#Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
#netstat -a -b

#Check https://github.com/Sitecore/docker-examples/tree/develop/getting-started
.\init.ps1 -LicenseXmlPath "D:\DKR\docker-examples-develop\getting-started\license.xml"

#mkcert -install
#mkcert -cert-file xp0cm.localhost.crt -key-file xp0cm.localhost.key "xp0cm.localhost"
#mkcert -cert-file xp0id.localhost.crt -key-file xp0id.localhost.key "xp0id.localhost"

docker-compose up --detach
