#!/bin/bash
# simple version for install base tools and update/deploy dotfiles.
# Note: by using stow command implies that files must be removed previously.
# TODO:
# - option for automatically remove files to be deployed
# - option to use current user files as stow.

## Catch Ctrl+C - exit completely
trap 'echo -e "\n\nCancelled by user, exiting..."; exit 130' INT

# simple version for update and deploy dotfiles.
detect_os() {
  if [ "$(uname)" = "Darwin" ]; then
    echo "mac"
  else
    if command -v lsb_release &>/dev/null; then
      echo $(lsb_release -i | cut -f2)
    else
      [ -f /etc/debian_version ] && echo "debian" || echo "linux"
    fi
  fi
}
OS=$(detect_os)
echo "Detected OS: $OS"

if [ "$OS" = "mac" ] && ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# ==== PARTE 1: PAQUETES ====
while true; do
  read -p "Install packages (git, curl, stow, etc.)? [Y/n] " yn
  case $yn in
  [Yy]*)
    INSTALL_PKG=true
    break
    ;;
  [Nn]*)
    INSTALL_PKG=false
    break
    ;;
  *) echo "Please answer yes or no." ;;
  esac
done

if [ "$INSTALL_PKG" = "true" ]; then
  # Package lists
  PKG_COMMON="git curl stow wget tmux fastfetch neovim"
  PKG_MAC="rustup"
  PKG_DEBIAN="python3 python3-pip build-essential"
  PKG_NEON="python3 python3-pip"

  # Install by OS
  case $OS in
  mac)
    echo "Installing via brew: $PKG_COMMON $PKG_MAC"
    brew install $PKG_COMMON $PKG_MAC
    ;;
  Debian | Ubuntu)
    echo "Installing via apt: $PKG_COMMON $PKG_DEBIAN"
    sudo apt update
    sudo apt install -y $PKG_COMMON $PKG_DEBIAN
    ;;
  Neon)
    echo "Installing via pkcon: $PKG_COMMON $PKG_NEON"
    sudo pkcon install -y $PKG_COMMON $PKG_NEON
    ;;
  esac
fi

# ==== PARTE 2: HERRAMIENTAS CLI ====
while true; do
  read -p "Install development tools (oh-my-zsh, nvm, pyenv )? [Y/n] " yn
  case $yn in
  [Yy]*)
    INSTALL_TOOLS=true
    break
    ;;
  [Nn]*)
    INSTALL_TOOLS=false
    break
    ;;
  *) echo "Please answer yes or no." ;;
  esac
done

if [ "$INSTALL_TOOLS" = "true" ]; then
  echo "checking tools:"

  #OH MY ZSH
  if [ -f ~/.oh-my-zsh/oh-my-zsh.sh ]; then
    echo "   - OH MY ZSH ................found"
  else
    while true; do
      read -p "OH MY ZSH not installed: do you want to install it: [Y/n}" yn
      case $yn in
      [Yy]*)
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        break
        ;;
      [Nn]*)
        echo "skipping OH MY ZSH installation"
        break
        ;;
      *)
        echo "Please answer yes or no."
        ;;
      esac
    done
  fi

  #OH MY ZSH - POWERLEVEL10K
  if [ -f ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme ]; then
    echo "   - Powerlevel10K.............found"
  else
    while true; do
      read -p "Powerlevel10K not installed: do you want to install it: [Y/n}" yn
      case $yn in
      [Yy]*)
        ZSH_CUSTOM=~/.oh-my-zsh/custom
        git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
        break
        ;;
      [Nn]*)
        echo "skipping Powerlevel10K installation"
        break
        ;;
      *)
        echo "Please answer yes or no."
        ;;
      esac
    done
  fi

  #Node Version Manager
  # if [ -f ~/.nvm/nvm.sh ]; then
  if [ $(which nvm | grep 'not found' | wc -l) = 1 ]; then
    echo 'not installed'
    while true; do
      read -p "nvm not installed: do you want to install it: [Y/n}" yn
      case $yn in
      [Yy]*)
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash
        break
        ;;
      [Nn]*)
        echo "skipping nvm installation"
        break
        ;;
      *)
        echo "Please answer yes or no."
        ;;
      esac
    done
  else
    echo "   - nvm.......................found"
  fi

  #PyENV
  if [ -f ~/.pyenv/bin/pyenv ]; then
    echo "   - pyenv.....................found"
  else
    while true; do
      read -p "pyenv not installed: do you want to install it: [Y/n}" yn
      case $yn in
      [Yy]*)
        git clone https://github.com/pyenv/pyenv.git ~/.pyenv
        echo 'export PYENV_ROOT="$HOME/.pyenv"' >>~/.zshrc
        echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >>~/.zshrc
        echo "Luego seleccionar versiones de python con"
        echo " pyenv global system"
        echo " pyenv local 2.17.6"
        echo " pyenv local 3.8.0"
        echo "\nPara Virtual Enviroment usar pipenv"
        echo "Instalar pipenv con pip/pip3 install pipenv"
        echo "pipenv install"
        break
        ;;
      [Nn]*)
        echo "skipping pyenv installation"
        break
        ;;
      *)
        echo "Please answer yes or no."
        ;;
      esac
    done
  fi

  # RUST - RUSTUO (version manager)
  #if [ $(which rustup | grep 'not found' | wc -l) = 1 ]; then
  #  while true; do
  #    read -q "Install Rust Version Manager - RUSTUP[Y/n]" yn
  #    case $yn in
  #    [Yy]*)
  #      curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  #      break
  #      ;;
  #    [Nn]*)
  #      echo "skipping rustup installation"
  #      break
  #      ;;
  #    *)
  #      echo "Please answer yes or no."
  #      ;;
  #    esac
  #  done
  #else
  #  echo "   - rustup....................found"
  #fi

fi

# ==== PARTE 3: STOW ====
while true; do
  read -p "Deploy dotfiles with stow? [Y/n] " yn
  case $yn in
  [Yy]*)
    INSTALL_DOTFILES=true
    break
    ;;
  [Nn]*)
    INSTALL_DOTFILES=false
    break
    ;;
  *) echo "Please answer yes or no." ;;
  esac
done

if [ "$INSTALL_DOTFILES" = "true" ]; then
  # Using stow to manage installation of config files
  # if a file named ".nostow" is present, that folder
  # will not be installed
  echo "\n\nInstalling dotfiles."
  cd ~/.dotfiles/
  for i in $(ls | egrep -v "bin|readme|LICENSE"); do
    # find if folder not needed to be processed
    FILE=~/.dotfiles/$i/.nostow
    if [ ! -f "$FILE" ]; then
      echo "   - dotfiles of $i to be deployed.... \n"
      stow $i
    else
      echo "   - dotfiles of $i to be ignored (.nostow file present)  \n"
    fi
  done
fi

echo "Done!"
