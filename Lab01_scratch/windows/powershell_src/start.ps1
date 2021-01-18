echo "---------------- start.ps1 --------- >>"
Get-Content $PSScriptRoot\hello.txt
echo "------------------------------------ <<"
Do
{
    $msg = Read-Host "Echo services";
    echo ">> $msg";
}While ($true)