#!/bin/bash

export CI_USER=gitlab-runner
/set-docker-group.sh
/usr/bin/gitlab-runner run --user=${CI_USER} --working-directory=/home/${CI_USER}

