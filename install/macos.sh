#!/bin/bash

AEROSPACE_BACKUP="$HOME/.config/aerospace.bkp"
AEROSPACE_CFG="$HOME/.config/aerospace"

echo -e "\n"
echo "Setting up macOs specific configs"
echo -e "\n"

echo "Setting up Aerospace configs"
# Aerospace tilining manager for Mac

 if [ -d "$AEROSPACE_BACKUP" ]; then
   echo -e "\tRemoving existing backup directory"
   rm -rf "$AEROSPACE_BACKUP" || {
     echo -e "\tError: Failed to remove existing backup at $AEROSPACE_BACKUP"
     exit 1
   }
 fi
# backup existing configs folder
if [ -d "$AEROSPACE_CFG" ]; then
  echo -e "\tDoing backup of existing aerospace config directory"
  mv "$AEROSPACE_CFG" "$AEROSPACE_BACKUP"
  echo -e "\tExisting aerospace configs folder moved to $AEROSPACE_BACKUP"
fi


 echo -e "\tsetting up configs for Aerospace tilining manager"
 mkdir -p "$AEROSPACE_CFG"; 
 ln -sf "$DOTFILES/aerospace/"* $AEROSPACE_CFG
 echo -e "\tsimlinks for aerospace created"
