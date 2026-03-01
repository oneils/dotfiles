#!/bin/bash

if ! command -v brew &>/dev/null; then
  echo "Homebrew is not installed. Please install Homebrew first."
  echo "Run: /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
  exit 1
fi

brew bundle install --file="$(dirname "$0")/Brewfile"
