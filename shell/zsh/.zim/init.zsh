zimfw() { source /Users/sergioandres/.dotfiles/shell/zsh/.zim/zimfw.zsh "${@}" }
zmodule() { source /Users/sergioandres/.dotfiles/shell/zsh/.zim/zimfw.zsh "${@}" }
fpath=(/Users/sergioandres/.dotfiles/shell/zsh/.zim/modules/git-info/functions /Users/sergioandres/.dotfiles/shell/zsh/.zim/modules/utility/functions ${fpath})
autoload -Uz -- coalesce git-action git-info mkcd mkpw
source /Users/sergioandres/.dotfiles/shell/zsh/.zim/modules/environment/init.zsh
source /Users/sergioandres/.dotfiles/shell/zsh/.zim/modules/input/init.zsh
source /Users/sergioandres/.dotfiles/shell/zsh/.zim/modules/completion/init.zsh
source /Users/sergioandres/.dotfiles/shell/zsh/.zim/modules/utility/init.zsh
source /Users/sergioandres/.dotfiles/shell/zsh/.zim/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /Users/sergioandres/.dotfiles/shell/zsh/.zim/modules/zsh-autosuggestions/zsh-autosuggestions.zsh
