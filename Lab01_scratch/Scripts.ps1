#Set-ExecutionPolicy Unrestricted

#Switch to Linux Containers
############################################
#           Scratch Image
############################################
#docker build -f DockerFile.01_scratch -t scratch_image:10 .
docker build --file DockerFile.01_scratch --tag scratch_image:10 .
########## docker rmi scratch_image:10
########## .\dive.exe scratch_image:10
#docker images
docker run --name scratch_container scratch_image:10
#docker ps -a
########## docker rm scratch_container

############################################
#           Alpine Image
############################################
docker build --file DockerFile.02_linux_alpine --tag alpine_image:10 .
########## docker rmi alpine_image:10
########## .\dive.exe alpine_image:10
docker run --name alpine_container alpine_image:10
docker start -a -i alpine_container
docker run -it --name alpine_container alpine_image:10 /bin/sh
########## docker rm alpine_container

#Switch to Windows Containers
#https://docs.microsoft.com/en-us/virtualization/windowscontainers/deploy-containers/version-compatibility?tabs=windows-server-2004%2Cwindows-10-20H2
############################################
#           Nanoserver Image
############################################
docker pull mcr.microsoft.com/windows/nanoserver:2004-amd64
docker build --file DockerFile.03_nanoserver --tag nanoserver_image:11 .
########## docker rmi nanoserver_image:11
########## .\dive.exe nanoserver_image:11
docker run --name nanoserver_container nanoserver_image:11
docker start -a -i nanoserver_container
docker run -it --name nanoserver_container nanoserver_image:11 cmd
docker stop nanoserver_container
########## docker rm nanoserver_container


############################################
#           PowerShell Image
############################################
docker pull mcr.microsoft.com/powershell:lts-nanoserver-2004
docker build --file DockerFile.04_powershell --tag powershell_image:10 .
########## docker rmi powershell_image:10
docker run --name powershell_container powershell_image:10
docker start -a -i powershell_container
docker run -it --name powershell_container powershell_image:10 pwsh
docker run -it --name powershell_container powershell_image:10 pwsh "start.ps1"
########## docker rm powershell_container
