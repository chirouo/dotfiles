@echo off
:: 设置代码页为 UTF-8
chcp 65001
setlocal enabledelayedexpansion

:: 检查是否以管理员权限运行
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo 请以管理员权限运行此脚本！
    pause
    exit /b 1
)

:: 1. Git pull 最新配置
echo 正在更新配置文件...
git pull
if %errorLevel% neq 0 (
    echo Git pull 失败！
    pause
    exit /b 1
)

:: 删除可能存在的旧链接
del /f /q "%USERPROFILE%\.vimrc" 2>nul
del /f /q "%USERPROFILE%\.ideavimrc" 2>nul
del /f /q "%APPDATA%\Code\User\keybindings.json" 2>nul
del /f /q "%APPDATA%\Code\User\settings.json" 2>nul
del /f /q "%APPDATA%\Cursor\User\keybindings.json" 2>nul
del /f /q "%APPDATA%\Cursor\User\settings.json" 2>nul

:: 2. 创建 .vimrc 链接
echo 创建 .vimrc 链接...
mklink "%USERPROFILE%\.vimrc" "%~dp0vim\.vimrc"
if %errorLevel% neq 0 echo .vimrc 链接创建失败！

:: 3. 创建 .ideavimrc 链接
echo 创建 .ideavimrc 链接...
mklink "%USERPROFILE%\.ideavimrc" "%~dp0vim\.vimrc"
if %errorLevel% neq 0 echo .ideavimrc 链接创建失败！

:: 4. 创建 VSCode keybindings.json 链接
echo 创建 VSCode keybindings.json 链接...
if not exist "%APPDATA%\Code\User" mkdir "%APPDATA%\Code\User"
mklink "%APPDATA%\Code\User\keybindings.json" "%~dp0win\vscode\keybindings.json"
if %errorLevel% neq 0 echo VSCode keybindings.json 链接创建失败！

:: 5. 创建 VSCode settings.json 链接
echo 创建 VSCode settings.json 链接...
mklink "%APPDATA%\Code\User\settings.json" "%~dp0win\vscode\settings.json"
if %errorLevel% neq 0 echo VSCode settings.json 链接创建失败！

:: 6-7. 创建 Cursor 配置链接（如果安装了 Cursor）
if exist "%APPDATA%\Cursor\User" (
    echo 检测到 Cursor 安装，创建 Cursor 配置链接...
    mklink "%APPDATA%\Cursor\User\keybindings.json" "%~dp0win\vscode\keybindings.json"
    if %errorLevel% neq 0 echo Cursor keybindings.json 链接创建失败！
    
    mklink "%APPDATA%\Cursor\User\settings.json" "%~dp0win\vscode\settings.json"
    if %errorLevel% neq 0 echo Cursor settings.json 链接创建失败！
) else (
    echo 未检测到 Cursor 安装，跳过 Cursor 配置链接创建。
)

echo 配置完成！
pause 