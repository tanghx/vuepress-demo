#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 生成静态文件
yarn build :build

# 进入生成的文件夹
cd blog/.vuepress/dist

# 如果是发布到自定义域名
# echo 'www.example.com' > CNAME

git init
git add -A
git commit -m 'deploy'

# 如果发布到 https://<USERNAME>.github.io/<REPO>
git push -f git@github.com:tanghx/blog.git master:gh-pages

git remote add origin https://github.com/tanghx/blog.git

git pull --rebase origin master

git push -u origin master

cd -