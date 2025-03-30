#!/bin/bash

echo "🚀 Bootstrapping Ani's Terminal Universe..."

# Install Homebrew if not installed
if ! command -v brew &>/dev/null; then
  echo "🍺 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install terminal essentials
brew install figlet lolcat git

# Clone zsh plugin dependencies
mkdir -p ~/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

# Copy .zshrc if not present
if [ ! -f ~/.zshrc ]; then
  echo "🔗 Linking .zshrc from dotfiles"
  cp ./zshrc ~/.zshrc
fi

# Reload shell
echo "🔁 Reloading your ZSH setup..."
source ~/.zshrc

echo "✅ Ani Terminal Activated. Welcome back, Operator 🧠🟢"
