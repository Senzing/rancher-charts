# Template

This directory contains a basic scaffolding to serve as the basis for creating a new chart.

Some of the items that need to be implemented are:

- commonAnnotations
- commonLabels
- imagePullSecret
- extraDeploy
- resources.requests
- resources.limits
- livenessProbe
- readinessProbe
- customLivenessProbe
- customReadinessProbe
- podLabels
- affinity
- nodeSelector
- tolerations (that would override the default one)
- podAnnotations
- priorityClassName
- lifecycleHooks
- sidecars
- initContainers
- extraEnvVars
- extraEnvVarsCM
- extraEnvVarsSecret
- command (which would override the default one)
- args (which would override the default one)
- extraVolumes
- extraVolumeMounts
- updateStrategy
- podSecurityContext
- containerSecurityContext

Also it is necessary to use the `senzing/senzing-common` chart to standarize some of the above items.

:warning: Take into account this is just an example to follow, depending on the specific use case you will need to remove, add or modify those templates, beyond replacing the placeholders `%%FOO%%`

## Variable replacement

1. Establish repository location.
   Example:

    ```console
    export GIT_ACCOUNT=senzing
    export GIT_REPOSITORY=charts
    export GIT_ACCOUNT_DIR=~/${GIT_ACCOUNT}.git
    export GIT_REPOSITORY_DIR="${GIT_ACCOUNT_DIR}/${GIT_REPOSITORY}"
    ```

1. Set enviroment variable to be replaced.
   Example:

    ```console
    export SENZING_HELM_CHART_NAME=senzing-nemo
    export SENZING_HELM_COMPONENT_NAME=nemoComponent
    export SENZING_HELM_CONTAINER_NAME=senzing-nemo
    export SENZING_HELM_DESCRIPTION=nemoDescription
    export SENZING_HELM_IMAGE_NAME=nemo
    export SENZING_HELM_MAIN_CONTAINER_NAME=senzing-nemo
    export SENZING_HELM_MAIN_OBJECT_BLOCK=main
    export SENZING_HELM_TEMPLATE_NAME=senzing-nemo
    export SENZING_HELM_UPSTREAM_PROJECT_URL=https://github.com/Senzing/charts/tree/master/charts/senzing-nemo
    export SENZING_HELM_UPSTREAM_PROJECT_VERSION=""
    ```

   Tips:

    1. `SENZING_HELM_CHART_NAME`,
       `SENZING_HELM_CONTAINER_NAME`
       `SENZING_HELM_MAIN_CONTAINER_NAME`, and
       `SENZING_HELM_TEMPLATE_NAME`
       will probably have the same value.
    1. `SENZING_HELM_IMAGE_NAME`
       is the Docker image name.
    1. `SENZING_HELM_COMPONENT_NAME`
       is used in `metadata.labels.app.kubernetes.io/component`
       and `Ingress.hostname`.
    1. `SENZING_HELM_DESCRIPTION`
       is used in `Chart.description`.
    1. `SENZING_HELM_MAIN_OBJECT_BLOCK`
       identifyies the primary container.
       For consistency, set value to "main".
    1. `SENZING_HELM_UPSTREAM_PROJECT_URL`
       is used in `Chart.home`.
    1. `SENZING_HELM_UPSTREAM_PROJECT_VERSION`
       is used in `Chart.appVersion`.

1. Identify source and target directories.
   Example:

    ```console
    export SENZING_HELM_CHART_SOURCE_DIR=${GIT_REPOSITORY_DIR}/template/CHART_NAME
    export SENZING_HELM_CHART_TARGET_DIR=${GIT_REPOSITORY_DIR}/charts/${SENZING_HELM_CHART_NAME}
    ```

1. Create initial target directory.
   Example:

    ```console
    mkdir -p ${SENZING_HELM_CHART_TARGET_DIR}
    cp -r ${SENZING_HELM_CHART_SOURCE_DIR}/* ${SENZING_HELM_CHART_TARGET_DIR}
    cp ${SENZING_HELM_CHART_SOURCE_DIR}/.helmignore ${SENZING_HELM_CHART_TARGET_DIR}
    ```

