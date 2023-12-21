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

init.luaを'_init.lua'
にrenameしたらとりあえずluaの設定は読み込まれなくなった。

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

## ここから、macでの作業

git pullした

まず現状を確認したい。
luaが設定されているのか？

```
┌──(yas@YSN-MBA)-[~/.config]
└─$cd nvim/
total 24
drwxr-xr-x  7 yas  staff   224B Nov 20 11:17 ./
drwx------  9 yas  staff   288B Oct 29 11:06 ../
-rw-r--r--@ 1 yas  staff   6.0K Nov 20 11:14 .DS_Store
-rw-r--r--  1 yas  staff    11B Oct 29 11:12 _init.vim
lrwxr-xr-x  1 yas  staff    33B Nov 20 11:16 init.lua@ -> /Users/yas/dotfiles/nvim/init.lua
lrwxr-xr-x  1 yas  staff    28B Nov 20 11:16 lua@ -> /Users/yas/dotfiles/nvim/lua
lrwxr-xr-x  1 yas  staff    32B Nov 20 11:17 plugin@ -> /Users/yas/dotfiles/nvim/plugin/
```
となっていたので

```
┌──(yas@YSN-MBA)-[~/.config/nvim]
└─$mv init.lua _init.lua
┌──(yas@YSN-MBA)-[~/.config/nvim]
└─$mv _init.vim init.vim
```

とした

``` init.vim
source ~/.vimrc
```
と書いたので、.vimrcが読み込まれるようになった。


最後にwindowsに設定する

## ここからwindowsでの作業

そもそもwindowsではdotfilesをcloneしていなかったのでまずcloneする

debianやmacでは
~/.config/nvim/init.vim
だったがwindowsでは
~/AppData/Local/nvim/init.vim
になっているのでこっちを変更する

windowsでも
~/.vimrcを読み込みたいところなので

```
sudo New-Item -ItemType SymbolicLink -Path .vimrc -Target .\dotfiles\.vimrc
```
してsymbokic linkを作成した
(sudo は普通は使えないけどなんかsudoでadministrator privilegesを与えられるutilityを入れていた気がする)


``` init.vim
source ~/.vimrc
```

と書いたことで無事読み込まれた。

## ここからdebianでの作業

neovimをmarkdownでnote takingできるようにする。

と思ったが、とりあえずnotetakingはもうできるよね？
previewはしたいが。
やっぱりpluginを入れないといろいろできないっぽいので仕方ないplugin managerを検討しよう。
調べたところ、packerかVim-Plugが初心者向けっぽい

packerは一回面倒くさくなったので、Vim-Plugにする

> https://dev.to/iamb4uc/neovim-customization-5fge

を参考にして、やっていく。

本来ならinit.vimに


```
call plug#begin([PLUGIN_DIR])

call plug#end()
```
と書いてこの間にインストールしたいpluginを書くっぽい。

なお、
> " The default plugin directory will be as follows:
> "   - Vim (Linux/macOS): '~/.vim/plugged'
> "   - Vim (Windows): '~/vimfiles/plugged'

が、init.vimは
source ~/.vimrc
しか書いていないし、gitの範囲外になってしまうので、面倒くさい。
では、~/dotfile/vimPlugins/.vimPlugins
というファイルを作って、
init.vimに
source ~/dotfile/vimPlugins/.vimPlugins
と書けばよいのでは？

https://github.com/junegunn/vim-plug
公式のドキュメント見た方がよさそうだった。
novimとvimでcurlのコマンドが違う。

```
call plug#begin([PLUGIN_DIR])
  Plug 'preservim/nerdtree'
call plug#end()

```
plug 'scrooloose/nerdtree'
はdeprecatedみたいなので
Plug 'preservim/nerdtree'
にすること。
call plug#end()
と書いて、
> Reload .vimrc and :PlugInstall to install plugins.
でOKっぽい。

とりあえずNERDTreeは入れられたので、macでも同様にやってみる

