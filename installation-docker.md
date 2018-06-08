### Install with Docker

#### Introduction

[Docker](https://docker.com) is an amazing production service management tool. Before proceeding forward with this tutorial, [install Docker](https://docs.docker.com/install/) for your platform. You can verify your Docker installation with the following command.

```bash
$ docker info
Containers: 48
 Running: 0
 Paused: 0
...
```

[Docker Compose](https://docs.docker.com/compose) is supplementary tool that works with Docker to orchestrate containers and services. To install Docker Compose, [follow their official documentation](https://docs.docker.com/compose/install/) for your platform. Note, however, that Docker Compose is entirely optional; you can run Commento containerised with just plain Docker.

#### With Docker Compose

The primary advantage with Docker Compose is that it's dead easy to get started; with a single `docker-compose up` command, you can start Commento. No pulling dependencies manually, no setting up runtime environments, no starting background services. It's dead simple. If you don't have a running PostgreSQL server around, we recommend this.

An example and reference `docker-compose.yml` for Commento CE is given below. The [latest version](https://gitlab.com/commento/commento-ce/blob/master/LICENSE) of the configuration file can always be found in the source repository.

```yaml
version: '3'

services:
  server:
    build: registry.gitlab.com/commento/commento-ce
    ports:
      - 80:8080
    environment:
      COMMENTO_ORIGIN: http://commento.example.com
      COMMENTO_POSTGRES: postgres://postgres:postgres@db:5432/commento?sslmode=disable
    depends_on:
      - db
  db:
    image: postgres
    environment:
      POSTGRES_DB: commento
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
    volumes:
      - postgres_data_volume:/var/lib/postgres

volumes:
  postgres_data_volume:
```

Remember to change `COMMENTO_ORIGIN` to the domain where you want to host Commento (if you're locally testing out, `localhost` is fine). If you want Commento exposed on a port other than `80`, change `80:8080`.

The above configuration pulls and sets up Commento CE and PostgreSQL in two separate containers with persistence volume. Save the `docker-compose.yml` file somewhere and run the following command to start the services.

```bash
$ docker-compose up -f /path/to/docker-compose.yml
```

Then open `commento.example.com` in your web browser to go to the Commento dashboard and get started with embedding Commento in your website.

You can configure Commento with more advanced settings (such as setting up OAuth and SMTP). To learn more about this, read our section [on configuring Commento](configuration.md).

#### With plain Docker

If you prefer to not use `docker-compose` and want to use plain ol' Docker, you can. First, pull the docker image. Then start a container with the appropriate ports. Note that this method requires you to have a running PostgreSQL server somewhere with access to.

```bash
$ docker pull registry.gitlab.com/commento/commento-ce
$ docker run -it                                                           \
    -p 80:8080                                                             \
    -e COMMENTO_ORIGIN=http://commento.example.com                         \
    -e COMMENTO_POSTGRES=postgres://username:password@ipaddr:port/commento \
    registry.gitlab.com/commento/commento-ce
```

Again, remember to change `COMMENTO_ORIGIN` and `COMMENTO_POSTGRES` to appropriate values. Running this would expose Commento on port `80` in your machine. Open `commento.example.com` in your web browser to the Commento dashboard and get started with embedding Commento in your website.
