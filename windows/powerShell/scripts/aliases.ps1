# Alias
Set-Alias fig docker-compose
# Set-Alias vi 'C:\Program Files\Vim\vim90\vim.exe'
set-Alias vi "C:\Program Files\Noevim\bin\nvim.exe"
# Set-Alias vim 'C:\Program Files\Vim\vim90\vim.exe'
set-Alias vim "C:\Program Files\Neovim\bin\nvim.exe"
Set-Alias touch New-Item
# Set-Alias ll Get-ChildItem
# Set-Alias code code-insiders.cmd
Set-Alias z zoxide.exe

# lsdがインストールされてたらllでlsdをつかう
if (Get-Command lsd -ErrorAction SilentlyContinue)
{
     function ll { lsd.exe -alF }
}


# https://blog.mamansoft.net/2020/05/31/windows-terminal-and-power-shell-makes-beautiful/
# ここの情報をもとに、rust製のクロスプラットフォームcoreutilsを使うようにする。

# パイプラインを受けつけないLinux標準コマンド
Remove-Item alias:cp
function cp() { uutils cp $args }
Remove-Item alias:mv
function mv() { uutils mv $args }
Remove-Item alias:rm
function rm() { uutils rm $args }
Remove-Item alias:ls
function mkdir() { uutils mkdir $args }
function printenv() { uutils printenv $args }

# パイプラインを受けつけるLinux標準コマンド
Remove-Item alias:cat
function cat() { $input | uutils cat $args }
function head() { $input | uutils head $args }
function tail() { $input | uutils tail $args }
function wc() { $input | uutils wc $args }
function tr() { $input | uutils tr $args }
function pwd() { $input | uutils pwd $args }
function cut() { $input | uutils cut $args }
function uniq() { $input | uutils uniq $args }
# ⚠ readonlyのaliasなので問題が発生するかも..
Remove-Item alias:sort -Force
function sort() { $input | uutils sort $args }
