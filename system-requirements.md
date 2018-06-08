### System Requirements

#### Hardware requirements

Commento is pretty lightweight, but we recommend having at least 512 MB of RAM and at least 30 MB of disk space. This does not include the [requirements for running the PostgreSQL server](http://documentation.commvault.com/commvault/v11/article?p=3066.htm). Go supports a fairly [wide range of operating systems and architectures](https://golang.org/doc/install#requirements), so if you are covered in there, there's a good chance things will work for you.

#### Supported operating systems

##### Linux

Nearly every Linux distribution should be able to run Commento, as long as there's an accessible PostgreSQL server.

Rarely, using release binaries might not work if you use a C library different from the one the binary was compiled in (`glibc` or `musl`). In that case, you may be required to compile from source for your system. Official release binaries are also provided only for the `amd64` architecture. Compiling for your architecture should be simple enough.

Commento has been verified to be working on the following distributions: Arch Linux, Debian 9.4

##### *BSD

No data available yet. Please consider editing [this document](https://gitlab.com/commento/docs) with your discoveries.

##### macOS

No data available yet. Please consider editing [this document](https://gitlab.com/commento/docs) with your discoveries.

##### Windows

No data available yet. Please consider editing [this document](https://gitlab.com/commento/docs) with your discoveries.
