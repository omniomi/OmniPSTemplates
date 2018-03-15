$ScriptName = '<%=$PLASTER_PARAM_ScriptName%>.ps1'
$ScriptDirectory = "$PSScriptRoot\..\src"
$ScriptPath = "$ScriptDirectory\$ScriptName"

Describe 'Top-level Script Tests' {
    It 'Passes Test-ScriptFileInfo' {
        Test-ScriptFileInfo -Path $ScriptPath
        $? | Should Be $true
    }
    It 'Is a single file' {
        $Files = Get-ChildItem $ScriptDirectory -Recurse
        $Files.Count | Should be 1
    }
}