zimfw() { source /Users/sergio.alfonso/.dotfiles/shell/zsh/.zim/zimfw.zsh "${@}" }
zmodule() { source /Users/sergio.alfonso/.dotfiles/shell/zsh/.zim/zimfw.zsh "${@}" }
fpath=(/Users/sergio.alfonso/.dotfiles/shell/zsh/.zim/modules/git-info/functions /Users/sergio.alfonso/.dotfiles/shell/zsh/.zim/modules/utility/functions /Users/sergio.alfonso/.dotfiles/shell/zsh/.zim/modules/zsh-completions/src ${fpath})
autoload -Uz -- coalesce git-action git-info mkcd mkpw
source /Users/sergio.alfonso/.dotfiles/shell/zsh/.zim/modules/environment/init.zsh
source /Users/sergio.alfonso/.dotfiles/shell/zsh/.zim/modules/input/init.zsh
source /Users/sergio.alfonso/.dotfiles/shell/zsh/.zim/modules/utility/init.zsh
source /Users/sergio.alfonso/.dotfiles/shell/zsh/.zim/modules/completion/init.zsh
source /Users/sergio.alfonso/.dotfiles/shell/zsh/.zim/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /Users/sergio.alfonso/.dotfiles/shell/zsh/.zim/modules/zsh-autosuggestions/zsh-autosuggestions.zsh
