# ci-php-node
Docker image for CI builds with PHP and Node.js.

# Instructions

1. Create PR from a fork with changes.
2. Merge PR and create a new tag on GitHub.
3. Request access to cyberriskalliance organization on DockerHub to your account from DevOps team. You need to have a DockerHub account. 
4. Authenticate to docker cli.
5. Using the same tag name build and push image to DockerHub. Also, push the same image with `latest` tag to DockerHub.

To authenticate to docker cli run:
```bash
docker login -u your_login -p your_password
```

To build and publish the image run:

```bash
docker buildx create --use --name multiarch-builder
docker buildx build \
  --platform linux/amd64 \
  -t cyberriskalliance/ci-php-node:2.7 \
  -t cyberriskalliance/ci-php-node:latest \
  --push \
  .

```

# Credits

Based on misterio92/ci-php-node:4.0. Links:
- GitHub https://github.com/vyuldashev/docker-ci-php-node
- Docker Hub: https://hub.docker.com/r/misterio92/ci-php-node/
