﻿# ----------------------------------------------------------------------------------
#
# Copyright Microsoft Corporation
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ----------------------------------------------------------------------------------

<# 
    .SYNOPSIS
    Tests creating an elastic pool
#>
function Test-CreateElasticPool
{
    # Setup 
	$location = Get-Location "Microsoft.Sql" "operations" "Southeast Asia"
	$rg = Create-ResourceGroupForTest $location
	$server = Create-ServerForTest $rg $location

    try
    {
		## Create Dtu based pool with DtuPoolParameterSet
        # Create a pool with all values
        $poolName = Get-ElasticPoolName
        $job = New-AzureRmSqlElasticPool  -ServerName $server.ServerName -ResourceGroupName $rg.ResourceGroupName `
            -ElasticPoolName $poolName -Edition Standard -Dtu 200 -DatabaseDtuMin 10 -DatabaseDtuMax 100 -StorageMB 204800 -AsJob
		$job | Wait-Job
		$ep1 = $job.Output

        Assert-NotNull $ep1
		Assert-AreEqual	Standard $ep1.Edition
		Assert-AreEqual StandardPool $ep1.SkuName
		Assert-AreEqual 200 $ep1.Capacity
		Assert-AreEqual 10 $ep1.DatabaseCapacityMin
		Assert-AreEqual 100 $ep1.DatabaseCapacityMax

        # Create a pool using piping and default values
        $poolName = Get-ElasticPoolName
        $ep2 = $server | New-AzureRmSqlElasticPool -ElasticPoolName $poolName
        Assert-NotNull $ep2
    }
    finally
    {
        Remove-ResourceGroupForTest $rg
    }
}

<# 
    .SYNOPSIS
    Tests creating an Vcore elastic pool
#>
function Test-CreateVcoreElasticPool
{
    # Setup 
	$location = Get-Location "Microsoft.Sql" "operations" "Southeast Asia"
	$rg = Create-ResourceGroupForTest $location
	$server = Create-ServerForTest $rg $location

    try
    {
		## Create Vcore based pool with all VcorePoolParameterSet
		$poolName = Get-ElasticPoolName
		$job = New-AzureRmSqlElasticPool -ServerName $server.ServerName -ResourceGroupName $rg.ResourceGroupName `
		        -ElasticPoolName $poolName -VCore 2 -Edition GeneralPurpose -ComputeGeneration Gen4  -DatabaseVCoreMin 0.1 -DatabaseVCoreMax 2 -AsJob
		$job | Wait-Job
		$ep1 = $job.Output

		Assert-NotNull $ep1
		Assert-AreEqual GP_Gen4 $ep1.SkuName
		Assert-AreEqual GeneralPurpose $ep1.Edition
		Assert-AreEqual 2 $ep1.Capacity
		Assert-AreEqual 0.1 $ep1.DatabaseCapacityMin
		Assert-AreEqual 2.0 $ep1.DatabaseCapacityMax

		# Create BC_Gen4_1 elastic pool which is not supported and check the error Message
		$poolName = Get-ElasticPoolName
		Assert-ThrowsContains -script { New-AzureRmSqlElasticPool -ServerName $server.ServerName -ResourceGroupName $rg.ResourceGroupName `
		-ElasticPoolName $poolName -VCore 1 -Edition BusinessCritial -ComputeGeneration BC_Gen4 -StorageMB 204800 } -message "Mismatch between SKU name 'BC_Gen4_1' and tier 'BusinessCritical'"
    }
    finally
    {
        Remove-ResourceGroupForTest $rg
    }
}

<# 
    .SYNOPSIS
    Tests creating an elastic pool with zone redundancy parameters
#>
function Test-CreateElasticPoolWithZoneRedundancy
{
    # Setup 
	$location = Get-Location "Microsoft.Sql" "operations" "West Europe"
	$rg = Create-ResourceGroupForTest $location
	$server = Create-ServerForTest $rg $location

	try
    {
        # Create a pool with zone redundancy set to true
        $poolName = Get-ElasticPoolName
        $ep1 = New-AzureRmSqlElasticPool  -ServerName $server.ServerName -ResourceGroupName $rg.ResourceGroupName `
            -ElasticPoolName $poolName -Edition Premium -ZoneRedundant
        Assert-NotNull $ep1
        Assert-AreEqual Premium $ep1.Edition
		Assert-NotNull $ep1.ZoneRedundant
		Assert-AreEqual "true" $ep1.ZoneRedundant

		# Create a pool with no zone redundancy set
        $poolName = Get-ElasticPoolName
        $ep2 = New-AzureRmSqlElasticPool  -ServerName $server.ServerName -ResourceGroupName $rg.ResourceGroupName `
            -ElasticPoolName $poolName -Edition Premium -Dtu 125
        Assert-NotNull $ep2
        Assert-AreEqual 125 $ep2.Capacity 
        Assert-AreEqual Premium $ep2.Edition
        Assert-NotNull $ep2.ZoneRedundant
        Assert-AreEqual "false" $ep2.ZoneRedundant
	}
    finally
    {
        Remove-ResourceGroupForTest $rg
    }
}

<# 
    .SYNOPSIS
    Tests updating an elastic pool
#>
function Test-UpdateElasticPool
{
    # Setup 
	$location = Get-Location "Microsoft.Sql" "operations" "Southeast Asia"
	$rg = Create-ResourceGroupForTest $location
	$server = Create-ServerForTest $rg $location

    $poolName = Get-ElasticPoolName
    $ep1 = New-AzureRmSqlElasticPool  -ServerName $server.ServerName -ResourceGroupName $rg.ResourceGroupName `
        -ElasticPoolName $poolName -Edition Standard -Dtu 200 -DatabaseDtuMin 10 -DatabaseDtuMax 100
    Assert-NotNull $ep1
    
    $poolName = Get-ElasticPoolName
    $ep2 = $server | New-AzureRmSqlElasticPool -ElasticPoolName $poolName -Edition Standard -Dtu 400 -DatabaseDtuMin 10 `
         -DatabaseDtuMax 100
    Assert-NotNull $ep2


    try
    {
        # Update a pool with all values
        $job = Set-AzureRmSqlElasticPool  -ServerName $server.ServerName -ResourceGroupName $rg.ResourceGroupName `
            -ElasticPoolName $ep1.ElasticPoolName -Dtu 400 -DatabaseDtuMin 0 -DatabaseDtuMax 50 -Edition Standard -StorageMB 409600 -AsJob
		$job | Wait-Job
		$sep1 = $job.Output

        Assert-NotNull $sep1
        Assert-AreEqual 400 $sep1.Capacity 
        Assert-AreEqual 429496729600 $sep1.MaxSizeBytes
        Assert-AreEqual Standard $sep1.Edition
		Assert-AreEqual StandardPool $sep1.SkuName
        Assert-AreEqual 0 $sep1.DatabaseCapacityMin
        Assert-AreEqual 50 $sep1.DatabaseCapacityMax

        # Update a pool using piping
        $sep2 = $server | Set-AzureRmSqlElasticPool -ElasticPoolName $ep2.ElasticPoolName -Dtu 200 `
            -DatabaseDtuMin 10 -DatabaseDtuMax 50  -Edition Standard -StorageMB 204800

        Assert-NotNull $sep2
        Assert-AreEqual 200 $sep2.Capacity 
        Assert-AreEqual 214748364800 $sep2.MaxSizeBytes
        Assert-AreEqual Standard $sep2.Edition
		Assert-AreEqual StandardPool $sep2.SkuName
        Assert-AreEqual 10 $sep2.DatabaseCapacityMin
        Assert-AreEqual 50 $sep2.DatabaseCapacityMax
    }
    finally
    {
        Remove-ResourceGroupForTest $rg
    }
}

<# 
    .SYNOPSIS
    Tests updating an Vcore elastic pool
#>
function Test-UpdateVcoreElasticPool
{
    # Setup 
	$location = Get-Location "Microsoft.Sql" "operations" "Southeast Asia"
	$rg = Create-ResourceGroupForTest $location
	$server = Create-ServerForTest $rg $location

	# Create a Vcore Pool
    $poolName = Get-ElasticPoolName
    $ep1 = New-AzureRmSqlElasticPool  -ServerName $server.ServerName -ResourceGroupName $rg.ResourceGroupName `
        -ElasticPoolName $poolName -VCore 2 -Edition GeneralPurpose -ComputeGeneration Gen4
    Assert-NotNull $ep1
    
	# Create a Dtu pool
    $poolName = Get-ElasticPoolName
    $ep2 = $server | New-AzureRmSqlElasticPool -ElasticPoolName $poolName -Edition Standard -Dtu 400 -DatabaseDtuMin 10 `
         -DatabaseDtuMax 100
    Assert-NotNull $ep2

    try
    {
        # Update Vcore pool to Dtu pool
        $job = Set-AzureRmSqlElasticPool  -ServerName $server.ServerName -ResourceGroupName $rg.ResourceGroupName `
            -ElasticPoolName $ep1.ElasticPoolName -Dtu 400 -DatabaseDtuMin 0 -DatabaseDtuMax 50 -Edition Standard -StorageMB 409600 -AsJob
		$job | Wait-Job
		$sep1 = $job.Output

        Assert-NotNull $sep1
        Assert-AreEqual 400 $sep1.Capacity 
        Assert-AreEqual 429496729600 $sep1.MaxSizeBytes
        Assert-AreEqual Standard $sep1.Edition
		Assert-AreEqual StandardPool $sep1.SkuName
        Assert-AreEqual 0 $sep1.DatabaseCapacityMin
        Assert-AreEqual 50 $sep1.DatabaseCapacityMax

        # Update a Dtu pool to Vcore pool using piping
        $sep2 = $server | Set-AzureRmSqlElasticPool -ElasticPoolName $ep2.ElasticPoolName -VCore 2 `
            -Edition GeneralPurpose -ComputeGeneration Gen4 -StorageMB 204800

        Assert-NotNull $sep2
        Assert-AreEqual 2 $sep2.Capacity 
        Assert-AreEqual 214748364800 $sep2.MaxSizeBytes
        Assert-AreEqual GeneralPurpose $sep2.Edition
		Assert-AreEqual GP_Gen4 $sep2.SkuName
        Assert-AreEqual 0 $sep2.DatabaseCapacityMin
        Assert-AreEqual 2 $sep2.DatabaseCapacityMax

		# Update VCore pool only on DatabaseVCoreMin
		$sep3 = $server | Set-AzureRmSqlElasticPool -ElasticPoolName $ep2.ElasticPoolName -DatabaseVCoreMin 0.1
		Assert-NotNull $sep3
		Assert-AreEqual 0.1 $sep3.DatabaseCapacityMin

		# Update Vcore pool only on VCores
		$sep4 = $server | Set-AzureRmSqlElasticPool -ElasticPoolName $ep2.ElasticPoolName -VCore 1
		Assert-NotNull $sep4
		Assert-AreEqual 1 $sep4.Capacity
		Assert-AreEqual 0.1 $sep4.DatabaseCapacityMin
    }
    finally
    {
        Remove-ResourceGroupForTest $rg
    }
}

<# 
    .SYNOPSIS
    Tests updating an elastic pool with zone redundancy parameter
#>
function Test-UpdateElasticPoolWithZoneRedundancy
{
    # Setup
	$location = Get-Location "Microsoft.Sql" "operations" "West Europe"
	$rg = Create-ResourceGroupForTest $location
	$server = Create-ServerForTest $rg $location

    try
    {
        # Create a pool with all values
        $poolName = Get-ElasticPoolName
        $ep1 = New-AzureRmSqlElasticPool  -ServerName $server.ServerName -ResourceGroupName $rg.ResourceGroupName `
            -ElasticPoolName $poolName -Edition Premium -Dtu 125
        Assert-NotNull $ep1

		# Update a pool with zone redundant set as true
        $sep1 = Set-AzureRmSqlElasticPool  -ServerName $server.ServerName -ResourceGroupName $rg.ResourceGroupName `
            -ElasticPoolName $ep1.ElasticPoolName -ZoneRedundant
        Assert-NotNull $sep1
        Assert-NotNull $sep1.ZoneRedundant
		Assert-AreEqual "true" $sep1.ZoneRedundant
    }
    finally
    {
        Remove-ResourceGroupForTest $rg
    }
}

<# 
    .SYNOPSIS
    Tests getting an elastic pool
#>
function Test-GetElasticPool
{
    # Setup 
	$location = Get-Location "Microsoft.Sql" "operations" "Southeast Asia"
	$rg = Create-ResourceGroupForTest $location
	$server = Create-ServerForTest $rg $location

    $poolName = Get-ElasticPoolName
    $ep1 = New-AzureRmSqlElasticPool  -ServerName $server.ServerName -ResourceGroupName $rg.ResourceGroupName `
        -ElasticPoolName $poolName -Edition Standard -Dtu 200 -DatabaseDtuMin 10 -DatabaseDtuMax 100
    Assert-NotNull $ep1
    
    $poolName = Get-ElasticPoolName
    $ep2 = $server | New-AzureRmSqlElasticPool -ElasticPoolName $poolName -Edition Standard -Dtu 400 -DatabaseDtuMin 0 `
         -DatabaseDtuMax 100
    Assert-NotNull $ep2

    try
    {
        # Create a pool with all values
        $gep1 = Get-AzureRmSqlElasticPool  -ServerName $server.ServerName -ResourceGroupName $rg.ResourceGroupName `
            -ElasticPoolName $ep1.ElasticPoolName 
        Assert-NotNull $ep1
        Assert-AreEqual 200 $ep1.Capacity
        Assert-AreEqual 204800 $ep1.StorageMB
        Assert-AreEqual Standard $ep1.Edition
        Assert-AreEqual 10 $ep1.DatabaseCapacityMin
        Assert-AreEqual 100 $ep1.DatabaseCapacityMax

        # Create a pool using piping
        $gep2 = $ep2 | Get-AzureRmSqlElasticPool
        Assert-NotNull $ep2
        Assert-AreEqual 400 $ep2.Capacity 
        Assert-AreEqual 409600 $ep2.StorageMB
        Assert-AreEqual Standard $ep2.Edition
        Assert-AreEqual 0 $ep2.DatabaseCapacityMin
        Assert-AreEqual 100 $ep2.DatabaseCapacityMax

        $all = $server | Get-AzureRmSqlElasticPool
        Assert-AreEqual $all.Count 2
    }
    finally
    {
        Remove-ResourceGroupForTest $rg
    }
}

<# 
    .SYNOPSIS
    Tests getting an elastic pool with zone redundancy
#>
function Test-GetElasticPoolWithZoneRedundancy
{
    # Setup 
	$location = Get-Location "Microsoft.Sql" "operations" "West Europe"
	$rg = Create-ResourceGroupForTest $location
	$server = Create-ServerForTest $rg $location

    try
    {
        # Create a pool with zone redundancy set to true
        $poolName = Get-ElasticPoolName
        $ep1 = New-AzureRmSqlElasticPool  -ServerName $server.ServerName -ResourceGroupName $rg.ResourceGroupName `
            -ElasticPoolName $poolName -Edition Premium -ZoneRedundant

		# Get created pool with zone redundancy true
        $gep1 = Get-AzureRmSqlElasticPool  -ServerName $server.ServerName -ResourceGroupName $rg.ResourceGroupName `
            -ElasticPoolName $ep1.ElasticPoolName 
        Assert-NotNull $gep1.ZoneRedundant
		Assert-AreEqual "true" $gep1.ZoneRedundant

		# Create a pool with no zone redundancy set
        $poolName = Get-ElasticPoolName
        $ep2 = New-AzureRmSqlElasticPool  -ServerName $server.ServerName -ResourceGroupName $rg.ResourceGroupName `
            -ElasticPoolName $poolName -Edition Premium -Dtu 125

		# Get created pool with zone redundancy false
        $gep2 = Get-AzureRmSqlElasticPool  -ServerName $server.ServerName -ResourceGroupName $rg.ResourceGroupName `
            -ElasticPoolName $ep2.ElasticPoolName 
        Assert-NotNull $gep2.ZoneRedundant
		Assert-AreEqual "false" $gep2.ZoneRedundant
    }
    finally
    {
        Remove-ResourceGroupForTest $rg
    }
}

<# 
    .SYNOPSIS
    Tests removing an elastic pool
#>
function Test-RemoveElasticPool
{
    # Setup 
	$location = Get-Location "Microsoft.Sql" "operations" "Southeast Asia"
	$rg = Create-ResourceGroupForTest $location
	$server = Create-ServerForTest $rg $location

    $poolName = Get-ElasticPoolName
    $ep1 = New-AzureRmSqlElasticPool  -ServerName $server.ServerName -ResourceGroupName $rg.ResourceGroupName `
        -ElasticPoolName $poolName -Edition Standard -Dtu 200 -DatabaseDtuMin 10 -DatabaseDtuMax 100
    Assert-NotNull $ep1
    
    $poolName = Get-ElasticPoolName
    $ep2 = $server | New-AzureRmSqlElasticPool -ElasticPoolName $poolName -Edition Standard -Dtu 400 -DatabaseDtuMin 0 `
         -DatabaseDtuMax 100
    Assert-NotNull $ep2

    try
    {
        # Create a pool with all values
        Remove-AzureRmSqlElasticPool -ServerName $server.ServerName -ResourceGroupName $rg.ResourceGroupName -ElasticPoolName $ep1.ElasticPoolName –Confirm:$false
        
        # Create a pool using piping
        $ep2 | Remove-AzureRmSqlElasticPool -Force

        $all = $server | Get-AzureRmSqlElasticPool
        Assert-AreEqual $all.Count 0
    }
    finally
    {
        Remove-ResourceGroupForTest $rg
    }
}

<#
	.SYNOPSIS
	Test listing and cancelling a elastic pool operation
#>
function Test-ListAndCancelElasticPoolOperation
{
	# Setup
	$location = Get-Location "Microsoft.Sql" "operations" "Southeast Asia"
	$rg = Create-ResourceGroupForTest $location
	$server = Create-ServerForTest $rg $location

	$poolName = Get-ElasticPoolName
	$ep1 = New-AzureRmSqlElasticPool -ServerName $server.ServerName -ResourceGroupName $rg.ResourceGroupName `
		-ElasticPoolName $poolName -Edition Premium -Dtu 125 -DatabaseDtuMin 0 -DatabaseDtuMax 50
	Assert-NotNull $ep1

	$poolName = Get-ElasticPoolName
	$ep2 = $server | New-AzureRmSqlElasticPool -ElasticPoolName $poolName -Edition Premium -Dtu 250 -DatabaseDtuMin 0 `
         -DatabaseDtuMax 50
	Assert-NotNull $ep2

	# Elastic pool will be Premium with DTU 125

	try
	{
		# Update the elastic pool ep1 to premium with 250 Dtu
		$ep1update = Set-AzureRmSqlElasticPool -ResourceGroupName $ep1.ResourceGroupName -ServerName $ep1.ServerName -ElasticPoolName $ep1.ElasticPoolName `
			-Edition Premium -Dtu 250 -DatabaseDtuMin 25 -DatabaseDtuMax 125
		Assert-AreEqual $ep1.ElasticPoolName $ep1update.ElasticPoolName
		Assert-AreEqual Premium $ep1update.Edition
		Assert-AreEqual 250 $ep1update.Capacity

		# List and Cancel the elastic pool update operation
		$epactivity = Get-AzureRmSqlElasticPoolActivity -ResourceGroupName $rg.ResourceGroupName -ServerName $server.ServerName -ElasticPoolName $ep1update.ElasticPoolName
		$epactivityId

		For($i=0; $i -lt $epactivity.Length; $i++) {
			if($epactivity[$i].Operation -eq "UPDATE"){
				$epactivityId = $epactivity[$i].OperationId
			}
		}

		try
		{
			# cancel a pool update operation with all values
			$activityCancel = Stop-AzureRmSqlElasticPoolActivity -ResourceGroupName $ep1.ResourceGroupName -ServerName $ep1.ServerName -ElasticPoolName $ep1.ElasticPoolName -OperationId $epactivityId
		}
		Catch
		{
			$ErrorMessage = $_.Exception.Message
			Assert-AreEqual True $ErrorMessage.Contains("Cannot cancel management operation '" + $epactivityId + "' in the current state") $ErrorMessage
		}

		# piping test on related pool operations
		# Update ep2 tp Premium with 500 Dtu
		$ep2update = Set-AzureRmSqlElasticPool -ResourceGroupName $ep2.ResourceGroupName -ServerName $ep2.ServerName -ElasticPoolName $ep2.ElasticPoolName `
			-Edition Premium -Dtu 500 -DatabaseDtuMin 25 -DatabaseDtuMax 250
		Assert-AreEqual $ep2.ElasticPoolName $ep2update.ElasticPoolName
		Assert-AreEqual Premium $ep2update.Edition
		Assert-AreEqual 500 $ep2update.Capacity

		$epactivity = $ep2update | Get-AzureRmSqlElasticPoolActivity
		For($i=0; $i -lt $epactivity.Length; $i++) {
			if($epactivity[$i].Operation -eq "UPDATE"){
				$epactivityId = $epactivity[$i].OperationId
			}
		}

		$epactivity = $ep2update | Get-AzureRmSqlElasticPoolActivity -OperationId $epactivityId
		
		try
		{
			# cancel a pool update operation using piping
			$activityCancel = $epactivity | Stop-AzureRmSqlElasticPoolActivity
		}
		Catch
		{
			$ErrorMessage = $_.Exception.Message
			Assert-AreEqual True $ErrorMessage.Contains("Cannot cancel management operation '" + $epactivityId + "' in the current state") $ErrorMessage
		}
	}
	finally
	{
		Remove-ResourceGroupForTest $rg
	}
}