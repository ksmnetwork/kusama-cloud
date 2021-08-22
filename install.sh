#!/bin/sh

APIUSER="${1:-}"
APIKEY="${2:-}"

if [ -z "${APIUSER}" ] || [ -z "${APIKEY}" ]; then
    echo "usage: $0 Username ApiKey"
    exit 1
fi

CONFIGFILE=$(cat <<'YAML'
server:
  http_listen_port: 0
  grpc_listen_port: 0
  log_level: error
clients:
  - url: https://<TheUSER>:<TheKEY>@logs-prod-us-central1.grafana.net/loki/api/v1/push
positions:
  filename: /tmp/positions.yaml
  ignore_invalid_yaml: true
scrape_configs:
- job_name: journal
  journal:
    max_age: 60s
    labels:
      job: systemd-journal
  relabel_configs:
    - source_labels: ['__journal__systemd_unit']
      target_label: 'unit'
    - source_labels: ['__journal__hostname']
      target_label: 'hostname'
  pipeline_stages:
  - match:
      selector: '{job!="systemd-journal", unit!="polkadot.service"}'
      action: drop
      drop_counter_reason: systemd_logs
  - match:
      selector: '{job="systemd-journal", unit="polkadot.service"}'
      stages:
      - regex:
          expression: '(^s?<timestamp>).*(<output>)'
      - timestamp:
          source: timestamp
          format: RFC3339Nano
      - output:
          source: output
YAML
)

echo "${CONFIGFILE}" | sed \
  -e "s#<TheUSER>#${APIUSER}#" \
  -e "s#<TheKEY>#${APIKEY}#"
