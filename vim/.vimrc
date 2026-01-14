" ==========================================
" 1. 基础设置 (Basic Settings)
" ==========================================
set nocompatible            " 关闭 VI 兼容模式
set encoding=utf8           " 内部编码使用 UTF-8
set fileencodings=utf8,gb2312,gb18030,ucs-bom,latin1 " 打开文件时尝试的编码格式
set mouse=a                 " 开启鼠标支持 (虽然建议少用，但滚轮很方便)
set clipboard^=unnamed,unnamedplus " 连通系统剪贴板 (支持 Ctrl+C/V)
set history=400             " 增加历史命令记录条数
set noerrorbells            " 关闭错误提示音
set visualbell t_vb=        " 关闭可视化响铃 (屏幕闪烁)
set hidden                  " 允许在有未保存修改时切换缓冲区 (Buffer)

" ==========================================
" 2. 界面与显示 (UI & Visuals)
" ==========================================
syntax enable               " 开启语法高亮
colorscheme desert          " 设置配色方案为 desert
set number                  " 显示绝对行号
set relativenumber          " 显示相对行号 (混合行号模式)
set showcmd                 " 右下角显示未输完的命令
set showmatch               " 高亮匹配的括号
set magic                   " 让正则表达式更加智能
set laststatus=2            " 总是显示状态栏

" 自定义状态栏格式 (文件名、POS位置、百分比、编码、时间)
highlight StatusLine cterm=bold ctermfg=yellow ctermbg=blue
set statusline=%F%m%r%h%w\[POS=%l,%v][%p%%]\[%{&fileformat}]\[%{&encoding}]\[%{strftime(\"%Y-%m-%d\ %H:%M:%S\")}] 

" ==========================================
" 3. 缩进与排版 (Indentation & Formatting)
" ==========================================
filetype plugin indent on   " 开启文件类型侦测、插件加载、缩进加载 (三合一)
set autoindent              " 换行时自动对齐上一行
set smartindent             " 智能缩进
set cindent                 " 针对 C 语言风格的缩进优化
set expandtab               " 将 Tab 转为空格
set smarttab                " 在行首按 Tab 时更智能
set tabstop=4               " Tab 宽度为 4 个空格
set shiftwidth=4            " 自动缩进宽度为 4 个空格
set backspace=indent,eol,start " 让退格键可以删除缩进、换行符和插入点之前的内容

" ==========================================
" 4. 搜索与文件导航 (Search & Navigation)
" ==========================================
set ignorecase              " 搜索忽略大小写
set smartcase               " 如果搜索词包含大写，则严格匹配大小写
set incsearch               " 边输入边高亮搜索结果
set path+=** " 递归查找子目录 (配合 :find 使用)
set wildmenu                " 命令行补全菜单 (Tab键弹出可视化菜单)

" ==========================================
" 5. 按键映射 (Key Mappings)
" ==========================================
let mapleader=" "           " 设置 Leader 键为空格


" --- 快速移动 ---
nnoremap H ^                " H 移到行首
nnoremap L $                " L 移到行尾
nnoremap J 5j               " J 向下跳 5 行
nnoremap K 5k               " K 向上跳 5 行

" --- 标签页切换 ---
nnoremap th :tabprevious<CR>
nnoremap tl :tabnext<CR>

" --- 剪贴板与粘贴 ---
" <Space>p 从寄存器0粘贴 (也就是粘贴最近一次 yank 的内容，而不是删除的内容)
nnoremap <leader>p "0p

" --- 禁用原版 Ex 模式 ---
nmap Q <Nop>

" --- 戒除方向键习惯 (硬核模式) ---
" 如果按方向键，报错提示去用 hjkl
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" ==========================================
" 6. 自动命令 (Auto Commands)
" ==========================================
" 自动重载 .vimrc
augroup AutoReloadConfig
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC | echom "配置已重载！Config Reloaded!"
augroup END
