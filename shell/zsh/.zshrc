# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# -----------------
# Zim configuration
# -----------------

# Use degit instead of git as the default tool to install and update modules.
#zstyle ':zim:zmodule' use 'degit'

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

zmodload -F zsh/terminfo +p:terminfo
# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key
# }}} End configuration added by Zim install

#ALIAS FOR WHAT!!!
alias tc-start='case $(pwd) in
/data/servers/tc-accounts-svc) gsed -i "s/8080/9989/g" ./conf/server.xml; gsed -i "s/8005/10911/g" ./conf/server.xml ; gsed -i "s/-Xms256M -Xmx4096M/-Xms128m -Xmx512m/g" ./bin/appenv.sh;;
/data/servers/tc-accounts-plus-svc) gsed -i "s/8080/9938/g" ./conf/server.xml; gsed -i "s/8005/10038/g" ./conf/server.xml ; gsed -i "s/-Xms256M -Xmx4096M/-Xms128M -Xmx512M/g" ./bin/appenv.sh;;
/data/servers/tc-idms-proxy) gsed -i "s/8080/9920/g" ./conf/server.xml; gsed -i "s/8005/10020/g" ./conf/server.xml ; gsed -i "s/-Xms256M -Xmx4096M/-Xms128M -Xmx512M/g" ./bin/appenv.sh;;
/data/servers/tc-o365-non-academic-staff-tool-ui) gsed -i "s/8080/10003/g" ./conf/server.xml; gsed -i "s/8005/10010/g" ./conf/server.xml ; gsed -i "s/-Xms256M -Xmx4096M/-Xms128M -Xmx512M/g" ./bin/appenv.sh;;
/data/servers/tc-keycode) gsed -i "s/8080/22127/g" ./conf/server.xml; gsed -i "s/8009/26127/g" ./conf/server.xml ;gsed -i "s/8005/24127/g" ./conf/server.xml ; gsed -i "s/-Xms256M -Xmx4096M/-Xms128m -Xmx512m/g" ./bin/appenv.sh;;
/data/servers/tc-security-gateway-svc) gsed -i "s/8080/9932/g" ./conf/server.xml; gsed -i "s/8009/10032/g" ./conf/server.xml ;gsed -i "s/8005/10932/g" ./conf/server.xml ; gsed -i "s/-Xms256M -Xmx4096M/-Xms128m -Xmx512m/g" ./bin/appenv.sh;;
*) echo "You are not in the correct path";;
esac && ./bin/startup.sh && tail -f ./logs/catalina.out'
alias tc-shutdown='./bin/shutdown.sh && rm -fR work/* && echo "work eliminado"'

#ALIAS FOR MAVEN
#THIS CLEAN REMOVE ALL FILES GENERAGED BY THE BUILD
#THIS PACKAGE TAKE THE COMPILED CODE AND PACKAGE
alias mcp='mvn clean package'
#SAME AS BEFORE, BUT UNZIP FILES OVER /data/servers/
alias pdeploy='mvn clean package && tar -xvzf target/*.tar.gz  -C /data/servers/'
#SAME AS BEFORE, BUT SKIP TEST
alias quick-deploy="mvn clean package -DskipTests -Dcobertura.skip -Djacoco.skip && tar -xvzf target/*.tar.gz -C /data/servers/"
#SAME AS BEFORE
alias cd-servers="cd /data/servers"
#CHECK ESPECIFIC TEST
alias mvn-test1='mvn test -DKeyStore.path=/data/servers/keystore/TEST1/k12.jks -DMULTI_USE_ENVIRONMENTAL_OVERRIDE=/data/servers/environment/overrides/QA.TEST1'
alias mvn-test2='mvn test -DKeyStore.path=/data/servers/keystore/TEST2/k12.jks -DMULTI_USE_ENVIRONMENTAL_OVERRIDE=/data/servers/environment/overrides/QA.TEST2'
alias mvn-test3='mvn test -DKeyStore.path=/data/servers/keystore/TEST3/k12.jks -DMULTI_USE_ENVIRONMENTAL_OVERRIDE=/data/servers/environment/overrides/QA.TEST3'
alias mvn-test4='mvn test -DKeyStore.path=/data/servers/keystore/TEST4/k12.jks -DMULTI_USE_ENVIRONMENTAL_OVERRIDE=/data/servers/environment/overrides/QA.TEST4'
alias mvn-test5='mvn test -DKeyStore.path=/data/servers/keystore/TEST5/k12.jks -DMULTI_USE_ENVIRONMENTAL_OVERRIDE=/data/servers/environment/overrides/QA.TEST5'
alias mvn-test6='mvn test -DKeyStore.path=/data/servers/keystore/TEST6/k12.jks -DMULTI_USE_ENVIRONMENTAL_OVERRIDE=/data/servers/environment/overrides/QA.TEST6'

#ALIAS FOR DOCKER
#START MOCK SERVICE AWS S3
alias s3-start='docker start s3mock'
alias s3-stop='docker stop s3mock'
#START START REDIS
alias redis-start='docker start redis'
alias redis-stop='docker stop redis'
alias redis-cli='docker exec -it redis redis-cli'
#START DOCKER
alias pg-start='docker start postgres-accounts'
alias pg-stop='docker stop postgres-accounts'

# ALIAS FOR JMETER
alias jmeter='sh /data/app/jmeter/bin/jmeter.sh'

#ALIAS UPDATE ZIM
alias upgrade_zim='zimfw update && zimfw upgrade'

#ALIAS CUSTOM
alias gstride='cd ~/Documents/git/stride'
alias workspace='cd ~/Documents/workspace/IDE/IntelliJ'

#Provides a convenient way to load ssh-agent
zstyle ':zim:ssh' ids 'id_nikerblack'

#move .zprofile

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/sergio.alfonso/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
