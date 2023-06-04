---
title: hexo备份迁移
date: 2023-06-04 17:00:29
tags:
    - linux
    - hexo
    - github
---
hexo 部署到github 之后，如何进行进行迁移备份？

### 1. 备份分支

备份文件的分支和部署的分支要分开，比如这里我选择main 分支作为备份文件的分支，选择master作为部署分支。

```shell
 ✗ echo `git branch`
* main master
```

### 2. 新机器拉取拉取分支

1. 新的机器首先配置hexo 所需环境，安装必须的 nodejs、npm、hexo，建议直接下载node的二进制压缩包，然后直接解压，设置软连接。

 ```sh
## 1.下载地址
https://nodejs.org/en/download/releases

## 2. 设置软连接
ln -s <解压文件>/some path/node /usr/local/bin/node
ln -s <解压文件>/some path/npm /usr/local/bin/npm
ln -s <解压文件>/some path/hexo /usr/local/bin/hexo
 ```

2. 拉取分支

```shell
git clone htpps://.....git  <somepath>
cd <somepath>
npm install
```

### 3.  Other

1. hexo主题不匹配导致无法生成静态文件 *.html，此时可以将主题设置成默认的landscape，查看是否是主题问题。

2. github权限问题，除了配置ssh 密钥外，还要设置token。
 
