### FILE PATHS ###

# File common
alias todo='vim ~/Dropbox/misc/notepad/todo-txt/todo.txt'

# File config
alias aliases='cd ~/dotfiles/aliases/.alias; f="$(fd | fzf)" && vim "$f"'
alias bashrc='vim ~/.bashrc'
alias dotfiles='cd ~/dotfiles; vim'
alias i3config='cd ~/dotfiles/i3/.config/i3/conf.d; f="$(fd | fzf)" && vim "$f"'
alias nvimrc='cd ~/dotfiles/nvim/.config/nvim/lua; vim'
alias pythonstartup='sudo -e /usr/local/share/pythonstartup.py'
alias vimrc='cd ~/dotfiles/vim/.vim; f="$(fd -e vim | fzf)" && vim "$f"'
alias zshrc='vim ~/.zshrc'
