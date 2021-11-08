{{/* vim: set filetype=mustache: */}}

{{/*
Expand the name of the chart.
*/}}
{{- define "name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
Return the proper phppgadmin image name
*/}}
{{- define "senzing.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.image "global" .Values.global) }}
{{- end -}}


{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "senzing.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.image) "global" .Values.global) -}}
{{- end -}}
