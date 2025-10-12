About soqt-rt-feedstock
=======================

Feedstock license: [BSD-3-Clause](https://github.com/realthunder/soqt-feedstock/blob/main/LICENSE.txt)

Home: https://github.com/realthunder/coin

Package license: BSD-3-Clause

Summary: SoQt library for Coin3D with enhanced shadow rendering.

SoQt is a Qt GUI component toolkit library for Coin. It is also compatible with SGI and TGS Open Inventor, and the API is based on the API of the InventorXt GUI component toolkit.


Current build status
====================


<table>
</table>

Current release info
====================

| Name | Downloads | Version | Platforms |
| --- | --- | --- | --- |
| [![Conda Recipe](https://img.shields.io/badge/recipe-soqt--rt-green.svg)](https://anaconda.org/realthunder/soqt-rt) | [![Conda Downloads](https://img.shields.io/conda/dn/realthunder/soqt-rt.svg)](https://anaconda.org/realthunder/soqt-rt) | [![Conda Version](https://img.shields.io/conda/vn/realthunder/soqt-rt.svg)](https://anaconda.org/realthunder/soqt-rt) | [![Conda Platforms](https://img.shields.io/conda/pn/realthunder/soqt-rt.svg)](https://anaconda.org/realthunder/soqt-rt) |

Installing soqt-rt
==================

Installing `soqt-rt` from the `realthunder` channel can be achieved by adding `realthunder` to your channels with:

```
conda config --add channels realthunder
conda config --set channel_priority strict
```

Once the `realthunder` channel has been enabled, `soqt-rt` can be installed with `conda`:

```
conda install soqt-rt
```

or with `mamba`:

```
mamba install soqt-rt
```

It is possible to list all of the versions of `soqt-rt` available on your platform with `conda`:

```
conda search soqt-rt --channel realthunder
```

or with `mamba`:

```
mamba search soqt-rt --channel realthunder
```

Alternatively, `mamba repoquery` may provide more information:

```
# Search all versions available on your platform:
mamba repoquery search soqt-rt --channel realthunder

# List packages depending on `soqt-rt`:
mamba repoquery whoneeds soqt-rt --channel realthunder

# List dependencies of `soqt-rt`:
mamba repoquery depends soqt-rt --channel realthunder
```




Updating soqt-rt-feedstock
==========================

If you would like to improve the soqt-rt recipe or build a new
package version, please fork this repository and submit a PR. Upon submission,
your changes will be run on the appropriate platforms to give the reviewer an
opportunity to confirm that the changes result in a successful build. Once
merged, the recipe will be re-built and uploaded automatically to the
`realthunder` channel, whereupon the built conda packages will be available for
everybody to install and use from the `realthunder` channel.
Note that all branches in the realthunder/soqt-rt-feedstock are
immediately built and any created packages are uploaded, so PRs should be based
on branches in forks, and branches in the main repository should only be used to
build distinct package versions.

In order to produce a uniquely identifiable distribution:
 * If the version of a package **is not** being increased, please add or increase
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string).
 * If the version of a package **is** being increased, please remember to return
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string)
   back to 0.

Feedstock Maintainers
=====================

* [@realthunder](https://github.com/realthunder/)

