You need to set up some non-optional configuration before starting Commento. In this example, let's assume our Commento instance will be running on the server and will be available at `commento.example.com`.

Before you launch Commento, you will also need a usable PostgreSQL server. Let's say the server is available at `postgres.example.com` on port `5432` with the credentials `username:password`. Create a database named `commento`.

Set up the environment variables to start the Commento server on `commento.example.com` on port `80`:

```bash
$ export COMMENTO_ORIGIN=commento.example.com
$ export COMMENTO_PORT=80
$ export COMMENTO_POSTGRES=postgres://username:password@postgres.example.com:5432/commento?sslmode=disable
```

You can read the documentation on [configuring Commento](/configuration/backend/README.md) to learn more about the different options availble. For now, this minimal configuration is sufficient. To launch the executable:
