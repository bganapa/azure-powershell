# ----------------------------------------------------------------------------------
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
    Run AzureStack Acquisition admin acquisition location test

.DESCRIPTION
    Run AzureStack Acquisition admin acquisition location tests using either mock client or our client.
	The mock client allows for recording and playback.  This allows for offline tests.

.PARAMETER RunRaw
    Run using our client creation path.

.EXAMPLE
    C:\PS> .\src\Acquisitions.Tests.ps1
    Describing Acquisitions
	 [+] TestListAcquisition 1.81s

.NOTES
    Author: Deepa Thomas
	Copyright: Microsoft
    Date:   February 24, 2018
#>
param(
	[bool]$RunRaw = $false
)

$global:RunRaw = $RunRaw

. $PSScriptRoot\CommonModules.ps1

$global:TestName = ""

InModuleScope Azs.Storage.Admin {

	Describe "Acquisition" -Tags @('Acquisition', 'Azs.Storage.Admin') {
	
		BeforeEach  {

			. $PSScriptRoot\Common.ps1

			function ValidateAcquisition {
				param(
					[Parameter(Mandatory=$true)]
					$Acquisition
				)
				# Resource
				$Acquisition             | Should Not Be $null

				# Validate acquisition properties
				$Acquisition.Id					| Should Not Be $null
				$Acquisition.Name				| Should Not Be $null
				$Acquisition.Type				| Should Not Be $null
				$Acquisition.FilePath			| Should Not Be $null
				$Acquisition.Maximumblobsize    | Should Not Be $null
				$Acquisition.Status				| Should Not Be $null
				$Acquisition.Storageaccount     | Should Not Be $null
				$Acquisition.Container			| Should Not Be $null
				$Acquisition.Blob				| Should Not Be $null
			}
		}

		It "TestListAcquisition" {
			$global:TestName = 'TestListAcquisitions'
			
			$farms =  Get-AzsStorageFarm -ResourceGroupName $global:ResourceGroup
			foreach($farm in $farms) {
				$acquisitions = Get-AzsStorageAcquisition -ResourceGroupName $global:ResourceGroup -FarmId (Select-Name $farm.Name)
				$acquisitions  | Should Not Be $null
				foreach($acquisition in $acquisitions) {
					ValidateAcquisition -Acquisition $acquisition
				}
			}
		}
	}
}