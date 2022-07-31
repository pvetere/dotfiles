# History
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=120000
SAVEHIST=100000
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Don't quit the shell window accidentally.  Press Ctrl-D 5x.
set -o ignoreeof
#export IGNOREEOF=5

export PATH="$HOME/bin:$HOME/bin-priv:/usr/local/bin:/usr/local/sbin:/usr/sbin:$HOME/go/bin:/snap/bin:$HOME/code/git-submodule-tools/bin:$HOME/.cargo/bin:$PATH"

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
#source ~/memsql/.memsqlrc

# Rust
. "$HOME/.cargo/env"

# Emscripten
export EMSDK=$HOME/code/emsdk
export PATH="$PATH:$EMSDK:$EMSDK/upstream/emscripten:$EMSDK/node/14.15.5_64bit/bin"
export EM_CONFIG="$EMSDK/.emscripten"
export EMSDK_NODE="$EMSDK/node/14.15.5_64bit/bin/node"

# WASI
source $HOME/.wasienv/wasienv.sh


if [ -e /home/pvetere/.nix-profile/etc/profile.d/nix.sh ]; then . /home/pvetere/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
