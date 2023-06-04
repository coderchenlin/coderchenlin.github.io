---
title: 'github: workflow'
date: 2023-06-04 21:12:42
tags: 
    - github
---
要在GitHub Actions中执行测试脚本，您可以按照以下步骤进行操作：

1. 在您的代码库中创建一个名为`.github/workflows`的目录（如果该目录不存在）。

2. 在`.github/workflows`目录中创建一个新的YAML文件，用于定义工作流程。您可以根据需要将该文件命名为`test.yml`或其他适当的名称。

3. 在`test.yml`文件中编写工作流程的定义。以下是一个示例的基本配置：

```yaml
name: CI

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

jobs:
  test:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Set up Python
        uses: actions/setup-python@v2
        with:
          python-version: 3.x

      - name: Install dependencies
        run: pip install -r requirements.txt

      - name: Run tests
        run: |
          # 运行您的测试脚本的命令
          python test_script.py
```

在上述示例中，工作流程在`main`分支的推送和拉取请求事件时触发。它定义了一个名为`test`的作业，该作业在最新版本的Ubuntu操作系统上运行。作业包含一系列步骤，例如检出代码、设置Python环境、安装依赖项和运行测试脚本。

在示例中的最后一个步骤中，使用`run`关键字来执行测试脚本的命令。您需要根据实际情况调整该命令，确保它与您的项目和测试脚本的要求一致。

4. 将`test.yml`文件推送到代码库的`.github/workflows`目录中。

5. 在GitHub上打开您的代码库，导航到“Actions”选项卡，您将看到您的工作流程正在运行。您可以查看工作流程的执行状态、日志和输出。

6. 每当有新的代码推送到`main`分支时，GitHub将自动运行工作流程，并执行定义的测试脚本。

通过这样的设置，您可以确保在每次代码更改时自动运行测试脚本，并及时获取测试结果和反馈。请根据您的项目和需求进行自定义和调整。


 --- 
<font size=8> writed by chatgpt </font>
