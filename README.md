# Arma 3 Dedicated Server

An Arma 3 Dedicated Server. Updates to the latest version every time it is restarted.

[Helm Docs](./charts/arma-reforger/README.md)

[Docker Image](https://github.com/brittonhayes/arma-reforger-helm/packages)

[ARMA Reforger Hosting Wiki](https://community.bistudio.com/wiki/Arma_Reforger:Server_Hosting)

## Usage

To use with helm, run the following command after setting the environment variables:

```bash
# Create a values file with your configuration settings
touch values.yaml

# Install the helm chart
helm -n arma-reforger install arma-reforger ./charts --values values.yaml
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