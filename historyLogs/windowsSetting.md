# windows用のsetting note


## 230126

komorebiというtile window managerがあるらしい。
また、いいかげん、hhkbのかな/英数が不便に感じてきたので、
スペースの横をaltにして、altの単押しでIME切り替えができるようにしたい。
これをやるにはauto hot keyが必要。

komorebiはauto hot keyにも対応しているらしいので、
先にauto hot keyを導入して学習しよう。

### auto hot key

#### pause and suspend

pause-> script:無効/ホットキー:有効
suspend-> script:有効/ホットキー:無効

つまり、
pause->scriptを操作
suspend->hot keyを操作

#### コメント

```ahk
; この行全体がコメント
```

行末のコメントは;の左に少なくとも1つのスペース(もしくはタブ)が必要

```ahk
Run "Notepad" ;これは関数呼び出しと同じ行にあるコメント
```

これもコメントになる。

```ahk
/*
MsgBox "This line is commented out (disabled)."
MsgBox "Common mistake:" */ " this does not end the comment."
MsgBox "This line is commented out."
*/
```


#### ホットキー


| symbol | desc                       |
| ------ | -------------------------- |
| #      | win key                    |
| !      | alt                        |
| ^      | ctrl                       |
| +      | shift                      |
| Up     | キーを離したときに起動する |

やってみたが、むずかしい。
v2になっていて、これの解説やサンプルコードがなさすぎる。
またv1からv2への移植がちょっと時間かかりすぎるので理解が進まない。

そもそも、HHKB Studioのスペースの横をaltにすると、remote desktopですごい面倒なことになりそうなので、
やっぱやめておこう。

なので、komorebi/whkdでやる。

> komorebic start

であっけなく起動した。










