Describe 'Module Manifest Tests' {
    It 'Passes Test-ModuleManifest' {
        Test-ModuleManifest -Path "$PSScriptRoot\..\OmniPSTemplates\OmniPSTemplates.psd1"
        $? | Should Be $true
    }
}