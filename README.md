This is a Dockerfile setup for nzbmegasearch - http://pillone.github.io/usntssearch/

To run:

docker run -d --name="nzbmegasearch" -v /path/to/config/file:/config -p 5000:5000 needo/nzbmegasearch
