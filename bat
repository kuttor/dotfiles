[0;34m/var/folders/bw/r1v_qtgn29x6mmwfj01b__3r0000gp/T//A8WSfb_gitconfig[m [0;34mgitconfig[m                                             
[1;31m# ---------------------------------------------------[m  [1;32m# vim:syntax=gitconfig[m                                
[1;31m--------------------------[m                                                                                   
# File: .gitconfig                                     # File: .gitconfig                                    
# Info: This is Git's per-user configuration file      # Info: This is Git's per-user configuration file     
# ---------------------------------------------------  # --------------------------------------------------- 
--------------------------                             --------------------------                            
                                                                                                             
[alias]                                                [alias]                                               
[7;31m [m  s = status -sb                                        s[1;32mt[m = status -sb                                     
[7;31m [m  do = commit -am[7;31m [m                                      do = commit -am                                     
[7;31m [m  up = pull                                             up = pull                                           
[7;31m [m  br = branch                                           br = branch                                         
[7;31m [m  co = checkout                                         co = checkout                                       
[7;31m [m  who = shortlog -s --                                  who = shortlog -s --                                
[7;31m [m  tags = tag -l                                         tags = tag -l                                       
[7;31m [m  branches = branch -a                                  branches = branch -a                                
[7;31m [m  remotes = remote -v                                   remotes = remote -v                                 
                                                       [1;32m  aliases = config --get-regexp alias[m                 
                                                       [1;32m  showtool = "!f() { git difftool ${1:-HEAD}^ ${1:-HE[m 
                                                       [1;32mAD};}; f"[m                                             
                                                       [1;32m  added = difftool --cached[m                           
                                                                                                             
                                                       [1;32m[diff][m                                                
                                                       [1;32m  tool = icdiff[m                                       
                                                                                                             
[1;31m    # View abbreviated SHA, description, and history [m  [1;32m[difftool][m                                            
[1;31mgraph of the latest 20 commits[m                                                                               
[1;31m    l = log --pretty=oneline -n 20 --graph --abbrev-c[m  [1;32m  prompt = false[m                                      
[1;31mommit[m                                                                                                        
                                                                                                             
[1;31m    # Show the diff between the latest commit and the[m  [1;32m[difftool "icdiff"][m                                   
[1;31m current state[m                                                                                               
[1;31m    d = !"git diff-index --quiet HEAD -- || clear; gi[m  [1;32m  cmd = /usr/local/bin/icdiff --line-numbers $LOCAL $[m 
[1;31mt --no-pager diff --patch-with-stat"[m                   [1;32mREMOTE[m                                                
                                                                                                             
[1;31m    # `git di $number` shows the diff between the sta[m  [1;32m[pager][m                                               
[1;31mte `$number` revisions ago and the current state[m                                                             
[1;31m    di = !"d() { git diff --patch-with-stat HEAD~$1; [m  [1;32m  difftool = true[m                                     
[1;31m}; git diff-index --quiet HEAD -- || clear; d"[m                                                               
[7;31m [m                                                                                                            
[1;31m    # Pull in remote changes for the current reposito[m                                                        
[1;31mry and all its submodules[m                                                                                    
[1;31m    p = !"git pull; git submodule foreach git pull or[m                                                        
[1;31migin master"[m                                                                                                 
[7;31m [m                                                                                                            
[1;31m    # Clone a repository including all submodules[m                                                            
[1;31m    c = clone --recursive[m                                                                                    
[7;31m [m                                                                                                            
[1;31m    # Switch to a branch, creating it if necessary[m                                                           
[1;31m    go = "!f() { git checkout -b \"$1\" 2> /dev/null [m                                                        
[1;31m|| git checkout \"$1\"; }; f"[m                                                                                
[7;31m [m                                                                                                            
[1;31m    # List aliases[m                                                                                           
[1;31m    aliases = config --get-regexp alias[m                                                                      
[7;31m [m                                                                                                            
[1;31m    # Amend the currently staged files to the latest [m                                                        
[1;31mcommit[m                                                                                                       
[1;31m    amend = commit --amend --reuse-message=HEAD[m                                                              
[7;31m [m                                                                                                            
[1;31m    # Credit an author on the latest commit[m                                                                  
[1;31m    credit = "!f() { git commit --amend --author \"$1[m                                                        
[1;31m <$2>\" -C HEAD; }; f"[m                                                                                       
                                                                                                             
[user]                                                 [user]                                                
[7;31m [m                                                                                                            
  name = "Andrew Kuttor"                                 name = "Andrew Kuttor"                              
  email = "andrew.kuttor@gmail.com"                      email = "andrew.kuttor@gmail.com"                   
                                                                                                             
[advice]                                               [advice]                                              
[7;31m [m                                                                                                            
  pushNonFastForward = false                             pushNonFastForward = false                          
  statusHints = false                                    statusHints = false                                 
                                                                                                             
[apply]                                                [apply]                                               
                                                                                                             
[0;34m---[m                                                    [0;34m---[m                                                   
                                                                                                             
  renames = copies                                       renames = copies                                    
  mnemonicprefix = true                                  mnemonicprefix = true                               
                                                                                                             
[push]                                                 [push]                                                
[7;31m [m                                                                                                            
  default = t[1;31mra[mc[1;33mk[ming                                     default = [1;32mma[mtc[1;33mh[ming                                  
                                                                                                             
[merge]                                                [merge]                                               
[7;31m [m                                                                                                            
  stat = true                                            stat = true                                         
  merge = true                                           merge = true                                        
                                                                                                             
[rerere]                                               [rerere]                                              
[7;31m [m                                                                                                            
  enabled = true                                         enabled = true                                      
                                                       [1;32m  autoupdate = 1[m                                      
                                                                                                             
[credential]                                           [credential]                                          
[7;31m  [m                                                                                                           
helper = osxkeychain                                   [7;32m  [mhelper = osxkeychain                                
[7;31m [m                                                                                                            
[1;31m # --------------------------------------------------[m                                                        
[1;31m--------------------------[m                                                                                   
[1;31m # Coloring Output[m                                                                                           
[1;31m # --------------------------------------------------[m                                                        
[1;31m--------------------------[m                                                                                   
                                                                                                             
[color]                                                [color]                                               
[7;31m [m                                                                                                            
  ui = auto                                              ui = auto                                           
[7;31m [m                                                                                                            
[1;31m[color "branch"][m                                                                                             
[1;31m        current = bold reverse red[m                                                                           
[1;31m        local = reverse green[m                                                                                
[1;31m        remote = reverse cyan[m                                                                                
[1;31m        plain = reverse white[m                                                                                
[7;31m [m                                                                                                            
[1;31m[color "diff"][m                                                                                               
[1;31m        plain = white[m                                                                                        
[1;31m        meta = dim reverse white[m                                                                             
[1;31m        frag = reverse yellow[m                                                                                
[1;31m        func = cyan[m                                                                                          
[1;31m        old = red[m                                                                                            
[1;31m        new = green[m                                                                                          
[1;31m        commit = ul yellow[m                                                                                   
[1;31m        whitespace = black white[m                                                                             
[7;31m [m                                                                                                            
[1;31m[color "decorate"][m                                                                                           
[1;31m        branch = reverse green[m                                                                               
[1;31m        remoteBranch = reverse cyan[m                                                                          
[1;31m        tag = reverse yellow[m                                                                                 
[1;31m        stash = reverse yellow[m                                                                               
[1;31m        HEAD = bold reverse red[m                                                                              
[7;31m [m                                                                                                            
[1;31m[color "status"][m                                                                                             
[1;31m        header = dim reverse white[m                                                                           
[1;31m        updated = bold yellow # AKA added==[m                                                                  
[1;31m        changed = bold magenta[m                                                                               
[1;31m        untracked = bold cyan[m                                                                                
[1;31m        unmerged = bold blue[m                                                                                 
[1;31m        nobranch = bold reverse blink red[m                                                                    
                                                                                                             
# ---------------------------------------------------  # --------------------------------------------------- 
--------------------------                             --------------------------                            
# Git Repo Servers                                     # Git Repo Servers                                    
# ---------------------------------------------------  # --------------------------------------------------- 
--------------------------                             --------------------------                            
                                                                                                             
[0;34m/var/folders/bw/r1v_qtgn29x6mmwfj01b__3r0000gp/T//E4FTxa_zshrc[m [0;34mzshrc[m                                                 
export MANPAGER='bat'                                  export MANPAGER='bat'                                 
export BAT_CONFIG_PATH="${DOTFILES}/bat.conf"          export BAT_CONFIG_PATH="${DOTFILES}/bat.conf"         
                                                                                                             
# EnhancedCD                                           # EnhancedCD                                          
export ENHANCD_DOT_SHOW_FULLPATH=1                     export ENHANCD_DOT_SHOW_FULLPATH=1                    
[1;31mexport ENHANCD_FILTER="/usr/local/bin/fzf:fzf-tmux:fz[m  [1;32mexport ENHANCD_FILTER="fzy"[m                           
[1;31mf:percol"[m                                                                                                    
[7;31m [m                                                                                                            
[7;31m [m                                                                                                            
[1;31m# ---------------------------------------------------[m                                                        
[1;31m-------------------------[m                                                                                    
[1;31m# Powertool configs, i.e. FZ, FZF[m                                                                            
[1;31m# ---------------------------------------------------[m                                                        
[1;31m--------------------------[m                                                                                   
[7;31m [m                                                                                                            
[1;31m# Source FZF[m                                                                                                 
[1;31m[[ -f "${HOME}/.local/.fzf.zsh" ]] && source "${HOME}[m                                                        
[1;31m/.local/.fzf.zsh"[m                                                                                            
[7;31m [m                                                                                                            
[1;31m# Use ~~ as the trigger sequence instead of the defau[m                                                        
[1;31mlt **[m                                                                                                        
[1;31mexport FZF_COMPLETION_TRIGGER='~~'[m                                                                           
[7;31m [m                                                                                                            
[1;31m# Options to fzf command[m                                                                                     
[1;31mexport FZF_DEFAULT_OPTS='--height 40% --layout=revers[m                                                        
[1;31me --border --color dark,hl:33,hl+:37,fg+:235,bg+:136,[m                                                        
[1;31mfg+:254'[m                                                                                                     
[7;31m [m                                                                                                            
[1;31m# Use fd (https://github.com/sharkdp/fd) instead of t[m                                                        
[1;31mhe default find[m                                                                                              
[1;31m# command for listing path candidates.[m                                                                       
[1;31m# - The first argument to the function ($1) is the ba[m                                                        
[1;31mse path to start traversal[m                                                                                   
[1;31m# - See the source code (completion.{bash,zsh}) for t[m                                                        
[1;31mhe details.[m                                                                                                  
[1;31mfunction _fzf_compgen_path() {[m                                                                               
[1;31m    fd --hidden --follow --exclude ".git" . "$1"[m                                                             
[1;31m}[m                                                                                                            
[7;31m [m                                                                                                            
[1;31m# Use fd to generate the list for directory completio[m                                                        
[1;31mn[m                                                                                                            
[1;31mfunction _fzf_compgen_dir() {[m                                                                                
[1;31m    fd --type d --hidden --follow --exclude ".git" . [m                                                        
[1;31m"$1"[m                                                                                                         
[1;31m}[m                                                                                                            
                                                                                                             
# Sources                                              # Sources                                             
source "${DOTFILES}/aliases"                           source "${DOTFILES}/aliases"                          
source "${DOTFILES}/functions"                         source "${DOTFILES}/functions"                        
source "${DOTFILES}/keybindings"                       source "${DOTFILES}/keybindings"                      
[0;34m---[m                                                    [0;34m---[m                                                   
source "${DOTFILES}/zsh_autoloads"                     source "${DOTFILES}/zsh_autoloads"                    
source "${DOTFILES}/zsh_completions"                   source "${DOTFILES}/zsh_completions"                  
source "${DOTFILES}/zsh_history"                       source "${DOTFILES}/zsh_history"                      
source "${DOTFILES}/zsh_setopts"                       source "${DOTFILES}/zsh_setopts"                      
                                                                                                             
                                                       [7;32m [m                                                     
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh                 [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh                
[7;31m [m                                                                                                            
