This is a Dockerfile setup for nzbmegasearch - http://pillone.github.io/usntssearch/

By default this Docker installs the latest stable version of nzbmegasearch:

```
docker run -d --name="nzbmegasearch" -v /path/to/config/file:/config -v /etc/localtime:/etc/localtime:ro -p 5000:5000 needo/nzbmegasearch
```

Edge
----
If you would like to run the latest updates from the master branch as well as enable in-app updates run:

```
docker run -d --name="nzbmegasearch" -v /path/to/config/file:/config -v /etc/localtime:/etc/localtime:ro -p 5000:5000 -e EDGE=1 needo/nzbmegasearch
```
