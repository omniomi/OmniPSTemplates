# NewModule

This is a modified version of the '[NewModule](https://github.com/PowerShell/Plaster/tree/master/examples/NewModule)' example template from the official [Plaster](https://github.com/PowerShell/Plaster) repository.

## Structural Changes

This version of the NewModule Plaster template uses a different project structure and module structure from the original.

### Project layout

```
ModuleName\
    |- .vscode\
    |- docs\
        |- en-US\
    |- src\
    |- tests\
    |- tools\
```

Unlike the original this template moves the build scripts, script analyzer settings, etc to a tools folder to keep the base project folder clean. The build.psake.ps1 and build.settings.ps1 files (when opting in to psake) have also been prepended with an underscore to make tab-completion of build.ps1 easier.

### Module layout
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

## Added Features / Changes

### (psake) Build Steps: ExportPublicFunctions and ExportFunctionsToSrc

This template includes psake build steps called `ExportPublicFunctions` and `ExportFunctionsToSrc`. `ExportPublicFunctions` is run during the build process and exports public functions to the module manifest in the release folder. `ExportFunctionsToSrc` is an on-demand task that exports public functions to the module manifest in the src folder.

These tasks look at all .ps1 files in .\Public\ and use `[System.Management.Automation.Language.Parser]` to find all the function names that should be exported. The functions are added explicitly to the FunctionsToExport property of the module manifest.

### (psake & pester) Build Steps: BuildTests

This is an on-demand task that can be run using `.\tools\build.ps1 BuildTests` or the VS Code 'run task' command.

The BuildTests task finds all functions in src\Public\ using `[System.Management.Automation.Language.Parser]` and if there is not a matching test file for a particular function in tests\ it creates one.

### (psake) Concatenation

`_build.settings.ps1` contains two new options `$ConcatenateBuild` and `$ConcatenationLevel` that affect the `CoreStageFiles` task.

When `$ConcatenateBuild` is set to `$true` the build process will perform file concatenation during staging as oposed to a direct 1-to-1 copy from src\ to Release\\. The `$ConcatenationLevel` option determines the level of concatenation with `1` concatenating public and private functions separately and not touching any other files and `2` concatenating all ps1 files in to the psm1 file.

### (optional) "Include Appveyor files?"

If _[Y]es_ will include an Appveyor.yml file at the project root and an Appveyor.ps1 file in tools\\.

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

If _[Y]es_ this step in the plaster manifest will create a directory called 'en-US' below src\ containing a file called 'ModuleName.Localization.psd1'. In addition plaster will:

* Add a section to the .psm1 file to load localization.
* Change the example [Error] method to accept an exception parameter (if selected).
* Add a handful of example strings.

__NOTE:__ The example localization scripts will include `ErrorPathNotFound` which can be deleted if you're not using the [Error] class.

### Minor differences from the original

The following minor differences also exist in this version of the template:

* The VS Code tasks include the export and build test tasks.
* The settings.json file disables the welcome screen and points to the correct script analyzer path.
* ScriptAnalyzerSettings.psd1 is set to ignore the 'Select' and 'Where' aliases and has a commented out rule for enforcing brace placement.
* build.ps1 is parameterized and can be used to run different build steps.