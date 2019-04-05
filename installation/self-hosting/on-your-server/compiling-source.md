### Compiling From Source

#### Introduction

To install Commento from source, first [set up your environment](/contributing/development-environment.md) first. Once you've done that, you can go ahead and build the project. The rest of this tutorial assumes you have all the necessary tools installed.

#### Compiling Commento

Compiling Commento is as simple as cloning the repository and running `make`.

```bash
$ git clone https://gitlab.com/commento/commento.git
$ cd commento
$ make prod
```

This will automatically fetch dependencies (Go and Yarn) and compile the project. The first `make` might be slow; future builds will be much faster as you wouldn't have to pull all the dependencies. After the command completes, your binary would be available at `./build/prod/commento` along with other files.

{% hint style='tip' %}
If you're not running Commento in a production environment, you may want to use `make devel` instead of `make prod` for more descriptive frontend errors. Substitute `./build/prod` with `./build/devel` appropriately.
{% endhint %}

#### Launching Commento

{% include "launching-commento-pre.md" %}

```bash
$ ./build/prod/commento
```

{% include "launching-commento-post.md" %}
