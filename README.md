# playground K3D cluster

## Create cluster
```
k3d cluster create --config k3d-playground.yaml
```

## Configure traefik
```
kubectl create secret tls traefik-custom-cert -n kube-system \
  --cert=traefik/tls/traefik.localhost.crt   \
  --key=traefik/tls/traefik.localhost.key
```

## Deploy cert-manager
```
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.21.3/cert-manager.yaml

kubectl create secret tls local-ca-secret \
  --cert=cert-manager/tls/localhost_Intermediate_CA.crt \
  --key=cert-manager/tls/localhost_Intermediate_CA.key \
  -n cert-manager

kubectl apply -f cert-manager/cluster-issuer.yaml
```

## Deploy whoami
```
kubectl apply -f whoami/whoami.yaml
kubectl apply -f whoami/whoami-ingress.yaml
```