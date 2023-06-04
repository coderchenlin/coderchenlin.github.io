---
title: git pre-commit
date: 2023-06-04 20:48:10
tags:
    - git
---

要在Git中设置pre-commit钩子并使用clang-format进行代码格式化和设置代码风格，您可以按照以下步骤进行操作：

1. 安装clang-format：确保您的系统上已安装clang-format。您可以根据您的操作系统选择适当的方法进行安装。

2. 导航到您的Git项目的根目录。

3. 进入`.git/hooks/`目录：

   ```
   cd .git/hooks/
   ```

4. 检查是否已存在`pre-commit`文件。如果存在，可以备份或删除该文件。

   ```
   ls pre-commit
   ```

   如果输出显示`pre-commit`文件，则可以备份或删除它。

5. 创建一个新的`pre-commit`文件并编辑：

   ```
   touch pre-commit
   chmod +x pre-commit
   vim pre-commit
   ```

   这将创建一个名为`pre-commit`的空文件，并赋予它执行权限。使用适合您的文本编辑器打开文件。

6. 在`pre-commit`文件中，添加以下脚本逻辑：

   ```bash
   #!/bin/bash

   # 定义clang-format的配置文件路径
   CONFIG_FILE=".clang-format"


   # 获取即将提交的C/C++源文件列表
   files=$(git diff --cached --name-only --diff-filter=ACM "*.c" "*.cpp" "*.h" "*.hpp")
   
   # 运行代码规范检查命令，例如使用clang-format进行检查
   # 检查命令将输出不符合规范的文件列表
   CHECK_RESULT=$(clang-format -style=llvm --dry-run --Werror $(git diff --cached --name-only))

   # 检查是否存在不符合规范的文件
   if [ -n "$CHECK_RESULT" ]; then
        echo "Code style violation:"
        echo "$CHECK_RESULT"
        exit 1
   fi

   # 检查是否存在要格式化的文件
   if [ -n "$files" ]; then
       echo "Running clang-format..."

       # 逐个格式化文件
       for file in $files
       do
           # 使用clang-format进行代码格式化，并覆盖原始文件
           clang-format -style=file -i "$file"
           git add "$file"
       done
   fi

   exit 0
   ```

   在示例中，我们使用了`git diff`命令来获取即将提交的C/C++源文件（扩展名为.c、.cpp、.h和.hpp）。然后，我们使用`clang-format`对这些文件进行格式化，并使用`git add`将格式化后的文件添加到暂存区。

   请注意，我们使用了`.clang-format`作为clang-format的配置文件。您可以根据需要在项目中创建并配置该文件，以定义您所需的代码风格。
    如果我们要使用llvm的风格，可以使用**-style=llvm**。

7. 保存并关闭文件。

现在，当您执行`git commit`命令提交代码时，Git将自动运行`.git/hooks/pre-commit`脚本，并使用clang-format对即将提交的C/C++源文件进行代码格式化，并根据`.clang-format`配置文件设置代码风格。

请确保脚本中的命令与您的开发环境和项目要求相匹配，并根据需要进行自定义。

注意：如果您的项目中包含其他类型的源文件，如C源文件(.c)或C++源文件(.cxx)，请根据需要修改文件类型的匹配模式，并相应地更新`git diff`命令中的参数。同样，根据需要进行适当的配置文件调整。


<font color = red> writed by chatgpt </font> 
