FROM ubuntu:19.10

# Use yourself as a possible cache.
ARG BUILDKIT_INLINE_CACHE=1

LABEL maintainer="Phillip Tarrant <https://gitlab.com/Ptarrant1> and Dockerfile created by kevdagoat <https://gitlab.com/kevdagoat>, modified by David Kolb <https://github.com/dkolb>"

RUN apt-get update && apt-get install -y \
  default-jre \
  libmysqlclient-dev \
  python3 \
  python3-dev \
  python3-pip \
&& rm -rf /var/lib/apt/lists/*

RUN mkdir /crafty_db /crafty_web /server_backups /minecraft_server

COPY ./crafty-web/requirements.txt /crafty_web/requirements.txt
RUN pip3 install -r /crafty_web/requirements.txt

COPY ./crafty-web/ /crafty_web
WORKDIR /crafty_web

EXPOSE 8000
EXPOSE 25500-25600

CMD ["python3", "crafty.py", "-c", "/crafty_web/configs/docker_config.yml"]