#!/bin/bash

# Keyboard layouts
#setxkbmap -model pc105 -layout us,il -option grp:alt_shift_toggle


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
