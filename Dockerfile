FROM gitlab/gitlab-runner:develop

RUN apt-get update && apt-get install -y \
    curl

ENV DOCKER_VERSION 1.10.2
RUN curl -fsSL --create-dirs --output /usr/local/bin/docker \
        "https://get.docker.com/builds/$(uname -s)/$(uname -m)/docker-${DOCKER_VERSION}" \
 && chmod +x /usr/local/bin/docker
RUN apt-get clean autoclean && apt-get autoremove -y

# Install docker-compose
RUN curl -L https://github.com/docker/compose/releases/download/1.4.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

COPY *.sh /
ENTRYPOINT /bootstrap.sh
