redis-commander-docker
======================

A [Docker](https://www.docker.com/) container for [Redis Commander](https://github.com/joeferner/redis-commander).

## Example usage
```bash
docker run --name my-redis -d redis && \
docker run -d --link my-redis:redis -p 8081:8081 tenstartups/redis-commander --redis-host redis
```

Redis Commander will be running on port: `8081`

### Via Docker compose
`docker-compose.yml`
```yml
redis:
  image: redis
redisCommander:
  image: tenstartups/redis-commander
  command: --redis-host redis
  links:
    - redis:redis
  ports:
    - "8081:8081"
```
Followed by: `fig up`
