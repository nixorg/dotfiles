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
brew install pandoc
brew install bat
brew install fd
brew install npm
brew install autojump
brew install tmux
brew install jq
brew install httpie
brew install graphviz
brew install postgresql@11
brew install vifm 

# core
brew cask install iterm2
brew cask install alfred
brew cask install adoptopenjdk/openjdk/adoptopenjdk8
brew cask install adoptopenjdk/openjdk/adoptopenjdk11
brew cask install font-fira-mono
brew cask install karabiner-elements
brew cask install maccy
brew cask install simplenote
brew cask install typora
brew cask install notion
brew cask install google-chrome
brew cask install marta

# chat
brew cask install skype
brew cask install telegram
brew cask install viber

# dev
brew cask install pgadmin4
brew cask install postman
brew cask install slack
brew cask install vagrant
brew cask install sublime-text
brew cask install visual-studio-code
brew cask install intellij-idea
brew cask install docker
brew cask install android-platform-tools

#brew cask install dropbox
#brew cask install ccleaner
# brew cask install deluge

# Remove outdated versions from the cellar.
brew cleanup
