## Setup

If any of this information gets outdated please see the instructions on how to run Cloudtube on the [official documentation](https://git.sr.ht/~cadence/tube-docs/tree/main/item/docs).

In order to start containers you'll need to properly setup config files for both [Cloudtube (config.js)](https://git.sr.ht/~cadence/cloudtube/tree/main/item/config/config.sample.js) and [Newleaf (configuration.py)](https://git.sr.ht/~cadence/NewLeaf/tree/main/item/configuration.sample.py), for the following examples you can use the locally copied (and configured) [cloudtube.config.js](cloudtube.config.js) and [newleaf-configuration.py](newleaf-configuration.py)

## Docker compose

```yaml
version: "3.4"

services:
  cloudtube:
    image: abeltramo/cloudtube:latest
    ports:
      - 3001:10412
    depends_on:
      - newleaf
    container_name: cloudtube
    restart: unless-stopped
    volumes:
      - ./db:/workdir/db
      - ./cloudtube.config.js:/workdir/config/config.js #instance should be "http://newleaf:3000"

  newleaf:
    image: abeltramo/newleaf:latest
    container_name: newleaf
    restart: unless-stopped
    volumes:
      - ./newleaf-configuration.py:/workdir/configuration.py #set e.g. website_origin = "https://tube.domain.tld" and bind_port = 3000
```

Run: `docker-compose up`, this command will trigger the following:

1. Download latest cloudtube and newleaf docker images from Docker hub (if already present locally will be updated)
2. Start `newleaf` first: this is because we specified that cloudtube `depends_on` newleaf. This container will also get the local [newleaf-configuration.py](newleaf-configuration.py) mounted at `/workdir/configuration.py`
3. Start `cloudtube` this container will:
    1. Get the local [cloudtube.config.js](cloudtube.config.js) at `/workdir/config/config.js`.
    2. Get the local `db` folder (will be created if not present) so that the sqlite db will be persisted outside of the container.
    3. Expose the web ui from the default port `10412` to the local `3001` port

Setup is over you can open your web browser at [http://localhost:3001](http://localhost:3001) to start using cloudtube 

---

You can see a more sophisticated [docker-compose-traefik.yml](docker-compose-traefik.yml) example that involves using Traefik as a proxy thanks to @erikderzweite