{{- define "mailpit.hasSecret" -}}
{{- if or
  (and .Values.mailpit.ui.authFile.enabled (not .Values.mailpit.ui.authFile.existingSecret))
  (and .Values.mailpit.smtp.authFile.enabled (not .Values.mailpit.smtp.authFile.existingSecret))
  .Values.mailpit.relay.config
}}true{{ end -}}
{{- end }}
