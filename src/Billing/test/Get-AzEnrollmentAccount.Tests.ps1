$TestRecordingFile = Join-Path 'C:\B\azure-powershell\src\Billing\test' 'Get-AzEnrollmentAccount.Recording.json'
. (Join-Path $PSScriptRoot '..\generated\runtime' 'HttpPipelineMocking.ps1')

Describe 'Get-AzEnrollmentAccount' {
    It 'ListExpandedFilter' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}
