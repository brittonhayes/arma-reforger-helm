# ARMA Reforger Helm Chart

A helm chart for deploying an [ARMA Reforger](https://community.bistudio.com/wiki/Arma_Reforger:Server_Hosting) dedicated linux server to kubernetes clusters via helm.

[Helm Docs](./charts/arma-reforger/README.md)

[Docker Image](https://github.com/brittonhayes/arma-reforger-helm/packages)

[ARMA Reforger Hosting Wiki](https://community.bistudio.com/wiki/Arma_Reforger:Server_Hosting)

## Usage

To use with helm, run the following command after setting the environment variables:

```bash
# Create a values file with your configuration settings
touch values.yaml

# Create a namespace for your server
kubectl create ns arma-reforger

# Add the helm repository to your cluster
helm repo add https://brittonhayes.github.io/arma-reforger-helm

# Install the helm chart into the namespace
helm install -n arma-reforger --values values.yaml arma-reforger/arma-reforger arma-reforger

# OR Upgrade the helm chart
helm upgrade -n arma-reforger --values values.yaml --install arma-reforger arma-reforger/arma-reforger
```

## Configuration

Basic deployment with discord webhook alerting

```yaml
replicas: 1

alerts:
  discord: https://discord.com/api/webhooks/1234567890/1234567890

config:
  name: My Reforger Server
  playerCountLimit: 10 # Maximum number of players
  steamQueryPort: 32002 # Public Port of the steam query endpoint
  gameHostBindPort: 32001 # Public Port of the server
  gameHostRegisterBindAddress: 73.XXX.XXX.XXX # Public IP of the server
  gameHostRegisterBindPort: 32001 # Public Port of the server

credentials:
  adminPassword: mysupersecretadminpassword
  serverPassword: mysupersecretserverpassword

resources:
  limits:
    cpu: 5
    memory: 8Gi
  requests:
    cpu: 4
    memory: 4G
```

# Acknowledgements

- Helm chart design heavily based on the work by [fbuchmeier](https://github.com/fbuchmeier)
- Server administration using [linuxgsm](https://linuxgsm.com)