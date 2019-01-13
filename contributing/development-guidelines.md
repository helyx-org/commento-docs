### Development guidelines

You could be fixing a typo somewhere or churning out an entirely new feature - all of it is welcome. There are, however, certain guidelines we'd like for contributors to follow.

#### Commit messages guidelines

Commit messages are code themselves. They document the changes being and should be well explained. With that in mind, here's an example of a good commit:

    main.go: move config parsing to config.go

    Configuration parsing should be in its own file as main.go was
    getting quite large.

    Closes https://gitlab.com/commento/commento/issues/42

This shortlog straight away tells us several things: we're making this change in `main.go`, this change is moving code out of `main.go` into `config.go`, and the code being moved out is the configuration parsing part.

Here's an example of a bad commit shortlog:

    Fix tests

This doesn't tell us much apart from the fact that the commit is fixing tests. Which file's tests are being fixed? Which individual test is being changed? What was wrong before? Why is the new behavior the correct one?

##### The rules

 - Each commit should be atomic: a commit must do one thing only. If a change has multiple logically different segments, each should probably be in its own commit.

 - The commit shortlog must be of the form `context: description` (all lower case), where `context` is the filename or the directory being changed. For example, if you're making a change to `main.go`, the shortlog must be prefixed with it. If your change spans several files and directories, it's up to you; use something logical.

 - The commit shortlog should be in imperative mood. For example, use "main.go: Move config..." instead of "main.go: Moved config...", as if you're giving orders to the codebase to change its behaviour.

 - Try to limit the commit shortlog and body to under 50 and 72 characters in length, respectively. Feel free to be as descriptive as possible in the commit body by wrapping your text and using multiple lines and paragraphs.
