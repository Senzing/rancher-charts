{{/* vim: set filetype=mustache: */}}


{{/*
Return the target Kubernetes version
*/}}
{{- define "senzing-common.capabilities.kubeVersion" -}}
{{- if .Values.global }}
    {{- if .Values.global.kubeVersion }}
    {{- .Values.global.kubeVersion -}}
    {{- else }}
    {{- default .Capabilities.KubeVersion.Version .Values.kubeVersion -}}
    {{- end -}}
{{- else }}
{{- default .Capabilities.KubeVersion.Version .Values.kubeVersion -}}
{{- end -}}
{{- end -}}


{{/*
Return the appropriate apiVersion for configmap.
*/}}
{{- define "senzing-common.capabilities.configmap.apiVersion" -}}
{{- print "v1" -}}
{{- end -}}


{{/*
Return the appropriate apiVersion for CRDs.
*/}}
{{- define "senzing-common.capabilities.crd.apiVersion" -}}
{{- if semverCompare "<1.19-0" (include "senzing-common.capabilities.kubeVersion" .) -}}
{{- print "apiextensions.k8s.io/v1beta1" -}}
{{- else -}}
{{- print "apiextensions.k8s.io/v1" -}}
{{- end -}}
{{- end -}}


{{/*
Return the appropriate apiVersion for cronjob.
*/}}
{{- define "senzing-common.capabilities.cronjob.apiVersion" -}}
{{- if semverCompare "<1.21-0" (include "senzing-common.capabilities.kubeVersion" .) -}}
{{- print "batch/v1beta1" -}}
{{- else -}}
{{- print "batch/v1" -}}
{{- end -}}
{{- end -}}


{{/*
Return the appropriate apiVersion for daemonset.
*/}}
{{- define "senzing-common.capabilities.daemonset.apiVersion" -}}
{{- if semverCompare "<1.16-0" (include "senzing-common.capabilities.kubeVersion" .) -}}
{{- print "policy/v1beta1" -}}
{{- else -}}
{{- print "apps/v1" -}}
{{- end -}}
{{- end -}}


{{/*
Return the appropriate apiVersion for deployment.
*/}}
{{- define "senzing-common.capabilities.deployment.apiVersion" -}}
{{- if semverCompare "<1.14-0" (include "senzing-common.capabilities.kubeVersion" .) -}}
{{- print "extensions/v1beta1" -}}
{{- else -}}
{{- print "apps/v1" -}}
{{- end -}}
{{- end -}}


{{/*
Return the appropriate apiVersion for horizontalpodautoscaler.
*/}}
{{- define "senzing-common.capabilities.horizontalpodautoscaler.apiVersion" -}}
{{- print "autoscaling/v2" -}}
{{- end -}}


{{/*
Return the appropriate apiVersion for ingress.
*/}}
{{- define "senzing-common.capabilities.ingress.apiVersion" -}}
{{- if .Values.ingress -}}
{{- if .Values.ingress.apiVersion -}}
{{- .Values.ingress.apiVersion -}}
{{- else if semverCompare "<1.14-0" (include "senzing-common.capabilities.kubeVersion" .) -}}
{{- print "extensions/v1beta1" -}}
{{- else if semverCompare "<1.19-0" (include "senzing-common.capabilities.kubeVersion" .) -}}
{{- print "networking.k8s.io/v1beta1" -}}
{{- else -}}
{{- print "networking.k8s.io/v1" -}}
{{- end }}
{{- else if semverCompare "<1.14-0" (include "senzing-common.capabilities.kubeVersion" .) -}}
{{- print "extensions/v1beta1" -}}
{{- else if semverCompare "<1.19-0" (include "senzing-common.capabilities.kubeVersion" .) -}}
{{- print "networking.k8s.io/v1beta1" -}}
{{- else -}}
{{- print "networking.k8s.io/v1" -}}
{{- end -}}
{{- end -}}


{{/*
Return the appropriate apiVersion for ob.
*/}}
{{- define "senzing-common.capabilities.job.apiVersion" -}}
{{- if semverCompare "<1.21-0" (include "senzing-common.capabilities.kubeVersion" .) -}}
{{- print "batch/v1beta1" -}}
{{- else -}}
{{- print "batch/v1" -}}
{{- end -}}
{{- end -}}


