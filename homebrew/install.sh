#!/bin/zsh
source 'zsh/functions.sh'
log_header 'Installing Homebrew'

# Install Homebrew only if missing
if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew not found. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew is already installed"
fi

# Path to the Homebrew binary you expect (Apple Silicon)
BREW_BIN="/opt/homebrew/bin/brew"

# Add brew shellenv to zprofile only if missing
ZPROFILE="$HOME/.zprofile"
BREW_EVAL="eval \"\$(${BREW_BIN} shellenv)\""

if ! grep -Fxq "$BREW_EVAL" "$ZPROFILE" 2>/dev/null; then
  echo "Adding Homebrew shellenv to $ZPROFILE"
  echo "$BREW_EVAL" >> "$ZPROFILE"
else
  echo "Homebrew shellenv already present in $ZPROFILE"
fi

# Evaluate in current shell only if brew exists
if [ -x "$BREW_BIN" ]; then
  eval "$(${BREW_BIN} shellenv)"
fi
