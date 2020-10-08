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
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

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
brew install the_silver_searcher
brew install git
brew install tree
brew install pandoc
brew install bat
brew install fd
brew install npm
brew install autojump
brew install tmux

# Core casks
brew cask install alfred
brew cask install iterm2
brew cask install java
brew cask install adoptopenjdk/openjdk/adoptopenjdk8

brew cask install sublime-text
brew cask install visual-studio-code
brew cask install google-chrome
brew cask install skype
brew cask install marta
brew cask install intellij-idea
#brew cask install dropbox
#brew cask install ccleaner
brew cask install android-platform-tools
# brew cask install deluge


# Install Docker, which requires virtualbox
#brew install docker
#brew install boot2docker

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package

# Remove outdated versions from the cellar.
brew cleanup
