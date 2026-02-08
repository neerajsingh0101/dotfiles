# --- Minimal prompt: icon + full path + git branch/status ---
autoload -Uz colors && colors
setopt prompt_subst

# Fast-ish git info (works without extra plugins)
__git_prompt_info() {
  command git rev-parse --is-inside-work-tree >/dev/null 2>&1 || return

  local branch dirty
  branch=$(command git symbolic-ref --quiet --short HEAD 2>/dev/null \
        || command git rev-parse --short HEAD 2>/dev/null)

  # dirty = unstaged/staged changes present
  command git diff --no-ext-diff --quiet --ignore-submodules -- 2>/dev/null
  local unstaged=$?
  command git diff --no-ext-diff --cached --quiet --ignore-submodules -- 2>/dev/null
  local staged=$?
  if (( unstaged != 0 || staged != 0 )); then
    dirty="*"
  else
    dirty=""
  fi

  # shows: (main*) or (a1b2c3)
  print -r -- " %{$fg[cyan]%}(${branch}${dirty})%{$reset_color%}"
}

# Icon + full pwd + git info + newline + prompt char
PROMPT='%{$fg[magenta]%}❯%{$reset_color%} %{$fg[blue]%}%~%{$reset_color%}$(__git_prompt_info)
%{$fg[magenta]%}›%{$reset_color%} '
