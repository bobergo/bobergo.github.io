#!/bin/bash

# 步骤1: 检查是否传入了日期参数
if [ $# -eq 1 ]; then
  DATE=$1
  TITLE=""
elif [ $# -eq 2 ]; then
  DATE=$1
  TITLE=$2
else
  DATE=$(date +"%Y-%m-%d")
  TITLE=""
fi

# 步骤2: 创建以日期为名字的文件夹
mkdir "$DATE"

# 步骤3: 在文件夹下创建index.md文件
touch "$DATE/index.md"

# 步骤4: 编辑index.md文件
echo "---" >> "$DATE/index.md"
echo "title: $TITLE" >> "$DATE/index.md"
echo "date: $DATE" >> "$DATE/index.md"
echo "draft: false" >> "$DATE/index.md"
echo "---" >> "$DATE/index.md"

# 输出成功信息
echo "done"