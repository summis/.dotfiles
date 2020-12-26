#!/bin/bash
#
# This script installs my configuration that I keep in
# https://github.com/summis/.dotfiles to fresh Arch install.

# If run as root rice will be installed in /root.
if [[ $EUID -eq 0 ]]
  then echo "Please don't run as root"
  exit 1
fi

# Update system and install some nice software and fonts.
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm - < packages.txt

# Install AUR helper if not installed and some nice AUR packages.
if ! command -v yay &> /dev/null
then
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
  cd .. && rm -rf yay
fi

while read package; do
  yay -S $package
done < packages-AUR.txt

# Initialize bare git repo for config.
GIT_REPO_URL="https://github.com/summis/.dotfiles.git"
git clone --bare $GIT_REPO_URL $HOME/.dotfiles

# Enable aliases in script and define alias for maintaing dotfile repo.
shopt -s expand_aliases
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# Dump old config files to backup folder just for the case.
mkdir -p $HOME/.old-dotfiles
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} > old-files.txt
xargs dirname <old-files.txt | xargs -I{} mkdir -p $HOME/.old-dotfiles/{}
xargs -I{} mv {} $HOME/.old-dotfiles/{} <old-files.txt
rm old-files.txt

# Checking out + don't show untracked filed with status command.
config checkout
config config --local status.showUntrackedFiles no

# Install vim package manager and packages.
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -es -c "PlugInstall" -c "qa"

# Create blanc default wallpaper.
mkdir $HOME/.wallpapers
convert -size 1366x768 xc:white $HOME/.wallpapers/white.png

# Enable colored outpurt for pacman.
sudo sed -i 's/#Color/Color/g' /etc/pacman.conf

# Change login banner to more pompous.
sudo rm /etc/issue
figlet -f banner "Welcome!" | sudo tee -a /etc/issue > /dev/null

# Create xdg directories if they don't exist.
grep "\$HOME/..*\"$" .config/user-dirs.dirs | \
  sed 's/.*\///;s/\"//' | \
  xargs -I{} mkdir -p $HOME/{}
xdg-user-dirs-update

# Sync pkgfile database.
sudo pkgfile -u

# Enable tab completion for aliases.
curl https://raw.githubusercontent.com/cykerway/complete-alias/master/complete_alias > \
  $HOME/.scripts/complete_alias

# Set finnish nodeadkeys keyboard.
localectl --no-convert set-x11-keymap fi, nodeadkeys

# Notes
# - you may have to add yourself to video group to be able to change screen brightness.
#   Depends on hardware whether xorg-xbacklight or acpilight should be installed
# - polybars wlan interface depends on hardware too
# - Maybe beep sound have to be disabled too

echo "Config installed! Start new session :)"
exit 0
