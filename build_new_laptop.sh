#!/bin/sh

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
# Set zsh as the default shell
chsh -s $(which zsh)

# Install software updates
softwareupdate --install --all

# Install XCode
xcode-select --install

brew tap 'homebrew/dupes'
brew tap 'caskroom/versions'
brew install 'caskroom/cask/brew-cask'

brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup

brew install 'python'
brew install 'redis'
brew install 'mysql'
brew install 'postgresql'
brew install 'rbenv'
brew install 'rbenv-build'

touch ~/.bash_profile || exit
grep -q -F 'export PATH="$HOME/.rbenv/bin:$PATH"' ~/.bash_profile || echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
grep -q -F 'eval "$(rbenv init -)"' ~/.bash_profile || echo 'eval "$(rbenv init -)"' >> ~/.bash_profile	
source ~/.bash_profile

touch ~/.zshrc || exit
grep -q -F 'export PATH="$HOME/.rbenv/bin:$PATH"' ~/.zshrc || echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
grep -q -F 'eval "$(rbenv init -)"' ~/.zshrc || echo 'eval "$(rbenv init -)"' >> ~/.zshrc
source ~/.zshrc

rbenv rehash

# Install/Symlink apps to Applications folder
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

brew cask install 'adobe-reader'
brew cask install 'firefox'
brew cask install 'google-chrome'
brew cask install 'google-drive'
brew cask install 'evernote'
brew cask install 'google-notifier'
brew cask install 'vlc'
brew cask install 'dropbox'
brew cask install 'google-hangouts'
brew cask install 'java'
brew cask install 'spectacle'
brew cask install 'caskroom/homebrew-cask/yemuzip'
brew cask install 'eclipse-platform' --version 4.3
brew cask install 'eclipse-ide' --version 4.3
brew cask install 'harvest'
brew cask install 'adobe-air'
brew cask install 'spotify'
brew cask install 'sourcetree'
brew cask install 'karabiner'
brew cask install 'postgres'
brew cask install 'mysqlworkbench'
brew cask install 'atom'
brew cask install 'virtualbox'
brew cask install 'sublime-text3'
brew cask install 'the-unarchiver'
brew cask install 'microsoft-office'
brew cask install 'totalfinder'
brew cask install 'commandq'
#brew cask install 'lexiloader'

brew update && brew upgrade brew-cask && brew cleanup

./.osx

defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key>
<string>/Applications/Google Chrome.app</string><key>_CFURLStringType</key>
<integer>0</integer></dict></dict></dict>'


defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key>
<string>/Applications/Safari.app</string><key>_CFURLStringType</key>
<integer>0</integer></dict></dict></dict>'

defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key>
<string>/Applications/Microsoft Office 2011/Microsoft Excel.app</string><key>_CFURLStringType</key>
<integer>0</integer></dict></dict></dict>'

defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key>
<string>/Applications/Microsoft Office 2011/Microsoft Word.app</string><key>_CFURLStringType</key>
<integer>0</integer></dict></dict></dict>'

defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key>
<string>/Applications/Preview.app</string><key>_CFURLStringType</key>
<integer>0</integer></dict></dict></dict>'

defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key>
<string>/Applications/Adobe Reader.app</string><key>_CFURLStringType</key>
<integer>0</integer></dict></dict></dict>'

#defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key>
#<string>/Applications/LexiLoader.app</string><key>_CFURLStringType</key>
#<integer>0</integer></dict></dict></dict>'


defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key>
<string>/Applications/Eclipse.app</string><key>_CFURLStringType</key>
<integer>0</integer></dict></dict></dict>'

defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key>
<string>/Applications/Sublime Text.app</string><key>_CFURLStringType</key>
<integer>0</integer></dict></dict></dict>'

defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key>
<string>/Applications/System Preferences.app</string><key>_CFURLStringType</key>
<integer>0</integer></dict></dict></dict>'

killall -HUP Dock

reboot

# Manual configuration

# Disable and reenable tap to click optoin for trackpad
# Install Forc.com IDE
# Configure Spectacle to launch at Login
# TotalFinder
# In the sidebar show spuser; hide iCloud Drive


