### Setting up your environment

Setting up your development environment varies a lot between different operating systems and distributions. Given below are the setups for some of them. If you don't find your platform here, unfortunately, you're on your own to translate the commands for a different platform (which is generally pretty easy) to yours. If that happens to be the case, please consider [improving this document](https://gitlab.com/commento/docs) for future developers.

<!-- Keep this list sorted -->

#### Linux

##### Arch Linux

Install
[`bash`](https://www.archlinux.org/packages/core/x86_64/bash/),
[`make`](https://www.archlinux.org/packages/core/x86_64/make/),
[`go`](https://www.archlinux.org/packages/community/x86_64/go/),
[`dep`](https://www.archlinux.org/packages/community/x86_64/dep/),
[`yarn`](https://www.archlinux.org/packages/community/any/yarn/), and
[`postgresql`](https://www.archlinux.org/packages/extra/x86_64/postgresql/)
with `pacman`. The first five are build dependencies that are required to compile Commento from source. PostgreSQL is optional if you have already have a database server that you can access.

##### Ubuntu

Open a terminal and install most of the development dependencies with these commands:

```
sudo apt update
sudo apt install build-essential golang go-dep
```

Then follow the next sections to install the rest.

###### Yarn

Follow the [yarn installation instructions for Debian-based distributions](https://classic.yarnpkg.com/en/docs/install/#debian-stable).

###### Optional Go upgrades

While the version of Go installed in the first section will work for most developers, you can optionally add this PPA to be able to use the latest Go version for a number of Ubuntu releases. Simply run these commands:

```
sudo apt install software-properties-common
[[ $(lsb_release -sr) < "18.04" ]] && sudo apt install python-software-properties
# This PPA contains an up-to-date version of Go
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt install golang
```

###### Postgresql

This section covers the installation of the Postgresql database from Ubuntu packages. There are also other methods, such as [Docker](https://hub.docker.com/_/postgres). This step is not necessary if you already have a running Postgresql server with a `commento` database. 

Install the Postgresql server and CLI client from the Ubuntu archive:

```
sudo apt install postgresql postgresql-client-common
```

The final step will be to create a `commento` database on the server. Learn more about [how to install and use PostgreSQL server on Ubuntu](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04).
