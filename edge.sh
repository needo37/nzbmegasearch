#!/bin/bash

# Does the user want the latest version
if [ -z "$EDGE" ]; then
  echo "Bleeding edge not requested"
else
  apt-get install -qy git
  rm -rf /opt/NZBmegasearch
  git clone https://github.com/pillone/usntssearch.git /opt/NZBmegasearch
  ln -s /config/custom_params.ini /opt/NZBmegasearch/custom_params.ini
  chown -R nobody:users /opt/NZBmegasearch
fi
