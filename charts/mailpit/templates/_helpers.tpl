{{- define "mailpit.hasSecret" -}}
{{- if or
  (and .Values.mailpit.ui.authFile.enabled (not .Values.mailpit.ui.authFile.existingSecret))
  (and .Values.mailpit.smtp.authFile.enabled (not .Values.mailpit.smtp.authFile.existingSecret))
  .Values.mailpit.relay.config
}}true{{ end -}}
{{- end }}

{{/* Return the SMTP Service name. */}}
{{- define "mailpit.smtp.serviceName" -}}
{{- default (printf "%s-smtp" (include "common.names.fullname" .)) .Values.service.smtp.name -}}
{{- end -}}

{{/* Return configured SMTP TLS DNS names or the SMTP Service DNS names. */}}
{{- define "mailpit.smtp.tls.dnsNames" -}}
{{- $context := .context -}}
{{- with .dnsNames -}}
{{- include "common.tplvalues.render" (dict "value" . "context" $context) -}}
{{- else -}}
{{- $smtpService := include "mailpit.smtp.serviceName" $context -}}
{{- $namespace := include "common.names.namespace" $context -}}
- {{ $smtpService }}
- {{ $smtpService }}.{{ $namespace }}
- {{ $smtpService }}.{{ $namespace }}.svc
- {{ $smtpService }}.{{ $namespace }}.svc.{{ $context.Values.clusterDomain }}
{{- end -}}
{{- end -}}

{{/* Return the name of the SMTP TLS Secret managed by cert-manager. */}}
{{- define "mailpit.smtp.tls.certManager.secretName" -}}
{{- printf "%s-smtp-tls" (include "common.names.fullname" .) -}}
{{- end -}}
