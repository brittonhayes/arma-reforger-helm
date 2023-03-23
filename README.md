# ARMA Reforger Helm Chart

A helm chart for deploying an [ARMA Reforger](https://community.bistudio.com/wiki/Arma_Reforger:Server_Hosting) dedicated linux server to kubernetes clusters via helm.

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/arma-reforger)](https://artifacthub.io/packages/search?repo=arma-reforger)

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
  scenarioID: "{59AD59368755F41A}Missions/21_GM_Eden.conf" # Scenario ID for "Game Master - Everon"

  # {90F086877C27B6F6}Missions/99_Tutorial.conf - Tutorial
  # {ECC61978EDCC2B5A}Missions/23_Campaign.conf - Conflict
  # {59AD59368755F41A}Missions/21_GM_Eden.conf - Game Master - Everon

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

Add a couple mods to your server. All mods will be automatically downloaded and installed, no additional configuration required.

```yaml
# Adding mods
config:
  mods:
  - modId: "59A30ACC02650E71"
    name: "Night Vision System"
    version: "1.1.3"
  - modId: "5A64DE35CCD36695"
    name: "3rd Ranger Battalion Modpack"
    version: "0.7.11"
```

Adding a modern military modset to your server

```yaml
config:
  mods:
  - modId: "59A30ACC02650E71"
    name: "Night Vision System"
    version: "1.1.5"
  - modId: "5A64DE35CCD36695"
    name: "3rd Ranger Battalion Modpack"
    version: "0.7.11"
  - modId: "59664C0CB36501CD"
    name: "BloodLust2"
    version: "0.3.0"
  - modId: "5AAF6D5352E5FCAB"
    name: "Project Redline - Core"
    version: "1.0.8"
  - modId: "597D72161FD1ED1D"
    name: "AttachmentsCompatibility"
    version: "0.0.4"
  - modId: "59BA0CE1B043CA92"
    name: "Project Redline - MD500"
    version: "1.0.2"
  - modId: "5994AD5A9F33BE57"
    name: "Game Master FX"
    version: "1.0.50"
  - modId: "5B02128D896F7DE8"
    name: "STRYKER"
    version: "1.1.11"
  - modId: "5AB301290317994A"
    name: "Suppressor System"
    version: "1.0.6"
  - modId: "5ABD0CB57F7E9EB1"
    name: "RIS Laser Attachments"
    version: "1.0.29"
  - modId: "5B3ED33ADA805340"
    name: "3RBN Weapons"
    version: "0.7.0"
```

Adding a cold war modset to your server

```yaml
config:
  mods:
  - modId: "5994AD5A9F33BE57"
    name: "Game Master FX"
    version: "1.0.50"
  - modId: "59674C21AA886D57"
    name: "BetterMuzzleFlashes"
    version: "1.3.2"
  - modId: "59F44B92BEFF0CED"
    name: "BetterVehicles"
    version: "1.1.0"
  - modId: "59673B6FBB95459F"
    name: "BetterTracers"
    version: "1.1.7"
  - modId: "59651354B2904BA6"
    name: "BetterHitsEffects"
    version: "2.7.13"
  - modId: "597D2A65AB73E657"
    name: "BetterExplosives"
    version: "1.1.5"
  - modId: "59664C0CB36501CD"
    name: "BloodLust2"
    version: "0.3.0"
```

# Acknowledgements

- Helm chart design heavily based on the work by [fbuchmeier](https://github.com/fbuchmeier)
- Server administration using [linuxgsm](https://linuxgsm.com)