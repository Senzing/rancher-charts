# Charts

## Overview

Charts used with [Kubernetes](https://github.com/Senzing/knowledge-base/blob/master/WHATIS/kubernetes.md).

Used by:

- [Helm](https://github.com/Senzing/knowledge-base/blob/master/WHATIS/helm.md)
- [Rancher](https://github.com/Senzing/knowledge-base/blob/master/WHATIS/rancher.md)
  - [Catalog](https://rancher.com/docs/rancher/v2.x/en/catalog/)

### Contents

1. [Using Helm](#using-helm)
    1. [Add helm repository](#add-helm-repository)
    1. [List helm repositories](#list-helm-repositories)
    1. [View charts in Senzing Helm repository](#view-charts-in-senzing-helm-repository)
    1. [Remove helm repository](#remove-helm-repository)
1. [Using Rancher Catalog](#using-rancher-catalog)
    1. [Add catalog](#add-catalog)
    1. [Delete catalog](#delete-catalog)
1. [Development](#development)
    1. [Clone repository](#clone-repository)
    1. [Identify public charts](#identify-public-charts)
    1. [Helm lint](#helm-lint)
    1. [Package Helm chart](#package-helm-chart)

## Using Helm

### Add helm repository

1. Example:

    ```console
    helm repo add senzing 'https://senzing.github.io/charts/'
    ```

### List helm repositories

1. Example:

    ```console
    helm repo list
    ```

### View charts in Senzing Helm repository

1. Example:

    ```console
    helm search senzing
    ```

### Remove helm repository

1. Example:

    ```console
    helm repo remove senzing
    ```

## Using Rancher Catalog

### Add catalog

1. Using Rancher Web interface.
   Reference: [Adding custom catalogs](https://rancher.com/docs/rancher/v2.x/en/catalog/#adding-custom-catalogs).
   Example:

    1. Choose Rancher > Top, Left-most dropdown box > Global
    1. Choose Rancher > Catalogs tab
    1. Click "Add Catalog" button.
    1. In "Add Catalog" dialog box:
        1. **Name:** senzing
        1. **Catalog URL:** [https://github.com/senzing/charts](https://github.com/senzing/charts)
        1. **Branch:** master
        1. **Kind:** Helm
    1. Click "Create" button

1. Using Rancher command line interface (CLI).  Example:

    ```console
    rancher catalog add senzing https://github.com/senzing/charts
    ```

### Delete catalog

1. Using Rancher Web interface. Example:

    1. Choose Rancher > Global tab
    1. Choose Rancher > Catalogs tab
    1. In "Custom" section, select "senzing" catalog.
    1. Click "Delete" button.

1. Using Rancher command line interface (CLI). Example:

    ```console
    rancher catalog delete senzing
    ```

## Development

### Clone repository

1. Using these environment variable values:

    ```console
    export GIT_ACCOUNT=senzing
    export GIT_REPOSITORY=charts
    export GIT_ACCOUNT_DIR=~/${GIT_ACCOUNT}.git
    export GIT_REPOSITORY_DIR="${GIT_ACCOUNT_DIR}/${GIT_REPOSITORY}"
    ```

   Then follow steps in [clone-repository](https://github.com/Senzing/knowledge-base/blob/master/HOWTO/clone-repository.md).

### Identify public charts

1. :pencil2: List docker images in an environment variable.  Example:

    ```console
    export CHART_NAMES=( \
      "coleifer-sqlite-web" \
      "db2-client" \
      "helm-create-example" \
      "ibm-db2-driver-installer" \
      "kafka-test-client" \
      "mysql-client" \
      "phpmyadmin" \
      "phppgadmin" \
      "postgresql-client" \
      "resolver" \
      "senzing-api-server" \
      "senzing-base" \
      "senzing-configurator" \
      "senzing-console" \
      "senzing-debug" \
      "senzing-entity-search-web-app" \
      "senzing-hello-world" \
      "senzing-hello-world-on-hub-docker-com" \
      "senzing-ibm-db2" \
      "senzing-init-container" \
      "senzing-mock-data-generator" \
      "senzing-package" \
      "senzing-redoer" \
      "senzing-stream-loader" \
      "senzing-stream-producer" \
      "senzing-yum" \
    )
    ```

### Helm lint

1. Single chart.

    :pencil2: Identify chart.

    ```console
    export CHART_NAME=senzing-hello-world
    ```

    Example:

    ```console
    cd ${GIT_REPOSITORY_DIR}/charts/${CHART_NAME}
    helm lint
    ```

1. Public charts. Example:

    ```console
    for CHART_NAME in ${CHART_NAMES[@]}; \
    do \
      cd ${GIT_REPOSITORY_DIR}/charts/${CHART_NAME}; \
      pwd; \
      helm lint; \
    done
    ```

### Package Helm chart

1. Single chart. Example:

    :pencil2: Identify chart.

    ```console
    export CHART_NAME=senzing-hello-world
    ```

    Example:

    ```console
    cd ${GIT_REPOSITORY_DIR}/docs
    helm package ${GIT_REPOSITORY_DIR}/charts/${CHART_NAME}
    helm repo index .
    ```

1. Public charts. Example:

    ```console
    cd ${GIT_REPOSITORY_DIR}/docs

    for CHART_NAME in ${CHART_NAMES[@]}; \
    do \
      helm package ${GIT_REPOSITORY_DIR}/charts/${CHART_NAME}; \
    done

    helm repo index .
    ```
