function fzfv --wraps='nvim (fzf -m --preview="bat --color=always {}")' --description 'alias fzfv=nvim (fzf -m --preview="bat --color=always {}")'
  nvim (fzf -m --preview="bat --color=always {}") $argv; 
end
