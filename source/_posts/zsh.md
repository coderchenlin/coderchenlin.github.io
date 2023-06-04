---
title: ubuntu安装zsh
date: 2023-06-04 15:16:19
tags:
---

### zsh

#### 安装

```shell
sudo apt install zsh
```

#### 切换zsh

```shell
chsh -s /bin/zsh
```

#### 查看

```shell
echo $SHELL
```



### oh-my-zsh

#### 安装

```shell
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
```



#### 配置zsh

```shell
## 拷贝一个模板配置
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

## 下载两个插件试试
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions

## 添加到~/.zshrc 中
plugins=(git
        zsh-autosuggestions
        zsh-syntax-highlighting
        )

```



#### 使之生效

```shell
source ~/.zshrc
```

