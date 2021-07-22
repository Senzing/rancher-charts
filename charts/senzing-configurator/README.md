# senzing-configurator

## Overview

This chart runs a [senzing/configurator](https://github.com/Senzing/configurator) deployment on a
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

1. [DockerHub](https://hub.docker.com/r/senzing/configurator)
1. [GitHub](https://github.com/Senzing/configurator)

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
      --name my-senzing-configurator \
      senzing/senzing-configurator
    ```

## Uninstalling the Chart

1. Uninstall/delete the deployment.
   Example:

    ```console
    helm delete my-senzing-configurator
    ```

## Configuration

| Parameter | Description | Default |
|-----------|-------------|---------|
| `image.repository` | Image name        | `senzing/configurator` |
| `image.tag`         | Image tag         | `latest` |
| `image.pullPolicy` | Image pull policy | `IfNotPresent` |

1. Specify each parameter using the `--set key=value[,key=value]` argument to `helm install` or use multiple `--set` arguments. Example:

    ```console
    helm install \
      --name my-senzing-configurator \
      --set image.tag=1.10.99999 \
      senzing/senzing-configurator
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
      --name my-senzing-configurator \
      --values my-additional-values.yaml \
      senzing/senzing-configurator
    ```

## References
