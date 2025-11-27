#!/bin/bash

# Define the dotfiles directory (where you cloned the repo)
DOTFILES="$HOME/projects/dotfiles"

NVIM_BACKUP="$HOME/.config/nvim.bkp"
NVIM_CFG="$HOME/.config/nvim"
# configs for which distro to use. Currently supported nvchad and lazyvim
NVIM_DISTRO="lazyvim"

FISH_BACKUP="$HOME/.config/fish.bkp"
FISH_CFG="$HOME/.config/fish"

IDEA_VIM_CFG="$HOME/.ideavimrc"
IDEA_VIM_BKP="$HOME/.ideavimrc.bkp"

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
ln -sf "$DOTFILES/nvim-$NVIM_DISTRO/"* "$NVIM_CFG"/
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


# === IDEAVIM ===

  # remove existing bkp file
  if [ -f "$IDEA_VIM_BKP" ]; then
    echo -e "\tRemoving existing backup file"
    rm -f "$IDEA_VIM_BKP" || {
      echo -e "\tError: Failed to remove existing backup at $IDEA_VIM_BKP"
      exit 1
    }
  fi

  # backup existing config file
  if [ -f "$IDEA_VIM_CFG" ]; then
    echo -e "\tDoing backup of existing ideavimrc file"
    mv -f "$IDEA_VIM_CFG" "$IDEA_VIM_BKP"
    echo -e "\tExisting ideavimrc file moved to $IDEA_VIM_BKP"
  fi


echo -e "\tSetting up ideavimrc..."
ln -sf "$DOTFILES/.ideavimrc" "$IDEA_VIM_CFG"
echo -e "\tsimlinks for ideavim created"

# ==== MacOS specific ====
uname=$(uname)
if [[ "$uname" == "Darwin" ]]; then
  . "$DOTFILES/install/macos.sh"
fi

# Tmux
# ln -sf "$DOTFILES/tmux/.tmux.conf" ~/.tmux.conf

echo "Done! Your config files have been linked."
