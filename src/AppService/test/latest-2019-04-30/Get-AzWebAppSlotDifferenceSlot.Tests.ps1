$TestRecordingFile = Join-Path $PSScriptRoot 'Get-AzWebAppSlotDifferenceSlot.Recording.json'
. (Join-Path $PSScriptRoot '..\generated\runtime' 'HttpPipelineMocking.ps1')

Describe 'Get-AzWebAppSlotDifferenceSlot' {
    It 'ListExpanded' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'List' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}
