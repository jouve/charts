{{/*
Create the name of the service account to use
usage: {{ template "common.names.serviceAccountName" (dict "serviceAccountRoot" .Values.serviceAccount "context" .) }}
*/}}
{{- define "common.names.serviceAccountName" -}}
{{- if .serviceAccountRoot.name -}}
{{ tpl .serviceAccountRoot.name .context }}
{{- else if .serviceAccountRoot.create -}}
{{ template "common.names.fullname" .context }}
{{- else -}}
default
{{- end -}}
{{- end -}}
