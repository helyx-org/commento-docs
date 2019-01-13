### Configuring the backend

#### Introduction

Commento's backend is configured by a set of environment variables. If you're running Commento with Docker Compose, you can do this with the `environment:` keyword as shown [here](installation-docker.md#with-docker-compose). If you prefer plain Docker, the `-e` flag sets environment variables, as shown [here](installation-docker.md#with-plain-docker). If you're executing the binary from the command line, you can set environment variables:

```bash
$ export COMMENTO_ORIGIN=commento.example.com
$ ./commento
```

You can also configure Commento using a configuration file specified with `COMMENTO_CONFIG_FILE`. You can find specifications for this file in the [section on configuration files](#configuration-file).

#### Confiuration settings

Here is the list of backend configuration settings available.

| Parameter | Description |
|---|---|
| `COMMENTO_ORIGIN` | This should be set to the subdomain or the IP address hosting Commento. All API requests will go to this server. **Required.** |
| `COMMENTO_POSTGRES` | A PostgreSQL server URI, including the database name. **Required.** |
| `COMMENTO_CONFIG_FILE` | A configuration file for Commento. See the [section on the configuration file](#configuration-file) for more details. Useful to store secrets and credentials. **Optional**, defaults to no file. |
| `COMMENTO_BIND_ADDRESS` | The address to bind the Commento server to. **Optional**, defaults to 127.0.0.1. |
| `COMMENTO_PORT` | The port to bind the Commento server to. **Optional**, defaults to 8080. |
| `COMMENTO_CDN_PREFIX` | If you want to use a CDN with Commento (like AWS Cloudfront, for example) for faster delivery of assets, you can. All static assets will be served from this domain. **Optional**, defaults to using `COMMENTO_ORIGIN`. |
| `COMMENTO_FORBID_NEW_OWNERS`| If you want to forbid the creation of new owners who can set up domains, set this variable to `true`. Otherwise, to allow others to create accounts, set this to `false`. **Optional**, defaults to `false`. |
| `COMMENTO_STATIC` | If you want to store the binary in a different directory from the static assets, set this directory to point to the static assets (HTML, JS, CSS, email templates and database migrations). **Optional**, defaults to the same directory as the binary. |
| `COMMENTO_GZIP_STATIC` | If set to true, all static content will be served GZipped. If you're not using something like a reverse proxy (like nginx, for example), we recommend you set this to `true`. **Optional**, defaults to `false`. |
| `COMMENTO_SMTP_USERNAME`<br>`COMMENTO_SMTP_PASSWORD`<br>`COMMENTO_SMTP_HOST`<br>`COMMENTO_SMTP_PORT`<br>`COMMENTO_SMTP_FROM_ADDRESS` | SMTP credentials and configuration for the server should use to send emails. **Optional**, defaults to emails disabled. |
| `COMMENTO_GOOGLE_KEY`<br>`COMMENTO_GOOGLE_SECRET`        | Google OAuth v2 credentials that you get from their developers portal. **Optional**, defaults to Google login disabled. |

{% hint style='tip' %}
**When in Docker**

If you're running Commento Dockerised, you don't need to change `COMMENTO_BIND_ADDRESS` and `COMMENTO_PORT`. Instead set the external bind address and port with the `-p` flag in Docker.
{% endhint %}

#### Configuration file

With the `COMMENTO_CONFIG_FILE` environment variable, you can specify a configuration file. You can use this file to store secrets and credentials without exposing them in the `./commento` invocation command. For example, a Docker secret can be created and mounted inside the container's filesystem, and Commento can read from this file.

{% hint style='info' %}
**Precedence**

If you're specifying a configuration file using `COMMENTO_CONFIG_FILE`, note that it will have lower precedence than environment variables.
{% endhint %}

The format for the configutation file is quite simple:

 - Each configuration value is specified in one line
 - Leading and trailing whitespaces on each line are ignored
 - All lines starting with a `#` are treated as comments and ignored
 - All empty lines are ignored
 - Each valid configuration line must contain an `=` symbol, specifying `COMMENTO_KEY=value`

Here is an example file:

```
# Set binding values
COMMENTO_ORIGIN=http://commento.example.com
COMMENTO_PORT=80

# Set PostgreSQL settings
COMMENTO_POSTGRES=postgres://commento:commento@127.0.0.1:5432/commento?sslmode=disable

# Set the SMTP credentials
COMMENTO_SMTP_USERNAME=apikey
COMMENTO_SMTP_PASSWORD=SG.ZXhwb3J0IENPTU1FTlRP.V4cG9ydCBDT01UT19TTV_Geks1RFQ0ZUhoNXFdjlnL
COMMENTO_SMTP_HOST=smtp.sendgrid.net
COMMENTO_SMTP_PORT=587
COMMENTO_SMTP_FROM_ADDRESS=no-reply@commento.io

# Set Google OAuth credentials
COMMENTO_GOOGLE_KEY=204475040454-chmuz29vz2xldxnlcmnvbnrlbn.apps.googleusercontent.com
COMMENTO_GOOGLE_SECRET=09HTEVfU0VDUkVUPTh4
```

Say we store this file in `/etc/commento_config`. Then, we can include this file when running Commento:

```
$ export COMMENTO_CONFIG_FILE=/etc/commento_config
$ ./commento
```
