# NewModule

This is a modified version of the '[NewModule](https://github.com/PowerShell/Plaster/tree/master/examples/NewModule)' example template from the official [Plaster](https://github.com/PowerShell/Plaster) repository.

## Structural Changes

This version of the NewModule Plaster template uses a different module structure from the original.

### This Version
```
ModuleName\
|- src\
    |- Classes\
    |- Private\
    |- Public\
    |- ModuleName.psd1
    |- ModuleName.psm1
```

This version is setup with folders for classes, private functions, and public functions. All ps1 files within the nested folders are automatically loaded by the .psm1 file.

If you opt to use psake during the setup instead of using `Export-ModuleMember` this template includes a build step to populate the module manifest with all of the public functions. Functions are exported in the manifest even if there is more than one top-level function to a file and regardless of name. If you do not opt to use psake you will need to update the manifest file's `FunctionsToExport` manually. (See below for more details)

### Original
```
ModuleName\
|- src\
    |- ModuleName.psd1
    |- ModuleName.psm1
```

The original template is setup for a flat src/ folder structure. The psm1 file has no logic except to export all members with the name format `*-*`.

## Added Features / Changes

### (psake) Build Step: ExportPublicFunctions

This template includes a psake build step called `ExportPublicFunctions` which can either be accessed from the VS Code 'Run Task' menu or by calling `.\build.ps1 ExportPublicFunctions`. The task is also executed during a normal build.

The task looks at all .ps1 files in src\ and uses [System.Management.Automation.Language.Parser] to find all the function names that should be exported. The functions are added explicitly to the FunctionsToExport property of the module manifest in the src\ directory before staging.

### (optional) "Create [Error] class?"

If _[Y]es_ this step in the plaster manifest will create a file in src\Classes\ called 'ModuleName.Errors.ps1' which contains the class  `[Error]`. The class will include one example method called 'PathNotFound' which accepts a path parameter.

This class is designed to make errors easier to repeat (Don't Repeat Yourself principle). Using the PathNotFound example you can throw the error simply by calling the class and method:

```
$PSCmdlet.WriteError([Error]::PathNotFound($Path))

# or

throw [Error]::PathNotFound($Path)
```

If you opt in to localization (details below) the example PathNotFound method will include an exception parameter to which you would pass `$LocalizedData.ErrorPathNotFound` before the path.

### (optional) "Include localization (multilingual support)?"

If _[Y]es_ this step in the plaster manifest will create a directory called 'en-US' below src\ containing a file called 'ModuleName.Localization.psd1'. In additon plaster will:

* Add a section to the .psm1 file to load localization.
* Change the example [Error] method to accept an exception parameter (if selected).
* Add a handful of example strings.

__NOTE:__ The example localization scripts will include `ErrorPathNotFound` which can be deleted if you're not using the [Error] class.

### Minor differences from the original

The following minor differences also exist in this version of the template:

* The VS Code tasks include ExportPublicFunctions
* The settings.json file contains `"powershell.scriptAnalysis.settingsPath": "ScriptAnalyzerSettings.psd1"` instead of `"powershell.scriptAnalysis.settingsPath": "src\ScriptAnalyzerSettings.psd1"`
* ScriptAnalyzerSettings.psd1 is set to ignore the 'Select' and 'Where' aliases and has a commented out rule for enforcing brace placement.
* build.ps1 is parameterized and can be used to run different built steps.