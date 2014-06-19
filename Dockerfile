FROM debian:jessie
MAINTAINER needo <needo@superhero.org>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q

# Install plexWatch Dependencies
RUN apt-get install -qy git python

# Checkout CouchPotato from github
RUN git clone https://github.com/pillone/usntssearch.git /opt/

# Path to nzbmegasearch's custom_params.ini
VOLUME /config

# megasearch doesn't have a handy config file command line argument
RUN ln -s /config/custom_params.ini /opt/NZBmegasearch/custom_params.ini

EXPOSE 5000

ENTRYPOINT ["python", "/opt/NZBmegasearch/mega2.py"]
