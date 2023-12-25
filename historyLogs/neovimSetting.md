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

### ここからwindowsでの作業

そもそもwindowsではdotfilesをcloneしていなかったのでまずcloneする

debianやmacでは
~/.config/nvim/init.vim
だったがwindowsでは
~/AppData/Local/nvim/init.vim
になっているのでこっちを変更する

windowsでも
~/.vimrcを読み込みたいところなので

```powershell
sudo New-Item -ItemType SymbolicLink -Path .vimrc -Target .\dotfiles\.vimrc
```
してsymbokic linkを作成した
(sudo は普通は使えないけどなんかsudoでadministrator privilegesを与えられるutilityを入れていた気がする)


``` init.vim
source ~/.vimrc
```

と書いたことで無事読み込まれた。

### ここからdebianでの作業

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

### ここからmacで作業

できた

### ここからwindowsで作業

できた

## 231222

とりあえず
Ctrl+BでNERDTreeをToggleできるようにした
```
noremap <C-b> :NERDTreeToggle
```
hikaliumの.vimrcをみながらsettingの勉強をしよう

> set nocompatible
よくわからんが今は.vimrcがあるといらないっぽい

> set backspace=indent,eol,start
バックスペースでの行移動を可能にするらしい
もう入っていた

> set wildignore+=*.pdf,*.o,*.obj,*.jpg,*.png
ファイルやディレクトリの補完時にこのパターンにマッチしたものを無視する

> set splitbelow
新しいウインドウを現在のウインドウの下に開く
> set splitright
新しいウインドウを現在のウインドウの右に開く

これはいれておこう

> set autoread
vimが開いているか、vim上で変更のないファイルで、外部で変更があったときに、自動的に読み込みなおす。
いれておこう->もう入ってた。

> hi clear TabLine
ハイライトグループをリセット

まず、hiは構文ハイライト(syntax highliting)の略


au はautocmdの省略形
特定のイベントが発生したときに自動で実行されるコマンドを指定する。

let g:はVimスクリプト内で変数を定義するときの構文
> let g:myVariable = 5
でglobal 変数(myVariable)が5になる。

```vimscript
if has('win32')
	let s:ostype = "Win"
elseif has('mac')
	let s:ostype = "Mac"
else
	let s:ostype = "Linux"
endif
```
OSを判別してる。
けどhikaliumの.vimrc内ではostypeの値を使用していない。

OK大体できた。

### gt, grでウィンドウを動けるようにしたい

> " Move between windows
>nnoremap <Return><Return> <c-w><c-w>

でできているのでできるはず

> Ctrl-w w : 次の画面に移動(Window) (Ctrl-w Ctrl-w でも可)
> Ctrl-w W : 前の画面に移動(Window)
なので
> nnoremap gt <c-w><c-w>
> nnoremap gr <c-w>W
でいいのでは?
できた。

### :eでファイルを開くときに別のウインドウで開いてほしい。

> nnoremap <leader>e :vnew|:e
でいけた。

### ctrl+tでterminalをtoggleしたい。

windowsで:terminalを実行するとcmd.exeになってしまうので
OSで分岐してpowerShell7のパスを与えることにした。


```vimscript

"OSTypeを設定する
if has('win32') || has('win64')
    let g:osType = "win"
elseif has('macunix')
    let g:osType='mac'
else
    let g:osType="linux"
endif

" terminalをトグルする関数

function! ToggleTerminal()
    if exists('t:terminal_window_id')
        if bufwinnr(t:terminal_window_id) != -1
            exec bufwinnr(t:terminal_window_id) . 'wincmd c'
            unlet t:terminal_window_id
            return
        endif
    endif
    if g:osType=="win" 
        belowright split | terminal "C:\Program Files\PowerShell\7\pwsh.exe"
    elseif g:osType=="mac"
        belowright split | terminal
    elseif g:osType=="linux"
        belowright split | terminal
    endif
    let t:terminal_window_id = bufnr('')
endfunction

" ctrl+tでterminalをtoggleする
nnoremap <C-t> :call ToggleTerminal()<CR>
```

でもこれ、挙動があやしいし、
うまく使えなそうなので結局tmax的なもの使った方がいい気がする。
windowsTerminalに標準で機能があった。
powershellはalt + shift + +でvsplitでpowershellが開く
powershellはalt + shift + -でsplitでpowershellが開く
ctrl + shift + w で閉じる
でもdefaultProfileしか開かないっぽいのとカレントディレクトリがhomeになるっぽい

とりあえずこれは後回しにしよう。

### NERDTreeでファイルを開くときに今のウインドウで開いてしまう。

よく考えたらこれ普通の挙動。
たとえばShift + Enterでvsplitしたwindowで開けばいいのに。
sでvsplitで開くっぽい
previewとopenの違い？
とりあえずpreviewの場合、フォーカスがNERDTreeに残ったままになる。
sで開くとvsplitして開くようだ


### markdownを開くとすべてfoldedされてしまっている問題

> let g:vim_markdown_folding_disabled = 1
これで解決するかな
できた。

### easy-motionがほしい

> Plug 'easymotion/vim-easymotion'

でinstallできた。

とりあえず<leader><leader> w, <leader><leader> bができるのでOK

いくつかVSCode Vimのsettingを流用しておいた。




## 231225

dotfiles以下のdirectory構成を変更した

これで、link.shのリンク先を変更した。
powershellもやらないといけない。

