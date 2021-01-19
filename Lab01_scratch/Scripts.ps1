#Set-ExecutionPolicy Unrestricted
docker pull mcr.microsoft.com/dotnet/aspnet:3.1
#https://docs.microsoft.com/en-us/virtualization/windowscontainers/deploy-containers/version-compatibility?tabs=windows-server-2004%2Cwindows-10-20H2
docker pull mcr.microsoft.com/windows/nanoserver:2004-amd64
docker pull mcr.microsoft.com/powershell:lts-nanoserver-2004

#Switch to Linux Containers
#docker images
#docker build -f DockerFile_scratch -t scratch_image:10 .
docker build --file DockerFile_scratch --tag scratch_image:10 .
docker build --file DockerFile_linux_alpine --tag alpine_image:10 .
#Switch to Windows Containers
docker build --file DockerFile_nanoserver --tag nanoserver_image:11 .
docker build --file DockerFile_powershell --tag powershell_image:10 .

########## docker rmi scratch_image:10
########## docker rmi alpine_image:10
########## docker rmi nanoserver_image:11
########## docker rmi powershell_image:10
########## .\dive.exe scratch_image:10
########## .\dive.exe alpine_image:10
########## .\dive.exe nanoserver_image:11

#docker ps -a
docker run --name hello_container scratch_image:10
docker run --name alpine_container alpine_image:10
docker run --name nanoserver_container nanoserver_image:11
docker run --name powershell_container powershell_image:10

docker start -a -i alpine_container
docker start -a -i nanoserver_container
docker start -a -i powershell_container
docker stop nanoserver_container

docker run -it --name alpine_container alpine_image:10 /bin/sh
docker run -it --name nanoserver_container nanoserver_image:11 cmd
docker run -it --name powershell_container powershell_image:10 pwsh
docker run -it --name powershell_container powershell_image:10 pwsh "start.ps1"

########## docker rm hello_container
########## docker rm alpine_container
########## docker rm nanoserver_container
########## docker rm powershell_container
