---
title: Down the `rgdal` rabbit hole
author: admin
date: '2020-11-03'
slug: down-the-rgdal-rabbit-hole
categories: []
tags: []
subtitle: ''
summary: ''
authors: []
lastmod: '2020-11-03T15:23:41-08:00'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---

# Down, down, down

I have [a package](https://github.com/jkbest2/spatq) that depends on INLA, which
has recently begun failing to load if `rgdal` isn't installed correctly. `rgdal`
can't be installed without the GDAL library, which requires PROJ, which requires
SQLite. I needed to install all of these on our cluster without root access.
That meant compiling each one to a non-standard location, then ensuring that the
next in the sequence knew where this was. It also meant that if I missed an
option in, say SQLite, I had to start from the bottom and recompile everything.

# Clawing my way out

This is what I eventually (after 2 days of work) got to work.

## SQLite

1. [Download](https://sqlite.org/download.html) and untar the most recent SQLite
   amalgamation. I did not use the `autoconf` version.
2. Configure: 

```bash
./configure --prefix=/usr/lusers/jkbest/inst/sqlite-3.33.0 \
    CFLAGS="-DSQLITE_ENABLE_COLUMN_METADATA=1"
```

Note the `CFLAGS` here. Without that `rgdal` *will* fail to install with a
message about `table_columns` or similar and you'll need to start over from this
step (ask me how I know!).

3. Compile and install:

```bash
make -jN
make install
```

4. Update `$PATH`s. In your `.zshrc`, `.bashrc` or similar, add entries to
   `PATH` for `bin`, `LD_LIBRARY_PATH` for `lib`, `CPATH` for `include`, and
   `PKG_CONFIG_PATH` for `lib/pkgconfig`. I don't know which of these mattered,
   but it didn't hurt to add them.
   

## PROJ

1. [Download](https://proj.org/download.html) and untar the latest version of PROJ.

2. Configure:

```bash
./configure --prefix=$INSTALL_PATH/proj-7.2.0 \
    SQLITE3_CFLAGS=-I/usr/lusers/jkbest/inst/sqlite-3.33.0/include \
    SQLITE3_LIBS="-L/usr/lusers/jkbest/inst/sqlite-3.33.0/lib -lsqlite3" \
    CPPFLAGS=-I/usr/lusers/jkbest/inst/sqlite-3.33.0/include \
    LDFLAGS="-L/usr/lusers/jkbest/inst/sqlite-3.33.0/lib -lsqlite3"

```

3. Compile and install:

```bash
make
make install
```

4. Update `PATH`, `LD_LIBRARY_PATH`, `PKG_CONFIG_PATH`, and `CPATH` as described
   above.
   
## GDAL

1. [Download](https://gdal.org/download.html) and untar the latest version of GDAL.

2. Configure:

```bash
./configure --prefix=/usr/lusers/jkbest/inst/gdal-3.2.0\
    CFLAGS="-I/usr/lusers/jkbest/inst/proj-7.2.0/include -I/usr/lusers/jkbest/inst/sqlite-3.33.0/include"\
    LIBS="-L/usr/lusers/jkbest/inst/proj-7.2.0/lib -lproj -L/usr/lusers/jkbest/inst/sqlite-3.33.0/lib -lsqlite3" \
    CPPFLAGS="-I/usr/lusers/jkbest/inst/proj-7.2.0/include -I/usr/lusers/jkbest/inst/sqlite-3.33.0/include"\
    LDFLAGS="-L/usr/lusers/jkbest/inst/proj-7.2.0/lib -lproj -L/usr/lusers/jkbest/inst/sqlite-3.33.0/lib -lsqlite3"
```

3. Compile and install (takes a while and benefits from multiple jobs):

```bash
make -jN
make install
```

4. Update environmental variables.

## rgdal

In R, run

```r
install.packages("rgdal", configure.args = "--host=host")
```

No idea why the `host` argument is necessary, but it errors with messages about
cross-compiling if it is not included.

# Fresh air

That was easy, right?
