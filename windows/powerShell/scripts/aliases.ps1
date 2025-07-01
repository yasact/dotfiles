# Alias
Set-Alias fig docker-compose
# Set-Alias vi 'C:\Program Files\Vim\vim90\vim.exe'
set-Alias vi "C:\Program Files\Noevim\bin\nvim.exe"
# Set-Alias vim 'C:\Program Files\Vim\vim90\vim.exe'
set-Alias vim "C:\Program Files\Neovim\bin\nvim.exe"
Set-Alias touch New-Item
Set-Alias ll Get-ChildItem
Set-Alias ls Get-ChildItem
Set-Alias grep Select-String
Set-Alias cat Get-Content
Set-Alias mkdir New-Item
Set-Alias which Get-Command




# aliases.ps1がloadされたことを表示する
Write-Host "aliases.ps1 loaded"