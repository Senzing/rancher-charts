# %%CHART_NAME%%

## Credit

<remove>
This is based off of https://github.com/bitnami/charts/blob/master/template/CHART_NAME/README.md
We appreciate Bitnami's leadership in Helm Chart creation.
</remove>

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
    helm install my-%%CHART_NAME%% senzing/%%CHART_NAME%%
    ```

    The command deploys %%CHART_NAME%% on the Kubernetes cluster in the default configuration.
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
    helm uninstall my-%%CHART_NAME%%
    ```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Parameters

See https://github.com/bitnami-labs/readme-generator-for-helm to create the table

The above parameters map to the env variables defined in [bitnami/%%CHART_NAME%%](http://github.com/bitnami/bitnami-docker-%%CHART_NAME%%). For more information please refer to the [bitnami/%%CHART_NAME%%](http://github.com/bitnami/bitnami-docker-%%CHART_NAME%%) image documentation.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install my-release \
  --set %%CHART_NAME%%Username=admin \
  --set %%CHART_NAME%%Password=password \
  --set mariadb.auth.rootPassword=secretpassword \
    senzing/%%CHART_NAME%%
```

The above command sets the %%CHART_NAME%% administrator account username and password to `admin` and `password` respectively. Additionally, it sets the MariaDB `root` user password to `secretpassword`.

> NOTE: Once this chart is deployed, it is not possible to change the application's access credentials, such as usernames or passwords, using Helm. To change these application credentials after deployment, delete any persistent volumes (PVs) used by the chart and re-deploy it, or use the application's built-in administrative tools if available.

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install my-release -f values.yaml senzing/%%CHART_NAME%%
```

> **Tip**: You can use the default [values.yaml](values.yaml)
