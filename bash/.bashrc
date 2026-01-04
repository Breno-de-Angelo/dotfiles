# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Omarchy Setup
if [ -f ~/.local/share/custom-desktop/default/bash/rc ]; then
    source ~/.local/share/custom-desktop/default/bash/rc
fi

# --- User Specific / Local Configs ---

# AUMO

# Paths
export PATH="$PATH:/home/breno/.local/bin"
export PATH="$PATH:/home/breno/go/bin"
export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="$PATH:/usr/arm-gnu-toolchain-14.3.rel1-x86_64-arm-none-eabi/bin"
export PATH="$PATH:/usr/local/texlive/2025/bin/x86_64-linux"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# pnpm
export PNPM_HOME="/home/breno/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Cargo
if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi

# Custom Functions/Aliases
alias text='gnome-text-editor'
alias mra='mr --all'
alias n='nvim'
alias gst='git status'

# JWT Decode
b64df() { echo -n "$1" | base64 --decode; }
b64ef() { echo -n "$1" | base64; }
alias b64dclip='xclip -o | base64 --decode'
alias b64eclip='xclip -o | base64'

jwtdecode() {
  local token="$1"
  if [[ -z "$token" ]]; then
    echo "Uso: jwtdecode <jwt>"
    return 1
  fi
  _b64url_decode() {
    local data="$1"
    echo "$data" |
      tr '_-' '/+' |
      sed -E 's/[^=]{2}$/&==/;s/[^=]$/&=/' |
      base64 -d 2>/dev/null
  }
  echo "Header:"
  _b64url_decode "$(echo "$token" | cut -d '.' -f1)" | jq .
  echo
  echo "Payload:"
  _b64url_decode "$(echo "$token" | cut -d '.' -f2)" | jq .
}

jwtdecodeclip() {
  local clip
  if command -v xclip &>/dev/null; then
    clip="$(xclip -selection clipboard -o)"
  elif command -v xsel &>/dev/null; then
    clip="$(xsel --clipboard --output)"
  else
    echo "Nenhum comando de clipboard disponível (pbpaste, xclip ou xsel)."
    return 1
  fi
  jwtdecode "$clip"
}

# K8s completions and aliases
if command -v kubectl &> /dev/null; then
    source <(kubectl completion bash) 2>/dev/null || true
    alias k=kubectl
    complete -o default -F __start_kubectl k 2>/dev/null || true
fi

if [ -f /usr/share/bash-completion/completions/kubectx.bash ]; then
    source /usr/share/bash-completion/completions/kubectx.bash
    alias kx=kubectx
    complete -F _kube_contexts kx 2>/dev/null || true
fi

if [ -f /usr/share/bash-completion/completions/kubens.bash ]; then
    source /usr/share/bash-completion/completions/kubens.bash
    alias kn=kubens
    complete -F _kube_namespaces kn 2>/dev/null || true
fi
# Secrets (Ignored by Git)
if [ -f ~/.bash_secrets ]; then
    source ~/.bash_secrets
fi
