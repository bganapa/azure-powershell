<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.
#>

<#
.SYNOPSIS
    Parameters required for creating/updating a product secret.

.DESCRIPTION
    Parameters required for creating/updating a product secret.

.PARAMETER SymmetricKey
    The symmetric key.

.PARAMETER PfxFileName
    The pfx certificate file location.

.PARAMETER PfxPassword
    The pfx certificate file password.

.PARAMETER Password
    The pfx certificate file password.

.PARAMETER SecretValue
    The secret value in a secure string format.

#>
function New-SecretParametersObject {
    param(    
        [Parameter(Mandatory = $false)]
        [string]
        $SymmetricKey,
    
        [Parameter(Mandatory = $false)]
        [string]
        $PfxFileName,
    
        [Parameter(Mandatory = $false)]
        [string]
        $PfxPassword,
    
        [Parameter(Mandatory = $false)]
        [string]
        $Password,
    
        [Parameter(Mandatory = $false)]
        [string]
        $SecretValue
    )
    
    $Object = New-Object -TypeName Microsoft.AzureStack.Management.Deployment.Admin.Models.SecretParameters -ArgumentList @($secretValue, $pfxFileName, $pfxPassword, $symmetricKey, $password)

    if (Get-Member -InputObject $Object -Name Validate -MemberType Method) {
        $Object.Validate()
    }

    return $Object
}

