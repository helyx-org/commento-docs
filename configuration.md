### Configuration

Commento is quite configurable, in both the frontend and the backend. You're free to inject custom styling CSS, JavaScript, toggle moderation settings, configure SMTP, enable OAuth, and so on. In this page, we document the exhaustive list of settings you can configure in Commento.

#### Backend

Commento's backend is configured by a set of environment variables. If you're running Commento with Docker Compose, you can do this with the `environment:` keyword as shown [here](installation-docker.md#with-docker-compose). If you prefer plain Docker, the `-e` flag sets environment variables, as shown [here](installation-docker.md#with-plain-docker). If you're executing the binary from the command line, you can set environment variables:

```bash
$ export COMMENTO_ORIGIN=commento.example.com
$ ./commento-ce
```

| Parameter | Description |
|---|---|
| `COMMENTO_ORIGIN` | This should be set to the subdomain or the IP address hosting Commento. All API requests will go to this server. **Required.** |
| `COMMENTO_POSTGRES` | A PostgreSQL server URI, including the database name. **Required.** |
| `COMMENTO_BIND_ADDRESS` | The address to bind the Commento server to. If you're running Commento Dockerised, there is no need to change it, it's already setup correctly. Optional, defaults to 127.0.0.1. |
| `COMMENTO_PORT` | The port to bind the Commento server to. If you're running Commento Dockerised, this is not the port you want to change. Optional, defaults to 8080. |
| `COMMENTO_CDN_PREFIX` | If you want to use a CDN with Commento (like AWS Cloudfront, for example) for faster delivery of assets, you can. All static assets will be served from this domain. Optional, defaults to using `COMMENTO_ORIGIN`. |
| `COMMENTO_STATIC` | If you want to store the binary in a different directory from the static assets, set this directory to point to the static assets (HTML, JS, CSS, email templates and database migrations). Optional, defaults to the same directory as the binary. |
| `COMMENTO_GZIP_STATIC` | If set to true, all static content will be served GZipped. If you're not using something like a reverse proxy (like nginx, for example), we recommend you set this to `true`. Optional, defaults to `false`. |
| `COMMENTO_SMTP_USERNAME`<br>`COMMENTO_SMTP_PASSWORD`<br>`COMMENTO_SMTP_HOST`<br>`COMMENTO_SMTP_PORT`<br>`COMMENTO_SMTP_FROM_ADDRESS` | SMTP credentials and configuration for the server should use to send emails. Optional, defaults to emails disabled. |
| `COMMENTO_OAUTH_GOOGLE_KEY`<br>`COMMENTO_OAUTH_GOOGLE_SECRET` | Google OAuth v2 credentials that you get from their developers portal. Optional, defaults to Google login disabled. |
