clipboard_copy() {
  clip.exe
}

clipboard_paste() {
  powershell.exe -command get-clipboard
}

git_branch_current() {
  git rev-parse --abbrev-ref HEAD 2> /dev/null
}

prompt() {
  if [ $? -eq 0 ]; then
    local symbol_color_name='yellow'
  else
    local symbol_color_name='red'
  fi
  cat <<-SHELL
$(color 'blue' ${PWD}) $(color 'purple' $(git_branch_current))
$(color ${symbol_color_name} '$') $()
SHELL
}

export PS1='$(prompt)'

alias cb='code ~/.bashrc'
alias co='clipboard_copy'
alias pa='clipboard_paste'

export EDITOR="code --wait"