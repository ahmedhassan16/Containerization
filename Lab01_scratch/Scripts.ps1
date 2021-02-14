# Set-ExecutionPolicy Unrestricted

############################################
#           Scratch Image
############################################
# Switch to Linux Containers

# Build Image from scratch base
# docker build -f DockerFile.01_scratch -t scratch_image:10 .
docker build --file DockerFile.01_scratch --tag scratch_image:10 .
# Create a container from image
docker run --name scratch_container scratch_image:10

## Inspect Image        ##### .\dive.exe scratch_image:10
## List containers      ##### docker ps -a
## Remove Container     ##### docker rm scratch_container
## Remove image         ##### docker rmi scratch_image:10

############################################
#           Alpine Image
############################################
# Build Image from alpine base
docker build --file DockerFile.02_linux_alpine --tag alpine_image:10 .
# Create a container from image
docker run --name alpine_container alpine_image:10
# Start container    (-a=attach, i=interactive)
docker start -a -i alpine_container

# Create a container with command (-it=Interactive attached shell)
docker run -it --name alpine_container2 alpine_image:10 /bin/sh

## Inspect Image        ##### .\dive.exe alpine_image:10
## Remove Container     ##### docker rm alpine_container
## Remove image         ##### docker rmi alpine_image:10

############################################
#           Nanoserver Image
############################################
# Switch to Windows Containers
# https://docs.microsoft.com/en-us/virtualization/windowscontainers/deploy-containers/version-compatibility?tabs=windows-server-2004%2Cwindows-10-20H2

# Pull image from registery
docker pull mcr.microsoft.com/windows/nanoserver:2004-amd64
# Build image from nanoserver base
docker build --file DockerFile.03_nanoserver --tag nanoserver_image:11 .

# Create a container from image
docker run --name nanoserver_container nanoserver_image:11
# Start container    (-a=attach, i=interactive)
docker start -a -i nanoserver_container
# Create a container with command (-it=Interactive attached shell)
docker run -it --name nanoserver_container2 nanoserver_image:11 cmd
# Stop container
docker stop nanoserver_container

## Inspect Image        ##### .\dive.exe nanoserver_image:11
## Remove Container     ##### docker rm nanoserver_container
## Remove image         ##### docker rmi nanoserver_image:11

############################################
#           PowerShell Image
############################################
# Pull image from registery
docker pull mcr.microsoft.com/powershell:lts-nanoserver-2004
# Build image from powershell base
docker build --file DockerFile.04_powershell --tag powershell_image:10 .

# Create a container from image
docker run --name powershell_container powershell_image:10
# Start container    (-a=attach, i=interactive)
docker start -a -i powershell_container
# Create a container with command (-it=Interactive attached shell)
docker run -it --name powershell_container2 powershell_image:10 pwsh
docker run -it --name powershell_container3 powershell_image:10 pwsh "start.ps1"

## Remove Container     ##### docker rm powershell_container
## Remove image         ##### docker rmi powershell_image:10
