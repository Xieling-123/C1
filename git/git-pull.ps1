# ============================================================
#  git-push.ps1 - Auto Commit & Push
#  功能：自动 add -> commit (带时间戳) -> push
# ============================================================

Write-Host "=== Start Auto Push ===" -ForegroundColor Cyan

# 1. 检查是否在 Git 仓库中
if (-not (Test-Path ".git")) {
    Write-Host "Error: Not a Git repository!" -ForegroundColor Red
    exit 1
}

# 2. 检查是否有文件变更
$status = git status --porcelain
if (-not $status) {
    Write-Host "Working tree clean, nothing to commit." -ForegroundColor Yellow
    exit 0
}

# 3. 添加所有变更到暂存区
Write-Host "Adding files..." -ForegroundColor Green
git add .

# 4. 生成带时间戳的提交信息（纯英文，绝对防乱码）
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$commitMessage = "auto commit: $timestamp"
Write-Host "Committing: $commitMessage" -ForegroundColor Green
git commit -m "$commitMessage"

# 5. 推送到远程仓库
Write-Host "Pushing to remote..." -ForegroundColor Green
git push origin main

# 6. 结果反馈
if ($LASTEXITCODE -eq 0) {
    Write-Host "=== Push Success! ===" -ForegroundColor Cyan
} else {
    Write-Host "=== Push Failed ===" -ForegroundColor Red
}