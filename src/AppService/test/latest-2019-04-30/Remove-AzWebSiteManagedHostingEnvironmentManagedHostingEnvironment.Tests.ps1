$TestRecordingFile = Join-Path $PSScriptRoot 'Remove-AzWebSiteManagedHostingEnvironmentManagedHostingEnvironment.Recording.json'
. (Join-Path $PSScriptRoot '..\generated\runtime' 'HttpPipelineMocking.ps1')

Describe 'Remove-AzWebSiteManagedHostingEnvironmentManagedHostingEnvironment' {
    It 'Delete' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'DeleteViaIdentity' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}