1. Use `envsubst` to replace variables in files.
   Example:

    ```console
    for FILE in $(find ${SENZING_HELM_CHART_SOURCE_DIR} -type f); \
    do \
      FILE_PATH=$(awk -F"${SENZING_HELM_CHART_SOURCE_DIR}/" '{print $2}' <<< "${FILE}")
      envsubst '\
        ${SENZING_HELM_CHART_NAME} \
        ${SENZING_HELM_COMPONENT_NAME} \
        ${SENZING_HELM_CONTAINER_NAME} \
        ${SENZING_HELM_DESCRIPTION} \
        ${SENZING_HELM_IMAGE_NAME} \
        ${SENZING_HELM_MAIN_CONTAINER_NAME} \
        ${SENZING_HELM_MAIN_OBJECT_BLOCK} \
        ${SENZING_HELM_TEMPLATE_NAME} \
        ${SENZING_HELM_UPSTREAM_PROJECT_URL} \
        ${SENZING_HELM_UPSTREAM_PROJECT_VERSION} \
      ' \
      < "${FILE}" \
      > "${SENZING_HELM_CHART_TARGET_DIR}/${FILE_PATH}";
    done
    ```

## Update Helm Chart package

### Update Chart.yaml

1. Update `description`.
1. If needed, add `keywords`.
1. Modify `sources`.

### Update templates

1. :pencil2: Locate git repository directory.
   Example:

    ```console
    export GIT_ACCOUNT=senzing
    export GIT_REPOSITORY=charts
    export GIT_ACCOUNT_DIR=~/${GIT_ACCOUNT}.git
    export GIT_REPOSITORY_DIR="${GIT_ACCOUNT_DIR}/${GIT_REPOSITORY}"
    ```

1. :pencil2: Identify Docker images and Helm Chart names.
   Example:

    ```console
    export IMAGES_AND_CHARTS=( \
      "arey-mysql-client;arey-mysql-client" \
      "phppgadmin;phppgadmin" \
      "apt;senzing-apt" \
    )
    ```

1. XXX
   Example:

    ```console
    for IMAGE_AND_CHART in ${IMAGES_AND_CHARTS[@]}; \
    do \
        IFS=";" read -r -a IMAGE_AND_CHART_DATA <<< "${IMAGE_AND_CHART}"
        export SENZING_HELM_IMAGE_NAME="${IMAGE_AND_CHART_DATA[0]}"; \
        export SENZING_HELM_CHART_NAME="${IMAGE_AND_CHART_DATA[1]}"; \
        export SENZING_HELM_COMPONENT_NAME=${SENZING_HELM_CHART_NAME}-component; \
        export SENZING_HELM_CONTAINER_NAME=${SENZING_HELM_CHART_NAME}; \
        export SENZING_HELM_DESCRIPTION="FIXME:"; \
        export SENZING_HELM_MAIN_CONTAINER_NAME=${SENZING_HELM_CHART_NAME}; \
        export SENZING_HELM_MAIN_OBJECT_BLOCK=main; \
        export SENZING_HELM_TEMPLATE_NAME=${SENZING_HELM_CHART_NAME}; \
        export SENZING_HELM_UPSTREAM_PROJECT_URL=https://github.com/Senzing/charts/tree/master/charts/${SENZING_HELM_CHART_NAME}; \
        export SENZING_HELM_UPSTREAM_PROJECT_VERSION=""; \
        export SENZING_HELM_CHART_TEMPLATE_DIR=${GIT_REPOSITORY_DIR}/template/CHART_NAME/templates; \
        export SENZING_HELM_CHART_SOURCE_DIR=${GIT_REPOSITORY_DIR}/charts/${SENZING_HELM_CHART_NAME}/templates; \
        for FILE in $(find ${SENZING_HELM_CHART_SOURCE_DIR/} -type f); \
        do \
          echo "Processing: ${FILE}"
          FILE_PATH=$(awk -F"${SENZING_HELM_CHART_SOURCE_DIR}/" '{print $2}' <<< "${FILE}")
          INPUT_FILE="${SENZING_HELM_CHART_TEMPLATE_DIR}/${FILE_PATH}"
          EXISTING_FILE="${SENZING_HELM_CHART_SOURCE_DIR}/${FILE_PATH}"
          OUTPUT_FILE="${EXISTING_FILE}.fromTemplate.yaml"
          envsubst '\
            ${SENZING_HELM_CHART_NAME} \
            ${SENZING_HELM_TEMPLATE_NAME} \
            ${SENZING_HELM_MAIN_OBJECT_BLOCK} \
            ${SENZING_HELM_SECONDARY_OBJECT_BLOCK} \
            ${SENZING_HELM_MAIN_CONTAINER} \
            ${SENZING_HELM_MAIN_CONTAINER_NAME} \
            ${SENZING_HELM_COMPONENT_NAME} \
            ${SENZING_HELM_DESCRIPTION} \
            ${SENZING_HELM_UPSTREAM_PROJECT_URL} \
            ${SENZING_HELM_UPSTREAM_PROJECT_VERSION} \
            ${SENZING_HELM_SECONDARY_OBJECT_BLOCK} \
            ${SENZING_HELM_OTHER_OBJECT_BLOCK} \
            ${SENZING_HELM_PORT_NAME} \
            ${SENZING_HELM_CONTAINER_NAME} \
            ${SENZING_HELM_IMAGE_NAME} \
          ' \
          < "${INPUT_FILE}" \
          > "${OUTPUT_FILE}"; \
          if $(diff ${EXISTING_FILE} ${OUTPUT_FILE} > /dev/null); then \
            echo "            No changes."; \
            rm ${OUTPUT_FILE}; \
          fi \
        done
    done
    ```

