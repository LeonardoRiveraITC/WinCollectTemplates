#Obtener archivos necesarios
#este script se debe ejecutar con permisos de administrador para permitir la instalacion de wincollect
#x86 o x64
$env:arch=(Get-WMIObject Win32_OperatingSystem).OSArchitecture
#admin
$env:adm="false"
#link de descarga de wincollect 
$env:link="https://drive.usercontent.google.com/download?id=1VtDUAeMzuik9RBJSiLzQSawIqzJCxLxl&export=download&authuser=0&confirm=t&uuid=6957de2e-9a3c-44a2-8340-c27f9c3e28f9"
#direccion de destino de logs wc
$env:wchost="10.15.1.6"
#installer para x86
if ( "32 bits" -eq $env:arch ){
	$env:link="https://drive.usercontent.google.com/download?id=1meuPXIsuuGZHdvNQ49f0nfFlqX-U3Pp2&export=download&authuser=0&confirm=t&uuid=35cd69d1-5a53-4973-a822-fe3292a1f530&at=APZUnTX1na0hXnt6Q5MUQ7Mx1Kiy%3A1709230312388"
}

#Get install file
Invoke-WebRequest -UseBasicParsing -Uri "$env:link" -OutFile "$env:temp/wcInstaller.msi"

#Install

msiexec.exe /i $env:temp\wcInstaller.msi ADMIN_GROUP="true"
