#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

brew install zsh

# Install Python
brew install python3

# Install other useful binaries.
brew install ack
brew install koekeishiya/formulae/skhd
brew install neovim
brew install autoenv
brew install fasd
brew install fzf
brew install gradle
brew install maven
brew install the_silver_searcher
brew install git
brew install tree
# brew install pandoc
brew install bat
brew install fd
brew install npm
brew install autojump
brew install tmux
brew install jq
brew install httpie
brew install graphviz
# brew install postgresql@11
# brew install vifm 

# font
brew tap homebrew/cask-fonts
brew install font-fira-mono-nerd-font

# core
brew install iterm2
brew install alfred
brew install adoptopenjdk/openjdk/adoptopenjdk8
brew install adoptopenjdk/openjdk/adoptopenjdk11
brew install karabiner-elements
brew install maccy
# brew cask install simplenote
# brew cask install typora
brew install notion
#brew cask install fsnotes
brew install google-chrome
brew install marta
brew install microsoft-office
brew install microsoft-teams

# chat
brew install skype
brew install telegram
brew install viber

# dev
#brew cask install pgadmin4
brew install postman
#brew cask install slack
#brew cask install vagrant
brew install sublime-text
brew install visual-studio-code
brew install intellij-idea
#brew cask install emacs
brew install docker
#brew cask install virtualbox
#brew cask install virtualbox-extension-pack
#brew cask install android-platform-tools

brew install dropbox
#brew cask install ccleaner
#brew cask install deluge

# services
brew services start skhd
# Remove outdated versions from the cellar.
brew cleanup

# setup dotfiles
mkdir ~/dotfiles
git clone --bare https://github.com/KreiDer/dotfiles $HOME/dotfiles
git --git-dir=$HOME/dotfiles/ --work-tree=$HOME checkout -f
git --git-dir=$HOME/dotfiles/ --work-tree=$HOME submodule update --init --recursive

# setup colorls
gem install colorls
