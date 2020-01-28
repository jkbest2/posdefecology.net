---
title: Compiling R with Intel compilers and MKL on Hyak
author: John
date: '2020-01-10'
slug: compiling-r
categories: []
tags: []
subtitle: ''
summary: 'Steps to compile custom, optimized R on Hyak'
authors: []
lastmod: '2020-01-28T10:54:43-08:00'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---

# Prerequisites

First, request a `build` node, which will have internet access. An hour of time
should be enough to install R and a few packages. Building R (especially the
suggested packages) can be sped up by using multiple build jobs.

```bash
srun -p build --mem=10G --cpus-per-task=8 --time=1:00:00 --pty /bin/zsh
```

To use the Intel compilers and link to MKL on Hyak, load the relevant module. In
early 2020, this is accomplished by running

```bash
module load icc_19
```

I add this to my `.bashrc` and `.zshrc` so that the module is loaded every time
I log in. To avoid warnings about building PDF documentation, load TeXLive as
well.

```bash
module load contrib/texlive/2017
```

Next, download the R source from CRAN and extract the contents. For R v3.6.2, this is done using `wget`.

```bash
wget https://cran.r-project.org/src/base/R-3/R-3.6.2.tar.gz
tar -xvf R-3.6.2.tar.gz
```

## Configuration

Following the [Intel instructions for building R with
MKL](https://software.intel.com/en-us/articles/build-r-301-with-intel-c-compiler-and-intel-mkl-on-linux),
we need to `source` the `compilervars.sh` script and set a number of
environmental variables. This can be done in a script for convenience. Some
packages (e.g. `TMB`) will break if you include OpenMP in the standard compiler
flags, so these are moved to the more appropriate `*_OPENMP_*` environmental
variables. The following takes care of these steps.

```bash
source /sw/intel-2019/bin/compilervars.sh intel64

export CC="icc"
export CXX="icpc"
export F77="ifort"
export FC="ifort"
export AR="xiar"
export LD="xild"

export CFLAGS="-fPIC -O3 -ipo -xHost -multiple-processes=8"
export CXXFLAGS="-fPIC -O3 -ipo -xHost -multiple-processes=8"
export FFLAGS="-fPIC -O3 -ipo -xHost -multiple-processes=8"
export FCFLAGS="-fPIC -O3 -ipo -xHost -multiple-processes=8"
export LDFLAGS=""

# OpenMP flags? Need to be here instead of above or TMB breaks?
export R_OPENMP_CFLAGS="-qopenmp"
export SHLIB_OPENMP_CFLAGS="-qopenmp"
export SHLIB_OPENMP_CXXFLAGS="-qopenmp"
export SHLIB_OPENMP_FFLAGS="-qopenmp"

MKL="-lmkl_rt -liomp5 -lpthread"
```

Finally, run the `configure` script inside the `R-*` directory. The `--prefix`
flag should be changed to the directory where the built version should be
installed.

```bash
./configure --prefix=/gscratch/*/bin/R-3.6.2 \
            --enable-R-shlib \
            --with-blas=$MKL \
            --with-lapack \
            --enable-BLAS-shlib
```

# Build and install R

This part is pretty easy once configuration is complete. The `-j` flag can be
used to specify the maximum number of parallel jobs to run. This should be equal
to the `--cpus-per-task` specified when you requested the build node.

```bash
make -j8
```

Installation can be accomplised using

```bash
make install
```

Finally, add the `R` and `Rscript` executables to your `PATH`.

# Testing the installation

In order to use multiple cores on a compute node, the `--cpus-per-task` flag
must be greater than one. Note that `--tasks-per-node` does *not* allow multiple
threads to be used by a single process. Watching CPU usage with e.g. `htop` will
tell you if multithreaded linear algebra is working. So, using an interactive
compute node (such as `stf-int`) open your newly-compiled version of R and
running

```r
X <- matrix(rnorm(5000 * 5000), nrow = 5000)
t(X) %*% X
```

You should see multiple CPUs being used at 100% in `htop`. If only one CPU is maxed out, something went wrong.


