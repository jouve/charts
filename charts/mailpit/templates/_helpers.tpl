{{- define "mailpit.hasSecret" -}}
{{- if or
  (and .Values.mailpit.ui.authFile.enabled (not .Values.mailpit.ui.authFile.existingSecret))
  (and .Values.mailpit.smtp.authFile.enabled (not .Values.mailpit.smtp.authFile.existingSecret))
  .Values.mailpit.relay.config
}}true{{ end -}}
{{- end }}

{{/*
Renders a value that contains a template.
Usage:
{{ include "mailpit.renderTplValues" ( dict "value" .Values.path.to.the.Value "context" $) }}
*/}}
{{- define "mailpit.renderTplValues" -}}
    {{- if typeIs "string" .value }}
        {{- tpl .value .context }}
    {{- else }}
        {{- tpl (.value | toYaml) .context }}
    {{- end }}
{{- end -}}

{{/*
Return the proper Docker image registry secret names evaluating values as templates

Parameters:
  .imageRoot with expected values:
    pullSecrets (optional)
  .context with expected values:
    .Values.global

Usage:
  {{ include "mailpit.renderPullSecrets" ( dict "imageRoot" .Values.path.to.the.image "context" $) }}
*/}}
{{- define "mailpit.renderPullSecrets" -}}
  {{- $pullSecrets := list }}
  {{- $context := .context }}

  {{- if $context.Values.global }}
    {{- range $context.Values.global.imagePullSecrets -}}
      {{- $pullSecrets = append $pullSecrets (include "mailpit.renderTplValues" (dict "value" . "context" $context)) -}}
    {{- end -}}
  {{- end -}}

  {{- if .imageRoot -}}
    {{- if .imageRoot.pullSecrets -}}
      {{- range .imageRoot.pullSecrets -}}
        {{- $pullSecrets = append $pullSecrets (include "mailpit.renderTplValues" (dict "value" . "context" $context)) -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{- if (not (empty $pullSecrets)) }}
imagePullSecrets:
    {{- range $pullSecrets }}
  - name: {{ . }}
    {{- end }}
  {{- end }}
{{- end -}}