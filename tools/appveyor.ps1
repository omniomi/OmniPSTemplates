[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [ValidateSet('Build','Test','Finish')]
    [string]
    $Task
)

if (-Not($env:APPVEYOR_BUILD_FOLDER)) { throw "This script is intended to be run by Appveyor CI/CD." }

switch ($Task) {
    'Test'   {
        $TestResultsFile = Join-Path $env:APPVEYOR_BUILD_FOLDER "\TestResults.xml"
        $TestDirectory   = Join-Path $env:APPVEYOR_BUILD_FOLDER '\tests\'
        $Result = Invoke-Pester $TestDirectory -OutputFormat NUnitXml -OutputFile $TestResultsFile -PassThru
        (New-Object 'System.Net.WebClient').UploadFile("https://ci.appveyor.com/api/testresults/nunit/$($env:APPVEYOR_JOB_ID)", (Resolve-Path $TestResultsFile))
        if ($Result.FailedCount -gt 0) {
            throw "$($res.FailedCount) tests failed."
        }
    }

    'Build'  {
        .\build.ps1 Build
    }

    'Finish' {
        $ReleaseDirectory = Join-Path $env:APPVEYOR_BUILD_FOLDER '\Release\OmniPSTemplates'
        $zipFile = Join-Path $env:APPVEYOR_BUILD_FOLDER "OmniPSTemplates.zip"
        Add-Type -assemblyname System.IO.Compression.FileSystem
        [System.IO.Compression.ZipFile]::CreateFromDirectory($releaseDirectory, $zipFile)
        Push-AppveyorArtifact $zipFile
    }
}