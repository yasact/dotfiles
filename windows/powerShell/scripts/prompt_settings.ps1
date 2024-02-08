function prompt()
{
    $loc = get-location
    # "--[" + $loc.path + "]`n" + "--" + " >"
    Write-Host -NoNewline "┌" -ForegroundColor DarkYellow
    # Write-Host -NoNewline "(" -ForegroundColor DarkYellow
    # Write-Host -NoNewline $env:USERNAME -ForegroundColor DarkCyan
    # Write-Host -NoNewline "@" -ForegroundColor DarkCyan
    # Write-Host -NoNewline $env:COMPUTERNAME -ForegroundColor DarkCyan
    # Write-Host -NoNewline ")─[" -ForegroundColor DarkYellow
    Write-Host -NoNewline "[" -ForegroundColor DarkYellow
    Write-Host -NoNewline $loc.path -ForegroundColor DarkCyan
    Write-Host  "]" -ForegroundColor DarkYellow
    Write-Host -NoNewline "└" -ForegroundColor DarkYellow
    Write-Host -NoNewline ">" -ForegroundColor DarkYellow
    return " "

}
