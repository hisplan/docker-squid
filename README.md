# docker-squid

## Docker

```bash
$ docker build -t squid .
```

```bash
$ docker run -it --rm -p 3128:3128 -p 3130:3130 --name squid squid
```

## Docker Compose

```bash
$ docker-compose up -d
```

## Shell Into Container

```bash
$ docker exec -it squid sh
```
