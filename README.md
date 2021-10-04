# ci-php-node
Docker image for CI builds with PHP and Node.js.

# Instructions

1. Create PR from a fork with changes.
2. Merge PR and create a new tag on GitHub.
3. Using the same tag name build and push image to DockerHub. Also, push the same image with `latest` tag to DockerHub.

To build and publish the image run:

```bash
docker build -t cyberriskalliance/ci-php-node:TAG_NAME -t cyberriskalliance/ci-php-node:latest .
docker push cyberriskalliance/ci-php-node:TAG_NAME
docker push cyberriskalliance/ci-php-node:latest
```

# Credits

Based on misterio92/ci-php-node:4.0. Links:
- GitHub https://github.com/vyuldashev/docker-ci-php-node
- Docker Hub: https://hub.docker.com/r/misterio92/ci-php-node/
