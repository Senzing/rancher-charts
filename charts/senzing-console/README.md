# senzing-console

## Overview

This chart bootstraps a
[Senzing environment for console access](https://github.com/Senzing/docker-senzing-console)
a deployment on a
[Kubernetes](http://kubernetes.io)
cluster using the
[Helm](https://helm.sh) package manager.

### Contents

1. [Prerequisites](#prerequisites)
1. [Installing the Chart](#installing-the-chart)
1. [Uninstalling the Chart](#uninstalling-the-chart)
1. [Configuration](#configuration)
1. [CHANGELOG](CHANGELOG.md)
1. [References](#references)

### Related artifacts

1. [DockerHub](https://hub.docker.com/r/senzing/senzing-console)
1. [GitHub](https://github.com/Senzing/docker-senzing-console)

## Prerequisites

1. Install Senzing helm charts. Example:

    ```console
    helm repo add senzing 'https://senzing.github.io/charts/'
    ```

## Installing the Chart

1. Install into default namespace. Example:

    ```console
    helm install \
      --name my-senzing-console \
      senzing/senzing-console
    ```

## Uninstalling the Chart

1. Uninstall/delete the deployment. Example:

    ```console
    helm delete my-senzing-console
    ```

## Configuration

| Parameter | Description | Default |
|-----------|-------------|---------|
| `image.repository` | Image name | `senzing/senzing-console` |
| `image.tag` | Image tag | `latest` |
| `image.pullPolicy` | Image pull policy | `IfNotPresent` |
| `senzing.engineConfigurationJson` | [SENZING_ENGINE_CONFIGURATION_JSON](https://github.com/Senzing/knowledge-base/blob/master/lists/environment-variables.md#senzing_engine_configuration_json) | None |
| `senzing.mountOptIbm` | Mount `/opt/IBM` for use with Db2 SQL database driver | `false` |
| `senzing.mountOptMicrosoft` | Mount `/opt/microsoft` for use with MS SQL database driver | `false` |
| `senzing.persistentVolumeClaim` | A Persistent Volume Claim (PVC) that can store `/opt/senzing` data | `senzing-persistent-volume-claim` |

1. Specify each parameter using the `--set key=value[,key=value]` argument to `helm install` or use multiple `--set` arguments. Example:

    ```console
    helm install \
      --name my-senzing-console \
      --set senzing.persistentVolumeClaim="my-new-senzing-claim" \
      senzing/senzing-console
    ```

1. Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart.

    `my-additional-values.yaml` YAML file example contents:

    ```yaml
    senzing:
      persistentVolumeClaim: my-new-senzing-claim
    ```

    Install helm chart. Example:

    ```console
    helm install \
      --name my-senzing-console \
      --values my-additional-values.yaml \
      senzing/senzing-console
    ```

## References
