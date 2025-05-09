#!/bin/bash

FORMULAS_FILE="./brew_formulas.txt"

echo "Installing required tools via brew"


# Check if Homebrew is installed
if ! command -v brew &>/dev/null; then
    echo "Homebrew is not installed. Please install Homebrew first."
    echo "Run: /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
    exit 1
fi

# Check if the formulas file exists
if [ ! -f "$FORMULAS_FILE" ]; then
    echo "Error: Formulas file not found at $FORMULAS_FILE"
    exit 1
fi

is_installed() {
    brew list "$1" &>/dev/null
    return $?
}

echo "Installing formulas from $FORMULAS_FILE..."
total_formulas=0
installed_count=0
already_installed_count=0
failed_count=0

while IFS= read -r formula || [ -n "$formula" ]; do
    # Skip empty lines and comments
    if [[ -z "$formula" || "$formula" =~ ^# ]]; then
        continue
    fi
    
    total_formulas=$((total_formulas + 1))
    
    # Check if the formula is already installed
    if is_installed "$formula"; then
        echo "✓ $formula is already installed"
        already_installed_count=$((already_installed_count + 1))
    else
        echo "Installing $formula..."
        if brew install "$formula"; then
            echo "✓ $formula installed successfully"
            installed_count=$((installed_count + 1))
        else
            echo "✗ Failed to install $formula"
            failed_count=$((failed_count + 1))
        fi
    fi
done < "$FORMULAS_FILE"

# Print summary
echo ""
echo "Installation summary:"
echo "Total formulas: $total_formulas"
echo "Newly installed: $installed_count"
echo "Already installed: $already_installed_count"
echo "Failed: $failed_count"

if [ "$failed_count" -eq 0 ]; then
    echo "All formulas installed successfully!"
else
    echo "Some formulas failed to install. Please check the output above for details."
    exit 1
fi
