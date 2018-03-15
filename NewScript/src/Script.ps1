<#PSScriptInfo
    .VERSION <%=$PLASTER_PARAM_Version%>
    .GUID <%=$PLASTER_Guid1%>
    .AUTHOR <%=$PLASTER_PARAM_FullName%>
    .COMPANYNAME
    .COPYRIGHT
    .TAGS
    .LICENSEURI
    .PROJECTURI
    .ICONURI
    .EXTERNALMODULEDEPENDENCIES
    .REQUIREDSCRIPTS
    .EXTERNALSCRIPTDEPENDENCIES
    .RELEASENOTES
    .DESCRIPTION
    <%=$PLASTER_PARAM_ScriptDesc%>
#>

[cmdletbinding()]
param()

# --------------------------- User Defined Variables --------------------------
#                         Edit these variables as needed

#
# <- VARIABLES HERE ->
#

###############################################################################
#                       DO NOT MODIFY BEYOND THIS POINT!                      #
###############################################################################

# Track running time.
$StopWatch = [ordered]@{
    Total = [System.Diagnostics.Stopwatch]::StartNew()
}

# ------------------------------ Static Variables -----------------------------

#
# <- VARIABLES HERE ->
#

# ------------------------------ Helper Functions -----------------------------

# Track step time.
$StopWatch.LoadFunctions = [System.Diagnostics.Stopwatch]::StartNew()

#
# <- FUNCTIONS HERE ->
#

# Stop step timer.
$StopWatch.LoadFunctions.Stop()

# ------------------------------- Script Logic --------------------------------

# Track step time.
$StopWatch.ScriptLogic = [System.Diagnostics.Stopwatch]::StartNew()

#
# <- LOGIC HERE ->
#

# Stop step timer.
$StopWatch.ScriptLogic.Stop()

# Compute and display elapsed run time (Verbose stream.)
$StopWatch.Total.Stop()
$StepTimes = @(
    $StopWatch.Keys | Where-Object { $_ -ne 'Total' } | ForEach-Object { [pscustomobject]@{ Step = $_ ; ElapsedTime = $StopWatch.Item($_).Elapsed.ToString()} }
)
$StepTimes | Out-String -Stream | Where-Object { $_ -ne "" } | Write-Verbose
Write-Verbose ""
Write-Verbose "TOTAL $($Stopwatch.Total.Elapsed.ToString())"