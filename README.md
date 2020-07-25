# Proxmox Backup Client container  

This container helps sysAdmin/DevOps to run the backup cli from Proxmox in any system with Docker/Podman.  
At the moment with Proxmox Backup Server being a *beta* development, the cli tool is only available for Debian Linux Distribution.  
With this container you can perform backups to you Proxmox Backup Server using podman or docker.

## How to use it?

### Install Podman

CentOS 7:

`sudo yum install podman`

CentOS 8 & Fedora:

`sudo dnf install podman`

First of all it is important to set the environment variables:

* PBS_PASSWORD
* PBS_FINGERPRINT

this env are necessary because the container tool is not able to interact a ask for password and fingerprint.



`podman run -i --rm -v /home/john:/mydata -e PBS_PASSWORD -e PBS_FINGERPRINT --security-opt label=disable quay.io/alebeta/proxmox-backup-cli:latest backup backup.pxar:/mydata/ --repository myuser@pbs@pbs-server:backup01`

Explaining the `podman run`

`-v`: map your local folder `/home/john` to the container volume `/mydata`. Then it is important to change `/home/john` for the directory you would like to backup.  
`-e`: specify the env variables needed to authenticate at the PBS server.  

**NOTE:** this should run with Docker too
