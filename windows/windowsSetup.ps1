# install scoop
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
# Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# bucket
scoop bucket add versions
scoop bucket add extras
scoop bucket add main

scoop install main/git
scoop install main/nodejs
scoop install neovim
scoop install versions/vscode-insiders