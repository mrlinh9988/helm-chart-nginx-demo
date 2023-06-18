{{- define "common.labels" -}}
app: nginx
type: {{ .Values.type }}
{{- end }} 