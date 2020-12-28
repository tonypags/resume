# Personal Projects

## Home Server P2V Migration
*March-June 2020*
- Migrated services from Windows Home Server 2011 to multiple Linux VMs on VMWare.
- Established DMZ subnet for internet-facing systems including media services, UniFi controller, and VPN. 
- Centralized all non-OS storage to a single server with a JBOD/ZFS striped mirror, and NFS shares secured by ACL and hard/soft firewalls. 
- Leveraged Cron for auto-remediation tasks and maintenance script execution.
- Proof-of-concept Apache web server hosting static website currently hosted with GoDaddy. 
- Installed backup software on NFS server and leveraged NFS shares and symlinks to capture systems’ critical data. 
- Documented network info and roles for all systems. 

## Network Monitoring Dashboard	(TIG Stack)
*October 2020*
- Installed Influx time-series database and Grafana for data visualization. 
- Deployed Telegraf to all servers for data collection. 
- Designed PowerShell script to check for and report to Influx on systems’ package updates. 
- Used public Grafana dashboard templates for server role status including: 
- Server utilization (memory, CPU, disk usage/IO, etc). 
- Weather conditions and history. 
- Created custom dashboard with metrics designed to show health of automation. 
- VPN uptime and auto-remediation history. 
- Pending package updates for all systems. 
- NFS latency. 

## Automation Upgrade
*November 2020*
- Leveraged Ansible Tower for configuration of DNS, DHCP, and OS firewalls.
- Leveraged Jenkins for remediation and maintenance script execution.

## Static Website Cloud Migration
*December 2020*
- Migrated static website to Azure Web Apps. 
- Added SSL support and custom domain name using 3rd-party registrar. 
- Enabled GitHub Actions CD pipeline to auto-deploy changes on push or pull request. 
- Cost savings $130 annually. 

