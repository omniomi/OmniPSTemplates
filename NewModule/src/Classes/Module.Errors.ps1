using namespace System.Management.Automation

<%
    if ($PLASTER_PARAM_Localization -eq 'yes') {
    @'
<#
    [Error]::PathNotFound($Path) is provided as an example below. To use these errors:

        throw [Terminating]

            throw [Error]::PathNotFound($LocalizedData.ErrorPathNotFound,$MyPath)

        $PSCmdlet.ThrowTerminatingError [Terminating]

            $PSCmdlet.ThrowTerminatingError([Error]::PathNotFound($LocalizedData.ErrorPathNotFound,$MyPath))

        $PSCmdlet.WriteError

            $PSCmdlet.WriteError([Error]::PathNotFound($LocalizedData.ErrorPathNotFound,$MyPath))

    Valid error categories:

        PS> [enum]::GetValues([System.Management.Automation.ErrorCategory])
#>

class Error {
static [ErrorRecord] PathNotFound([String]$Exception,[string]$Path) {
    $Exp = [System.ArgumentException]::new($Exception -f $Path)
    $ErrorCategory = [ErrorCategory]::ObjectNotFound
    return [ErrorRecord]::new($Exp, 'PathNotFound', $ErrorCategory, $Path)
}
}
'@
    }
    else {
    @'
<#
    [Error]::PathNotFound($Path) is provided as an example below. To use these errors:

        throw [Terminating]

            throw [Error]::PathNotFound($MyPath)

        $PSCmdlet.ThrowTerminatingError [Terminating]

            $PSCmdlet.ThrowTerminatingError([Error]::PathNotFound($MyPath))

        $PSCmdlet.WriteError

            $PSCmdlet.WriteError([Error]::PathNotFound($MyPath))

    Valid error categories:

        PS> [enum]::GetValues([System.Management.Automation.ErrorCategory])
#>

class Error {
    static [ErrorRecord] PathNotFound([string]$Path) {
        $Exception = [System.ArgumentException]::new("Cannot find path '$Path' because it does not exist.")
        $ErrorCategory = [ErrorCategory]::ObjectNotFound
        return [ErrorRecord]::new($Exception, 'PathNotFound', $ErrorCategory, $Path)
    }
}
'@
    }
%>
