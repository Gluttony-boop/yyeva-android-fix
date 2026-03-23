@echo off
REM 发布脚本 (Windows版本)
REM 使用说明:
REM 1. 将脚本中的 YOUR_USERNAME 替换为你的 GitHub 用户名
REM 2. 确保在项目根目录执行此脚本
REM 3. 推送代码到 GitHub 后,JitPack 会自动构建

echo ===================================
echo 准备发布到 JitPack
echo ===================================

REM 1. 提交代码
echo 1. 提交代码...
git add .
git commit -m "Release version 1.0.0"

REM 2. 创建标签
echo 2. 创建 Git 标签...
git tag -a v1.0.0 -m "Release version 1.0.0"

REM 3. 推送代码和标签
echo 3. 推送到 GitHub...
git push origin main
git push origin v1.0.0

echo ===================================
echo 代码已推送!
echo ===================================
echo 接下来请:
echo 1. 访问 https://jitpack.io/
echo 2. 输入你的 GitHub 仓库地址: https://github.com/YOUR_USERNAME/REPO_NAME
echo 3. 点击 'Look up' 按钮
echo 4. 点击 'Get it' 按钮开始构建
echo ===================================
pause
