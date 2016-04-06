FROM gitlab/gitlab-runner:latest

# Change the VOLUME mapping from base image, so docker login/push work.
VOLUME ["/home/gitlab-runner", "/home/gitlab-runner"]

RUN apt-get update && apt-get install -y \
    curl \
    php5-cli

ENV DOCKER_VERSION 1.10.0
RUN curl -fsSL --create-dirs --output /usr/local/bin/docker \
        "https://get.docker.com/builds/$(uname -s)/$(uname -m)/docker-${DOCKER_VERSION}" \
 && chmod +x /usr/local/bin/docker
RUN apt-get clean autoclean && apt-get autoremove -y

# Install docker-compose
ENV DOCKER_COMPOSE_VERSION 1.6.2
RUN curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

# Install composer.
RUN php -r "readfile('https://getcomposer.org/installer');" | php && mv composer.phar /usr/local/bin/composer

COPY *.sh /
ENTRYPOINT /bootstrap.sh
