{{/*
Return the proper main image name
*/}}
{{- define "microsoft-mssql-tools.image" -}}
{{ include "senzing-common.images.image" (dict "imageRoot" .Values.main.image "global" .Values.global) }}
{{- end -}}

{{/*
Return the proper image name (for the init container volume-permissions image)
*/}}
{{- define "microsoft-mssql-tools.volumePermissions.image" -}}
{{- include "senzing-common.images.image" ( dict "imageRoot" .Values.volumePermissions.image "global" .Values.global ) -}}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "microsoft-mssql-tools.imagePullSecrets" -}}
{{- include "senzing-common.images.pullSecrets" (dict "images" (list .Values.main.image .Values.volumePermissions.image) "global" .Values.global) -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "microsoft-mssql-tools.serviceAccountName" -}}
{{- if .Values.serviceAccount.enabled -}}
    {{ default (printf "%s-serviceaccount" (include "senzing-common.names.fullname" .)) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Return true if cert-manager required annotations for TLS signed certificates are set in the Ingress annotations
Ref: https://cert-manager.io/docs/usage/ingress/#supported-annotations
*/}}
{{- define "microsoft-mssql-tools.ingress.certManagerRequest" -}}
{{ if or (hasKey . "cert-manager.io/cluster-issuer") (hasKey . "cert-manager.io/issuer") }}
    {{- true -}}
{{- end -}}
{{- end -}}

{{/*
Compile all warnings into a single message.
*/}}
{{- define "microsoft-mssql-tools.validateValues" -}}
{{- $messages := list -}}
{{- $messages := without $messages "" -}}
{{- $message := join "\n" $messages -}}

{{- if $message -}}
{{-   printf "\nVALUES VALIDATION:\n%s" $message -}}
{{- end -}}
{{- end -}}

