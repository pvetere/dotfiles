# History
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=120000
SAVEHIST=100000
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Path
export PATH="$HOME/bin:$HOME/bin-priv:/usr/local/bin:/usr/local/sbin:/usr/sbin:$HOME/go/bin:/snap/bin:$HOME/code/git-submodule-tools/bin:$PATH"

# Libraries
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib64

# Editor
if which nvim > /dev/null 2>&1 ; then
  export EDITOR=nvim
else
  export EDITOR=vi
fi

# Locale
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# GitHub
export GITHUB_USER=pvetere

# Java
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# MemSQL
source ~/memsql/.memsqlrc

# Rust
. "$HOME/.cargo/env"