### Update values.yaml

### Update README.md

#### Documenting paramters

After the `values.yaml` file has been updated
and documented in a style parseable by
[readme-generator](https://github.com/bitnami-labs/readme-generator-for-helm#metadata),
the `CHART_NAME/README.md`'s  `## Parameters` section should be updated
using Bitami's [readme-generator-for-helm](https://github.com/bitnami-labs/readme-generator-for-helm).

1. Install [nvm](https://github.com/nvm-sh/nvm).
1. Install `npm`.
   Example:

    ```console
    nvm install v12.21.0
    ```

1. Install `readme-generator`.
   Example:

    ```console
    git clone https://github.com/bitnami-labs/readme-generator-for-helm
    npm install -g readme-generator-for-helm
    ```

1. :pencil2: Update `CHART_NAME/README.md`.
   Example:

    ```console
    readme-generator \
      --readme ${SENZING_HELM_CHART_TARGET_DIR}/README.md \
      --values ${SENZING_HELM_CHART_TARGET_DIR}/values.yaml
    ```

#### Cleanup README.md

## Test Helm Chart

### Lint Helm Chart

1. Get dependencies via
   [helm dependency update](https://helm.sh/docs/helm/helm_dependency_update/).
   Example:

    ```console
    helm dependency update ${SENZING_HELM_CHART_TARGET_DIR}
    ```

1. Print chart via
   [helm lint](https://helm.sh/docs/helm/helm_lint/).
   Example:

    ```console
    helm lint  \
      --values ${SENZING_HELM_CHART_TARGET_DIR}/values.yaml \
      ${SENZING_HELM_CHART_TARGET_DIR}
    ```

### Print Helm Chart

1. Get dependencies via
   [helm dependency update](https://helm.sh/docs/helm/helm_dependency_update/).
   Example:

    ```console
    helm dependency update ${SENZING_HELM_CHART_TARGET_DIR}
    ```

1. Print chart via
   [helm template](https://helm.sh/docs/helm/helm_template/).
   Example:

    ```console
    helm template  \
      --values ${SENZING_HELM_CHART_TARGET_DIR}/values.yaml \
      ${SENZING_HELM_CHART_TARGET_DIR}
    ```

1. To debug
   [helm template](https://helm.sh/docs/helm/helm_template/).
   Example:

    ```console
    helm template  \
      --debug \
      --values ${SENZING_HELM_CHART_TARGET_DIR}/values.yaml \
      ${SENZING_HELM_CHART_TARGET_DIR}
    ```
