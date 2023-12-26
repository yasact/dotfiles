$pathToScriptDir = "$HOME\Documents\Powershell\Scripts"

# $script = @( "$HOME\Documents\PSScripts\scripts\keybindings.ps1", "$HOME\Documents\PSScripts\scripts\aliases.ps1", "$HOME\Documents\PSScripts\scripts\prompt_settings.ps1", "$HOME\Documents\PSScripts\scripts\functions.ps1")
$script = @( "$pathToScriptDir\keybindings.ps1", "$pathToScriptDir\aliases.ps1", "$pathToScriptDir\prompt_settings.ps1", "$pathToScriptDir\functions.ps1")


foreach ($s in $script)
{
  if (Test-Path $s)
  {
    . $s
  }
}
