cd C案例
# 1. 初始化（如果已经 init 过，跳过）
git init

# 2. 添加所有文件
git add .

# 3. 提交（用英文，防乱码）
git commit -m "first commit"

# 4. 关联远程仓库（首次用 add，已存在才用 set-url）
git remote set-url origin https://github.com/Xieling-123/C1.git

# 5. 确保分支叫 main
git branch -M main

# 6. 推送并建立追踪关系
git push -u origin main