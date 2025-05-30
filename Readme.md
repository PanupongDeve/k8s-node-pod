# Learn Typescript  

Application Runtime - Nodejs  
Package Manger - NPM
Dependencies Management - package.json, package-lock.json  
Sorce Code - dist/index.js  
Type - Application Package  


## Build Step

1. build container

```bash
docker build -t panupongdeve/node-pod:<tag> .
```

2. push to container registry

login docker
```bash
docker login
```

push docker
```bash
docker push panupongdeve/node-pod:multi-stages-v2
```

## Deploy K8S

Minefests directory: ./minifests

```bash
cd manifests
kubectl apply -f .\hello.pod.yaml
```

## generate pod file
```bash
kubectl run node-pod --image=panupongdeve/node-pod:multi-stages-v2 --env="HOST=0.0.0.0" --port=5000 --dry-run=client -o yaml -l app=node-pod > manifests/node-pod.yml
```


### Forwarding Port
```bash
kubectl port-forward --address 0.0.0.0 pods/node-pod 5000:5000
```

### Generate Deployment
```bash
kubectl create deploy nginx --image nginx -o yaml --dry-run=client > .\manifests\nginx.yml
```

### Nginx ingress
```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.12.1/deploy/static/provider/baremetal/deploy.yaml
```