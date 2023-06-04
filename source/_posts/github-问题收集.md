---
title: 'github: 问题收集'
date: 2023-06-04 21:41:09
tags:
    - git
---
1. Recv failure: Connection reset by peer
Firstly try this. 
```
git config --global --unset http.proxy
git config --global --unset https.proxy
```

2. remote: Support for password authentication was removed on Augus
```
 git remote set-url origin https://<new token>@github.com/<用户名>/<仓名>.git
```

3. git commit --amend 使用nano编辑器，非常不方便
```
git config --global core.editor vim
```
