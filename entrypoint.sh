#!/bin/sh
apk update && apk add tzdata 
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime 
echo "Asia/Shanghai" > /etc/timezone
apk add --no-cache git openssh-client
git config --global user.email 1169942595@qq.com
git config --global user.name A-JiuA
git config --global --add safe.directory /root/public
mkdir -p /root/.ssh
echo "$SSH_PRIVATE_KEY" > /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa
mkdir -p ~/.ssh
cp /root/.ssh/* ~/.ssh/ 2> /dev/null || true
echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config
SOURCE_DIR=$(basename "$SOURCE_REPO")
echo "SOURCE=$SOURCE_REPO"
git clone "$SOURCE_REPO" "$SOURCE_DIR"
cp -r "$SOURCE_DIR"/.git public && cd public
git add .
git commit -m "Site updated: $(date +%F) $(date +%T)"
git push
rm -rf .git