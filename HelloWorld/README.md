## Dependencies
### install ko
```
GO111MODULE=on go get github.com/google/ko/cmd/ko
```
### install tekton cli
```
brew tap tektoncd/tools
brew install tektoncd/tools/tektoncd-cli
```
### Docker setup
- 4 cpu, 8GB memory, 1GB swap
- Enable docker kubernetes
- Add `host.docker.local:5000` as an insecure registry with Docker for Desktop

## Start local docker registry
```
docker run -d -p 5000:5000 --name registry-srv -e REGISTRY_STORAGE_DELETE_ENABLED=true registry:2
```

## Start local docker registry ui (localhost:8080)
```
docker run -it -p 8080:8080 --name registry-web --link registry-srv -e REGISTRY_URL=http://registry-srv:5000/v2 -e REGISTRY_NAME=localhost:5000 hyper/docker-registry-web
```

## Setting credentials
```
kubectl create secret docker-registry regcred \
                    --docker-server=host.docker.local:5000 \
                    --docker-username=shiyu \
                    --docker-password=test \
                    --docker-email=shiyu@uber.com
```

## Follow tutorial
https://github.com/tektoncd/pipeline/blob/master/docs/tutorial.md
