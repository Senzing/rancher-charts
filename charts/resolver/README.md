# resolver

## Overview

This chart runs a [senzing/resolver](https://github.com/Senzing/resolver) deployment on a
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

1. [DockerHub](https://hub.docker.com/r/senzing/resolver)
1. [GitHub](https://github.com/Senzing/resolver)

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
      --name my-resolver \
      senzing/resolver
    ```

## Uninstalling the Chart

1. Uninstall/delete the deployment.
   Example:

    ```console
    helm delete my-resolver
    ```

## Configuration

| Parameter | Description | Default |
|-----------|-------------|---------|
| `image.repository` | Image name        | `senzing/resolver` |
| `image.tag`         | Image tag         | `latest` |
| `image.pullPolicy` | Image pull policy | `IfNotPresent` |

1. Specify each parameter using the `--set key=value[,key=value]` argument to `helm install` or use multiple `--set` arguments. Example:

    ```console
    helm install \
      --name my-senzing-base \
      --set image.tag=1.10.99999 \
      senzing/resolver
    ```

1. Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart.

    `my-additional-values.yaml` YAML file example contents:

    ```yaml
    image:
      tag: 1.10.99999
    ```

    Install helm chart. Example:

    ```console
    helm install \
      --name my-resolver \
      --values my-additional-values.yaml \
      senzing/resolver
    ```

## References
