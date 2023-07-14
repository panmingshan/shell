#! /bin/sh
# 下载目录
savePath='~/software'
# 判断是否安装nodejs
node_env=true;
if ! type node >/dev/nul 2>&1; then
node_env=false;
fi;

if $node_env;then
mkdir -p ~/software

wget -o ~/software/node.tar https://npmmirror.com/mirrors/node/v18.16.1/node-v18.16.1-linux-x64.tar.xz
cd $savePath
tar -xvf 
fi 