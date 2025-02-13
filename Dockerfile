# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Gitlab Runner
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        gitlab/gitlab-runner:alpine3.19-f012c9b6

LABEL       author="MrGazdag" maintainer="44264503+MrGazdag@users.noreply.github.com"

RUN apt-get update -y \
 && apt-get install -y curl ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 \
 && useradd -d /home/container -m container
 
USER container
ENV  USER=container HOME=/home/container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
