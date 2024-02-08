# vi風キーバインド
Set-PSReadlineOption -EditMode "Vi"

# shift+spaceでMenuComplete
Set-PSReadLineKeyHandler -Chord shift+spacebar -Function MenuComplete
# tab補完で一覧で表示する(bash風)
Set-PSReadLineKeyHandler -key Tab -Function Complete 