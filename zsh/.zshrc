source ~/.zsh_custom_fns
source ~/.zsh_sets
source ~/.zsh_secrets # secrets as env_vars, like access keys and ips
source ~/.zsh_exports # first exports then aliases, because some aliases use exports(envars) 
source ~/.zsh_aliases
source ~/.zsh_scripts

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
