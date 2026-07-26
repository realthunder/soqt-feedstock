#!/bin/bash

# Create the build directory
mkdir -p build
cd build

# Set QT_SELECTOR based on the build variant
QT_SELECTOR=""
if [[ "$build_variant" = "qt5" ]]; then
    QT_SELECTOR="-D SOQT_USE_QT5=ON"
    echo "QT_SELECTOR set for qt5: $QT_SELECTOR"
elif [[ "$build_variant" = "qt6" ]]; then
    QT_SELECTOR="-D SOQT_USE_QT6=ON"
    echo "QT_SELECTOR set for qt6: $QT_SELECTOR"
else
    echo "Unknown build variant: $build_variant. QT_SELECTOR remains unset."
fi

# Ensure the build uses the correct Qt tools
if [[ "${target_platform}" =~ osx-arm64 && "$build_variant" = "qt6" ]]; then
    rm -f "${PREFIX}/lib/qt6/moc"
    ln -s "${BUILD_PREFIX}/lib/qt6/moc" "${PREFIX}/lib/qt6/moc"
    
    # Additional debugging information
    echo "Adjusted Qt tools for osx-arm64 with build variant qt6"
    echo "Removed: ${PREFIX}/lib/qt6/moc"
    echo "Linked to: ${BUILD_PREFIX}/lib/qt6/moc"
else
    echo "Skipping Qt tools adjustment. Target platform: ${target_platform}, Build variant: $build_variant"
fi

CXXFLAGS="$CXXFLAGS -std=c++11"

# Run CMake with specified options
cmake -G "Ninja" \
    -D CMAKE_POLICY_VERSION_MINIMUM="3.5" \
    -D CMAKE_INSTALL_PREFIX="$PREFIX" \
    -D CMAKE_PREFIX_PATH="$PREFIX" \
    -D CMAKE_BUILD_TYPE="Release" \
    -D SOQT_BUILD_DOCUMENTATION:BOOL=NO \
    -D QT_HOST_PATH="${PREFIX}" \
    ${QT_SELECTOR} \
    ..

# Build and install using Ninja
ninja install

# Cross builds (linux-aarch64) leak the absolute host and build-env
# include dirs into the exported target's INTERFACE_INCLUDE_DIRECTORIES
# (soqt-export.cmake); the build-env path does not exist on consumer
# machines, so any consumer's CMake hard-errors with "non-existent
# path" (broke the pivy-rt aarch64 build). Keep only the relocatable
# ${_IMPORT_PREFIX}/include entry.
for f in "$PREFIX"/lib/cmake/SoQt-*/soqt-export.cmake; do
    [ -f "$f" ] || continue
    sed -i.bak -e 's|[^";]*/_build_env/include;||g' \
               -e 's|[^";]*/_h_env[^";]*/include;||g' "$f"
    rm -f "$f.bak"
done
