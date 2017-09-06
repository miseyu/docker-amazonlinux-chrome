# docker-amazonlinux-chrome

## Usage

### Building the image:

```
docker build -t amazonlinux-chrome --no-cache --rm=true ./
```

### Running

```
docker run -it -d -v /opt/docker/docker_amazonlinux_chrome/headless_shell:/root/Chromium/src/out/headless-chrome/ --name docker-amazonlinux-chrome miseyu/docker-amazonlinux-chrome
```