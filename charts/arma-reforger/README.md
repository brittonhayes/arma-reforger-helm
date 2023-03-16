# arma-reforger

![Version: 0.1.7](https://img.shields.io/badge/Version-0.1.7-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.16.0](https://img.shields.io/badge/AppVersion-1.16.0-informational?style=flat-square)

A Helm chart for ARMA reforger on LinuxGSM.

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Britton Hayes |  | <https://github.com/brittonhayes> |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| alerts | object | `{"discord":""}` | Webook alerts configurations |
| alerts.discord | string | `""` | Discord webhook URL |
| config.admins | list | `[]` | List of administrators |
| config.autoJoinable | bool | `false` | Set if the session can be selected through the auto join feature.  |
| config.battleeye | bool | `true` | true=enabled, false=disabled |
| config.commonConfigPath | string | `"/linuxgsm/lgsm/config-lgsm/armarserver/common.cfg"` | Common config path |
| config.dedicatedServerID | string | `""` |  |
| config.disableThirdPerson | bool | `false` | true=enabled, false=disabled |
| config.fastvalidation | bool | `true` | false (disabled) - extra data for every replicated entity and component in the map will be transferred when new client connects to the server. When a mismatch occurs, it is possible to point at particular entity or component where things start to differ. When developing locally (ie. both server and client run on the same machine), it is fine to disable fast validation to more easily pin point source of the problem. |
| config.gameHostBindAddress | string | `"0.0.0.0"` | When left out or empty, 0.0.0.0 is used, which allows connections through any IP address.  |
| config.gameHostBindPort | int | `2001` | UDP port to which the server socket will be bound.  |
| config.gameHostRegisterBindAddress | string | `"0.0.0.0"` | When left out or empty, an attempt is made to automatically determine the IP address, but this will often fail and should not be relied upon as the server might not be reachable from public networks.  |
| config.gameHostRegisterBindPort | int | `2001` | Otherwise, this is the UDP port that is forwarded to the server.   |
| config.maxFPS | int | `60` | otherwise, the server can try to use all the available resources! |
| config.mods | list | `[]` | List of mods |
| config.name | string | `"arma-reforger-server.example.com"` | length 0..100 characters  |
| config.networkViewDistance | int | `500` | Maximum network streaming range of replicated entities.  |
| config.playerCountLimit | int | `20` | Set the maximum amount of players on the server.  |
| config.region | string | `"US"` | ISO 3166-1 alpha-2 values are accepted - https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2 |
| config.scenarioID | string | `""` | See the listScenarios startup parameter to list available scenarios and obtain their .conf file path.  |
| config.serverConfigPath | string | `"/linuxgsm/lgsm/config-lgsm/armarserver/armarserver.server.json"` | Server config path |
| config.serverMaxViewDistance | int | `1600` | number value, range 500..10000, default: 1600  |
| config.serverMinGrassDistance | int | `0` | Minimum grass distance in meters. If set to 0 no distance is forced upon clients.  |
| config.steamQueryPort | int | `17777` | Change Steam Query UDP port on which game listens to A2S requests  |
| config.supportedGameClientTypes | list | `["PLATFORM_PC","PLATFORM_XBL"]` | A server cannot be Xbox-exclusive; if configured with only PLATFORM_XBL, the server will not start. |
| config.visible | bool | `true` | Set the visibility of the server in the Server Browser. |
| credentials | object | `{"adminPassword":"","serverPassword":"","useExistingSecret":{"adminPasswordKey":"admin-password","enabled":false,"name":"","namespace":"","serverPasswordKey":"server-password"}}` | Specify credentials for the server |
| credentials.useExistingSecret.adminPasswordKey | string | `"admin-password"` | The Server ADMIN Password |
| credentials.useExistingSecret.enabled | bool | `false` | Use a dedicated, already existing secret for credentials, any key already specified under 'credentials.' directly will be ignored |
| credentials.useExistingSecret.name | string | `""` | The credential is looked up from a secret with this name |
| credentials.useExistingSecret.namespace | string | `""` | The credential is looked up from a secret, which resides in this namespace if empty, use Release.Namespace |
| credentials.useExistingSecret.serverPasswordKey | string | `"server-password"` | The Server Password |
| deploymentAnnotations."reloader.stakater.com/auto" | string | `"true"` | To automatically reload the container on configuration changes, use |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/brittonhayes/arma-reforger"` |  |
| image.tag | string | `"latest"` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence.data.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.data.annotations | object | `{}` |  |
| persistence.data.enabled | bool | `true` |  |
| persistence.data.size | string | `"40Gi"` | Size of the persistent volume claim (set this closer to 100Gi if you want to use quite a few mods) |
| persistence.data.storageClass | string | `"hostpath"` |  |
| persistence.profile.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.profile.annotations | object | `{}` |  |
| persistence.profile.enabled | bool | `true` | WARNING: if you set this to false, your progress in Antistasi will be lost on a server restart |
| persistence.profile.size | string | `"2Gi"` |  |
| persistence.profile.storageClass | string | `"hostpath"` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | string | `nil` |  |
| replicas | int | `1` | Only one replica is supported at this time |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.type | string | `"NodePort"` |  |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
