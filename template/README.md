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
    export SENZING_HELM_CHART_NAME=test-chart-1
    export SENZING_HELM_TEMPLATE_NAME=test-chart-1
    export SENZING_HELM_MAIN_OBJECT_BLOCK=MainObjectBlock
    export SENZING_HELM_SECONDARY_OBJECT_BLOCK=SecondaryObjectBlock
    export SENZING_HELM_MAIN_CONTAINER=MainContainer
    export SENZING_HELM_MAIN_CONTAINER_NAME=MainContainerName
    export SENZING_HELM_COMPONENT_NAME=ComponentName
    export SENZING_HELM_DESCRIPTION=Description
    export SENZING_HELM_UPSTREAM_PROJECT_URL=UpstreamProjectUrl
    export SENZING_HELM_UPSTREAM_PROJECT_VERSION=UpstreamProjectVersion
    export SENZING_HELM_SECONDARY_OBJECT_BLOCK=SecondaryObjectBlock
    export SENZING_HELM_OTHER_OBJECT_BLOCK=OtherObjectBlock
    export SENZING_HELM_PORT_NAME=PortName
    export SENZING_HELM_CONTAINER_NAME=ContainerName
    export SENZING_HELM_IMAGE_NAME=ImageName
    ```

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
        ${SENZING_HELM_MAIN_CONTAINER} \
        ${SENZING_HELM_MAIN_OBJECT_BLOCK} \
        ${SENZING_HELM_OTHER_OBJECT_BLOCK} \
        ${SENZING_HELM_PORT_NAME} \
        ${SENZING_HELM_SECONDARY_OBJECT_BLOCK} \
        ${SENZING_HELM_SECONDARY_OBJECT_BLOCK} \
        ${SENZING_HELM_TEMPLATE_NAME} \
        ${SENZING_HELM_UPSTREAM_PROJECT_URL} \
        ${SENZING_HELM_UPSTREAM_PROJECT_VERSION} \
      ' \
      < "${FILE}" \
      > "${SENZING_HELM_CHART_TARGET_DIR}/${FILE_PATH}";
    done
    ```