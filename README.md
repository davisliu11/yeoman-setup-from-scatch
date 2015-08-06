# yeoman-setup-from-scatch
Setup the yeoman work environment for a fresh installed Ubuntu 14.04 Desktop
Please clone the repository and execute the "sudo ./setup.sh" in Ubuntu to automate it.

The script will install npm, yeoman, bower, grunt-cli, ruby gems ... and configure the npm, ruby gem to use mirror repository in China.

setup.sh为Yoman开发环境一键安装脚本(Ubuntu 14.04测试), 请执行sudo ./setup.sh开始安装

## 一. 安装与配置npm
1. 安装npm
 sudo apt-get install npm

2. 创建node的软链接, 因为很多nodejs的工具会直接使用node命令

 sudo ln -s /usr/bin/nodejs /usr/bin/node

3. 加入淘宝的源, 并使用npm config get registry确认源加入成功

 dev@mangdin:~$ npm config set registry http://registry.npm.taobao.org

 dev@mangdin:~$ npm config get registry

 http://registry.npm.taobao.org/

4. 升级npm到最新版本 (自己更新自己)

 sudo npm install -g npm

## 二. 安装yeoman, bower, grunt-cli与yeoman的angular js的generator
1. 安装

 sudo npm install -g yo generator-angular bower grunt-cli 

2. 确认安装成功

 yo --version && bower --version && grunt --version

## 三. 安装与配置Ruby Gems, Compass
在yoman中, 可以根据自己需要, 选择是否用Compass工具来编译sass文件成css. 如果您不需要Sass可直接跳过这一步.

1. 安装

 sudo apt-get install rubygems-integration

2. 使用gem sources -l查看当前gem用到的源,全部去掉,然后加上淘宝的源

 dev@mangdin:~$ gem sources -l | grep http | xargs gem sources --remove

 http://rubygems.org/ removed from sources
 
 dev@mangdin:~$ gem sources -a https://ruby.taobao.org/

 https://ruby.taobao.org/ added to sources
 
 dev@mangdin:~$ gem sources -l

 *** CURRENT SOURCES ***
 
 https://ruby.taobao.org/

## 四. 用yo angular生成一个工程, 运行起来, 并最终打包
1. 因为yeoman需要autoconf, nasm与git, 所以需要先安装这几个工具

 sudo apt-get install autoconf nasm git

2. 生成工程: mkdir hello ; cd hello ; yo angular

 根据提示选择

 - 匿名报告 anonymously report 随便选, 直接回车就行
 - Would you like to use Sass (with Compass)? No (没有做第三步的话, 这个一定要选No)
 - Would you like to include Bootstrap? Yes
 - Which modules would you like to include? 

此步会从npm服务器下载200MB左右的npm依赖, 因此根据网络状况持续一段时间

3. grunt server 运行服务器, 可以通过访问http://localhost:8080看到样例工程

4. grunt 打包, 最终生成dist目录 (dist为网站部署的内容, 已经合并与minify过js, html等)
