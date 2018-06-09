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
| `COMMENTO_ORIGIN` | **Required.** This should be set to the subdomain or the IP address hosting Commento. All API requests will go to this server. |
| `COMMENTO_POSTGRES` | **Required.** A PostgreSQL server URI, including the database name. |
| `COMMENTO_PORT` | Optional, defaults to 8080. The port to bind the Commento server to. If you're running Commento Dockerised, this is not the port you want to change. |
| `COMMENTO_CDN_PREFIX` | Optional, defaults to using `COMMENTO_ORIGIN`. If you want to use a CDN with Commento (like AWS Cloudfront, for example) for faster delivery of assets, you can. All static assets will be served from this domain. |
| `COMMENTO_STATIC` | Optional, defaults to the same directory as the binary. If you want to store the binary in a different directory from the static assets, set this directory to point to the static assets (HTML, JS, CSS, email templates and database migrations). |
| `COMMENTO_SMTP_USERNAME`<br>`COMMENTO_SMTP_PASSWORD`<br>`COMMENTO_SMTP_HOST`<br>`COMMENTO_SMTP_PORT`<br>`COMMENTO_SMTP_FROM_ADDRESS` | Optional, defaults to emails disabled. SMTP credentials and configuration for the server should use to send emails. |
| `COMMENTO_OAUTH_GOOGLE_KEY`<br>`COMMENTO_OAUTH_GOOGLE_SECRET` | Optional, defaults to Google login disabled. Google OAuth v2 credentials that you get from their developers portal. |
