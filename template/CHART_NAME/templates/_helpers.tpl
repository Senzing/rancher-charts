{{/*
Return the proper ${SENZING_HELM_MAIN_OBJECT_BLOCK} image name
*/}}
{{- define "${SENZING_HELM_TEMPLATE_NAME}.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.${SENZING_HELM_MAIN_OBJECT_BLOCK}.image "global" .Values.global) }}
{{- end -}}

{{/*
Return the proper image name (for the init container volume-permissions image)
*/}}
{{- define "${SENZING_HELM_TEMPLATE_NAME}.volumePermissions.image" -}}
{{- include "common.images.image" ( dict "imageRoot" .Values.volumePermissions.image "global" .Values.global ) -}}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "${SENZING_HELM_TEMPLATE_NAME}.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.${SENZING_HELM_MAIN_OBJECT_BLOCK}.image .Values.${SENZING_HELM_SECONDARY_OBJECT_BLOCK}.image .Values.volumePermissions.image) "global" .Values.global) -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "${SENZING_HELM_TEMPLATE_NAME}.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (printf "%s-foo" (include "common.names.fullname" .)) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Compile all warnings into a single message.
*/}}
{{- define "${SENZING_HELM_TEMPLATE_NAME}.validateValues" -}}
{{- $messages := list -}}
{{- $messages := append $messages (include "${SENZING_HELM_TEMPLATE_NAME}.validateValues.foo" .) -}}
{{- $messages := append $messages (include "${SENZING_HELM_TEMPLATE_NAME}.validateValues.bar" .) -}}
{{- $messages := without $messages "" -}}
{{- $message := join "\n" $messages -}}

{{- if $message -}}
{{-   printf "\nVALUES VALIDATION:\n%s" $message -}}
{{- end -}}
{{- end -}}

