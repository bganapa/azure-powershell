
$rpName = "azurebridge"
$location = pwd
$moduleName = "AzureBridge"
$namespace = "Microsoft.AzureStack.Management.AzureBridge.Admin"
$dll = "$namespace.dll"
$client = "$namespace.AzureBridgeAdminClient"
. ..\..\..\tools\GeneratePSSwagger.ps1 -RPName $rpName -Location $location -Name $moduleName -Admin -Repo "deathly809" -Branch "feature/azs.azurebridge.admin" -DLLName $dll -ClientName "$client" -PSSwaggerLocation "E:\github\PSswagger" -AzureStack