## Grafana Cloud Monitoring for KUSAMA/PolkaDOT Validators KuELK ##
### A monitoring service on Grafana Cloud, Loki and Promtail ###
#### Inspired by [Grafana Account Page](https://grafana.com/grafana/dashboards/14899) ####

![Dashboard](https://rmrk.mypinata.cloud/ipfs/bafybeigtp22b45hq4bbjkidxucqnq2e3ielk5bhqvojk4cbz3hjukzots4)

## Stress less project ###
### Grafana Cloud Monitoring for KUSAMA/PolkaDOT Validators is a single agent installation, PROMTAIL ###
* No need to install Grafana
* No need to setup Loki
* Serveless Setup and Installation
* Full controll on what is send as logs
* Error reports [Report Template](https://github.com/TGReaper/kusama-cloud/blob/22fa7557ef4e48737bc6b7522e192a031b040e05/error-report.pdf) 

#### A snapshot is available to provide you with a fisrt look & feel of it ####
[SNAPSHOT](https://ksmnetwork.grafana.net/dashboard/snapshot/CY4DF3m7hQJmdRTt1X9K6TzJ5Z3woErt)

---
## Grafana Cloud ##
* Create Grafana Cloud Account and obtain your Loki URL 
* Grafana Dashboard ID: 14899 [Dashboard URL](https://grafana.com/grafana/dashboards/14899) 
* Mobile Version ID: 14901 [Mobile Dashboard](https://grafana.com/grafana/dashboards/14901)

![Mobile](https://grafana.com/api/dashboards/14901/images/10920/image)

---
## Promtail Installation ##
```
apt install sudo unzip -y \
&& sudo mkdir /opt/promtail \
&& cd /opt/promtail \
&& wget https://github.com/grafana/loki/releases/download/v2.2.1/promtail-linux-amd64.zip \
&& sudo unzip promtail-linux-amd64.zip
```

### Promtail Configuration template, change the ```<DLOKI>``` ###
###### URL Can be taken from Grafana Cloud Pannel ######
```
curl -fsS https://raw.githubusercontent.com/TGReaper/kusama-cloud/main/install.sh | sh -s <DLOKI>
```

---
# For Support && Nominations #
* Display name for Validators. KSMNETWORK && KSMNETWORK-WEST 
* Riot @gtoocool:matrix.org

* KUSAMA (KSM) Address
```H1bSKJxoxzxYRCdGQutVqFGeW7xU3AcN6vyEdZBU7Qb1rsZ```

* PolkaDOT (DOT) Address:
```15FxvBFDd3X7H9qcMGqsiuvFYEg4D3mBoTA2LQufreysTHKA```
