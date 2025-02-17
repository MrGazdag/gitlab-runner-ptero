# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Gitlab Runner
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        gitlab/gitlab-runner:alpine3.19-f012c9b6

LABEL       author="MrGazdag" maintainer="44264503+MrGazdag@users.noreply.github.com"

RUN apk -U add --no-cache bash curl ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 docker sudo

RUN adduser -D -h /home/container -s /bin/bash container
RUN echo "container ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/container
USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

ENTRYPOINT  ["/bin/bash"]
CMD         ["/entrypoint.sh"]
