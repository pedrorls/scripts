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

echo "Installing dependencies"
sudo apt install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev nodejs
echo "Dependencies installed"

echo "Installing rbenv"
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL


git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

echo "Installing ruby 2.4"
rbenv install 2.4.0
rbenv global 2.4.0
ruby -v
echo "ruby installed"

echo "Installing bundler"
gem install bundler
echo "Budler installed"

echo "Instaling rails 5.1.1"
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
gem install rails -v 5.1.1
rbenv rehash
echo "rails installed"