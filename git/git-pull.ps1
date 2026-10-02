# ============================================================
#  git-pull.ps1 - 自动化更新脚本
#  功能：自动 stash -> pull -> stash pop
# ============================================================

Write-Host "=== 开始自动化更新 ===" -ForegroundColor Cyan

# 1. 检查是否在 Git 仓库中
if (-not (Test-Path ".git")) {
    Write-Host "错误：当前目录不是 Git 仓库！" -ForegroundColor Red
    exit 1
}

# 2. 检查是否有未提交的本地修改
$status = git status --porcelain
if ($status) {
    Write-Host "检测到本地有未提交的修改，正在暂存..." -ForegroundColor Yellow
    git stash push -m "auto-stash before pull"
    $stashed = $true
} else {
    $stashed = $false
}

# 3. 从远程仓库拉取更新
Write-Host "正在从远程仓库拉取更新..." -ForegroundColor Green
git pull origin main

# 4. 恢复暂存的本地修改
if ($stashed) {
    Write-Host "正在恢复本地修改..." -ForegroundColor Yellow
    git stash pop
}

if ($LASTEXITCODE -eq 0) {
    Write-Host "=== 更新成功！===" -ForegroundColor Cyan
} else {
    Write-Host "=== 更新失败，请检查网络或远程仓库状态 ===" -ForegroundColor Red
}