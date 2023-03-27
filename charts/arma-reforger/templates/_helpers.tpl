{{/*
Expand the name of the chart.
*/}}
{{- define "arma-reforger.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "arma-reforger.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "arma-reforger.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "arma-reforger.labels" -}}
helm.sh/chart: {{ include "arma-reforger.chart" . }}
{{ include "arma-reforger.selectorLabels" . }}

{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "arma-reforger.selectorLabels" -}}
app.kubernetes.io/name: {{ include "arma-reforger.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "arma-reforger.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "arma-reforger.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "credentials.useExistingSecretNamespace" }}
{{- if .Values.credentials.useExistingSecret.namespace }}
{{ .Values.credentials.useExistingSecret.namespace }}
{{- else }}
{{- .Release.Namespace }}
{{- end }}
{{- end }}

{{- define "credentials.useExistingSecretName" }}
{{- if .Values.credentials.useExistingSecret.name }}
{{- .Values.credentials.useExistingSecret.name }}
{{- else }}
{{- .Release.Name }}
{{- end }}
{{- end }}

{{- define "serverPassword" -}}
{{- $content := (lookup "v1" "Secret" (include "credentials.useExistingSecretNamespace" .) (include "credentials.useExistingSecretName" .) ) }}
{{- if .Values.credentials.serverPassword -}}
{{ .Values.credentials.serverPassword }}
{{- else if $content -}}
{{ (index $content.data .Values.credentials.useExistingSecret.serverPasswordKey) | b64dec -}}
{{- else -}}
noLookupWhenTemplating
{{- end -}}
{{- end -}}

{{- define "adminPassword" -}}
{{- $content := (lookup "v1" "Secret" (include "credentials.useExistingSecretNamespace" .) (include "credentials.useExistingSecretName" .) ) }}
{{- if .Values.credentials.adminPassword -}}
{{ .Values.credentials.adminPassword }}
{{- else if $content -}}
{{ (index $content.data .Values.credentials.useExistingSecret.adminPasswordKey) | b64dec -}}
{{- else -}}
noLookupWhenTemplating
{{- end -}}
{{- end -}}

{{- define "mods" -}}
{{- if .Values.config.mods -}}
    {{ $first := true }}
    {{- range $v := .Values.config.mods }}
    {{- if $first}}{{$first = false}}{{else}},{{end -}}
    { "modId": {{ $v.modId | quote }}, "name": {{ $v.name | quote }}, "version": {{ $v.version | quote }} }
    {{- end }}
{{- end }}
{{- end -}}