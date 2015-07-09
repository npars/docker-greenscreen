# greenscreen
Docker image of groupon/greenscreen

# Usage

Provide Chromecast application id and Couchdb settings.

Example with default values:

```
docker run \
    -p 4994:4994 \
    -e CAST_APPID="" \
    -e COUCH_HOST="http://couchdb" \
    -e COUCH_PORT="5984" \
    -e COUCH_DB="gscreen" \
    tomologic/greenscreen
```

## Cloudant

Cloudant is currently free if monthly cost is below $50.00

Example settings with [Cloudant](https://cloudant.com/):

```
docker run \
    -p 4994:4994 \
    -e CAST_APPID="Your Chromecast Application ID" \
    -e COUCH_HOST="https://KEY:PASSWORD@ACCOUNT.cloudant.com" \
    -e COUCH_PORT="443" \
    tomologic/greenscreen
```
