function Get-ScriptDirectory {
  $Invoc = (Get-Variable MyInvocation -Scope 1).Value
  Split-Path $Invoc.MyCommand.Path 
}

# Hang on to current location
pushd . 

# Move to the Package working directory
$pkgroot = (Get-ScriptDirectory) + "\package"
cd $pkgroot

# Clear out the lib which are the references that will be added.
ls -Filter lib | del -recurse

mkdir lib\SL40

# Move the built binaries (release) into their respective convention folders
copy ..\..\Caliburn.Micro.Telerik\Bin\Release\Caliburn.Micro.Telerik*.* .\lib\SL40\


..\nuget.exe pack Caliburn.Micro.Telerik.nuspec

popd