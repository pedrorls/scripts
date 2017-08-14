#!/bin/bash

function update {
    echo "Updating Packages"
    if ! apt update
    then
        echo "Some error ocurred, sorry"
        exit 1
    fi
   echo "Packages updated successfully"
}

echo "Installing pip"
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
echo "pip installed"

echo "Installing virtualenv & virtualenvwrapper"
pip install virtualenv virtualenvwrapper
rm -rf ~/get-pip.py ~/.cache/pip
echo "virtualenvwrapper & virtualenv installed"

echo "Setting up virtual enviroment"
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
echo -e "\n# virtualenv and virtualenvwrapper" >> ~/.bashrc
echo "export WORKON_HOME=$HOME/.virtualenvs" >> ~/.bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc
source ~/.bashrc
echo "virtual enviroment setted"

update