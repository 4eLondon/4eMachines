#!/bin/bash
# Recreates the minimal bspwm desktop setup from a fresh Debian netinst.
# Run as your normal user (needs sudo).
set -e

echo "==> Updating package lists"
sudo apt update

echo "==> Installing packages"
sudo apt install --no-install-recommends -y \
  x11-xserver-utils xinit xinput \
  xserver-xorg-core xserver-xorg-input-libinput xserver-xorg-video-fbdev \
  bspwm sxhkd \
  alacritty \
  picom polybar \
  feh mpv \
  pcmanfm \
  firefox-esr \
  fonts-hack \
  unzip zip \
  build-essential \
  git fzf zoxide htop pfetch \
  nano neovim ranger \
  maim xdotool \
  xclip \
  ufw \
  cloud-guest-utils \
  qemu-guest-agent \

echo "==> Linking dotfiles"
cp -f dotfiles/.bashrc dotfiles/.xinitrc "$HOME/"
mkdir -p "$HOME/.bin" "$HOME/.local/bin"

mkdir -p "$HOME/.config"
cp -r config/* "$HOME/.config/"

chmod +x "$HOME/.config/bspwm/bspwmrc"

mkdir -p "$HOME/Pictures/Wallpaper" "$HOME/Pictures/screenshots"

echo "==> Enabling firewall"
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw --force enable

echo "==> Done."
echo "Run 'startx' to boot int desktop."
