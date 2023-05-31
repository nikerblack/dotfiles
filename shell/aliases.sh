# Enable aliases to be sudo’ed
alias sudo='sudo '

alias ..="cd .."
alias ...="cd ../.."
alias ll="ls -l"
alias la="ls -la"
alias ~="cd ~"
alias dotfiles='cd $DOTFILES_PATH'

# Git
alias gaa="git add -A"
alias gc='$DOTLY_PATH/bin/dot git commit'
alias gca="git add --all && git commit --amend --no-edit"
alias gco="git checkout"
alias gd='$DOTLY_PATH/bin/dot git pretty-diff'
alias gs="git status -sb"
alias gf="git fetch --all -p"
alias gps="git push"
alias gpsf="git push --force"
alias gpl="git pull --rebase --autostash"
alias gb="git branch"
alias gl='$DOTLY_PATH/bin/dot git pretty-log'

# Utils
alias k='kill -9'
alias i.='(idea $PWD &>/dev/null &)'
alias c.='(code $PWD &>/dev/null &)'
alias o.='open .'
alias up='dot package update_all'
alias devlocal='bat /data/servers/environment/properties/dev/local/sergio.properties'

# DATA STORE ALIAS
alias redis-start='docker start redis'
alias redis-stop='docker stop redis'
alias redis-cli='docker exec -it redis redis-cli'
alias pg-start='docker start postgres-accounts'
alias pg-stop='docker stop postgres-accounts'

# AWS LOCAL ALIAS
alias as-ls-start='docker start accounts-plus-localstack'
alias as-ls-stop='docker stop accounts-plus-localstack'

# MAVEN ALIAS
alias pdeploy='mvn clean package && tar -xvzf target/*.tar.gz  -C /data/servers/'
alias quick-deploy='mvn clean package -DskipTests -Dcobertura.skip -Djacoco.skip && tar -xvzf target/*.tar.gz  -C /data/servers/'
alias deploy='find target/ -type f | grep -i tar.gz$ | xargs -I{} tar -xvzf {} -C /data/servers'
alias mcp="mvn clean package"
alias mci="mvn clean install"
alias mcpi="mvn clean install -DskipTests -Dcobertura.skip -Djacoco.skip"
alias mcps="mvn clean package -DskipTests -Dcobertura.skip -Djacoco.skip"

# TOMCAT ALIAS
alias tc-start='dot servers start'
alias tc-shutdown='dot servers stop'
alias tc-debug='dot servers debug'