param(
    [Parameter(Position=0,Mandatory=0)]
	[string]$ProjectName='defaultProjectName'
) 
$ErrorActionPreference = "Stop"

if ((Get-Command 'npm' -errorAction SilentlyContinue) -eq $null)
{
	Write-Error "Npm is not intalled. Please install npm and run the script again";
}

if ((Get-Command 'ng' -errorAction SilentlyContinue) -eq $null)
{
	#install ng if not exists
	npm install -g @angular/cli
}

# npm install -g typings
# npm install -g typescript


#create default Project
ng new $ProjectName
Set-Location $ProjectName

#add materials and animations 
#https://coursetro.com/posts/code/67/Angular-4-Material-Tutorial
npm install --save @angular/material @angular/animations

#add firebase
#https://progblog.io/Angular-2-Firebase-Tutorial-Part-1-Create-a-Firebase-3-CRUD-app-with-Angular-CLI/
npm install angularfire2 firebase --save

Copy-Item ../app.module.ts ./src/app  -Force