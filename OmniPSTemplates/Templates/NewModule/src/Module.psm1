<%
    if ($PLASTER_PARAM_Localization -eq 'Yes') {
        @"
# -------------------------- Load Localization ----------------------------
#
Data LocalizedData {
    # culture="en-US"
    ConvertFrom-StringData @'
    ErrorPathNotFound=Cannot find path '{0}' because it does not exist.
    ErrorLoadingScript=There was an error loading '{0}'.
    VerboseLoadingScript=Loading script file '{0}'.
'@
}
Microsoft.PowerShell.Utility\Import-LocalizedData LocalizedData -FileName ${PLASTER_PARAM_ModuleName}.Localization.psd1 -ErrorAction SilentlyContinue

"@
    }
%>
# -------------------------- Load Script Files ----------------------------
#
# All functions in .\Public are added to the manifest during build.
#
$ModuleScriptFiles = @(Get-ChildItem -Path $PSScriptRoot -Filter *.ps1 -Recurse  | Where-Object { $_.Name -notlike "*.ps1xml" } )

foreach ($ScriptFile in $ModuleScriptFiles) {
    try {
<%
    if ($PLASTER_PARAM_Localization -eq 'Yes') {
        '       Write-Verbose "$($LocalizedData.VerboseLoadingScript -f $ScriptFile.Name)"'
    }
    else {
        '       Write-Verbose "Loading script file $($ScriptFile.Name)"'
    }
%>
        . $ScriptFile.FullName
    }
    catch {
<%
    if ($PLASTER_PARAM_Localization -eq 'Yes') {
        '       Write-Error "$($LocalizedData.ErrorLoadingScript -f $ScriptFile.FullName)"'
    }
    else {
        '       Write-Error "Error loading script file $($ScriptFile.FullName)"'
    }
%>
    }
}