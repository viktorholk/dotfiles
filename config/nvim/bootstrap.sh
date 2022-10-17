#!/bin/bash

echo "Bootstrapping ..."

# Node packages
npm install -g neovim typescript typescript-language-server vscode-langservers-extracted cssmodules-language-server @fsouza/prettierd write-good

# Ruby gems
gem install neovim solargraph

# Python packages
python3 -m pip install black isort flake8

# Dotnet tools
dotnet tool install --global csharp-ls
