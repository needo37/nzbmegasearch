FROM debian:jessie
MAINTAINER needo <needo@superhero.org>
ENV DEBIAN_FRONTEND noninteractive

# Fix a Debianism of the nobody's uid being 65534
RUN usermod -u 99 nobody
RUN usermod -g 100 nobody

RUN apt-get update -q

# Install Dependencies
RUN apt-get install -qy wget python

# Install nzbmegasearch v0.46
RUN mkdir /opt/NZBmegasearch
RUN wget -P /tmp/ https://github.com/pillone/usntssearch/archive/v0.46.tar.gz
RUN tar -C /opt/NZBmegasearch -xvf /tmp/v0.46.tar.gz --strip-components 1
RUN chown nobody:users /opt/NZBmegasearch

# Path to nzbmegasearch's custom_params.ini
VOLUME /config

# megasearch doesn't have a handy config file command line argument
RUN ln -s /config/custom_params.ini /opt/NZBmegasearch/custom_params.ini

EXPOSE 5000

USER nobody
ENTRYPOINT ["python", "/opt/NZBmegasearch/mega2.py"]
