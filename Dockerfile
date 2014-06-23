FROM debian:jessie
MAINTAINER needo <needo@superhero.org>
ENV DEBIAN_FRONTEND noninteractive

# Fix a Debianism of the nobody's uid being 65534
RUN usermod -u 99 nobody
RUN usermod -g 100 nobody

RUN apt-get update -q

# Install Dependencies
RUN apt-get install -qy git python

# Checkout CouchPotato from github
RUN git clone https://github.com/pillone/usntssearch.git /opt/

# Path to nzbmegasearch's custom_params.ini
VOLUME /config

# megasearch doesn't have a handy config file command line argument
RUN ln -s /config/custom_params.ini /opt/NZBmegasearch/custom_params.ini

EXPOSE 5000

USER nobody
ENTRYPOINT ["python", "/opt/NZBmegasearch/mega2.py"]
