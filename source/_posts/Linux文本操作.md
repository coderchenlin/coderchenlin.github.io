---
date: 2022-11-16 22:09:50  
title: linux文本操作 
tags:
- shell
---

1. 把src.txt 的文本追加到dst.txt 后面

   ```shell
   cat src.txt >> dst.txt
   ```
2. linux 单线程所能支持的最大文件处理数量

   ```shell
   cat /proc/sys/fs/file-max
   ```

   设置:例如设置成8192

   ```shell
   echo 8192 > /proc/sys/fs/file-max
   ```
