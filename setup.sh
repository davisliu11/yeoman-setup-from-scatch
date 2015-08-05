#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# 1. install & config npm
apt-get install npm
ln -s /usr/bin/nodejs /usr/bin/node
npm config set registry http://registry.npm.taobao.org
npm install -g npm

# 2. install yeoman, bower, grunt-cli & generator-angular
npm install -g yo generator-angular bower grunt-cli 
yo --version && bower --version && grunt --version

# 3. install ruby 
apt-get install rubygems-integration
gem sources -l | grep http | xargs gem sources --remove
gem sources -a https://ruby.taobao.org/
gem sources -l

# 4. yo angular
apt-get install autoconf nasm git

echo Install completed. Now please input "yo angular" to start scaffolding a new project.
echo Please be kindly reminded that it may cost a long time to download the dependencies.
