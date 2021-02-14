FROM mcr.microsoft.com/dotnet/aspnet:5.0
COPY App/bin/Release/net5.0/publish/ App/
WORKDIR /App
RUN mkdir -p data
ENTRYPOINT ["dotnet", "NetCore.Docker.dll"]