{{/*
Return the appropriate apiVersion for networkpolicy.
*/}}
{{- define "senzing-common.capabilities.networkPolicy.apiVersion" -}}
{{- if semverCompare "<1.7-0" (include "senzing-common.capabilities.kubeVersion" .) -}}
{{- print "extensions/v1beta1" -}}
{{- else -}}
{{- print "networking.k8s.io/v1" -}}
{{- end -}}
{{- end -}}


{{/*
Return the appropriate apiVersion for podsecuritypolicy.
*/}}
{{- define "senzing-common.capabilities.policy.apiVersion" -}}
{{- if semverCompare "<1.21-0" (include "senzing-common.capabilities.kubeVersion" .) -}}
{{- print "policy/v1beta1" -}}
{{- else -}}
{{- print "policy/v1" -}}
{{- end -}}
{{- end -}}


{{/*
Return the appropriate apiVersion for RBAC resources.
*/}}
{{- define "senzing-common.capabilities.rbac.apiVersion" -}}
{{- if semverCompare "<1.17-0" (include "senzing-common.capabilities.kubeVersion" .) -}}
{{- print "rbac.authorization.k8s.io/v1beta1" -}}
{{- else -}}
{{- print "rbac.authorization.k8s.io/v1" -}}
{{- end -}}
{{- end -}}


{{/*
Return the appropriate apiVersion for role.
*/}}
{{- define "senzing-common.capabilities.role.apiVersion" -}}
{{- if semverCompare "<1.17-0" (include "senzing-common.capabilities.kubeVersion" .) -}}
{{- print "rbac.authorization.k8s.io/v1beta1" -}}
{{- else -}}
{{- print "rbac.authorization.k8s.io/v1" -}}
{{- end -}}
{{- end -}}


{{/*
Return the appropriate apiVersion for rolebinding.
*/}}
{{- define "senzing-common.capabilities.rolebinding.apiVersion" -}}
{{- if semverCompare "<1.17-0" (include "senzing-common.capabilities.kubeVersion" .) -}}
{{- print "rbac.authorization.k8s.io/v1beta1" -}}
{{- else -}}
{{- print "rbac.authorization.k8s.io/v1" -}}
{{- end -}}
{{- end -}}


{{/*
Return the appropriate apiVersion for secret.
*/}}
{{- define "senzing-common.capabilities.secret.apiVersion" -}}
{{- print "v1" -}}
{{- end -}}


{{/*
Return the appropriate apiVersion for service.
*/}}
{{- define "senzing-common.capabilities.service.apiVersion" -}}
{{- print "v1" -}}
{{- end -}}


{{/*
Return the appropriate apiVersion for serviceaccount.
*/}}
{{- define "senzing-common.capabilities.serviceaccount.apiVersion" -}}
{{- print "v1" -}}
{{- end -}}


{{/*
Return the appropriate apiVersion for statefulset.
*/}}
{{- define "senzing-common.capabilities.statefulset.apiVersion" -}}
{{- if semverCompare "<1.14-0" (include "senzing-common.capabilities.kubeVersion" .) -}}
{{- print "apps/v1beta1" -}}
{{- else -}}
{{- print "apps/v1" -}}
{{- end -}}
{{- end -}}


{{/*
Returns true if the used Helm version is 3.3+.
A way to check the used Helm version was not introduced until version 3.3.0 with .Capabilities.HelmVersion, which contains an additional "{}}"  structure.
This check is introduced as a regexMatch instead of {{ if .Capabilities.HelmVersion }} because checking for the key HelmVersion in <3.3 results in a "interface not found" error.
**To be removed when the catalog's minimun Helm version is 3.3**
*/}}
{{- define "senzing-common.capabilities.supportsHelmVersion" -}}
{{- if regexMatch "{(v[0-9])*[^}]*}}$" (.Capabilities | toString ) }}
  {{- true -}}
{{- end -}}
{{- end -}}
