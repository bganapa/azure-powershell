$TestRecordingFile = Join-Path $PSScriptRoot 'Get-AzAppServiceGlobalSubscriptionPublishingCredentials.Recording.json'
. (Join-Path $PSScriptRoot '..\generated\runtime' 'HttpPipelineMocking.ps1')

Describe 'Get-AzAppServiceGlobalSubscriptionPublishingCredentials' {
    It 'Get' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'GetViaIdentity' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}
