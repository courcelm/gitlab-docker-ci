# gitlab-docker-ci

[GitLab CI](https://about.gitlab.com/gitlab-ci/) runner with access to host Docker daemon.

[![Deploy to Docker Cloud](https://files.cloud.docker.com/images/deploy-to-dockercloud.svg)](https://cloud.docker.com/stack/deploy/)

## Motivation

Test your code, ideally Docker containers themselves, inside a Dockerized GitLab CI runner.
Use the host node's Docker daemon, creating "sibling" containers.

Why not re-use one of the existing images out there?
You'll notice this project helps harmonize the host's `docker` group gid with the container.
We don't wholesale re-install Docker client in the container when adding some libraries will do.
And writing my own let me understand the tech, better. :-)

## Usage

Edit the included `docker-compose.yml` file with your registration data, then run `docker-compose up`.

Uncomment the volume mount for `/etc/gitlab-runner` if you wish to mount and re-use an existing config.

Or, build the Dockerfile and run the image using your favorite orchestration tool.

## See Also

* [jpetazzo's blog on Docker-in-Docker for CI](https://jpetazzo.github.io/2015/09/03/do-not-use-docker-in-docker-for-ci/)
* [rayrutjes's simple-gitlab-runner](https://github.com/rayrutjes/simple-gitlab-runner)

&copy; Brad Jones LLC
