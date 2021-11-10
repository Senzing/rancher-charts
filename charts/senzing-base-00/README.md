# senzing-base

## Overview

This chart bootstraps a [generic Senzing environment](https://github.com/Senzing/docker-senzing-base) deployment on a
[Kubernetes](http://kubernetes.io) cluster using the
[Helm](https://helm.sh) package manager.

### Contents

1. [Prerequisites](#prerequisites)
1. [Installing the Chart](#installing-the-chart)
1. [Uninstalling the Chart](#uninstalling-the-chart)
1. [Configuration](#configuration)
1. [CHANGELOG](CHANGELOG.md)
1. [References](#references)

### Related artifacts

1. [DockerHub](https://hub.docker.com/r/senzing/senzing-base)
1. [GitHub](https://github.com/Senzing/docker-senzing-base)

## Prerequisites

1. Install Senzing helm charts.
   Example:

    ```console
    helm repo add senzing 'https://senzing.github.io/charts/'
    ```

## Installing the Chart

1. Install into default namespace.
   Example:

    ```console
    helm install \
      --name my-senzing-base \
      --set senzing.databaseUrl=${SENZING_DATABASE_URL} \
      senzing/senzing-base
    ```

## Uninstalling the Chart

1. Uninstall/delete the deployment.
   Example:

    ```console
    helm delete my-senzing-base
    ```

## Configuration

| Parameter | Description | Default |
|-----------|-------------|---------|
| `image.repository` | Image name | `senzing/senzing-base` |
| `image.tag` | Image tag | `latest` |
| `image.pullPolicy` | Image pull policy | `IfNotPresent` |
| `senzing.persistentVolumeClaim` | Persistent Volume Claim (PVC) | `senzing-persistent-volume-claim` |

1. Specify each parameter using the `--set key=value[,key=value]` argument to `helm install` or use multiple `--set` arguments.
   Example:

    ```console
    helm install \
      --name my-senzing-base \
      --set senzing.persistentVolumeClaim=my-persistent-volume-claim
      senzing/senzing-base
    ```

1. Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart.

    `my-additional-values.yaml` YAML file example contents:

    ```yaml
    senzing:
      persistentVolumeClaim: my-persistent-volume-claim
    ```

    Install helm chart.  Example:

    ```console
    helm install \
      --name my-senzing-base \
      --values my-additional-values.yaml \
      senzing/senzing-base
    ```

## References
