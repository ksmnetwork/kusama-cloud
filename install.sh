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
  # Drop this logs
  - match:
      selector: '{job="systemd-journal", unit="ifup@eth0.service"}'
      action: drop
      drop_counter_reason: ifup_logs
  - match:
      selector: '{job="systemd-journal", unit="init.scope"}'
      action: drop
      drop_counter_reason: promtail_logs
  - match:
      selector: '{job="systemd-journal", unit="cron.service"}'
      action: drop
      drop_counter_reason: cron_logs
  - match:
      selector: '{job="systemd-journal", unit="ssh.service"}'
      action: drop
      drop_counter_reason: ssh_logs
  - match:
      selector: '{job="systemd-journal", unit="systemd-logind.service"}'
      action: drop
      drop_counter_reason: systemd_logs
  # Get this logs
  - match:
      selector: '{job="systemd-journal", unit="polkadot.service"}'
      stages:
      - regex:
          expression: '(^s?<ts>).*(<output>)'
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
