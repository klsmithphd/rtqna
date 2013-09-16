#!/usr/bin/env bash

appname=rtqna
native_symlink_home="/home/vagrant/.meteor-symlink"

local_sharedfolder="/vagrant/$appname/.meteor/local"
local_nativefolder="$native_symlink_home/$appname-local"

pkg_sharedfolder="/vagrant/$appname/packages"
pkg_nativefolder="$native_symlink_home/$appname-packages"


if [ ! -d /home/vagrant/.meteor ]; then
    apt-get update
    apt-get install -y curl git

    su -c "curl https://install.meteor.com | /bin/sh" vagrant
    ln -s /home/vagrant/.meteor/tools/latest/bin/npm /usr/local/bin/npm
    ln -s /home/vagrant/.meteor/tools/latest/bin/node /usr/local/bin/node

    /usr/local/bin/npm install -g meteorite

    mkdir -p $local_nativefolder
    mkdir -p $pkg_nativefolder
    chown -R vagrant:vagrant $native_symlink_home
    echo "mountpoint -q $local_sharedfolder" >> ~vagrant/.bashrc
    echo "if [ \$? -eq 1 ]; then" >> ~vagrant/.bashrc
    echo "    sudo mount --bind $local_nativefolder $local_sharedfolder" >> ~vagrant/.bashrc
    echo "fi" >> ~vagrant/.bashrc

    echo "mountpoint -q $pkg_sharedfolder" >> ~vagrant/.bashrc
    echo "if [ \$? -eq 1 ]; then" >> ~vagrant/.bashrc
    echo "    sudo mount --bind $pkg_nativefolder $pkg_sharedfolder" >> ~vagrant/.bashrc
    echo "fi" >> ~vagrant/.bashrc

    if [ ! -d $local_sharedfolder ]; then
        mkdir -p $local_sharedfolder
    fi
    if [ ! -d $pkg_sharedfolder ]; then
        mkdir -p $pkg_sharedfolder
    fi

    mount --bind $local_nativefolder $local_sharedfolder
    mount --bind $pkg_nativefolder $pkg_sharedfolder
fi