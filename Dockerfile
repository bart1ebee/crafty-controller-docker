FROM python:3-alpine
# Use yourself as a possible cache.
ARG BUILDKIT_INLINE_CACHE=1

LABEL maintainer="Phillip Tarrant <https://gitlab.com/Ptarrant1> and Dockerfile created by David Kolb <https://github.com/dkolb>"

RUN apk update \
      && apk add --no-cache \
        openjdk11 \
        mariadb-dev \
        g++ \
        libffi-dev \
        make \
        bash \
        wget \
        rsync

# File layout
RUN mkdir /crafty_db /crafty_web /server_backups /minecraft_servers
WORKDIR /crafty_web

# App requirements
COPY ./crafty-web/requirements.txt /crafty_web
RUN pip install -r requirements.txt

# Source files
COPY ./crafty-web /crafty_web

# Customizations
COPY ./startup.sh /crafty_web/


EXPOSE 8000
EXPOSE 25500-25600

CMD "./startup.sh"
#CMD ["python", "/crafty_web/crafty.py", "-c", "/crafty_web/configs/docker_config.yml"]
