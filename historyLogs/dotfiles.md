# dotfiles Setting

## 231225

### bashrc setting

.bashrcを整理したい。
起動に時間かかってるし。


| 設定ファイル   | 利用法                                                                                           | 例                                             |
| -------------- | ------------------------------------------------------------------------------------------------ | ---------------------------------------------- |
| ~/.profile     | ・ログイン時にそのセッション全体に適用するものを記述する・シェルの種類に依存しないものを記述する | ・環境変数など                                 |
| ~/.bashrc      | bashでしか使わないものを記述する                                                                 | ・エイリアス・シェルオプション・プロンプト設定 |
| ~/.bash_profil | ~/.profileと同じに使えるが、bashのみで有効                                                       |                                                |

## 231226

powershellのPSScriptsをdotfilesに一緒にしたい。

できた。

## 240122

zshにgit-propmtを追加したい
git-promptを追加した。

propmtの設定ファイルを分割した(.zshPropmt)

zshにgit-completionを追加した。
bashは最近使わないので変更していない。

## ディレクトリ変更

そろそろhomeディレクトリにリンクが多くなってきたので動かしたい。
あと、dotfilesが~/dotfilesとは限らないので、
dotfiles以下へのリンクを辞めたい。

zshの設定ファイルを.config/zshにコピーして、ここへのリンクを張ることにする。
同様にbashの設定ファイルも.config/bashにコピーして、ここへのリンクを張ることにする。

## 230125

yabaiとskhdのconfigファイルをdotfile管理したい。
link.macos.shに
まずmacos以下にyabai/yabaircとskhd/skhdrcをつくるようにする。
link.shから$ostype=macosのときにlink.macos.shを呼ぶようにする



あとで、link.shの方もXDG_CONFIG_DIR以下に持っていきたい


