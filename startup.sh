#!/bin/sh

# On first run crafty still currently asks interactively if you want to setup
# a server and then crashes because of the EOF it gets from stdnin.
# This works around that.
echo "n\n" | exec python /crafty_web/crafty.py \
  -c /crafty_web/configs/docker_config.yml
