@echo off
:: Set UTF-8 code page
chcp 65001 >nul

setlocal enabledelayedexpansion

:: Define source file paths 
set "VIMRC_SOURCE=%~dp0vim\.vimrc"
set "VSCODE_KEYBINDINGS_SOURCE=%~dp0win\vscode\keybindings.json"
set "VSCODE_SETTINGS_SOURCE=%~dp0win\vscode\settings.json"

:: Define target file paths 
set "VIMRC_TARGET=%USERPROFILE%\.vimrc"
set "IDEAVIMRC_TARGET=%USERPROFILE%\.ideavimrc"
set "VSCODE_KEYBINDINGS_TARGET=%APPDATA%\Code\User\keybindings.json"
set "VSCODE_SETTINGS_TARGET=%APPDATA%\Code\User\settings.json"
set "CURSOR_KEYBINDINGS_TARGET=%APPDATA%\Cursor\User\keybindings.json"
set "CURSOR_SETTINGS_TARGET=%APPDATA%\Cursor\User\settings.json"

:: Check for admin privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Please run this script as Administrator!
    pause
    exit /b 1
)

:: Change to script directory
cd /d "%~dp0"

:: 1. Git pull latest config
echo Updating configuration files...
git pull
if %errorLevel% neq 0 (
    echo Git pull failed!
    pause
    exit /b 1
)

:: Delete existing symlinks
del /f /q "%VIMRC_TARGET%" 2>nul
del /f /q "%IDEAVIMRC_TARGET%" 2>nul
del /f /q "%VSCODE_KEYBINDINGS_TARGET%" 2>nul
del /f /q "%VSCODE_SETTINGS_TARGET%" 2>nul
del /f /q "%CURSOR_KEYBINDINGS_TARGET%" 2>nul
del /f /q "%CURSOR_SETTINGS_TARGET%" 2>nul

:: 2. Create .vimrc symlink
echo Creating .vimrc symlink...
mklink "%VIMRC_TARGET%" "%VIMRC_SOURCE%"
if %errorLevel% neq 0 echo Failed to create .vimrc symlink!

:: 3. Create .ideavimrc symlink
echo Creating .ideavimrc symlink...
mklink "%IDEAVIMRC_TARGET%" "%VIMRC_SOURCE%"
if %errorLevel% neq 0 echo Failed to create .ideavimrc symlink!

:: 4. Create VSCode keybindings.json symlink
echo Creating VSCode keybindings.json symlink...
if not exist "%APPDATA%\Code\User" mkdir "%APPDATA%\Code\User"
mklink "%VSCODE_KEYBINDINGS_TARGET%" "%VSCODE_KEYBINDINGS_SOURCE%"
if %errorLevel% neq 0 echo Failed to create VSCode keybindings.json symlink!

:: 5. Create VSCode settings.json symlink
echo Creating VSCode settings.json symlink...
mklink "%VSCODE_SETTINGS_TARGET%" "%VSCODE_SETTINGS_SOURCE%"
if %errorLevel% neq 0 echo Failed to create VSCode settings.json symlink!

:: 6-7. Create Cursor config symlinks if Cursor is installed
if exist "%APPDATA%\Cursor\User" (
    echo Cursor detected, creating symlinks...
    mklink "%CURSOR_KEYBINDINGS_TARGET%" "%VSCODE_KEYBINDINGS_SOURCE%"
    if %errorLevel% neq 0 echo Failed to create Cursor keybindings.json symlink!
    
    mklink "%CURSOR_SETTINGS_TARGET%" "%VSCODE_SETTINGS_SOURCE%"
    if %errorLevel% neq 0 echo Failed to create Cursor settings.json symlink!
) else (
    echo Cursor not detected, skipping Cursor config...
)

echo Setup complete!
pause 