#!/usr/bin/env bash

appname=rtqna
sharedfolder="/vagrant/$appname/.meteor/local"
nativefolder="/home/vagrant/.meteor-local/$appname"

if [ ! -d /home/vagrant/.meteor ]; then
    apt-get update
    apt-get install -y curl git

    su -c "curl https://install.meteor.com | /bin/sh" vagrant
    ln -s /home/vagrant/.meteor/tools/latest/bin/npm /usr/local/bin/npm
    ln -s /home/vagrant/.meteor/tools/latest/bin/node /usr/local/bin/node

    /usr/local/bin/npm install -g meteorite

    mkdir -p $nativefolder
    chown -R vagrant:vagrant $nativefolder
    echo "mountpoint -q $sharedfolder" >> ~vagrant/.bashrc
    echo "if [ \$? -eq 1 ]; then" >> ~vagrant/.bashrc
    echo "    sudo mount --bind $nativefolder $sharedfolder" >> ~vagrant/.bashrc
    echo "fi" >> ~vagrant/.bashrc

    if [ ! -d $sharedfolder ]; then
        mkdir -p $sharedfolder
    fi

    mount --bind $nativefolder $sharedfolder
fi