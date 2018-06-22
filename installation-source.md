### Install from source

#### Introduction

To install Commento from source, you need to [install the developer environment](development-environment.md) first. Once you've done that, you can go ahead and build the production binaries. The rest of this tutorial assumes you have all the necessary tools installed.

Note that this option is only possible in Commento CE.

#### Compilation

Compiling Commento CE is as simple as cloning the repository and running `make`.

```bash
$ git clone https://gitlab.com/commento/commento-ce.git
$ cd commento-ce
$ make prod
```

This would automatically build the backend, frontend, database migration steps, and the templates. The resulting binary and assets would be placed in `build/prod`. There, you'll find the `commento-ce` binary and the necessary assets to run Commento.
