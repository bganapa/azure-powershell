<#
Copyright (c) Microsoft and contributors.  All rights reserved.

Licensed under the Apache License, Version 2.0 (the ""License"");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

See the License for the specific language governing permissions and
limitations under the License.

Code generated by Microsoft (R) PSSwagger 0.3.0
Changes may cause incorrect behavior and will be lost if the code is regenerated.
#>

<#
.SYNOPSIS
    

.DESCRIPTION
    Return product name.

.PARAMETER Skip
    Skip the first N items as specified by the parameter value.

.PARAMETER ProductName
    Name of the product.

.PARAMETER Top
    Return the top N items as specified by the parameter value. Applies after the -Skip parameter.

#>
function Get-PublishedProduct
{
    [OutputType([Microsoft.AzureStack.Management.AzureBridge.Admin.Models.PublishedProductResource])]
    [CmdletBinding(DefaultParameterSetName='PublishedProducts_List')]
    param(    
        [Parameter(Mandatory = $false, ParameterSetName = 'PublishedProducts_List')]
        [int]
        $Skip = -1,
    
        [Parameter(Mandatory = $true, ParameterSetName = 'PublishedProducts_Get')]
        [System.String]
        $ProductName,
    
        [Parameter(Mandatory = $false, ParameterSetName = 'PublishedProducts_List')]
        [int]
        $Top = -1
    )

    Begin 
    {
	    Initialize-PSSwaggerDependencies -Azure
        $tracerObject = $null
        if (('continue' -eq $DebugPreference) -or ('inquire' -eq $DebugPreference)) {
            $oldDebugPreference = $global:DebugPreference
			$global:DebugPreference = "continue"
            $tracerObject = New-PSSwaggerClientTracing
            Register-PSSwaggerClientTracing -TracerObject $tracerObject
        }
	}

    Process {
    
    $ErrorActionPreference = 'Stop'

    $NewServiceClient_params = @{
        FullClientTypeName = 'Microsoft.AzureStack.Management.AzureBridge.Admin.AzureBridgeAdminClient'
    }

    $GlobalParameterHashtable = @{}      
    $GlobalParameterHashtable['SubscriptionId'] = $null
    if($PSBoundParameters.ContainsKey('SubscriptionId')) {
        $GlobalParameterHashtable['SubscriptionId'] = $PSBoundParameters['SubscriptionId']
    }
 
    $NewServiceClient_params['GlobalParameterHashtable'] = $GlobalParameterHashtable 
    $AzureBridgeAdminClient = New-ServiceClient @NewServiceClient_params
    
    
    

    $skippedCount = 0
    $returnedCount = 0
    if ('PublishedProducts_List' -eq $PsCmdlet.ParameterSetName) {
        Write-Verbose -Message 'Performing operation ListWithHttpMessagesAsync on $AzureBridgeAdminClient.'
        $taskResult = $AzureBridgeAdminClient.PublishedProducts.ListWithHttpMessagesAsync()
    } elseif ('PublishedProducts_Get' -eq $PsCmdlet.ParameterSetName ) {
        Write-Verbose -Message 'Performing operation GetWithHttpMessagesAsync on $AzureBridgeAdminClient.'
        $taskResult = $AzureBridgeAdminClient.PublishedProducts.GetWithHttpMessagesAsync($ProductName)
    } else {
        Write-Verbose -Message 'Failed to map parameter set to operation method.'
        throw 'Module failed to find operation to execute.'
    }

    if ($TaskResult) {
        $result = $null
        $ErrorActionPreference = 'Stop'
                    
        $null = $taskResult.AsyncWaitHandle.WaitOne()
                    
        Write-Debug -Message "$($taskResult | Out-String)"


        if((Get-Member -InputObject $taskResult -Name 'Result') -and
           $taskResult.Result -and
           (Get-Member -InputObject $taskResult.Result -Name 'Body') -and
           $taskResult.Result.Body)
        {
            Write-Verbose -Message 'Operation completed successfully.'
            $result = $taskResult.Result.Body
            Write-Debug -Message "$($result | Out-String)"
            if ($result -is [Microsoft.Rest.Azure.IPage[Microsoft.AzureStack.Management.AzureBridge.Admin.Models.PublishedProductResource]]) {
                    foreach ($item in $result) {
                        if ($skippedCount++ -lt $Skip) {
                        } else {
                            if (($Top -eq -1) -or ($returnedCount++ -lt $Top)) {
                                $item
                            } else {
                                break
                            }
                        }
                    }
                } else {
                    $result
                }
        }
        elseif($taskResult.IsFaulted)
        {
            Write-Verbose -Message 'Operation failed.'
            if ($taskResult.Exception)
            {
                if ((Get-Member -InputObject $taskResult.Exception -Name 'InnerExceptions') -and $taskResult.Exception.InnerExceptions)
                {
                    foreach ($ex in $taskResult.Exception.InnerExceptions)
                    {
                        Write-Error -Exception $ex
                    }
                } elseif ((Get-Member -InputObject $taskResult.Exception -Name 'InnerException') -and $taskResult.Exception.InnerException)
                {
                    Write-Error -Exception $taskResult.Exception.InnerException
                } else {
                    Write-Error -Exception $taskResult.Exception
                }
            }
        } 
        elseif ($taskResult.IsCanceled)
        {
            Write-Verbose -Message 'Operation got cancelled.'
            Throw 'Operation got cancelled.'
        }
        else
        {
            Write-Verbose -Message 'Operation completed successfully.'
        }
            
        Write-Verbose -Message 'Flattening paged results.'
        # Get the next page iff 1) there is a next page and 2) any result in the next page would be returned
        while ($result -and (Get-Member -InputObject $result -Name 'nextLink') -and $result.'nextLink' -and (($Top -eq -1) -or ($returnedCount -lt $Top))) {
            Write-Debug -Message "Retrieving next page: $($result.'nextLink')"
            $taskResult = $AzureBridgeAdminClient.PublishedProducts.ListNextWithHttpMessagesAsync($result.'nextLink')
             $result = $null
        $ErrorActionPreference = 'Stop'
                    
        $null = $taskResult.AsyncWaitHandle.WaitOne()
                    
        Write-Debug -Message "$($taskResult | Out-String)"


        if((Get-Member -InputObject $taskResult -Name 'Result') -and
           $taskResult.Result -and
           (Get-Member -InputObject $taskResult.Result -Name 'Body') -and
           $taskResult.Result.Body)
        {
            Write-Verbose -Message 'Operation completed successfully.'
            $result = $taskResult.Result.Body
            Write-Debug -Message "$($result | Out-String)"
            if ($result -is [Microsoft.Rest.Azure.IPage[Microsoft.AzureStack.Management.AzureBridge.Admin.Models.PublishedProductResource]]) {
                    foreach ($item in $result) {
                        if ($skippedCount++ -lt $Skip) {
                        } else {
                            if (($Top -eq -1) -or ($returnedCount++ -lt $Top)) {
                                $item
                            } else {
                                break
                            }
                        }
                    }
                } else {
                    $result
                }
        }
        elseif($taskResult.IsFaulted)
        {
            Write-Verbose -Message 'Operation failed.'
            if ($taskResult.Exception)
            {
                if ((Get-Member -InputObject $taskResult.Exception -Name 'InnerExceptions') -and $taskResult.Exception.InnerExceptions)
                {
                    foreach ($ex in $taskResult.Exception.InnerExceptions)
                    {
                        Write-Error -Exception $ex
                    }
                } elseif ((Get-Member -InputObject $taskResult.Exception -Name 'InnerException') -and $taskResult.Exception.InnerException)
                {
                    Write-Error -Exception $taskResult.Exception.InnerException
                } else {
                    Write-Error -Exception $taskResult.Exception
                }
            }
        } 
        elseif ($taskResult.IsCanceled)
        {
            Write-Verbose -Message 'Operation got cancelled.'
            Throw 'Operation got cancelled.'
        }
        else
        {
            Write-Verbose -Message 'Operation completed successfully.'
        }
        }
    }
    }

    End {
        if ($tracerObject) {
            $global:DebugPreference = $oldDebugPreference
            Unregister-PSSwaggerClientTracing -TracerObject $tracerObject
        }
    }
}
