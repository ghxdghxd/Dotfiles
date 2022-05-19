#!/usr/bin/env bash
SCM_THEME_PROMPT_DIRTY=" ${red}✗"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓"
SCM_THEME_PROMPT_PREFIX=" |"
SCM_THEME_PROMPT_SUFFIX="${green}|"

GIT_THEME_PROMPT_DIRTY=" ${red}✗"
GIT_THEME_PROMPT_CLEAN=" ${bold_green}✓"
GIT_THEME_PROMPT_PREFIX=" ${green}"
GIT_THEME_PROMPT_SUFFIX="${green}"

# Nicely formatted terminal prompt
function prompt_command(){
  if [ $? -eq 0 ]; then
    status=${green}➜${reset_color}
  else
    status=${red}➜${reset_color}
  fi
  export PS1="\n${blue} \D{%F %T} ${green}\u${yellow}@${green}\h ${purple}\w $(scm_prompt_info)\n${reset_color} ${status}  "
}

safe_append_prompt_command prompt_command