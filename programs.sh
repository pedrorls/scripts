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

echo "Installing sublime text 3"
echo "Adding ST3 Repository"
add-apt-repository ppa:webupd8team/sublime-text-3 -y
update
apt install sublime-text-installer -y
echo "ST3 installed successfully"

echo "Installing Inkscape"
apt install inkscape -y
echo "Inkscape installed successfully"

update

echo "Installing gdebi"
apt install gdebi -y
echo "Installed gdebi"

echo "installing SPC"
apt-get install software-properties-common -y
echo "SPC installed"

echo "installing elementary tweaks"
echo "Adding package"
add-apt-repository ppa:philip.scott/elementary-tweaks -y
update
apt-get install elementary-tweaks -y
echo "Elementary tweaks installed"

echo "Installing TLP"
apt install tlp tlp-rdw -y
echo "TLP installed"

echo "Installing redshift"
apt install redshift redshift-gtk -y
echo "Redshift installed"

echo "Installing VLC"
apt install vlc -y
echo "VLC installed"

echo "Installing firefox"
apt install firefox -y
echo "Firefox installed"

echo "Installing Corebird"
echo "adding package"
add-apt-repository ppa:ubuntuhandbook1/corebird -y
update
apt install corebird
echo "Corebird installed"

echo "Installing synapse"
apt install synapse -y
echo "Synapse installed"

echo "Installing Spotify"
echo "Adding package"
sh -c "echo 'deb http://repository.spotify.com stable non-free' >> /etc/apt/sources.list.d/spotify.list"
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
update
apt install spotify-client -y
echo "Spotify installed"

echo "Installing Skype"
wget https://repo.skype.com/latest/skypeforlinux-64.deb -O skype.deb
dpkg -i skype.deb
echo "Skype installed"

echo "Installing WPS"
wget http://kdl1.cache.wps.com/ksodl/download/linux/a21//wps-office_10.1.0.5707~a21_amd64.deb -O wps-office.deb
wget http://kdl.cc.ksosoft.com/wps-community/download/fonts/wps-office-fonts_1.0_all.deb -O web-office-fonts.deb
dpkg -i wps-office*.deb
echo "WPS installed"

echo "Installing Keylock-indicator"
echo "Adding Repository"
add-apt-repository ppa:tsbarnes/indicator-keylock
update
apt install indicator-keylock
echo "indicator-keylock installed"

echo "CLEANING ..."
apt autoremove -y
apt autoclean -y
echo "CLEANED !!!"

