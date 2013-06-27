local ruby_version=''
if which rbenv &> /dev/null; then
  ruby_version='‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
fi
local current_dir='${PWD/#$HOME/~}'
local git_info='$(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[075]%}±%{$reset_color%} %{$FG[193]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED=""
ZSH_THEME_GIT_PROMPT_MODIFIED=""
ZSH_THEME_GIT_PROMPT_DELETED=""
ZSH_THEME_GIT_PROMPT_RENAMED=""
ZSH_THEME_GIT_PROMPT_UNMERGED=""
ZSH_THEME_GIT_PROMPT_UNTRACKED=""

RPROMPT="${git_info}$(git_prompt_status)"

PROMPT="╭─%{$FG[040]%}%n%{$reset_color%}%{$FG[239]%}@%{$reset_color%}%{$FG[033]%}%m%{$reset_color%}%{$FG[172]%} ${ruby_version}%{$reset_color%} %{$FG[239]%}%{$reset_color%}%{$terminfo[bold]$FG[226]%}${current_dir}%{$reset_color%}
╰─○ "
