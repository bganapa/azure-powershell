$TestRecordingFile = Join-Path $PSScriptRoot 'Get-AzStorageAccountKey.Recording.json'
. (Join-Path $PSScriptRoot '..\generated\runtime' 'HttpPipelineMocking.ps1')

Describe 'Get-AzStorageAccountKey' {
    It 'List1' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}
