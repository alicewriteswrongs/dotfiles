alias -g G='| grep'
alias abcdehighqual='abcde -o ogg:"-q 7"' #rips at ogg vorbis quality level 7
alias addall='git commit -a'		#add all changed files and commit
alias aliases='vim ~/dotfiles/zsh/aliases.zsh'
alias attach='tmux attach -t'
alias bc='bc -l'
alias bioed='ssh benpote@bioed.bu.edu'
alias blog='cd ~/Code/Blog/alice_blog/'
alias c='cd ~/Code'
alias ca='cd ~/ownCloud/Code'
alias changebackground='feh --bg-max'
alias chromesound='chromium --audio-buffer-size=2048'
alias cleankernel='make mrproper' # remove previous compilation
alias def='sdcv'
alias documents='cd ~/Dropbox/Documents/'
alias dotfiles='cd ~/dotfiles/'    #get into dotfiles repo
alias dotsync='cd ~/dotfiles && git pull origin master && git commit -a && git push origin master'
alias envnew2='virtualenv env'
alias envnew='virtualenv env -p python3'
alias envoff='deactivate'
alias envon='source env/bin/activate'
alias fhere='nautilus .'
alias format='git log --pretty=format:"%h - %an, %ar : %s"'
alias fullpath='ls -d -1 $PWD/*.*'
alias gad='git add'
alias gamend='git commit --amend'
alias gapush='git commit -a && git push origin master'
alias gash='git stash'
alias gbranch='git checkout master && git checkout -b'
alias gch='git checkout'
alias gdmaster='git fetch origin && git diff origin/master'
alias gitb='git branch'
alias gitc='git commit'
alias gitd='git branch -D'
alias gitgraph='git log --pretty=oneline --graph'
alias gitignore='vim ~/dotfiles/git/gitignore'
alias gitl='git log -1 HEAD' #last commit
alias gits='git status'
alias gl='git log --pretty=format:"%h - %an - %ar - %s" -10'
alias gpgfing='gpg --fingerprint'
alias gpglist='gpg --list-keys'
alias gpgrefresh='gpg --refresh-keys --keyserver hkp://pool.sks-keyservers.net'
alias gpgupload='gpg --send-keys --keyserver hkps://pool.sks-keyservers.net'
alias gpush='git commit && git push origin master'
alias grebc='git rebase --continue'
alias grebi='git rebase -i master'
alias grep='grep -n --color=auto' #colorize grep output and line numbers
alias gsta='git stash apply'
alias howbig='du -hc | tail -n 1'
alias i3config='vim ~/dotfiles/i3/i3config'
alias imac='ssh benpote@cumm005-0b01-dhcp-062.bu.edu'
alias keypush='keybase dir sign && git add SIGNED.md && git commit && git push origin master'
alias koantest='ruby path_to_enlightenment.rb'
alias la='ls -alhF'			#show hidden files and attribute
alias less='less -M'
alias litpush='Pweave -f pandoc *.mdw && git commit -a && git push origin master'
alias lpcpush='git push lpc LPC_edits:master'
alias ls='ls --color=auto'
alias ls='ls --color=auto'  #colorize ls output
alias mc='make clean'
alias mkdir='mkdir -p -v'   #makes a directory and it's hierarchy, also verbose
alias mv='mv -iv'           #makes it interactive and verbose
alias new='tmux new -s'
alias node='nodejs'
alias nodpms='xset dpms 0 0 0'
alias notes='cd ~/ownCloud/notes'
alias orphans='sudo pacman -Qdt'
alias p='cd ~/Code/projects'
alias poetry='cd ~/ownCloud/Documents/writing/poetry'
alias pretty='git log --pretty=oneline' #get succinct git log information
alias pullom='git checkout master && git pull origin master'
alias pullsubmod='git submodule init && git submodule update'
alias purewheel='sudo python setup.py bdist_wheel'
alias pushom='git push origin master'
alias qemuload='qemu-system-x86_64'
alias qtconsole='ipython qtconsole --pylab=inline'
alias quemudefault='qemu-system-i386  -m 512 -net nic -net user,hostfwd=tcp:127.0.0.1:2222-:22 vm-cs155/vm-cs155.vmdk'
alias s3down='aws s3 sync'
alias scc='ssh -X benpote@scc2.bu.edu'
alias sessions='tmux list-sessions'
alias shellscripts='cd ~/Code/shellscripts && vim'
alias shellsync='cd ~/Code/shellscripts && git pull origin master && git commit -a && git push origin master'
alias shutdown='sudo shutdown -P now'
alias so="unalias -m '*' && source ~/.zshrc"
alias tmptest='mkdir /tmp/test && cd /tmp/test'
alias todo='cd ~/notes && vim ~/notes/todo.org'
alias top='htop'			#use a better version of top instead
alias untar='tar -xvf'
alias usb='sudo mount /dev/sdb1 /mnt/usb' 
alias vdestroy='vagrant destroy'
alias vhalt='vagrant halt'
alias vimrc='vim ~/dotfiles/vimrc/vimrc'
alias vlc='no-screensaver.sh && vlc'
alias vprov='vagrant provision'
alias vprune='vagrant global-status --prune'
alias vreboot='vagrant halt && vagrant up'
alias vreboothard='vagrant destroy && vagrant up'
alias vssh='vagrant ssh'
alias vstatus='vagrant global-status'
alias vup='vagrant up'
alias wipc='git commit -a -m "WIP"'
alias yesdpms='xset dpms 300 600 0'
alias zfunc='vim ~/dotfiles/zsh/functions.zsh'
alias zshrc='vim ~/dotfiles/.zshrc'
