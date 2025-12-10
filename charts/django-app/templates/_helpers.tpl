{{/*
Return the name of the chart
*/}}
{{- define "django-app.name" -}}
{{- .Chart.Name -}}
{{- end -}}

{{/*
Return the full name of the chart
*/}}
{{- define "django-app.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
