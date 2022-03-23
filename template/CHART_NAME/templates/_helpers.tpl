{{/*
Return the proper ${SENZING_HELM_MAIN_OBJECT_BLOCK} image name
*/}}
{{- define "${SENZING_HELM_TEMPLATE_NAME}.image" -}}
{{ include "senzing-common.images.image" (dict "imageRoot" .Values.${SENZING_HELM_MAIN_OBJECT_BLOCK}.image "global" .Values.global) }}
{{- end -}}

{{/*
Return the proper image name (for the init container volume-permissions image)
*/}}
{{- define "${SENZING_HELM_TEMPLATE_NAME}.volumePermissions.image" -}}
{{- include "senzing-common.images.image" ( dict "imageRoot" .Values.volumePermissions.image "global" .Values.global ) -}}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "${SENZING_HELM_TEMPLATE_NAME}.imagePullSecrets" -}}
{{- include "senzing-common.images.pullSecrets" (dict "images" (list .Values.${SENZING_HELM_MAIN_OBJECT_BLOCK}.image .Values.volumePermissions.image) "global" .Values.global) -}}
{{- end -}}

{{/*
Return true if cert-manager required annotations for TLS signed certificates are set in the Ingress annotations
Ref: https://cert-manager.io/docs/usage/ingress/#supported-annotations
*/}}
{{- define "${SENZING_HELM_TEMPLATE_NAME}.ingress.certManagerRequest" -}}
{{ if or (hasKey . "cert-manager.io/cluster-issuer") (hasKey . "cert-manager.io/issuer") }}
    {{- true -}}
{{- end -}}
{{- end -}}

{{/*
Compile all warnings into a single message.
*/}}
{{- define "${SENZING_HELM_TEMPLATE_NAME}.validateValues" -}}
{{- $messages := list -}}
{{- $messages := without $messages "" -}}
{{- $message := join "\n" $messages -}}

{{- if $message -}}
{{-   printf "\nVALUES VALIDATION:\n%s" $message -}}
{{- end -}}
{{- end -}}

