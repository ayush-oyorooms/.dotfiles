source ~/.zsh_custom_fns
source ~/.zsh_sets
source ~/.zsh_secrets # secrets as env_vars, like access keys and ips
source ~/.zsh_aliases
source ~/.zsh_exports
source "/opt/homebrew/opt/kube-ps1/share/kube-ps1.sh"

kubeoff
autoload -Uz compinit
compinit
source <(kubectl completion zsh)

clear

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
