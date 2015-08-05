#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# 1. install & config npm
apt-get -y install npm
ln -s /usr/bin/nodejs /usr/bin/node
npm config set registry http://registry.npm.taobao.org
npm install -g npm

# 2. install yeoman, bower, grunt-cli & generator-angular
npm install -g yo generator-angular bower grunt-cli 
yo --version && bower --version && grunt --version

# 3. install ruby 
apt-get -y install rubygems-integration
gem sources -l | grep http | xargs gem sources --remove
gem sources -a https://ruby.taobao.org/
gem sources -l

# 4. yo angular
apt-get -y install autoconf nasm git

ORIG_USER=`who am i | awk '{print $1}'`

chown -R $ORIG_USER:$ORIG_USER $HOME

echo
echo OK. npm, yeoman, bower, grunt-cli, ruby was installed successfully. 
echo Now please start scaffold a new project by issuing command \"yo angular\".
