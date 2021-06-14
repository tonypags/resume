# Personal Projects - Home Lab
<!--ts-->
* [Home Server P2V Migration](https://github.com/tonypags/resume/blob/master/Personal-Projects.md#home-server-p2v-migration)
* [Environment Operational Hardening](https://github.com/tonypags/resume/blob/master/Personal-Projects.md#environment-operational-hardening)
* [Network Monitoring Dashboard	(TIG Stack)](https://github.com/tonypags/resume/blob/master/Personal-Projects.md#network-monitoring-dashboardtig-stack)
* [Automation Upgrade](https://github.com/tonypags/resume/blob/master/Personal-Projects.md#automation-upgrade)
* [Static Website Cloud Migration](https://github.com/tonypags/resume/blob/master/Personal-Projects.md#static-website-cloud-migration)
* [Hard Drive Upgrade](https://github.com/tonypags/resume/blob/master/Personal-Projects.md#hard-drive-upgrade)
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

# Roadmap
*After finishing job search*
- VPN replaces port-forwarding for external access to services.
- Symlink remaining systems config files, and Controller archives. 
- Re-organize Ansible playbooks into roles. 
- Manage iptables configs with Ansible.
- Add Ansible roles for DNS and DHCP config.
- Add a new guest to VMWare using Terraform.
