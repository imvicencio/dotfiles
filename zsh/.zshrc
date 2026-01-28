export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git node npm github)

source $ZSH/oh-my-zsh.sh

# ===== Aliases =====
alias zshsource="source ~/.zshrc"
alias zshconfig="code ~/.zshrc"
alias ls="colorls -la"
alias la='colorls -lA --sd'
alias pip="pip3"
alias python="python3"
alias dev="cd ~/dev"

# ===== Kubernetes Aliases (CKA/CKAD) =====
alias k='kubectl'
alias kg='kubectl get'
alias kd='kubectl describe'
alias kdel='kubectl delete'
alias kaf='kubectl apply -f'
alias kdf='kubectl delete -f'
alias kcf='kubectl create -f'
alias kex='kubectl exec -it'
alias klo='kubectl logs'
alias klof='kubectl logs -f'

# Namespaces
alias kgns='kubectl get namespaces'
alias kns='kubectl config set-context --current --namespace'

# Pods
alias kgp='kubectl get pods'
alias kgpw='kubectl get pods -o wide'
alias kgpa='kubectl get pods --all-namespaces'
alias kdp='kubectl describe pod'
alias kdelp='kubectl delete pod'

# Deployments
alias kgd='kubectl get deployments'
alias kdd='kubectl describe deployment'
alias kdeld='kubectl delete deployment'
alias ksd='kubectl scale deployment'
alias krd='kubectl rollout restart deployment'

# Services
alias kgs='kubectl get svc'
alias kds='kubectl describe svc'
alias kdels='kubectl delete svc'

# ConfigMaps & Secrets
alias kgcm='kubectl get configmap'
alias kgsec='kubectl get secret'
alias kdcm='kubectl describe configmap'
alias kdsec='kubectl describe secret'

# Nodes
alias kgno='kubectl get nodes'
alias kdno='kubectl describe node'
alias kgnowide='kubectl get nodes -o wide'

# All resources
alias kga='kubectl get all'
alias kgaa='kubectl get all --all-namespaces'

# Context & Config
alias kgc='kubectl config get-contexts'
alias kuc='kubectl config use-context'
alias kccc='kubectl config current-context'

# Quick dry-run for generators
alias kdr='kubectl run --dry-run=client -o yaml'
alias kdrc='kubectl create --dry-run=client -o yaml'

# Export variables
export do='--dry-run=client -o yaml'
export now='--force --grace-period=0'

# ===== NVM (Node Version Manager) =====
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# ===== SDKMAN =====
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# ===== Syntax Highlighting =====
# Para macOS con Homebrew
if [[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Para Ubuntu/Linux
if [[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# ===== Colorls Tab Complete =====
if command -v colorls &> /dev/null; then
    source $(dirname $(gem which colorls))/tab_complete.sh
fi

# ===== Pyenv =====
if command -v pyenv &> /dev/null; then
    eval "$(pyenv init -)"
fi

# ===== Cargo (Rust) =====
if [[ -f "$HOME/.cargo/env" ]]; then
    . "$HOME/.cargo/env"
fi
