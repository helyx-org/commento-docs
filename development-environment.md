### Setting up your environment

Setting up your development environment varies a lot between different operating systems and distributions. Given below are the setups for some of them. If you don't find your platform here, unfortunately, you're on your own to translate the commands for a different platform (which is generally pretty easy) to yours. If that happens to be the case, please consider [improving this document](https://gitlab.com/commento/docs) for future developers.

<!-- Keep this list sorted -->

#### Linux

##### Arch Linux

 - Install [`make`](https://www.archlinux.org/packages/core/x86_64/make/) [`go`](https://www.archlinux.org/packages/extra/x86_64/go/) [`npm`](https://www.archlinux.org/packages/community/any/npm/) [`uglify-js`](https://www.archlinux.org/packages/community/any/uglify-js/) [`docker`](https://www.archlinux.org/packages/community/x86_64/docker/) [`docker-compose`](https://www.archlinux.org/packages/community/any/docker-compose/) with `pacman`.
 - Install [`html-minifier`](https://www.npmjs.com/package/html-minifier) [`sass`](https://www.npmjs.com/package/sass) with `npm`. Unfortunately, these two aren't in the AUR either.
