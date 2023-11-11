DISABLE_AUTO_TITLE="true"
precmd() {
  # sets the tab title to current dir
  echo -ne "\e]1;${PWD##*/}\a"
}

# install the gnu-sed via : https://formulae.brew.sh/formula/gnu-sed
# Note that the value of $HOMEBREW_PREFIX can be found out via grepping it from `brew config`, it isn't the envar
export PATH=/opt/homebrew/opt/gnu-sed/libexec/gnubin:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export CLICOLOR=1
export LSCOLORS=gxcxdxdxbxxxxxbxbxgxgx
# export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
# LS_COLORS='rs=0:di=36:ln=32:mh=00:pi=33:so=33:do=33:bd=00:cd=00:or=05;36:mi=04;93:su=31:sg=31:ca=00:tw=36:ow=36:st=36:ex=031:*.tar=00:*.tgz=00:*.arc=00:*.arj=00:*.taz=00:*.lha=00:*.lz4=00:*.lzh=00:*.lzma=00:*.tlz=00:*.txz=00:*.tzo=00:*.t7z=00:*.zip=00:*.z=00:*.dz=00:*.gz=00:*.lrz=00:*.lz=00:*.lzo=00:*.xz=00:*.zst=00:*.tzst=00:*.bz2=00:*.bz=00:*.tbz=00:*.tbz2=00:*.tz=00:*.deb=00:*.rpm=00:*.jar=00:*.war=00:*.ear=00:*.sar=00:*.rar=00:*.alz=00:*.ace=00:*.zoo=00:*.cpio=00:*.7z=00:*.rz=00:*.cab=00:*.wim=00:*.swm=00:*.dwm=00:*.esd=00:*.jpg=00:*.jpeg=00:*.mjpg=00:*.mjpeg=00:*.gif=00:*.bmp=00:*.pbm=00:*.pgm=00:*.ppm=00:*.tga=00:*.xbm=00:*.xpm=00:*.tif=00:*.tiff=00:*.png=00:*.svg=00:*.svgz=00:*.mng=00:*.pcx=00:*.mov=00:*.mpg=00:*.mpeg=00:*.m2v=00:*.mkv=00:*.webm=00:*.ogm=00:*.mp4=00:*.m4v=00:*.mp4v=00:*.vob=00:*.qt=00:*.nuv=00:*.wmv=00:*.asf=00:*.rm=00:*.rmvb=00:*.flc=00:*.avi=00:*.fli=00:*.flv=00:*.gl=00:*.dl=00:*.xcf=00:*.xwd=00:*.yuv=00:*.cgm=00:*.emf=00:*.ogv=00:*.ogx=00:*.aac=00:*.au=00:*.flac=00:*.m4a=00:*.mid=00:*.midi=00:*.mka=00:*.mp3=00:*.mpc=00:*.ogg=00:*.ra=00:*.wav=00:*.oga=00:*.opus=00:*.spx=00:*.xspf=00:';
#
# export LS_COLORS

# https://stackoverflow.com/a/56178134/13738635
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/\* \(.*\)/ (\1)/'
}

setopt PROMPT_SUBST
# export PS1=$'⚡\033[1;31m%1d\033[m$(parse_git_branch): \$ ' # https://superuser.com/a/1108504
export PS1=$'⚡\033[1;31m%1d |\033[1;3m\033[1;35m$(parse_git_branch)\033[m: \033[m\$ '
export XDG_CONFIG_HOME="~/.config"

# for some reason nvim on this mac(Monterey 12.6.8) does not source init.lua automatically
export nvm_cfg="~/.config/nvim/init.lua"
export SDKMAN_DIR="$HOME/.sdkman"
setopt interactivecomments # https://stackoverflow.com/a/11873793/13738635
# setopt extendedglob # https://unix.stackexchange.com/a/153863


source ~/.zsh_secrets # secrets as env_vars, like access keys and ips
source ~/.zsh_aliases

clear

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
