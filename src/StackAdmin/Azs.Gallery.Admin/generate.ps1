
<#
.DESCRIPTION
Create PSSwagger based modules.

.PARAMETER RPName
The name of the resource provider located in azure-rest-api-specs.  This name is used to form your module name using the format "Azs.$RPName" or "Azs.$RPName.Admin" if Admin is selected.

.PARAMETER Location
The root directory where output is produced.

.PARAMETER Admin
Designates that the output is an admin module.

.PARAMETER PSSwaggerFolderPath
If using a custom PSSwagger tool provide the location.  If not provided we attempt to import the PSSwagger module.

.PARAMETER Name
The name of your module.  If this is left blank we use the RPName.

.PARAMETER ModuleDirectory
The name of the output directory the module is placed.

#>
Function New-PSSwaggerCode {
        
    param(
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [System.String]$RPName,
        
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [System.String]$Location,
        
        [ValidateNotNullOrEmpty()]
        [System.String]$PSSwaggerLocation = $null,
        
        [switch]$Admin,

        [switch]$AzureStack,

        [ValidateNotNullOrEmpty()]
        [System.String]$Name,
        
        [ValidateNotNullOrEmpty()]
        [System.String]$ModuleDirectory = "Module",
        
        [ValidateNotNullOrEmpty()]
        [System.Version]$Version = "0.1.0",

        [ValidateNotNullOrEmpty()]
        [System.String]$GithubAccount = "Azure",

        [ValidateNotNullOrEmpty()]
        [System.String]$GithubBranch = "current",

        [ValidateNotNullOrEmpty()]
        [System.String]
        $PredefinedAssemblies,

        [ValidateNotNullOrEmpty()]
        [System.String]
        $ClientTypeName
        
    )

    $file="https://github.com/$GithubAccount/azure-rest-api-specs/blob/$GithubBranch/specification/azsadmin/resource-manager/$RPName/readme.md"

    # Generate single JSON file
    Invoke-Expression "& autorest $file --version=latest --output-artifact=swagger-document.json --output-folder=$Location"

    # Either use installed or from the repo
    if($PSSwaggerLocation) {
        $env:PSModulePath = "$PSSwaggerLocation;$env:PSModulePath"    
        Import-Module $PSSwaggerLocation\PSSwagger
    } else {
        Import-Module PSSwagger
    }

    # If the name is not set we set it
    if(-not $Name) {
        $Name = $RPName
    }

    $postfix = ""
    $prefix = "Az."

    if($Admin) {
        $postFix = ".Admin"
    }

    if($AzureStack) {
        $preFix = "Azs."
    }

    $RPName = $RPName.Substring(0,1).ToUpper() + $RPName.Substring(1);

    $specPath = Join-Path $Location -ChildPath "$Name.json"
    $namespace = "$prefix$RPName$postfix"
    $output = Join-Path $Location -ChildPath $ModuleDirectory

    New-PSSwaggerModule `
        -SpecificationPath $specPath `
        -Path $output `
        -AssemblyFileName $PredefinedAssemblies `
        -ClientTypeName $clientTypeName `
        -Name $namespace `
        -Version $Version `
        -NoVersionFolder `
        -UseAzureCsharpGenerator `
        -DefaultCommandPrefix Azs `
        -Header MICROSOFT_MIT_NO_CODEGEN `
        -Verbose 

}

#### Generate.ps1

$rpName = "gallery"
$name = "Gallery"
$location = Get-Location
$psswagger = "D:\github\PSswagger"
$module = "Module"
$namespace = "Microsoft.AzureStack.Management.$Name.Admin"
$assembly = "$namespace.dll"
$client = "$namespace.GalleryAdminClient"

New-PSSwaggerCode `
    -RPName $rpName `
    -Location $location `
    -Admin `
    -ModuleDirectory $module `
    -AzureStack `
    -PSSwaggerLocation $psswagger `
    -GithubAccount bganapa `
    -GithubBranch stack-admin `
    -PredefinedAssemblies $assembly `
    -Name $name `
    -ClientTypeName $client
    