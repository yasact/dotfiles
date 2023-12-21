# neovim設定メモ

## 231221

neovimをセットアップする
昔にluaで設定を書いたがよくわからん(packerがうまく使えない)し、
hikaliumは.vimrcを使ってるので.vimrcにすることにする。

まずは、nvimでmarkdownでnote takingできるようにする。
not for coding.

lua で構築したが一旦全消ししたい。

まずdebianで構築してからwindowsに持ってくる方が楽っぽい
debianとmacは構成同じっぽいから、
debian -> mac -> windowsの順でやる。

すでに自分の育てた.vimrcがあるので、これをnvimで読ませるようにすれば良いのでは？
ということは、init.vimにsource .vimrcして、現在他のluaを読み込ませているのをコメントアウトすればOKなのでは？

init.luaとinit.vimが同じディレクトリ(~/.config/nvim)にあるとどっちが読み込まれるの？

> Neovimでは、init.luaとinit.vimが同じディレクトリにある場合、init.luaが読み込まれます。init.luaはNeovimの設定ファイルをLuaで記述するためのファイルであり、init.vimと同じディレクトリに配置することで、Neovimはinit.luaを優先して読み込みます[1][2][3].
> Citations:
> [1] https://qiita.com/KowerKoint/items/387074cf7022e2e0c8fe
> [2] https://qiita.com/reisuta/items/3d0cab193137bb32099d
> [3] https://zenn.dev/hisasann/articles/neovim-settings-to-lua
> [4] https://zenn.dev/r4iw3r/articles/2e0e6d5f1f63c2
> [5] https://zenn.dev/slin/articles/2020-11-03-neovim-lua2

ということで、init.luaをrenameすればOKか

init.luaを_init.luaにrenameしたらとりあえずluaの設定は読み込まれなくなった。

次は、init.vimを作る。
~/.config/nvim/init.vimを作って
やってみる。

vimと同じように~/.vimrcを読み込ませるか？
この~/.vimrc は syumlinkで~/.dotfiles/.vimrcにしてあるので、
そっちを直接読んでもいいけど...
とりあえず
int.vim -> ~/.vimrc -> ~/.dotfiles/.vimrc
という流れにしておく。

OKとりあえず読み込まれた。

今の問題は
color schemeのhybridが読み込まれないと言われる。
https://github.com/w0ng/vim-hybrid

これを使っていたけどrequirementsにneovimは入っていないのでダメっぽい
のでコメントアウトしておいた

```vim
" set background=dark
" colorscheme hybrid
```
こんな風に

これでとりあえず.vimrcは読み込まれるようになった。
OK
これをmacに持っていきたい
のでまずはgit pushしておく。
