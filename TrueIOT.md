# Build IOT docker image
```bash
docker build -t="nms/docker-iot" .
```

# Setup IOT mqtt users

## Tracker user
```bash
mosca adduser true_tracker true_890_123_654 --credentials /db/credentials.json --authorize-publish 'PUB/THA/TRACKER/*' --authorize-subscribe 'SUB/THA/TRACKER/*'
```

## Watch user
```bash
mosca adduser true_watch true_890_123_654 --credentials /db/credentials.json --authorize-publish 'PUB/THA/WATCH/*' --authorize-subscribe 'SUB/THA/WATCH/*'
```

## Proxy user
```bash
mosca adduser true_proxy true_890_123_654 --credentials /db/credentials.json
```

## Remove user
```bash
mosca rmuser username --credentials /db/credentials.json
```

# Start mqtt server
```bash
/usr/src/app/bin/mosca -d /db --credentials /db/credentials.json --http-port 80 --http-bundle -v
```
# 