

################
#Aliases
################

#edit bashrc!
alias bashrc='vim ~/Code/dotfiles/.bashrc'

#Commands and programs
alias top='htop'			#use a better version of top instead
alias la='ls -al'			#show hidden files and attributes
alias ls='ls --color=auto'  #colorize ls output
alias grep='grep -n --color=auto' #colorize grep output and line numbers
alias mkdir='mkdir -p -v'   #makes a directory and it's hierarchy, also verbose
alias mv='mv -iv'           #makes it interactive and verbose
alias usb='sudo mount /dev/sdb1 /mnt/usb' 

#git commands
alias pretty='git log --pretty=oneline' #get succinct git log information
alias addall='git commit -a'		#add all changed files and commit
alias format='git log --pretty=format:"%h - %an, %ar : %s"'
alias pushom='git push origin master'
alias gits='git status'

#ssh aliases
alias scc='ssh -X scc2.bu.edu -l benpote'
alias bioed='ssh benpote@bioed.bu.edu'

#mysql aliases (mac os x)
#alias mysql='/usr/local/mysql/bin/mysql'
#alias mysqladmin='/usr/local/mysql/bin/mysqladmin'

#python aliases
alias qtconsole='ipython qtconsole --pylab=inline'

#common directory changes
alias dotfiles='cd ~/Code/dotfiles/'    #get into dotfiles repo


################
#Other config
################


#colored terminal output!
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

#autocomplete for git
source ~/.git-completion.bash

#for vcftools
export PERL5LIB=/usr/local/Cellar/vcftools/0.1.11/lib/perl5/site_perl/

#export Vim as my default editor
export EDITOR="vim"

#export ~/Dropbox/shellscripts
export PATH=$PATH:~/Dropbox/shellscripts

#export ruby gems (esp sup)
export PATH=$PATH:~/.gem/ruby/2.1.0/bin

#use vim instead of less
alias less='/usr/share/vim/vim74/macros/less.sh'

#fix issue with vim-ipython (unmap ctrl-s)
stty stop undef
