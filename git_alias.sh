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
git config --global alias.last 'log -l HEAD | grep commit'


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
