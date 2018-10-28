#!/usr/bin/env bash

set -o errexit

OS_VERSION="$(lsb_release -rs)"
EXPECTED_OS_VERSION='18.04'

if [ ${OS_VERSION} \< ${EXPECTED_OS_VERSION} ]; then
  echo "Unexpected OS version: expected=${EXPECTED_OS_VERSION}, actual=${OS_VERSION}"
  exit 1
fi

# Make sure that PATH variable includes user's private bin directories.
echo 'export PATH="$HOME/bin:$HOME/.local/bin:$PATH"' >> ~/.bashrc

### Upgrade the system pip.
sudo -H pip3 install -U pip
hash -r

### Install Ansible.
pip3 install --user ansible
source ~/.bashrc




# We need to install a proper version of Python PIP to be able to properly install Ansible with support for Python3.

### Update the repositories and install some common required dependencies.
#sudo apt-get -y update
#sudo apt-get install -y software-properties-common
#
#sudo apt-get install -y curl
#sudo apt-get intall -y wget
#
#### Install Git.
#sudo add-apt-repository -y ppa:git-core/ppa
#sudo apt-get install -y git
#
#### Install base ZSH.
#sudo apt-get install -y zsh
#sudo chsh -s $(which zsh)

### Make bash to load additional .bashrc files to avoid ~/.bashrc bloating.
#ADDITIONAL_RESOURCES_DIR="${HOME}/.bashrc.d"
#ADDITIONAL_RESOURCES_FILE_NAME_PATTERN='*.sh'
#mkdir ${ADDITIONAL_RESOURCES_DIR}
#chmod 700 ${ADDITIONAL_RESOURCES_DIR}

#function add_process_additional_resources_dir_entry() {
#  if [ $# -lt 3 ]; then
#    echo "ERROR: invalid number of arguments: expected=3, actual=$#"
#    exit 1
#  fi
#
#  local TARGET_FILE_PATH=$1
#  local ADDITIONAL_RESOURCES_DIR=$2
#  local ADDITIONAL_RESOURCES_FILE_NAME_PATTERN=$3
#
#  echo "if [ -d ${ADDITIONAL_RESOURCES_DIR} ]; then
#    for file in ${ADDITIONAL_RESOURCES_FILE_NAME_PATTERN}; do
#      if [ -r \${file} ]; then
#        source \${file}
#      fi
#    done
#    unset file
#  fi" >> ${TARGET_FILE_PATH}
#}
#
#add_process_additional_resources_dir_entry


### Install pyenv as described at https://github.com/pyenv/pyenv.
#PYENV_ROOT="${HOME}/.pyenv"
#git clone https://github.com/pyenv/pyenv.git ${PYENV_ROOT}
## Configure bash.
#echo "export PYENV_ROOT=${PYENV_ROOT}" >> ~/.bashrc
#echo 'export PATH="${PYENV_ROOT}/bin:$PATH"' >> ~/.bashrc
#echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc
## Configure ZSH.
#echo "export PYENV_ROOT=${PYENV_ROOT}" >> ~/.zshenv
#echo 'export PATH="${PYENV_ROOT}/bin:$PATH"' >> ~/.zshenv
#echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshenv

# Install Ansible.
#pip3 install --user ansible
#
#python3 -m pip install --user --upgrade pip
#python3 -m pip install --user virtualenv
#python3 -m pip install --user ansible
