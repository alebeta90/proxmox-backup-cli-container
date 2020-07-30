# Proxmox Backup Client container  

This container helps sysAdmin/DevOps to run the backup cli from [Proxmox](https://proxmox.com/en/) in any system with [Docker](https://www.docker.com/)/[Podman](https://podman.io/).  
At the moment with [Proxmox Backup Server](https://pbs.proxmox.com/wiki/index.php/Main_Page) being a *beta* development, the cli tool is only available for Debian Linux Distribution.  
With this container you can perform backups to you Proxmox Backup Server using podman or docker.

Proxmox Backup Server Documentation: [https://pbs.proxmox.com/wiki/index.php/Main_Page](https://pbs.proxmox.com/wiki/index.php/Main_Page).  

## How to use it?

We recommend to use *Podman* to run the container, it just create a light process and does not need a runtime to run the container.

### Install Podman

CentOS 7:

`sudo yum install podman`

CentOS 8 & Fedora:

`sudo dnf install podman`

Set the environment variables:

* PBS_PASSWORD
* PBS_FINGERPRINT

this env are necessary because the container tool is not able to interact a ask for password and fingerprint.  


`podman run -i --rm -h my_hostname -v /home/john:/mydata -e PBS_PASSWORD -e PBS_FINGERPRINT --security-opt label=disable quay.io/alebeta/proxmox-backup-cli:latest backup backup.pxar:/mydata/ --repository myuser@pbs@pbs-server:backup01`

Explaining the `podman run`

`-h`: set the container hostname, it is useful to identify backups in your *BPS*. If hostname is not set, it will show the container ID which is not so useful.  
`-v`: map your local folder `/home/john` to the container volume `/mydata`. Then it is important to change `/home/john` for the directory you would like to backup.  
`-e`: specify the env variables needed to authenticate at the PBS server.  
`--security-opt`: For testing we use `label=disable` option, which relax the security context of Podman. But for production usage, it is important to run the container without this option and configure the permissions and security context properly.  

**NOTE:** This container image can run with docker, but it haven't been tested yet.

## Contributors

@mihai-satmarean @alebeta90
