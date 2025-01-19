# Win11设置

## 系统设置

- 右键：设置为win10样式

- 触摸板：改三指当中指

- 输入法：设置ctrl + space 切换 中英 

- geek删除不需要的**微软自带的软件**

## 必用软件清单

沟通：

- QQ
- 微信
- 腾讯会议

网盘：

- 百度网盘
- 夸克网盘
- 迅雷

娱乐：

- qq音乐
- bilibili

web开发（可选）：

- navicate17（百度网盘）
- apifox

JB全家桶：

- 2023版本idea（百度网盘）
- 2023版本pycharm（百度网盘）

文档：

- zotero
- xmind
- 腾讯文档
- onenote（微软自带）
- wps（备用）（注：这两个教学看一下再装wps[教学1](https://www.bilibili.com/video/BV1UW4Ce8EWo/)[教学2](https://www.bilibili.com/video/BV1dysSepEUo/)）
- word（微软自带）
- excel（微软自带）
- powerpoint（微软自带）

编辑器：

- vscode
- sublime text

工具：

- ToDesk
- Clash for Windows / Clash Verge
- geek
- everything
- 7zip
- pixpin（这个带OCR）~~snipaste~~
- ~~utools~~(现在直接用 win 键)

linux：

- VMware（百度网盘）
- MobaXterm（百度网盘）

## 文件目录结构

- SchoolStudy
- Temp
- 将SchoolStudy、Temp、用户文件夹固定到快速访问

## windows右键“新建”自定义（regedit）

[视频](https://www.bilibili.com/video/BV12g411F79m/):

1. 通过改.md项的ShellNew 

   - 增加一个NullFile（新建空白文件）或

   - FileName（新建模板文件，值填模板文件的路径）

2. 通过改.md项的默认值"XX" + 新建一个项对应前面的默认值"XX",值填你想要的名字“XX”
   - 修改新建项时项的名字

3. 通过改计算机\HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Discardable\PostSetup\ShellNew
   中的`class `

   - 排序 新建的项

   - 删除 不需要的新建项

   注：BMP文件不在class中，要想删除参考这篇[博客](https://www.cnblogs.com/[![img](https://i0.hdslb.com/bfs/reply/9f3ad0659e84c96a711b88dd33f4bc2e945045e0.png)live41](https://search.bilibili.com/all?from_source=webcommentline_search&keyword=live41&seid=6595502123390268598)/p/18214635)

## windows自定义右键的快捷打开程序

[博客]([windows11右键菜单新增项增加md文件，使用Typora_如何将typore加到右键菜单里-CSDN博客](https://blog.csdn.net/qq_42445433/article/details/127549533))：

1. 方案一：重点关注
2. 方案二：和本节无关，实际内容是“自定义右键新建项”

# 开发环境配置

## 编辑器配置

- vscode：`keybindings.json``settings.json`
- sublime：删除微软自带记事本，改成这个

## 后端环境配置

[博客](https://blog.csdn.net/chirou_/article/details/144530654)：
软件：navicate17、mysql8安装、maven安装（包含配置settings）、idea2023安装

springboot2 mysql8 maven

## 配置文件

.vimrc .bashrc .tmux.conf都在github

.ideavimrc --mklink--> .vimrc

## 终端环境

目前用的是bash，配置在git .dotfile仓库

- 命令行纠错工具：fuck （apt）
- 命令行大全：tldr （too long dont read）（pip3）
- 模糊文件/文件夹 ：fzf（fuzzy finder）(github)
- 多窗口：Tmux（dotfiles/tmux/.tmux.conf)
- 编辑器：vim（dotfiles/vim/.vimrc)

## 网络环境配置

- 访问github失败，DNS污染 github520项目

# Cheat Sheet

### Linux Command

| 命令  | 全称                            | 中文解释                     |
| ----- | ------------------------------- | ---------------------------- |
| cd    | Change Directory                | 切换目录                     |
| ls    | List                            | 列出目录内容                 |
| cp    | Copy                            | 复制文件或目录               |
| mv    | Move                            | 移动或重命名文件或目录       |
| rm    | Remove                          | 删除文件或目录               |
| mkdir | Make Directory                  | 创建目录                     |
| rmdir | Remove Directory                | 删除空目录                   |
| pwd   | Print Working Directory         | 显示当前工作目录             |
| touch | Touch                           | 创建空文件或更新文件时间戳   |
| cat   | Concatenate                     | 显示文件内容                 |
| more  | More                            | 分页显示文件内容             |
| less  | Less                            | 分页显示文件内容（更高级）   |
| head  | Head                            | 显示文件开头部分             |
| tail  | Tail                            | 显示文件结尾部分             |
| find  | Find                            | 查找文件或目录               |
| grep  | Global Regular Expression Print | 搜索文本内容                 |
| chmod | Change Mode                     | 更改文件权限                 |
| chown | Change Owner                    | 更改文件所有者               |
| ps    | Process Status                  | 显示进程状态                 |
| kill  | Kill                            | 终止进程                     |
| df    | Disk Free                       | 显示磁盘空间使用情况         |
| du    | Disk Usage                      | 显示目录或文件的磁盘使用情况 |
| top   | Top                             | 实时显示系统资源使用情况     |
| man   | Manual                          | 显示命令手册                 |
| echo  | Echo                            | 输出文本到终端               |
| ssh   | Secure Shell                    | 远程登录                     |
| scp   | Secure Copy                     | 安全复制文件                 |
| wget  | Web Get                         | 从网络下载文件               |
| curl  | Client URL                      | 从网络传输数据               |
| tar   | Tape Archive                    | 归档文件                     |
| zip   | Zip                             | 压缩文件                     |
| unzip | Unzip                           | 解压缩文件                   |
| sudo  | Superuser Do                    | 以超级用户权限执行命令       |

### Tmux

[TmuxCheatSheet](https://tmuxcheatsheet.com/)

### Vscode

| 快捷键                                     | 功能              |
| ------------------------------------------ | ----------------- |
| `.`                                        | 打开网页版 VSCode |
| `code + 路径`                              | 打开工程          |
| `Ctrl + P`                                 | 打开指定文件      |
| `Ctrl + P` 输入 `@` 或 `Ctrl + Shift + O`  | 跳转到指定函数    |
| `Ctrl + ``(1左边的按键)                    | 打开/关闭终端     |
| `Ctrl + G`                                 | 跳转到行          |
| `Ctrl + 左/右`                             | 按单词移动光标    |
| `Ctrl + D` （重复按可以多选）              | 选中单词          |
| `Ctrl + L` （重复按会同时选择下一行）      | 选中行            |
| `Alt + 上/下`                              | 移动行            |
| `Ctrl + Shift + I`                         | 格式化代码        |
| `F12`                                      | 跳转到定义        |
| `Ctrl + Shift + O`                         | 查看当前文件符号  |
| `Ctrl + X / Ctrl + C` （什么都不选的时候） | 剪切/复制当前行   |
| `Alt + 数字`                               | 切换 tab          |
| `Ctrl + PageUp / PageDown`                 | 顺序切换 tab      |
| `Ctrl + W`                                 | 关闭文件          |
| `Ctrl + K W` （Ctrl 不松手）               | 关闭所有文件      |
| `Ctrl + Shift + E`                         | 打开文件列表      |

[VSCode快捷键大全](https://blog.csdn.net/qq_41684621/article/details/105708671)

### windows11

| 快捷键              | 功能                                                    |
| ------------------- | ------------------------------------------------------- |
| `Win + E`           | 打开文件资源管理器                                      |
| `Win + D`           | 回到桌面（再次按下返回）                                |
| `Win + I`           | 打开设置                                                |
| `Win + A`           | 打开 WiFi 等快速设置                                    |
| `Win + B`           | 打开托盘                                                |
| `Win + S`           | 搜索                                                    |
| `Win + N`           | 打开通知中心和日历                                      |
| `Win + X`           | 打开快速链接菜单（右键 Win 图标）                       |
| `Win + M`           | 缩小化（再次按 `Win + Shift + M`，和 `Win + D` 差不多） |
| `Win + ,`           | 看一眼桌面                                              |
| `Win + ;`           | Windows 表情                                            |
| `Win + 上/下/左/右` | 分屏                                                    |
| `F11`               | 全屏                                                    |
| `Alt + D`           | 选择地址栏                                              |
| `Alt + Enter`       | 打开选定项的“属性”对话框                                |
| `Alt + 向右键`      | 查看下一个文件夹                                        |
| `Alt + 向左键`      | 查看上一个文件夹                                        |
| `Alt + P`           | 显示预览面板                                            |

### 浏览器快捷键

| 快捷键             | 功能                     |
| ------------------ | ------------------------ |
| `Ctrl + Shift + C` | 选择元素（方便前端开发） |
