"-----------------------------------------------"
"               基础设置                        "
"-----------------------------------------------"
set modelines=0		                     " 禁用模式行（安全措施）
syntax on                                " 语法高亮
filetype on                              " 开启文件类型检测
colorscheme slate

set encoding=utf-8                       " 编码设置
set number                               " 显示行号
set relativenumber                       " 显示相对行号
set smartindent                          " 智能缩进
set autoindent                           " 自动对齐

set smarttab
set tabstop=4                            " tab缩进
set shiftwidth=4                         " 设定自动缩进为4个字符
set expandtab                            " 用space替代tab的输入
set splitright                           " 设置左右分割窗口时，新窗口出现在右侧
set splitbelow                           " 设置水平分割窗口时，新窗口出现在底部

set nobackup                             " 不需要备份
set noswapfile                           " 禁止生成临时文件
set autoread                             " 文件自动检测外部更改
set clipboard=unnamed                    " 共享剪切板

set nocompatible                         " 去除vi一致性
set ambiwidth=single                     " 处理具有东亚宽度等级歧义的字符（例如欧元、注册标志、版权标志、希腊字母、西里尔字母）
set nowrap                               " 不自动折行
set mouse=a                              " 使用鼠标
set mousehide                            " 输入时隐藏光标
set sidescroll=10                        " 移动到看不见的字符时，自动向右滚动十个字符

set sm!                                  " 高亮显示匹配括号
set hlsearch                             " 高亮查找匹配
set cursorline                           " 高亮显示当前行
set termguicolors                        " 启用终端真色

set showmatch                            " 显示匹配
set ruler                                " 显示标尺，在右下角显示光标位置
set novisualbell                         " 不要闪烁
set showcmd                              " 显示输入的命令

set laststatus=2                         " always show statusline
set showtabline=2                        " always show tabline
set vb t_vb=

" 设置分割窗口分割线以及背景色 以及缓冲区末尾空行的 ~
set fillchars=vert:\⎜,eob:\  "有空格  
highlight VertSplit guibg=#262626 guifg=#666666

" 设置光标样式-----------------------------------
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set completeopt=longest,menu             " 自动补全配置让Vim补全菜单行为跟IDE一致
set backspace=indent,eol,start           " 允许用退格键删除字符
let g:markdown_fenced_languages =['c', 'cpp', 'python', 'javascript']
set guifont=Hack_Nerd_Font_Mono:h16      " 设置字体和字体大小, 只对gui客户端起作用，终端使用需要修改终端字体和大小
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 设置netrw--------------------------------------
let g:netrw_banner = 0         " 设置是否显示横幅
let g:netrw_liststyle = 3      " 设置目录列表样式：树形
let g:netrw_browse_split = 4   " 在之前的窗口编辑文件
let g:netrw_altv = 1           " 水平分割时，文件浏览器始终显示在左边
let g:netrw_winsize = 22       " 设置文件浏览器窗口宽度
let g:netrw_list_hide= '^\..*' " 不显示隐藏文件 用 a 键就可以切换显示所有文件、 隐藏匹配文件或只显示匹配文件
" 打开\关闭netrw
nnoremap <SPACE>ft :Lexplore<CR>


"-----------------------------------------------"
"               自定义功能                      "
"-----------------------------------------------"

" 快捷键绑定------------------------------------
let mapleader='\'
" 窗口移动快捷键
noremap <TAB>w <C-w>w
noremap <TAB><left> <C-w><left>
noremap <TAB><right> <C-w><right>
noremap <TAB><up> <C-w><up>
noremap <TAB><down> <C-w><down>
" 使用方向键切换buffer
noremap <Leader><left> :bp<CR>
noremap <Leader><right> :bn<CR>
" 使用方括号切换tab
noremap <Leader>] :tabnext<CR>
noremap <Leader>[ :tabprevious<CR>
" 使用 \ + s 保存, \ + q 退出
noremap <Leader>s :w<CR>
noremap <Leader>q :q<CR>

map <F5> :call Run()<CR>
func! Run()
    execute "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "!time %<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time %<"
    elseif &filetype == 'python'
        exec "!clear"
        exec "!time python3 %"
    elseif &filetype == 'html'
        exec "!time open % &"
    elseif &filetype == 'javascript'
        exec "!clear"
        exec "!node %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!time open %.html &"
    endif
endfunc


