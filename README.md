## Grafana Cloud Monitoring for KUSAMA/PolkaDOT Validators ##
### A monitoring service on Grafana Cloud, Loki and Promtail ###
#### Inspired by [Grafana Account Page](https://grafana.com/grafana/dashboards/14899) ####

![Dashboard](https://github.com/TGReaper/kusama-cloud/raw/main/Screenshot%20from%202021-08-21%2017-32-29.png)

## Stress less project ###
### Grafana Cloud Monitoring for KUSAMA/PolkaDOT Validators is a single agent installation, PROMTAIL ###
* No need to install Grafana
* No need to setup Loki
* Serveless Setup
* Full controll on what is send as logs

#### Demo Account ####
https<area>://ksmnetwork.grafana.net/login
* demo@ksm<area>.network
* d3mo@d3mo

#### A snapshot is available to provide you with a fisrt look & feel of it ####
[SNAPSHOT](https://ksmnetwork.grafana.net/dashboard/snapshot/CY4DF3m7hQJmdRTt1X9K6TzJ5Z3woErt)

* To connect your Validators please request your credentials at the contacts listed below.
* Currently the Dashboard is available only by API Credentials, since is a POC Project and Grafana Gloud require each user to be at least a Team Member.
* You can request access to the dashboard at [Be a member](https://ksmnetwork.grafana.net/login)
* API credentials: USERNAME:APIKEY
* [KSMNETWORK GRAFANA CLOUD MEMBERS ACCESS](https://ksmnetwork.grafana.net/login)
---
## Promtail Installation ##
```
apt install sudo unzip -y \
&& sudo mkdir /opt/promtail \
&& cd /opt/promtail \
&& wget https://github.com/grafana/loki/releases/download/v2.2.1/promtail-linux-amd64.zip \
&& sudo unzip promtail-linux-amd64.zip
```

### Promtail Configuration template, change the "<USERNAME> <APIKEY>" with the provided ###
```
curl -fsS https://raw.githubusercontent.com/TGReaper/kusama-cloud/main/install.sh | sh -s <USERNAME> <APIKEY>
```

## The repository can be used as a stand alone, use it as you like ##
* Create Grafana Cloud Account 
* Grafana Dashboard ID: 14899
* Import the [Dashboard](https://grafana.com/grafana/dashboards/14899)
* The Start up [Dashboard JSON](https://grafana.com/api/dashboards/14899/revisions/1/download) 

---
# For Support && Nominations #
* Display name for Validators. KSMNETWORK && KSMNETWORK-WEST 
* Riot @gtoocool:matrix.org

* KUSAMA (KSM) Address
```H1bSKJxoxzxYRCdGQutVqFGeW7xU3AcN6vyEdZBU7Qb1rsZ```

* PolkaDOT (DOT) Address:
```15FxvBFDd3X7H9qcMGqsiuvFYEg4D3mBoTA2LQufreysTHKA```
