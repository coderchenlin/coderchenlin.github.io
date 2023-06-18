---
title: git clang-format
date: 2023-06-18 22:56:00
tags:
    - git
    - clang-format
---

### 1. why use clang-format?
1. important to raise the code quality
2.  formatting your code is important is that you get a uniformed code when reading it, meaning you will decrease the “WTF per minute”-score*.

### install
1. clang-format
    ```
     sudo apt-get install clang-format
    ```

2. config .clang-format
    ```
    cd <path to repo>    
    clang-format -style=llvm -dump-config > .clang-format
    ```
    also you can choose another style or custom your style by changing *.clang-format*.

### how to use
after editing the code. do it as follows:
    ```
    git add -u
    git clang-format
    ```
The clang-format will format the staged code, you can use <font color=red> git diff </font> to check whether the clang-format is work.

