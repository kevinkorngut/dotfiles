#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Check for Homebrew and install it if missing
if test ! $(which brew)
then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Taps
brew tap homebrew/apache
brew tap homebrew/bundle
brew tap homebrew/core
brew tap homebrew/dupes
brew tap homebrew/php
brew tap homebrew/services
brew tap homebrew/versions

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install homebrew/php/php56 --with-gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install other useful binaries.
brew install ack
brew install autoenv
brew install exiv2
brew install exiftool
brew install git
brew install git-extras
brew install heroku
brew install imagemagick --with-webp
brew install mas
brew install node
brew install openssl
brew install rename
brew install tree
brew install yarn
brew install webkit2png
brew install zopfli

#1Password
mas install 443987910
#DaisyDisk
mas install 411643860
#Marked 2
mas install 890031187
#Numbers
mas install 409203825
#Pages
mas install 409201541
#Postico (postgres GUI)
mas install 1031280567
#Fantastical 2
mas install 975937182
#Final Cut X
mas install 424389933
#The Unarchiver
mas install 425424353
#Tweetbot
mas install 557168941
#Twitter
mas install 409789998
#Xcode
mas install 497799835

# Remove outdated versions from the cellar.
brew cleanup
