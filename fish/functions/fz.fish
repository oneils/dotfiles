function fz --wraps='nvim (fzf -m --preview="bat --color=always {}")' --description 'alias fz=nvim (fzf -m --preview="bat --color=always {}")'
  nvim (fzf -m --preview="bat --color=always {}") $argv; 
end
