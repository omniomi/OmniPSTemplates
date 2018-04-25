#
# Module manifest for module 'OmniPSTemplates'
#
# Generated by: omniomi
#
# Generated on: 2018-04-22
#

@{

# Script module or binary module file associated with this manifest.
# RootModule = ''

# Version number of this module.
ModuleVersion = '1.1.0'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = 'cdd94e5f-7f01-40ce-8de2-94305d477d85'

# Author of this module
Author = 'omniomi'

# Company or vendor of this module
CompanyName = 'Community'

# Copyright statement for this module
Copyright = '(c) 2017 omniomi. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Plaster templates for publishable modules and scripts.'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '4.0'

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
DotNetFrameworkVersion = '4.0'

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
CLRVersion = '4.0'

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @()

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
# VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
FileList =  'OmniPSTemplates.psd1',
            'Templates\NewModule\build.ps1',
            'Templates\NewModule\build.psake.ps1',
            'Templates\NewModule\build.settings.ps1',
            'Templates\NewModule\plasterManifest.xml',
            'Templates\NewModule\ReleaseNotes.md',
            'Templates\NewModule\ScriptAnalyzerSettings.psd1',
            'Templates\NewModule\_gitignore',
            'Templates\NewModule\docs\en-US\about_Module.help.md',
            'Templates\NewModule\docs\en-US\about_Module.help.txt',
            'Templates\NewModule\editor\VSCode\settings.json',
            'Templates\NewModule\editor\VSCode\tasks_pester.json',
            'Templates\NewModule\editor\VSCode\tasks_psake.json',
            'Templates\NewModule\editor\VSCode\tasks_psake_pester.json',
            'Templates\NewModule\license\Apache.txt',
            'Templates\NewModule\license\MIT.txt',
            'Templates\NewModule\src\Module.psm1',
            'Templates\NewModule\src\Classes\Module.Errors.ps1',
            'Templates\NewModule\src\en-US\Module.Localization.psd1',
            'Templates\NewModule\test\Module.T.ps1',
            'Templates\NewModule\test\Shared.ps1',
            'Templates\NewScript\.gitignore', 'Templates\NewScript\build.ps1',
            'Templates\NewScript\build.psake.ps1',
            'Templates\NewScript\build.settings.ps1',
            'Templates\NewScript\plasterManifest.xml',
            'Templates\NewScript\ReleaseNotes.md',
            'Templates\NewScript\ScriptAnalyzerSettings.psd1',
            'Templates\NewScript\_gitignore',
            'Templates\NewScript\editor\VSCode\settings.json',
            'Templates\NewScript\editor\VSCode\tasks_pester.json',
            'Templates\NewScript\editor\VSCode\tasks_psake.json',
            'Templates\NewScript\editor\VSCode\tasks_psake_pester.json',
            'Templates\NewScript\license\Apache.txt',
            'Templates\NewScript\license\MIT.txt',
            'Templates\NewScript\src\Script.ps1',
            'Templates\NewScript\test\Script.T.ps1'

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    #Extensions of this module
    Extensions = 'System.Collections.Hashtable'

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = 'Plaster','Template','Boilerplate','Scaffold','Build'

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/omniomi/OmniPSTemplates/blob/master/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/omniomi/OmniPSTemplates'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        # ReleaseNotes = ''

        # External dependent modules of this module
        # ExternalModuleDependencies = ''

        Extensions = @(
            @{
                Module = "Plaster"
                MinimumVersion = "1.1.0"
                Details = @{
                    TemplatePaths = @("Templates\NewModule","Templates\NewScript")
                }
            }
        )

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
HelpInfoURI = 'https://github.com/omniomi/OmniPSTemplates/tree/master/docs'

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

