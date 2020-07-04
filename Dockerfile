# Alpine doesn't compile. musl vs glibc issues from argon2 password hashing dep.
FROM python:3

LABEL maintainer="Phillip Tarrant <https://gitlab.com/Ptarrant1> and Dockerfile created by David Kolb <https://github.com/dkolb>"

RUN apt-get update \
      && apt-get install -y \
        default-jre \
        libmariadb-dev \
      && apt-get clean \
      && rm -rf /var/cache/apt/lists

# File layout
RUN mkdir /crafty_db /crafty_web
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
