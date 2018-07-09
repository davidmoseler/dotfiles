
brew install zsh-syntax-highlighting


sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


# create shortcuts 

defaults write -g NSUserKeyEquivalents -dict-add "Menu Item" -string "@$~^k" 
defaults write -g NSUserKeyEquivalents -dict-add "Enter Full Screen" -string "@^f" 
defaults write -g NSUserKeyEquivalents -dict-add "Exit Full Screen" -string "@^f" 
