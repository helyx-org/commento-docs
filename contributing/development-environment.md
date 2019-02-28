### Setting up your environment

Setting up your development environment varies a lot between different operating systems and distributions. Given below are the setups for some of them. If you don't find your platform here, unfortunately, you're on your own to translate the commands for a different platform (which is generally pretty easy) to yours. If that happens to be the case, please consider [improving this document](https://gitlab.com/commento/docs) for future developers.

<!-- Keep this list sorted -->

#### Linux

##### Arch Linux

Install [`bash`](https://www.archlinux.org/packages/core/x86_64/bash/), [`make`](https://www.archlinux.org/packages/core/x86_64/make/), [`go`](https://www.archlinux.org/packages/extra/x86_64/go/), [`dep`](https://www.archlinux.org/packages/community/x86_64/dep/), [`yarn`](https://www.archlinux.org/packages/community/any/yarn/), and [`postgresql`](https://www.archlinux.org/packages/extra/x86_64/postgresql/) with pacman. The first four are build dependencies that are required to compile Commento from source. PostgreSQL is optional if you have already have a database server that you can access.
