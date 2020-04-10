### System Requirements

The Go programming language supports a fairly [wide range of operating systems and hardware architectures](https://golang.org/doc/install#requirements); if you are covered in there, then there's a good chance things will work for you.

#### Hardware requirements

Commento is pretty lightweight, but we recommend having at least 64 MB of free RAM and at least 30 MB of free disk space. This does not include the [requirements for running the PostgreSQL server](http://documentation.commvault.com/commvault/v11/article?p=3066.htm). You may, of course, choose to use a separate server or a cloud provider for the PostgreSQL database.

Commento has been verified to be working on the following hardware architectures: `amd64`, `x86`

#### Software requirements

To run Commento, you will need access to a PostgreSQL database version 9.6 or later. There aren't any other software requirements, unless you're [compiling from source](/installation/self-hosting/on-your-server/compiling-source.md).

##### Supported operating systems

###### Linux

Nearly every Linux distribution should be able to run Commento, as long as there's an accessible PostgreSQL server.

Occasionally, using [release binaries](/installation/self-hosting/on-your-server/release-binaries.md) might not work if you use a C library version different from the one the release binary was compiled in or a different `libc` implementation altogether (`glibc`, `musl`, or something else). In that case, you may be required to compile from source for your system. [Compiling](/installation/self-hosting/on-your-server/compiling-source.md) for your architecture should be simple enough.

Commento has been verified to be working on the following distributions: Arch Linux, Debian 9.12

###### *BSD

No data available yet. Please consider editing [this document](https://gitlab.com/commento/docs) with your discoveries.

###### macOS

No data available yet. Please consider editing [this document](https://gitlab.com/commento/docs) with your discoveries.

###### Windows

No data available yet. Please consider editing [this document](https://gitlab.com/commento/docs) with your discoveries.
