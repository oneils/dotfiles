#!/bin/bash

# Define the dotfiles directory (where you cloned the repo)
DOTFILES="$HOME/projects/dotfiles"

NVIM_BACKUP="$HOME/.config/nvim.bkp"
NVIM_CFG="$HOME/.config/nvim"
# configs for which distro to use. Currently supported nvchad and lazyvim
NVIM_DISTRO="lazyvim"

FISH_BACKUP="$HOME/.config/fish.bkp"
FISH_CFG="$HOME/.config/fish"

KITTY_BACKUP="$HOME/.config/kitty.bkp"
KITTY_CFG="$HOME/.config/kitty"

GHOSTTY_BACKUP="$HOME/.config/ghostty.bkp"
GHOSTTY_CFG="$HOME/.config/ghostty"

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


# ==== Kitty ====
echo "Setting up Kitty config..."

# remove existing bkp folder
if [ -d "$KITTY_BACKUP" ]; then
  echo -e "\tRemoving existing backup directory"
  rm -rf "$KITTY_BACKUP" || {
    echo -e "\tError: Failed to remove existing backup at $KITTY_BACKUP"
    exit 1
  }
fi

# backup existing configs folder
if [ -d "$KITTY_CFG" ]; then
  echo -e "\tDoing backup of existing Kitty config directory"
  mv -f "$KITTY_CFG" "$KITTY_BACKUP"
  echo -e "\tExisting Kitty configs folder moved to $KITTY_BACKUP"
fi

echo -e "\tSetting up Kitty config..."
mkdir -p "$KITTY_CFG"
ln -sf "$DOTFILES/kitty/"* "$KITTY_CFG"/
echo -e "\tsimlinks for Kitty created"


# ==== Ghostty ====
echo "Setting up Ghostty config..."

# remove existing bkp folder
if [ -d "$GHOSTTY_BACKUP" ]; then
  echo -e "\tRemoving existing backup directory"
  rm -rf "$GHOSTTY_BACKUP" || {
    echo -e "\tError: Failed to remove existing backup at $GHOSTTY_BACKUP"
    exit 1
  }
fi

# backup existing configs folder
if [ -d "$GHOSTTY_CFG" ]; then
  echo -e "\tDoing backup of existing Ghostty config directory"
  mv -f "$GHOSTTY_CFG" "$GHOSTTY_BACKUP"
  echo -e "\tExisting Ghostty configs folder moved to $GHOSTTY_BACKUP"
fi

echo -e "\tSetting up Ghostty config..."
mkdir -p "$GHOSTTY_CFG"
ln -sf "$DOTFILES/ghosty/"* "$GHOSTTY_CFG"/
echo -e "\tsimlinks for Ghostty created"


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
ln -s "$DOTFILES/.ideavimrc" "$IDEA_VIM_CFG"
echo -e "\tsimlinks for ideavim created"

# ==== MacOS specific ====
uname=$(uname)
if [[ "$uname" == "Darwin" ]]; then
  . "$DOTFILES/install/macos.sh"
fi

# ==== Tmux ====
echo "Setting up Tmux config..."
ln -sf "$DOTFILES/.tmux.conf" "$HOME/.tmux.conf"
echo -e "\tsymlink for Tmux created"

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo -e "\tInstalling TPM (Tmux Plugin Manager)..."
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
  echo -e "\tTPM installed"
else
  echo -e "\tTPM already installed, skipping"
fi

echo "Done! Your config files have been linked."
