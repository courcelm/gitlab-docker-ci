FROM gitlab/gitlab-runner:latest

RUN apt-get update && apt-get install -yqq --no-install-recommends \
    curl \
    php5-cli

ENV DOCKER_VERSION 1.11.1
RUN curl -fsSL --create-dirs --output /usr/local/bin/docker \
    "https://get.docker.com/builds/$(uname -s)/$(uname -m)/docker-${DOCKER_VERSION}.tgz" | tar xz > docker \
    && mv docker/docker /usr/local/bin/docker \
    && rm -rf docker
RUN apt-get clean autoclean && apt-get autoremove -y

# Install docker-compose
ENV DOCKER_COMPOSE_VERSION 1.7.1
RUN curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

# Install composer.
RUN php -r "readfile('https://getcomposer.org/installer');" | php && mv composer.phar /usr/local/bin/composer

COPY *.sh /
ENTRYPOINT /bootstrap.sh
