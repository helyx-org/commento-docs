### Running tests

#### Backend

Commento uses Go for the backend and we include a comprehensive test suite (not complete yet, we're working on it) along with the source code, as is the convention in Go code. To run all backend tests, you need a working PostgreSQL server running. For the rest of this tutorial, we'll assume you've setup one and set the corresponding address in `COMMENTO_POSTGRES` (see our documentation [on configuring Commento](configuration.md) for more details.

{% hint style='danger' %}
Set up `COMMENTO_POSTGRES` with a database name that's different from the one you're using for production. Tests will clean the database and delete all data. You shouldn't be running tests on production machines in any case, but it's worth mentioning.
{% endhint %}

To execute all tests automatically, run the following from the project's root directory.

```bash
$ make test
```
