#!/bin/bash

# Define the dotfiles directory (where you cloned the repo)
DOTFILES="$HOME/projects/dotfiles"

NVIM_BACKUP="$HOME/.config/nvim.bkp"
NVIM_CFG="$HOME/.config/nvim"

FISH_BACKUP="$HOME/.config/fish.bkp"
FISH_CFG="$HOME/.config/fish"

# Create symbolic links for your configs
echo "Creating symlinks..."

# Neovim
echo "Setting up Neovim config..."


# remove existing bkp folder
 if [ -d "$NVIM_BACKUP" ]; then
   echo -e "\tRemoving existing backup directory"
   rm -rf "$NVIM_BACKUP" || {
     echo -e "\tError: Failed to remove existing backup at $NVIM_BACKUP"
     exit 1
   }
 fi

# backup existing configs folder
if [ -d "$NVIM_CFG" ]; then
  echo -e "\tDoing backup of existing nvim config directory"
  mv -f "$NVIM_CFG" "$NVIM_BACKUP" 
  echo -e "\tExisting nvim configs folder moved to $NVIM_BACKUP"
fi

echo -e "\tSetting up Neovim config..."
mkdir -p "$NVIM_CFG"
ln -sf "$DOTFILES/nvim/"* "$NVIM_CFG"/
echo -e "\tsimlinks for Neovim created"


# ==== Fish ====
echo "Setting up Fish config..."


# remove existing bkp folder
 if [ -d "$FISH_BACKUP" ]; then
   echo -e "\tRemoving existing backup directory"
   rm -rf "$FISH_BACKUP" || {
     echo -e "\tError: Failed to remove existing backup at $FISH_BACKUP"
     exit 1
   }
 fi

# backup existing configs folder
if [ -d "$FISH_CFG" ]; then
  echo -e "\tDoing backup of existing Fish config directory"
  mv -f "$FISH_CFG" "$FISH_BACKUP" 
  echo -e "\tExisting Fish configs folder moved to $FISH_BACKUP"
fi

echo -e "\tSetting up Fish config..."
mkdir -p "$FISH_CFG"
ln -sf "$DOTFILES/fish/"* "$FISH_CFG"/
echo -e "\tsimlinks for Fish created"




# ==== MacOS specific ====
uname=$(uname)
if [[ "$uname" == "Darwin" ]]; then
  . "$DOTFILES/install/macos.sh"
fi

# Tmux
# ln -sf "$DOTFILES/tmux/.tmux.conf" ~/.tmux.conf

echo "Done! Your config files have been linked."
