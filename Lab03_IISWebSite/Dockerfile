FROM mcr.microsoft.com/windows/servercore/iis:windowsservercore-2004
WORKDIR /inetpub/wwwroot

RUN powershell -NoProfile -Command Remove-Item -Recurse C:\inetpub\wwwroot\*
COPY wwwroot .

ENTRYPOINT ["C:\\ServiceMonitor.exe", "w3svc"]