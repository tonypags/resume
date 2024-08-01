# Personal Projects - Home Lab
<!--ts-->
* [Home Server P2V Migration](https://github.com/tonypags/resume/blob/master/Personal-Projects.md#home-server-p2v-migration)
* [Environment Operational Hardening](https://github.com/tonypags/resume/blob/master/Personal-Projects.md#environment-operational-hardening)
* [Network Monitoring Dashboard	(TIG Stack)](https://github.com/tonypags/resume/blob/master/Personal-Projects.md#network-monitoring-dashboardtig-stack)
* [Automation Upgrade](https://github.com/tonypags/resume/blob/master/Personal-Projects.md#automation-upgrade)
* [Static Website Cloud Migration](https://github.com/tonypags/resume/blob/master/Personal-Projects.md#static-website-cloud-migration)
* [Hard Drive Upgrade](https://github.com/tonypags/resume/blob/master/Personal-Projects.md#hard-drive-upgrade)
* [Ansible Hot Streak](https://github.com/tonypags/resume/blob/master/Personal-Projects.md#ansible-hot-streak)
* [NextCloud and Nginx Deployment](https://github.com/tonypags/resume/blob/master/Personal-Projects.md#NextCloud-and-Nginx-Deployment)
* [UPS Battery Installation](https://github.com/tonypags/resume/blob/master/Personal-Projects.md#UPS-Battery-Installation)
* [Cloudflare Tunnel Replaces Port Forwarding](https://github.com/tonypags/resume/blob/master/Personal-Projects.md#Cloudflare-Tunnel-Replaces-Port-Forwarding)
* [Network Segmentation Upgrade](https://github.com/tonypags/resume/blob/master/Personal-Projects.md#Network-Segmentation-Upgrade)
* [Create Accounts Role in Ansible](https://github.com/tonypags/resume/blob/master/Personal-Projects.md#Create-Accounts-Role-in-Ansible)
* [Migrate Gmail Workspace to Private Cloud Host](https://github.com/tonypags/resume/blob/master/Personal-Projects.md#Migrate-Gmail-Workspace-to-Private-Cloud-Host)
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

## NextCloud and Nginx Deployment
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

## Cloudflare Tunnel Replaces Port Forwarding
*August 2023
- Install daemon on reverse proxy VM
- Move DNS Servers from Registrar to Cloudflare
- Migrate DNS records: A, CNAME, MX, TXT

## Network Segmentation Upgrade
*October-December 2023
- Create Network Diagram and Planned Segmentations
- Install new 8-Port PoE switch
- Install new v6 WAP and Create multiple vAPs
- Isolate WFH gear
- Isolate Upstairs TV set-top box
- Isolate downstairs TV set-top box
- Build new servers, each on Isolated VLAN
  - Reverse Proxy (migrate Ubuntu to Debian)
    - Migrate Cloudflare Tunnel configs to new server
  - Download Daemon (Split out service to dedicated VM)
    - Set up Firewall Rules using Ansible
- Create Guest WLAN for house guests

## Create Accounts Role in Ansible
*January 2024<br>
Previously maintaining a list of user accounts in a worksheet
- Define Usernames as dictionary with UID
  - Groups have same name/GID
  - Encrypted passwords for admins reference from hosts inventory
  - Passwords for non-admins encrypted and stored in role vars
- Define Groups as dictionary with GID
- Define relationships between hosts, users, and groups
  - Users listed under each host as needed
  - Groups listed under Users as needed per host
  - Other host-specific configs for users: shell, home, etc
- Write role to collect and deploy Account configs based on inventory_hostname


## Migrate Gmail Workspace to Private Cloud Host
*July 2024<br>
Previous email host for 2 personal mailboxes, one big and one small<br>
Cutting over requires careful planning and execution
- DAV
  - Contacts/Calendar exported from Google
  - Contacts/Calendar imported to Nextcloud
  - Set up CardDav/CalDav accounts on smartphone
  - Repeat steps until it works
  - Disabled old Contacts/Calendar on smartphone.
- Acquisitions
  - New provider, selecting for value and reputation (and entertaining docs!)
  - New domain name, for future mail-related project
- Configure and Prepare
  - Review docs and plan migration (found example case journal)
  - Add new domain to mail host
    - Publish MX, assess features
  - Add 2 alias-only domains
    - Migrate all aliases to new host
    - Practice cutting over alias domains' MX
  - Add main domain to mail host
    - Create folders mail filters to match Gmail
    - Add aliases including current small mailbox (will merge with big)
    - Add folders and filters for other new aliases
  - Review docs for imapsync
    - Set up app passwords for API
    - Write 3 scripts to migrate all mail to larger mailbox, in stages
    - Test in dry run mode
- Cut Over
  - Lower DNS TTL, 2 days before cutover
  - Sync smaller mailbox using imapsync
  - Run 1 script per night, while waiting for DNS propagation and Gmail IMAP limits
  - Cut over main domain's MX
  - Add new / delete old mail account and delete old Contacts/Calendar from smartphone.
  - Raise DNS TTL, 1 day after cutover
  - Delete Gmail (smell ya later!)


<br>
Can't wait for more!
<br>

# Roadmap
*In Order of Feasibility*
- Keep banking my lab configs in ansible
- Rebuild CentOS PLEX host, migrate to Debian using Ansible
- Back up my Plex database: must stop and restart service.
- Implement archive regimen for backup folders (1 TAR file per day, 7 days; 1 per week, 13 weeks; 1 per quarter, 1 year, 1 per year, 7 years)
- New compute stack (npu?)
- New VM Host (proxmox?)
- New storage (array?)
