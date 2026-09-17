{{/*
Create the name of the ServiceAccount to use.
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
