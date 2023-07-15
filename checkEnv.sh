#! /bin/sh
# 下载目录
savePath=~/software


# --------------------nodejs---------------------
# 判断是否安装nodejs
node_env=true;
if ! type node >/dev/nul 2>&1; then
node_env=false;
fi;


#安装nodejs
if ! $node_env;then
mkdir -p $savePath
wget -O "${savePath}/node.tar" https://npmmirror.com/mirrors/node/v18.16.1/node-v18.16.1-linux-x64.tar.xz
cd $savePath
tar -xvf ./node.tar
nodePath=$(ls | grep node-v)
rm  -rf nodejs
mv $nodePath 'nodejs';
cd ./nodejs/bin/
ln -s ./node /usr/local/bin/node;
else
echo "node已安装，version:$(node -v)"
fi;


# --------------------redis---------------------
# 下载redis
# 判断是否安装
redis_env=true;
if ! type mysql-cli >/dev/nul 2>&1; then
redis_env=false;
fi;


#安装
if ! $redis_env;then
mkdir -p $savePath
wget -O "${savePath}/redis.tar" https://download.redis.io/redis-stable.tar.gz
cd $savePath
tar -xzvf  ./redis.tar
redisPath=$(ls | grep redis)
rm  -rf redisD
mv $redisPath 'redisD';
cd ./redisD
make
make install
redis-server
else
echo "redis已安装，version:$(redis-server -v)"
fi;

# --------------------mysql---------------------
# 下载mysql
# 判断是否安装
mysql_env=true;
if ! type mysql >/dev/nul 2>&1; then
mysql_env=false;
fi;


#安装
if ! $mysql_env;then
mkdir -p $savePath
wget -O "${savePath}/mysql.tar" https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-8.0.33-linux-glibc2.28-x86_64.tar.gz
cd $savePath
tar -xvf ./mysql.tar
mysqlPath=$(ls | grep mysql-8.0.3*)
rm  -rf mysqlD
mv $mysqlPath 'mysqlD';
cd ./mysqlD/bin/
ln -s ./mysql /usr/local/bin/mysqlD;
else
echo "node已安装，version:$(mysql -V)"
fi;

# -----------------------------------------
# 下载nginx
# 判断是否安装
nginx_env=true;
if ! type nginx >/dev/nul 2>&1; then
nginx_env=false;
fi;


#安装
if ! $nginx_env;then
mkdir -p $savePath
wget -O "${savePath}/nginx.tar" http://nginx.org/download/nginx-1.24.0.tar.gz
cd $savePath
tar -xvf ./nginx.tar
nginxPath=$(ls | grep nginx-1.*)
rm  -rf nginxD
mv $nginxPath 'nginxD';
cd ./nginxD
./configure 
make
make install
else
echo "nginx已安装，version:$(nginx -v)"
fi;