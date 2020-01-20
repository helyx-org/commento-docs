### Contributing to Commento

#### Introduction

Thank you for choosing to contribute to Commento. There are, however, certain [guidelines](development-guidelines.md) we'd like for the contributors to follow. If you're a newcomer to open source and you haven't contributed to other projects or used [Git](https://docs.gitlab.com/ee/gitlab-basics/command-line-commands.html) before, you should make yourself familiar before proceeding; there are tons of tutorials to get started with Git.

#### How do I start contributing?

 - First, [set up the environment](development-environment.md) required to compile and build the project.

 - Then, you should [fork](https://docs.gitlab.com/ee/gitlab-basics/fork-project.html) the [project](https://gitlab.com/commento/commento) and [clone](https://docs.gitlab.com/ee/gitlab-basics/command-line-commands.html#clone-your-project) your fork locally. You will be using your fork for all development. It's generally a good practice to not make any changes on the `master` branch; instead create a branch for each merge request.

 - Following this, you should compile the project [from source](/installation/self-hosting/on-your-server/compiling-source.md) and make sure everything is working as intended. [Run the tests](running-tests.md) to double-check.

 - Next, you should review the [development guidelines](development-guidelines.md); code standards (commit messages are code too) are important if you plan on reading what you've written on a different day.

 - After you've read the guidelines, you pick and work on the contribution you want to make. This can be a bug fix, a new feature, a performance improvement, or a code standards improvement, or even a typo. If you need inspiration, pick an issue from [our public issue tracker](https://gitlab.com/commento/commento/issues).

 - When you're satisfied with your work (and when you're sure you've adhered to the guidelines), you can [make a Merge Request (MR)](https://docs.gitlab.com/ee/gitlab-basics/add-merge-request.html).

#### I've made a mess of it

In the [words](https://www.kernel.org/doc/html/v4.10/process/coding-style.html#you-ve-made-a-mess-of-it) of Linus Torvalds, that's okay, we all do. Join [#commento on Freenode](http://webchat.freenode.net/?channels=%23commento) and we'll help you out. Make sure you've read the documentation beforehand.

#### Free Commento.io access

[Commento.io](https://commento.io) is the hosted, cloud version of Commento. The service costs me money to host and maintain; as a result, normally, you have to pay a monthly subscription fee.

Commento is an [open source project](https://gitlab.com/commento) and it would not exist without its contributors. As a thank you, I'm very happy to offer free, perpetual Commento.io access in exchange for non-trivial patches. Once your merge request has been accepted and merged, [email me](mailto:adtac@commento.io) to apply the waiver to your account. What's trivial and what's non-trivial is entirely at my discretion; please don't abuse this.
