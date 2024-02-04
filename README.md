# Contest Management System Bash Version

Edited version of Contest Managment System for [ITTS E. Scalfaro](https://www.ittsscalfaro.edu.it/)

Main Website [olimpiadi.francescomancuso.it](https://olimpiadi.francescomancuso.it/)

## Credits

All credits to Bash configurations goes to [@melongist](https://github.com/melongist)

## Pre-installation

### Support

| System | Support |
| :--- | :---: |
| Ubuntu 20.04 | ✅ |
| Ubuntu 22.04 | Not tested yet |


| Server | Support |
| :--- | :---: |
| AWS | ✅ |
| Cloud.it | ✅ |
| Oracle | ✅ |

### Requirement

- 4 GB RAM
- At least 30 GB of space

### Requirement with Forum

- 8 GB RAM
- At least 50 GB of space

### Install GIT

```bash
sudo apt install git
```

## Installation

### 1. Clone this repository in your root folder (/home/USER/)

```bash
cd /home/USER/ # your username
```
```bash
git clone https://github.com/FrancescooM/olimpiadicms-bash.git
```

### 2. Run first bash file (CMS prerequisites)

```bash
cd olimpiadicms-bash/
```
```bash
bash cms15dev01.sh
```

### 3. After reboot, run second bash file (CMS install)

```bash
cd /home/USER/olimpiadicms-bash/ # your username
```
```bash
bash cms15dev02.sh
```

CMS installed!
 
## Post-installation
  
- Open SSH, HTTP, HTTPS, TCP 8888, TCP 8889, TCP 8890 ports

- CMS default links:
    - Contest Area - http://localhost:8888
    - Admin Login - http://localhost:8889
    - Ranking - http://localhost:8890

- Use the following commands to create a contest and run the CMS services

### Helpful commands for CMS

Create another admin account
```bash
cmsAddAdmin USERNAME -p PASSWORD
```

Up Admin Web Server, login at the default link and create users, contest, tasks, ecc.
```bash
cmsAdminWebServer
```

Then shutdown the cmsAdminWebServer service with CTRL+C command to run all the CMS

Command to run in order to run all the services (use "screen" to manage multiple services):
```bash
cmsLogService  #for log
```
```bash
cmsRankingWebServer  #Ranking
```
```bash
cmsResourceService -a #Select the contest number, then press Enter
```

Now the CMS is ready to go! Have fun!

## Advanced configurations

### Change CMS ports

Run this command, then reboot the services
```bash
sudo nano /usr/local/etc/cms.conf
```

## Reference project

- [ioi/cms](https://github.com/ioi/cms)
- [CMS Docs](https://cms.readthedocs.io/en/latest/index.html)
- [melongist's Bash version](https://github.com/melongist/CSL/tree/main/CMS)