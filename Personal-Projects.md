# Personal Projects - Home Lab
<!--ts-->
* [Home Server P2V Migration](https://github.com/tonypags/resume/blob/master/Personal-Projects.md#home-server-p2v-migration)
* [Environment Operational Hardening](https://github.com/tonypags/resume/blob/master/Personal-Projects.md#environment-operational-hardening)
* [Network Monitoring Dashboard	(TIG Stack)](https://github.com/tonypags/resume/blob/master/Personal-Projects.md#network-monitoring-dashboardtig-stack)
* [Automation Upgrade](https://github.com/tonypags/resume/blob/master/Personal-Projects.md#automation-upgrade)
* [Static Website Cloud Migration](https://github.com/tonypags/resume/blob/master/Personal-Projects.md#static-website-cloud-migration)
* [Hard Drive Upgrade](https://github.com/tonypags/resume/blob/master/Personal-Projects.md#hard-drive-upgrade)
* [Ansible Hot Streak](https://github.com/tonypags/resume/blob/master/Personal-Projects.md#ansible-hot-streak)
* [Roadmap](https://github.com/tonypags/resume/blob/master/Personal-Projects.md#roadmap)
<!--te-->

## Home Server P2V Migration
*March-April 2020*
- Migrated services from Windows Home Server 2011 to multiple CentOS 8 and Ubuntu 18 Linux VMs on VMWare.
- Established DMZ subnet for internet-facing systems including media services, UniFi controller, and VPN client. 
- Centralized all non-OS storage to a single server with a JBOD/ZFS striped mirror, and NFS shares secured by ACL and hard/soft firewalls. 
- Documented network info and roles for all systems. 

## Environment Operational Hardening
*May 2020*
- Designed PowerShell script to monitor and auto-remediate VPN client disconnections.
- Leveraged Cron for auto-remediation tasks and maintenance script execution.
- Installed backup software on NFS server and leveraged NFS shares and symlinks to capture most systems’ critical data. 
- Proof-of-concept Apache web server for static website currently hosted with GoDaddy. 

## Network Monitoring Dashboard	(TIG Stack)
*October 2020*
- Installed Influx time-series database and Grafana for data visualization. 
- Deployed Telegraf to all servers for data collection. 
- Designed PowerShell script to check systems’ package updates and report to Influx. 
- Used public Grafana dashboard templates for server role status including: 
  - Server utilization (memory, CPU, disk usage/IO, etc). 
  - Weather conditions and history. 
  - VPN uptime and auto-remediation history. 
  - Pending package updates for all systems. 
  - NFS latency. 
- Created custom dashboard with metrics designed to show health of automation. 

## Automation Upgrade
*November 2020*
- Leveraged Ansible Tower for package updates and common toolset deployment.
- Leveraged Jenkins for remediation and maintenance script execution.
- Installed 2x8TB CMR disk drives to replace 2x6TB SMR drives and reduce noise. 

## Static Website Cloud Migration
*December 2020*
- Migrated static website to Azure Web Apps. 
- Added SSL support and custom domain name using 3rd-party registrar. 
- Configured GitHub Actions CD pipeline to auto-deploy changes on push or pull request. 
- Cost savings $130 annually. 

## Hard Drive Upgrade
*January 2021*
- Installed 2x10TB disk drives to replace 2x8TB drives and reduce noise. 
- Replaced disks in ZFS array (5TB, about 5 days)
- Zeroed out old drives (2x8TB, about 2 days; 2x6TB, about 2 days)

## Ansible Hot Streak
*June 2022*
- Created a backup role for Ansible to centrally manage selections and configs.
- Replaced Symlink solution with rsync scripts updated by Ansible.
- Execute backup via Jenkins daily.
- Add Ansible roles for DNS and DHCP config.
- Added UniFi USG Controller archives to backup.
- Reorganized all logic into roles, playbooks into common folder tree.
- Created NTP role and applied to DNS/DHCP Raspberry Pi 2 host.
- Created Ansible and Jenkins roles to rebuild management server.
- Created Apache role to rebuild web server.
- Rebuilt 2 of 3 CentOS hosts as Ubuntu 22, using new Ansible roles.
- Wrote curl-able script for restoring SSH profile to any server via backup for ansible readiness.

## NextCloud & Nginx Deployment
*August-October 2022*
- Found an RSS Reader I can self-host, with a mobile app.
- Build web host (no ansible role yet).
- Implement NGINX reverse proxy for this and other hosted web services.
- Unable to use NFS mount as data store -- OH NO!  :(
- Add SSL Certs with custom domain.
- Add RSS feeds from old solution.
- Add wedding photos.
- Add account for wife.

## UPS Battery Installation
*January 2023*<br>
A long time coming, I moved to the suburbs so I need this.
- Move all hardware onto battery backup, except for modem.
- Write group of scripts to gracefully shutdown all VMs and hosts.
Challenges
- Testing this script.... access to 1 system is stubborn -- I CAN DO IT!  :)

<br>
Can't wait for more!
<br>

# Roadmap
*In Order of Feasibility*
- Implement archive regimen for backup folders (1 TAR file per day, 7 days; 1 per week, 13 weeks; 1 per quarter, 1 year, 1 per year, 7 years)
- Back up my Plex database: must stop and restart service.
- Make an Accounts role for Ansible, for all hosts (better than lost excel sheet)
- Rebuild final CentOS PLEX host, migrate to Ubuntu using Ansible
- Add SSL record for all web services.
- VPN replaces port-forwarding for external access to services.
- Deploy remote access solution (Guacamole).
- Add a new guest to VMWare using Terraform. -- OH NO, ESXi-only not supported :(
- Manage iptables configs with Ansible.
- Build a copy of Concierge to Azure Portal using Terraform
