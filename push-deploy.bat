@echo off
setlocal

:: ============ 配置 GitHub 仓库 =============
set REPO_URL=https://github.com/jsTHISCHIP/doc.git
set BRANCH=main
:: ===========================================

set /p commit_msg="请输入提交信息: "

:: 初始化仓库
git init

:: 添加远程仓库
git remote remove origin >nul 2>nul
git remote add origin %REPO_URL%

:: 添加并提交
git add .
git commit -m "%commit_msg%"

:: 推送（第一次加上 -u）
git branch -M %BRANCH%
git push -u origin %BRANCH%

echo =========================================
echo ✅ 首次推送成功，GitHub Actions 应已触发部署
echo 🌍 页面地址: https://github.com/jsTHISCHIP/doc.git
echo =========================================

pause