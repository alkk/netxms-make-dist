# Docker image for producing NetXMS source package from git repo

This image is intended to be used for building NetXMS source package from git repository. It is based on Debian 11 image and contains all required dependencies for running "make dist" and producing complete source package.

Usage:

```shell
docker run --rm -v $(PWD)/dist:/dist netxms-make-dist:latest stable-4.3

# OR using makefile from cloned sources:

make # latest master
make REVISION=stable-4.2 # specific revision (e.g. tag or commit hash)
```

Resulting file will be placed to "dist" directory.
