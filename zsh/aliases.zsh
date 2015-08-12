alias abcdehighqual='abcde -o ogg:"-q 7"' #rips at ogg vorbis quality level 7
alias litpush='Pweave -f pandoc *.mdw && git commit -a && git push origin master'
alias fhere='nautilus .'
alias gdiff='git diff'
alias gapush='git commit -a && git push origin master'
alias gpush='git commit && git push origin master'
alias koantest='ruby path_to_enlightenment.rb'
alias p='cd ~/Code/projects'
alias chromesound='chromium --audio-buffer-size=2048'
alias aliases='vim ~/Code/dotfiles/zsh/aliases.zsh'
alias purewheel='sudo python setup.py bdist_wheel'
alias gitignore='vim ~/Code/dotfiles/git/gitignore'
alias so='source ~/.zshrc'
alias addall='git commit -a'		#add all changed files and commit
alias attach='tmux attach -t'
alias bc='bc -l'
alias bioed='ssh benpote@bioed.bu.edu'
alias blog='cd ~/Code/Blog/alice_blog/'
alias changebackground='feh --bg-max'
alias c='cd ~/Code'
alias cleankernel='make mrproper' # remove previous compilation
alias def='sdcv'
alias documents='cd ~/Dropbox/Documents/'
alias dotfiles='cd ~/Code/dotfiles/'    #get into dotfiles repo
alias envnew2='virtualenv env'
alias envnew='virtualenv env -p python3'
alias envon='source env/bin/activate'
alias format='git log --pretty=format:"%h - %an, %ar : %s"'
alias fullpath='ls -d -1 $PWD/*.*'
alias gitb='git branch'
alias gitd='git branch -D'
alias check='git checkout'
alias gitc='git commit'
alias gitgraph='git log --pretty=oneline --graph'
alias gitl='git log -1 HEAD' #last commit
alias gits='git status'
alias gpgfing='gpg --fingerprint'
alias gpglist='gpg --list-keys'
alias gpgrefresh='gpg --refresh-keys --keyserver hkp://pool.sks-keyservers.net'
alias gpgupload='gpg --send-keys --keyserver hkps://pool.sks-keyservers.net'
alias grep='grep -n --color=auto' #colorize grep output and line numbers
alias -g G='| grep'
alias howbig='du -hc | tail -n 1'
alias i3config='vim ~/Code/dotfiles/i3/i3config'
alias imac='ssh benpote@cumm005-0b01-dhcp-062.bu.edu'
alias la='ls -alh'			#show hidden files and attribute
alias less='less -M'
alias ls='ls --color=auto'  #colorize ls output
alias mkdir='mkdir -p -v'   #makes a directory and it's hierarchy, also verbose
alias mv='mv -iv'           #makes it interactive and verbose
alias new='tmux new -s'
alias node='nodejs'
alias nodpms='xset dpms 0 0 0'
alias notes='cd ~/notes'
alias orphans='sudo pacman -Qdt'
alias poetry='cd ~/ownCloud/Documents/writing/poetry'
alias pretty='git log --pretty=oneline' #get succinct git log information
alias pullom='git pull origin master'
alias pullsubmod='git submodule init && git submodule update'
alias pushom='git push origin master'
alias qemuload='qemu-system-x86_64'
alias qtconsole='ipython qtconsole --pylab=inline'
alias quemudefault='qemu-system-i386  -m 512 -net nic -net user,hostfwd=tcp:127.0.0.1:2222-:22 vm-cs155/vm-cs155.vmdk'
alias scc='ssh -X benpote@scc2.bu.edu'
alias sessions='tmux list-sessions'
alias shutdown='sudo shutdown -P now'
alias todo='cd ~/notes && vim ~/notes/todo.org'
alias top='htop'			#use a better version of top instead
alias untar='tar -xvf'
alias usb='sudo mount /dev/sdb1 /mnt/usb' 
alias vimrc='vim ~/Code/dotfiles/.vimrc'
alias vlc='no-screensaver.sh && vlc'
alias yesdpms='xset dpms 300 600 0'
alias zshrc='vim ~/Code/dotfiles/.zshrc'
