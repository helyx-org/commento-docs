### Configuring the backend

#### Introduction

Commento's backend is configured by a set of environment variables. If you're executing the binary from the command line, you can set environment variables:

```bash
$ export COMMENTO_ORIGIN=http://commento.example.com  # no whitespace around =
$ ./commento
```

If you're running Commento with Docker Compose, you can do this with the `environment:` keyword as shown [here](/installation/self-hosting/on-your-server/docker.md#with-docker-compose). If you prefer plain Docker, the `-e` flag sets environment variables, as shown [here](/installation/self-hosting/on-your-server/docker.md#with-vanilla-docker).

You can also configure Commento using a configuration file specified with `COMMENTO_CONFIG_FILE`. You can find specifications for this file in the [section on configuration files](#configuration-file).

#### Confiuration settings

<div class="setting-right red">Required</div>
<div class="setting-title">COMMENTO_ORIGIN</div>

This should be set to the subdomain or the IP address hosting Commento. All API requests will go to this server. This may include subdirectories if Commento is hosted behind a reverse proxy, for example. Include the protocol in the value to use HTTP/HTTPS.

<div class="setting-example">COMMENTO_ORIGIN=http://commento.example.com</div>

---

<div class="setting-right red">Required</div>
<div class="setting-title">COMMENTO_POSTGRES</div>

A PostgreSQL server URI, including the database name.

<div class="setting-example">COMMENTO_POSTGRES=postgres://user:pass@ip:5432/commento?sslmode=disable</div>

---

<div class="setting-right">Optional</div>
<div class="setting-title">COMMENTO_CONFIG_FILE</div>

A configuration file for Commento. See the [section on the configuration file](#configuration-file) for more details. Useful to store secrets and credentials. No config file will be loaded by default, if left unspecified.

<div class="setting-example">COMMENTO_CONFIG_FILE=/etc/commento.env</div>

---

<div class="setting-right">Optional</div>
<div class="setting-title">COMMENTO_BIND_ADDRESS</div>

The address to bind the Commento server to. Useful if the server has multiple network interfaces. If not specified, this value defaults to `COMMENTO_ORIGIN`.

<div class="setting-example">COMMENTO_BIND_ADDRESS=172.0.0.17</div>

---

<div class="setting-right">Optional</div>
<div class="setting-title">COMMENTO_PORT</div>

The port to bind the Commento server to. Defaults to 8080.

<div class="setting-possible">0 - 65535</div>

{% hint style='tip' %}
**When in Docker**

You don't need to set `COMMENTO_BIND_ADDRESS` and `COMMENTO_PORT` if you're running Commento in Docker. Instead, set the external bind address and port with Docker's `-p` flag.
{% endhint %}

---

<div class="setting-right">Optional</div>
<div class="setting-title">COMMENTO_CDN_PREFIX</div>

Useful if you'd like to use a CDN with Commento (like AWS Cloudfront, for example) for faster delivery of static assets. You must set the CDN's origin value as `COMMENTO_ORIGIN`. If not specified, a CDN is not used.

<div class="setting-example">COMMENTO_CDN_PREFIX=http://d111111abcdef8.cloudfront.net</div>

---

<div class="setting-right">Optional</div>
<div class="setting-title">COMMENTO_FORBID_NEW_OWNERS</div>

Used to disable new dashboard registrations. Useful if you are the only person using Commento on your server. Does not impact the creation of accounts for your readers. Defaults to false.

<div class="setting-possible">true, false</div>

---

<div class="setting-right">Optional</div>
<div class="setting-title">COMMENTO_STATIC</div>

If you want to store the binary in a different directory from the static assets, set this directory to point to the static assets (HTML, JS, CSS, email templates and database migrations). Defaults to the same directory as the binary.

<div class="setting-example">COMMENTO_STATIC=/usr/local/share/commento</div>

---

<div class="setting-right">Optional</div>
<div class="setting-title">COMMENTO_GZIP_STATIC</div>

If set to true, all static content will be served GZipped if the client's browser supports compression. Defaults to false.

<div class="setting-possible">true, false</div>

---

<div class="setting-right">Optional</div>
<div class="setting-title">COMMENTO_SMTP_HOST</div>
<div class="setting-title">COMMENTO_SMTP_PORT</div>
<div class="setting-title">COMMENTO_SMTP_USERNAME</div>
<div class="setting-title">COMMENTO_SMTP_PASSWORD</div>
<div class="setting-title">COMMENTO_SMTP_FROM_ADDRESS</div>

SMTP credentials and configuration the server should use to send emails. By default, all settings are empty and email features such as email notification and reset password are turned off.

<div class="setting-example">
COMMENTO_SMTP_HOST=smtp.gmail.com<br>
COMMENTO_SMTP_PORT=587<br>
COMMENTO_SMTP_USERNAME=example@gmail.com<br>
COMMENTO_SMTP_PASSWORD=hunter2<br>
COMMENTO_SMTP_FROM_ADDRESS=no-reply@example.com
</div>

---

<div class="setting-right">Optional</div>
<div class="setting-title">COMMENTO_AKISMET_KEY</div>

Akismet API key. Create a key in your [Akismet dashboard](https://akismet.com/account/). By default, Akismet integration is turned off when this value is left empty.

<div class="setting-example">COMMENTO_AKISMET_KEY=836d01853fd6</div>

---

<div class="setting-right">Optional</div>
<div class="setting-title">COMMENTO_GOOGLE_KEY</div>
<div class="setting-title">COMMENTO_GOOGLE_SECRET</div>

Google OAuth configuration. Create a new project in the [Google developer console](https://console.developers.google.com/project) to generate a set of credentials. By default, Google login is turned off when these values are left empty.

<div class="setting-example">
COMMENTO_GOOGLE_KEY=961031300431-0fe76kc72xvo0otts78ug2aqmi4is067.apps.googleusercontent.com<br>
COMMENTO_GOOGLE_SECRET=XmaKz7gRkWw3MQgoAHmApuwb
</div>

---

<div class="setting-right">Optional</div>
<div class="setting-title">COMMENTO_GITHUB_KEY</div>
<div class="setting-title">COMMENTO_GITHUB_SECRET</div>

GitHub OAuth configuration. Create a new OAuth app in [GitHub developer settings](https://github.com/settings/developers) to generate a set of credentials. By default, GitHub login is turned off when these values are left empty.

<div class="setting-example">
COMMENTO_GITHUB_KEY=uk3juvzyyejgxhbym1sqkn3t<br>
COMMENTO_GITHUB_SECRET=2fbdc6bdbb7c02119fd8fa70b7bdcfa7af8e2c
</div>

---

<div class="setting-right">Optional</div>
<div class="setting-title">COMMENTO_GITLAB_KEY</div>
<div class="setting-title">COMMENTO_GITLAB_SECRET</div>

Google OAuth configuration. Create a new application in your [GitLab settings](https://gitlab.com/profile/applications) to generate a set of credentials. By default, GitLab login is turned off when these values are left empty.

<div class="setting-example">
COMMENTO_GITLAB_KEY=78433742e6bad8fdf11261716daf6d1729c805d534a09707342d986cd52093d4<br>
COMMENTO_GITLAB_SECRET=cf73049b59f63915bbdc318b1e2e8ecbbf5b8bafb18f1dd84d68adf8951b762b
</div>

---

<div class="setting-right">Optional</div>
<div class="setting-title">COMMENTO_TWITTER_KEY</div>
<div class="setting-title">COMMENTO_TWITTER_SECRET</div>

Twitter OAuth configuration. Create an app in the [Twitter developer dashboard](https://developer.twitter.com/en/apps) to generate a set of credentials. By default, Twitter login is turned off when these values are left empty.

<div class="setting-example">
COMMENTO_TWITTER_KEY=HsWM4q8lcKNiv6idWvRdeSjS<br>
COMMENTO_TWITTER_SECRET=9j60WfN3LG6GAMbU5LCch1HQ6tT4ytiOzO95rM3DVD5dXHFT
</div>

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
COMMENTO_SMTP_HOST=smtp.gmail.com
COMMENTO_SMTP_PORT=587
COMMENTO_SMTP_USERNAME=example@gmail.com
COMMENTO_SMTP_PASSWORD=hunter2
COMMENTO_SMTP_FROM_ADDRESS=no-reply@commento.io

# Set Google OAuth credentials
COMMENTO_GOOGLE_KEY=204475040454-chmuz29vz2xldxnlcmnvbnrlbn.apps.googleusercontent.com
COMMENTO_GOOGLE_SECRET=09HTEVfU0VDUkVUPTh4
```

Say we store this file in `/etc/commento.env`. Then, we can include this file when running Commento:

```
$ export COMMENTO_CONFIG_FILE=/etc/commento.env
$ ./commento
```
