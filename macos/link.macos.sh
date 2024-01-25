# macosのときだけ作るシンボリックリンク
# yabai
# skhd
#
# yabai
# ~/.config/yabaiフォルダを作成する
mkdir -p ~/.config/yabai
# ~/.config/yabai/yabaircにsymbolicLinkを作成する
ln -sf "$DOTFILES_ROOT/macos/yabai/yabairc" ~/.config/yabai/yabairc

# skhd
# ~/.config/yabaiフォルダを作成する
mkdir -p ~/.config/skhd
# ~/.config/skhd/skhdrcにsymbolicLinkを作成する
ln -sf "$DOTFILES_ROOT/macos/skhd/skhdrc" ~/.config/skhd/skhdrc


