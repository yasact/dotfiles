
$pathToScriptDir = "$HOME\dotfiles\windows\powershell\scripts"


$script = @( "$pathToScriptDir\keybindings.ps1", 
  "$pathToScriptDir\aliases.ps1",
  "$pathToScriptDir\prompt_settings.ps1",
  "$pathToScriptDir\functions.ps1", 
  "$pathToScriptDir\completionSettings.ps1")

foreach ($s in $script)
{
  if (Test-Path $s)
  {
    . $s
  }
}