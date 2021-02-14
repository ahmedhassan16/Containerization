# dotnet --list-sdks
dotnet new console --output App --framework net5.0 --name NetCore.Docker
# dotnet run --project .\App\  "local"           #You have to create c:\data\log.txt & data.txt files
dotnet publish .\App\ -c Release


docker build --file DockerFile --tag core50_image .

#docker run -it -v hostVolume:'c:/Data' --name core50_container core50_image
docker run  -it `
            --mount type=bind,source="$(pwd)/hostVolume",target='c:/Data' `
            --name core50_container core50_image
            
docker attach core50_container

## Inspect Image        ##### .\dive.exe core50_image
## Remove Container     ##### docker rm core50_container
## Remove image         ##### docker rmi core50_image
