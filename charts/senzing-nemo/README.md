# senzing-nemo

## Credit

[remove]
This is based off of [Bitnami's README.md](https://github.com/bitnami/charts/blob/master/template/CHART_NAME/README.md)
We appreciate Bitnami's leadership in Helm Chart creation.
[/remove]

## Synopsis

%%DESCRIPTION%% (check existing examples)

## Overview

### Contents

1. [Preamble](#preamble)
1. [Prerequisites](#prerequisites)
1. [Install chart](#install-chart)
1. [Uninistall chart](#uninstall-chart)

## Preamble

At [Senzing](http://senzing.com),
we strive to create GitHub documentation in a
"[don't make me think](https://github.com/Senzing/knowledge-base/blob/master/WHATIS/dont-make-me-think.md)" style.
For the most part, instructions are copy and paste.
Whenever thinking is needed, it's marked with a "thinking" icon :thinking:.
Whenever customization is needed, it's marked with a "pencil" icon :pencil2:.
If the instructions are not clear, please let us know by opening a new
[Documentation issue](https://github.com/Senzing/kubernetes-demo/issues/new?assignees=&labels=&template=documentation_request.md)
describing where we can improve.   Now on with the show...

## Prerequisites

1. [Kubernetes](https://github.com/Senzing/knowledge-base/blob/master/WHATIS/kubernetes.md) 1.12+
1. [Helm](https://github.com/Senzing/knowledge-base/blob/master/WHATIS/helm.md) 3.1.0
1. PV provisioner support in the underlying infrastructure
1. ReadWriteMany volumes for deployment scaling

## Install chart

1. Add Senzing repository using
   [helm repo add](https://helm.sh/docs/helm/helm_repo_add/).
   Example:

    ```console
    helm repo add senzing https://hub.senzing.com/charts/
    ```

1. :thinking: **Optional:** Update repositories using
   [helm repo update](https://helm.sh/docs/helm/helm_repo_update/).
   Example:

    ```console
    helm repo update
    ```

1. Install chart using
   [helm install](https://helm.sh/docs/helm/helm_install/).
   Example:

    ```console
    helm install my-senzing-nemo senzing/senzing-nemo
    ```

    The command deploys `senzing-nemo` on the Kubernetes cluster in the default configuration.
    The [Parameters](#parameters) section lists the parameters that can be configured during installation.

1. :thinking: **Optional:** View deployed charts using
   [helm list](https://helm.sh/docs/helm/helm_list/).
   Example:

    ```console
    helm list
    ```

## Uninstall chart

1. Uninstall/delete the deployment using
   [helm uninstall](https://helm.sh/docs/helm/helm_uninstall/).
   Example:

    ```console
    helm uninstall my-senzing-nemo
    ```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Parameters

### Global parameters

| Name                      | Description                                     | Value |
| ------------------------- | ----------------------------------------------- | ----- |
| `global.imagePullSecrets` | Global Docker registry secret names as an array | `[]`  |
| `global.imageRegistry`    | Global Docker image registry                    | `""`  |
| `global.storageClass`     | Global StorageClass for Persistent Volume(s)    | `""`  |


### Common parameters

| Name                     | Description                                                                             | Value           |
| ------------------------ | --------------------------------------------------------------------------------------- | --------------- |
| `commonAnnotations`      | Annotations to add to all deployed objects                                              | `{}`            |
| `commonLabels`           | Labels to add to all deployed objects                                                   | `{}`            |
| `clusterDomain`          | Kubernetes cluster domain name                                                          | `cluster.local` |
| `diagnosticMode.args`    | Args to override all containers in the deployment                                       | `["infinity"]`  |
| `diagnosticMode.command` | Command to override all containers in the deployment                                    | `["sleep"]`     |
| `diagnosticMode.enabled` | Enable diagnostic mode (all probes will be disabled and the command will be overridden) | `false`         |
| `extraDeploy`            | Array of extra objects to deploy with the release                                       | `[]`            |
| `fullnameOverride`       | String to fully override senzing-common.names.fullname                                  | `""`            |
| `kubeVersion`            | Override Kubernetes version                                                             | `""`            |
| `nameOverride`           | String to partially override senzing-common.names.fullname                              | `""`            |


### senzing-nemo Parameters

| Name                                      | Description                                                                                    | Value           |
| ----------------------------------------- | ---------------------------------------------------------------------------------------------- | --------------- |
| `main.affinity`                           | Affinity for senzing-nemo pods assignment                                                      | `{}`            |
| `main.args`                               | Override default container args (useful when using custom images)                              | `[]`            |
| `main.autoscaling.builtInMetrics`         | main autoscaling list of built-in metrics                                                      | `[]`            |
| `main.autoscaling.customMetrics`          | main autoscaling list of custom metrics                                                        | `[]`            |
| `main.autoscaling.enabled`                | Enable main deployment autoscaling                                                             | `false`         |
| `main.autoscaling.maxReplicas`            | main autoscaling maximum number of replicas                                                    | `2`             |
| `main.autoscaling.minReplicas`            | main autoscaling minimum number of replicas                                                    | `5`             |
| `main.autoscaling.targetCPU`              | main autoscaling target CPU percentage                                                         | `50`            |
| `main.autoscaling.targetMemory`           | main autoscaling target CPU memory                                                             | `60`            |
| `main.command`                            | Override default container command (useful when using custom images)                           | `[]`            |
| `main.containerSecurityContext.enabled`   | Enabled senzing-nemo containers' Security Context                                              | `true`          |
| `main.containerSecurityContext.runAsUser` | Set senzing-nemo containers' Security Context runAsUser                                        | `1001`          |
| `main.customLivenessProbe`                | Custom livenessProbe that overrides the default one                                            | `{}`            |
| `main.customReadinessProbe`               | Custom readinessProbe that overrides the default one                                           | `{}`            |
| `main.existingConfigmap`                  | The name of an existing ConfigMap with your custom configuration for senzing-nemo              | `nil`           |
| `main.extraEnvVars`                       | Array with extra environment variables to add to senzing-nemo nodes                            | `[]`            |
| `main.extraEnvVarsSecret`                 | Name of existing Secret containing extra env vars for senzing-nemo nodes                       | `nil`           |
| `main.extraEnvVarsCM`                     | Name of existing ConfigMap containing extra env vars for senzing-nemo nodes                    | `nil`           |
| `main.extraVolumes`                       | Optionally specify extra list of additional volumes for the senzing-nemo pod(s)                | `[]`            |
| `main.extraVolumeMounts`                  | Optionally specify extra list of additional volumeMounts for the senzing-nemo container(s)     | `[]`            |
| `main.hostAliases`                        | senzing-nemo pods host aliases                                                                 | `[]`            |
| `main.image.debug`                        | Enable senzing-nemo image debug mode                                                           | `false`         |
| `main.image.pullPolicy`                   | senzing-nemo image pull policy                                                                 | `IfNotPresent`  |
| `main.image.pullSecrets`                  | senzing-nemo image pull secrets                                                                | `[]`            |
| `main.image.registry`                     | senzing-nemo image registry                                                                    | `docker.io`     |
| `main.image.repository`                   | senzing-nemo image repository                                                                  | `senzing/nemo`  |
| `main.image.tag`                          | senzing-nemo image tag (immutable tags are recommended)                                        | `latest`        |
| `main.initContainers`                     | Add additional init containers to the senzing-nemo pod(s)                                      | `{}`            |
| `main.lifecycleHooks`                     | for the senzing-nemo container(s) to automate configuration before or after startup            | `{}`            |
| `main.livenessProbe.enabled`              | Enable livenessProbe on senzing-nemo nodes                                                     | `true`          |
| `main.livenessProbe.failureThreshold`     | Failure threshold for livenessProbe                                                            | `bar`           |
| `main.livenessProbe.initialDelaySeconds`  | Initial delay seconds for livenessProbe                                                        | `foo`           |
| `main.livenessProbe.periodSeconds`        | Period seconds for livenessProbe                                                               | `bar`           |
| `main.livenessProbe.successThreshold`     | Success threshold for livenessProbe                                                            | `foo`           |
| `main.livenessProbe.timeoutSeconds`       | Timeout seconds for livenessProbe                                                              | `foo`           |
| `main.nodeAffinityPreset.key`             | Node label key to match. Ignored if `main.affinity` is set                                     | `""`            |
| `main.nodeAffinityPreset.type`            | Node affinity preset type. Ignored if `main.affinity` is set. Allowed values: `soft` or `hard` | `""`            |
| `main.nodeAffinityPreset.values`          | Node label values to match. Ignored if `main.affinity` is set                                  | `[]`            |
| `main.nodeSelector`                       | Node labels for senzing-nemo pods assignment                                                   | `{}`            |
| `main.podAffinityPreset`                  | Pod affinity preset. Ignored if `main.affinity` is set. Allowed values: `soft` or `hard`       | `""`            |
| `main.podAnnotations`                     | Annotations for senzing-nemo pods                                                              | `{}`            |
| `main.podAntiAffinityPreset`              | Pod anti-affinity preset. Ignored if `main.affinity` is set. Allowed values: `soft` or `hard`  | `soft`          |
| `main.podLabels`                          | Extra labels for senzing-nemo pods                                                             | `{}`            |
| `main.podSecurityContext.enabled`         | Enabled senzing-nemo pods' Security Context                                                    | `true`          |
| `main.podSecurityContext.fsGroup`         | Set senzing-nemo pod's Security Context fsGroup                                                | `1001`          |
| `main.priorityClassName`                  | senzing-nemo pods' priorityClassName                                                           | `""`            |
| `main.readinessProbe.enabled`             | Enable readinessProbe on senzing-nemo nodes                                                    | `true`          |
| `main.readinessProbe.failureThreshold`    | Failure threshold for readinessProbe                                                           | `bar`           |
| `main.readinessProbe.initialDelaySeconds` | Initial delay seconds for readinessProbe                                                       | `foo`           |
| `main.readinessProbe.periodSeconds`       | Period seconds for readinessProbe                                                              | `bar`           |
| `main.readinessProbe.successThreshold`    | Success threshold for readinessProbe                                                           | `foo`           |
| `main.readinessProbe.timeoutSeconds`      | Timeout seconds for readinessProbe                                                             | `foo`           |
| `main.replicaCount`                       | Number of senzing-nemo replicas to deploy                                                      | `1`             |
| `main.resources.limits`                   | The resources limits for the senzing-nemo containers                                           | `{}`            |
| `main.resources.requests`                 | The requested resources for the senzing-nemo containers                                        | `{}`            |
| `main.senzing.databaseUrl`                | The normalized database connection URL                                                         | `""`            |
| `main.senzing.debug`                      | Debug?  Boolean.                                                                               | `""`            |
| `main.senzing.logLevel`                   | The logging filter: DEBUG, INFO, WARNING, ERROR, CRITICAL, FATAL                               | `""`            |
| `main.senzing.subcommand`                 | CLI sub-command                                                                                | `""`            |
| `main.sidecars`                           | Add additional sidecar containers to the senzing-nemo pod(s)                                   | `{}`            |
| `main.tolerations`                        | Tolerations for senzing-nemo pods assignment                                                   | `[]`            |
| `main.updateStrategy.type`                | senzing-nemo statefulset strategy type                                                         | `RollingUpdate` |


### Traffic Exposure Parameters

| Name                               | Description                                                                                           | Value                    |
| ---------------------------------- | ----------------------------------------------------------------------------------------------------- | ------------------------ |
| `ingress.annotations`              | Additional custom annotations for the ingress record                                                  | `{}`                     |
| `ingress.apiVersion`               | Force Ingress API version (automatically detected if not set)                                         | `nil`                    |
| `ingress.certManager`              | Add the corresponding annotations for cert-manager integration                                        | `false`                  |
| `ingress.enabled`                  | Enable ingress record generation for senzing-nemo                                                     | `false`                  |
| `ingress.extraHosts`               | An array with additional hostname(s) to be covered with the ingress record                            | `[]`                     |
| `ingress.extraPaths`               | An array with additional arbitrary paths that may need to be added to the ingress under the main host | `[]`                     |
| `ingress.extraTls`                 | TLS configuration for additional hostname(s) to be covered with this ingress record                   | `[]`                     |
| `ingress.hostname`                 | Default host for the ingress record                                                                   | `nemoComponent.local`    |
| `ingress.path`                     | Default path for the ingress record                                                                   | `/`                      |
| `ingress.pathType`                 | Ingress path type                                                                                     | `ImplementationSpecific` |
| `ingress.secrets`                  | Custom TLS certificates as secrets                                                                    | `[]`                     |
| `ingress.selfSigned`               | Create a TLS secret for this ingress record using self-signed certificates generated by Helm          | `false`                  |
| `ingress.tls`                      | Enable TLS configuration for the host defined at `ingress.hostname` parameter                         | `false`                  |
| `service.annotations`              | Additional custom annotations for senzing-nemo service                                                | `{}`                     |
| `service.clusterIP`                | senzing-nemo service Cluster IP                                                                       | `nil`                    |
| `service.externalTrafficPolicy`    | senzing-nemo service external traffic policy                                                          | `Cluster`                |
| `service.httpsPort`                | senzing-nemo service HTTPS port                                                                       | `443`                    |
| `service.loadBalancerIP`           | senzing-nemo service Load Balancer IP                                                                 | `nil`                    |
| `service.loadBalancerSourceRanges` | senzing-nemo service Load Balancer sources                                                            | `[]`                     |
| `service.nodePorts.http`           | Node port for HTTP                                                                                    | `nil`                    |
| `service.nodePorts.https`          | Node port for HTTPS                                                                                   | `nil`                    |
| `service.port`                     | senzing-nemo service HTTP port                                                                        | `80`                     |
| `service.type`                     | senzing-nemo service type                                                                             | `LoadBalancer`           |


### Init Container Parameters

| Name                                                   | Description                                                                                     | Value                   |
| ------------------------------------------------------ | ----------------------------------------------------------------------------------------------- | ----------------------- |
| `volumePermissions.containerSecurityContext.runAsUser` | Set init container's Security Context runAsUser                                                 | `0`                     |
| `volumePermissions.enabled`                            | Enable init container that changes the owner/group of the PV mount point to `runAsUser:fsGroup` | `false`                 |
| `volumePermissions.image.pullPolicy`                   | Bitnami Shell image pull policy                                                                 | `Always`                |
| `volumePermissions.image.pullSecrets`                  | Bitnami Shell image pull secrets                                                                | `[]`                    |
| `volumePermissions.image.registry`                     | Bitnami Shell image registry                                                                    | `docker.io`             |
| `volumePermissions.image.repository`                   | Bitnami Shell image repository                                                                  | `bitnami/bitnami-shell` |
| `volumePermissions.image.tag`                          | Bitnami Shell image tag (immutable tags are recommended)                                        | `10`                    |
| `volumePermissions.resources.limits`                   | The resources limits for the init container                                                     | `{}`                    |
| `volumePermissions.resources.requests`                 | The requested resources for the init container                                                  | `{}`                    |


### Other Parameters

| Name                    | Description                                          | Value   |
| ----------------------- | ---------------------------------------------------- | ------- |
| `rbac.create`           | Specifies whether RBAC resources should be created   | `false` |
| `serviceAccount.create` | Specifies whether a ServiceAccount should be created | `true`  |
| `serviceAccount.name`   | The name of the ServiceAccount to use.               | `""`    |


See [readme-generator-for-helm)](https://github.com/bitnami-labs/readme-generator-for-helm) to create the table

The above parameters map to the env variables defined in [bitnami/senzing-nemo](http://github.com/bitnami/bitnami-docker-%%CHART_NAME%%). For more information please refer to the [bitnami/senzing-nemo](http://github.com/bitnami/bitnami-docker-%%CHART_NAME%%) image documentation.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install my-release \
  --set %%CHART_NAME%%Username=admin \
  --set %%CHART_NAME%%Password=password \
  --set mariadb.auth.rootPassword=secretpassword \
    senzing/senzing-nemo
```

The above command sets the senzing-nemo administrator account username and password to `admin` and `password` respectively. Additionally, it sets the MariaDB `root` user password to `secretpassword`.

> NOTE: Once this chart is deployed, it is not possible to change the application's access credentials, such as usernames or passwords, using Helm. To change these application credentials after deployment, delete any persistent volumes (PVs) used by the chart and re-deploy it, or use the application's built-in administrative tools if available.

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install my-senzing-nemo -f values.yaml senzing/senzing-nemo
```

> **Tip**: You can use the default [values.yaml](values.yaml)
