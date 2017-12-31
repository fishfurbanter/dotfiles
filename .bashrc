
########################
# Bash-it configuration
########################

# Path to the bash it configuration
export BASH_IT="/home/andecy/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='bobby-python'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='weechat'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Unomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Load Bash It
source $BASH_IT/bash_it.sh


####
# Set vim as the default shell editor
####
VISUAL=vim
EDITOR="$VISUAL"

####
# Add .utils/bin to path
####
PATH=$PATH:$HOME/.utils/bin

####
#History size
####
HISTSIZE=10000
HISTFILESIZE=100000

####
# Virtualenv
####
export WORKON_HOME=~/.envs
export PROJECT_HOME=~/actual
#export VIRTUALENVWRAPPER_SCRIPT=/bin/vitualenvwrapper.sh
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source /bin/virtualenvwrapper.sh

####
#Dotfiles git repo alias
####
alias config='/usr/bin/git --git-dir=/home/andecy/.cfg/ --work-tree=/home/andecy'
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
GEM_HOME=$(ruby -e 'print Gem.user_dir')
eval $(thefuck --alias)


####
# Racket SICP Alias
####
alias sicp='racket -i neil/sicp -l xrepl'

####
# Copied from .bash_profile
####
alias devt="pushd $HOME/dev/tutorials"
# Wallpaper directory
export WALLPAPER_DIR="/home/$USER/.wallpapers"

# Override .bash_it/themes/base.theme.bash
function py_interp_prompt {
  py_version=$(python --version 2>&1 | awk '{print " Py-"$2;}') || return
  echo -e "${PYTHON_THEME_PROMPT_PREFIX}${py_version}${PYTHON_THEME_PROMPT_SUFFIX}"
}

# Override .bash_it/themes/colors.theme.bash
function prompt_command() {
    PS1="\n${bold_blue}$(python_version_prompt) ${purple}\h ${reset_color}in ${green}\w\n${bold_cyan}$(scm_char)${green}$(scm_prompt_info) ${green}→${reset_color} "
}
