#!/bin/bash

# 步骤1: 检查是否传入了日期参数
if [ $# -eq 1 ]; then
  DATE=$1
  TITLE=""
  TAG=""
elif [ $# -eq 2 ]; then
  DATE=$1
  TITLE=$2
  TAG=""
elif [ $# -eq 3 ]; then
  DATE=$1
  TITLE=$2
  TAG=$3
else
  DATE=$(date +"%Y-%m-%d")
  TITLE=""
  TAG=""
fi

# 步骤2: 创建以日期为名字的文件夹
# 检查文件夹是否存在
folder_name="$DATE"
if [ -d "$folder_name" ]; then
  echo "folder already exist."
else
    mkdir "$folder_name"
fi

# 步骤3: 在文件夹下创建index.md文件
file_name="$folder_name/index.md"
if [ -e "$file_name" ]; then
  echo "file already exist. remove it."
  rm -f "$file_name"
else
  touch "$file_name"
fi

# 步骤4: 编辑index.md文件
echo "---" >> "$file_name"
echo "title: $TITLE" >> "$file_name"
echo "date: $DATE" >> "$file_name"
echo "tags: [\"$TAG\"]" >> "$file_name"
echo "draft: false" >> "$file_name"
echo "---" >> "$file_name"

# 输出成功信息
echo "done"