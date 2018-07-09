#!/bin/bash

#ln -sfn ~/code/dotfiles/zshrc ~/.zshrc
#ln -sfn ~/code/dotfiles/vimrc ~/.vimrc
#ln -sfn ~/code/dotfiles/tmux.conf ~/.tmux.conf
#ln -sfn ~/code/dotfiles/aliases ~/.aliases

#sudo cp -rp /bin/* /usr/local/bin/
#sudo cp -rp /tmux/* ~/.tmux/
#chmod +x ~/.tmux/*.sh

#This is the installation of a bunch of scripts that make life easier
#Do not mind of complaints in this step
#The inexistent "workflow" folder is a project which does not appear in this rep
#The 'home' directory is a personal backup, that you need to setup in drivehq ftp server if you want
#Otherwise, ignore
cp -r ~/code/dotfiles/bin ~/bin
chmod 700 ~/bin/setperm
~/bin/setperm
~/bin/gethome

# tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# vim plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#command -v zsh | sudo tee -a /etc/shells
#chsh -s $(which zsh)

##### Oh my zsh
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

#Migration of configuration files
cp ~/code/dotfiles/bashrc ~/.bashrc
cp ~/code/dotfiles/vimrc ~/.vimrc
cp ~/code/dotfiles/profile ~/.profile
cp ~/code/dotfiles/tmux.conf ~/.tmux.conf

#Packages and more packages :-)
sudo apt-get update
sudo apt-get install build-essential cmake
sudo apt-get install python-dev python3-dev
sudo apt-get install wget curl libgnome2-bin
#Heroku
sudo add-apt-repository "deb https://cli-assets.heroku.com/branches/stable/apt ./"
curl -L https://cli-assets.heroku.com/apt/release.key | sudo apt-key add -
sudo apt-get install heroku
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
sudo apt-get install libssl-dev zlib1g-dev libreadline-dev libyaml-dev liblzma-dev libgmp-dev libpq-dev qt5-default libqt5webkit5-dev
if [ ! -d ~/.rbenv ]; then
  git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
  mkdir -p ~/.rbenv/plugins
  cd ~/.rbenv/plugins
  git clone git://github.com/sstephenson/ruby-build.git
  cd -
fi
sudo apt-get install ruby-dev
sudo apt-get install libmysqlclient-dev
sudo apt-get install nodejs-legacy
sudo apt-get install npm
sudo apt-get install ssh vsftpd postgresql
sudo apt-get install tmux vim-gtk xclip silversearcher-ag ctags
sudo apt-get install virtualbox-guest-additions-iso
sudo apt-get install virtualbox-guest-x11

#Geckodriver for Capybara :-)
wget https://github.com/mozilla/geckodriver/releases/download/v0.16.0/geckodriver-v0.16.0-linux64.tar.gz
tar xfv geckodriver-v0.16.0-linux64.tar.gz
sudo mv geckodriver /usr/local/bin
rm geckodriver-v0.16.0-linux64.tar.gz

#Temporarily commenting huge vim plugin
# cd ~/.vim/bundle/YouCompleteMe
# ./install.py --clang-completer
# cd -

##### GIT configurations

#git config --global init.templatedir '~/code/dotfiles/git_template'
#chmod a+x ~/code/dotfiles/git_template/hooks/*

git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.unstage "reset HEAD"
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global alias.brs "for-each-ref --sort=committerdate refs/heads/ --format='%(committerdate:short) %(refname:short)'"
git config --global alias.glog 'log -E -i --grep'
git config --global alias.car 'commit --amend --no-edit'
git config --global alias.uncommit 'reset --soft HEAD^'


git config --global alias.aa "add --all"
git config --global alias.adp "add --patch"
git config --global alias.b "branch"
git config --global alias.ri "rebase -i"
git config --global alias.sdot "status . --short --branch"
git config --global alias.stat "show --stat"
git config --global alias.si "status --ignored"
git config --global alias.dc "diff --word-diff --cached --color-words"
git config --global alias.df "diff --word-diff --color-words"
git config --global alias.pl "pull"
git config --global alias.plr "pull --rebase"
git config --global alias.rim "!git rebase --interactive $(git merge-base master HEAD)"
git config --global alias.upstream "rev-parse --abbrev-ref --symbolic-full-name @{u}"
#git config --global alias.riu "!git rebase -i $(git upstream)"
git config --global alias.sl "log --oneline --decorate --graph -20"
git config --global alias.slap "log --oneline --decorate --all --graph"
git config --global alias.slp "log --oneline --decorate --graph"
git config --global alias.commend 'commit --amend --no-edit'
git config --global alias.it '!git init && git commit -m “root” --allow-empty'
git config --global alias.stsh 'stash --keep-index'
git config --global alias.staash 'stash --include-untracked'
git config --global alias.staaash 'stash --all'
git config --global alias.shorty 'status --short --branch'
git config --global alias.grog 'log --graph --abbrev-commit --decorate --all --format=format:"%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(dim white) - %an%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n %C(white)%s%C(reset)"'

git config --global alias.rim 'git config --global alias.plr "pull --rebase" rebase --interactive $(git merge-base master HEAD)"git config --global alias.riu "git config --global alias.plr "pull --rebase" rebase -i $(git upstream)"git config --global alias.sl "log --oneline --decorate --graph -20'


git config --global push.default upstream
git config --global fetch.prune true


git config --global diff.tool vimdiff
git config --global merge.tool vimdiff
git config --global difftool.prompt false

git config --global merge.tool diffmerge

git config --global core.editor vim

# load zshrc file
#source ~/.zshrc
