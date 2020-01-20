### Using Docker

#### Introduction

[Docker](https://docker.com) is a production service management tool. Before proceeding forward with this tutorial, [install Docker](https://docs.docker.com/install/) for your platform.

[Docker Compose](https://docs.docker.com/compose) is supplementary tool that works with Docker to orchestrate containers and services. To install Docker Compose, [follow the official documentation](https://docs.docker.com/compose/install/) for your platform. Note that Docker Compose is entirely optional; you can run Commento containerised with just vanilla Docker.

#### With Vanilla Docker

First, pull the docker image.

```bash
$ docker pull registry.gitlab.com/commento/commento
```

Then start a container with the appropriate ports. Note that this method requires you to have a running PostgreSQL server somewhere with access to.

```bash
$ docker run -it                                                           \
    -p 80:8080                                                             \
    -e COMMENTO_ORIGIN=http://commento.example.com                         \
    -e COMMENTO_POSTGRES=postgres://username:password@ipaddr:port/commento \
    registry.gitlab.com/commento/commento
```

Again, remember to change `COMMENTO_ORIGIN` and `COMMENTO_POSTGRES` to appropriate values. Open `http://commento.example.com` on web browser and you should be greeted with the login page. Go to the [next step](/installation/self-hosting/register-your-website/README.md) to create an account and register your website.

#### With Docker Compose

With Docker Compose it's easy to orchestrate multiple services with a single configuration file. And with a single `docker-compose up` command, you can start everything, including a PostgreSQL server. If you don't have a running PostgreSQL server around, this is recommend.

An example and reference `docker-compose.yml` for Commento is given below. The [latest version](https://gitlab.com/commento/commento/blob/master/docker-compose.yml) of the configuration file can always be found in the source repository (change `SET_VERSION` below appropriately).

```yaml
version: '3'

services:
  server:
    image: registry.gitlab.com/commento/commento:SET_VERSION
    ports:
      - 8080:8080
    environment:
      COMMENTO_ORIGIN: http://commento.example.com:8080
      COMMENTO_PORT: 8080
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
      - postgres_data_volume:/var/lib/postgresql/data

volumes:
  postgres_data_volume:
```

Remember to change `COMMENTO_ORIGIN` to the domain where you want to host Commento (if you're locally testing out, `localhost` is fine). If you want Commento exposed on a port other than `80`, change `80:8080`.

The above configuration pulls and sets up Commento and PostgreSQL in two separate containers with a persistent database volume. Save the `docker-compose.yml` file somewhere and run the following command to start the services.

```bash
$ docker-compose -f /path/to/docker-compose.yml up
```

Open `http://commento.example.com` on web browser and you should be greeted with the login page. Go to the [next step](/installation/self-hosting/register-your-website/README.md) to create an account and register your website.
