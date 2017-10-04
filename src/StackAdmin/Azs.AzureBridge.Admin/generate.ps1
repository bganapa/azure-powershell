
$rpName = "azurebridge"
$location = pwd
$moduleName = "AzureBridgeAdmin"
$namespace = "Microsoft.AzureStack.Management.AzureBridge.Admin"
$dll = "$namespace.dll"
. ..\..\..\tools\GeneratePSSwagger.ps1 -RPName $rpName -Location $location -Name $moduleName -Admin -Repo "deathly809" -Branch "feature/azs.azurebridge.admin" -DLLName $dll -ClientName "AzureBridgeAdminClient" -PSSwaggerLocation "E:\github\PSswagger"