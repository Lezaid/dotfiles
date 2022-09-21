set number                      " Line numbers
set relativenumber              " Show the line number relative to the line with the cursor in front of each line
" set numberwidth=8               " Minimal number of columns to use for the line number
set colorcolumn=81              " Is a comma separated list of screen columns that are highlighted
set cursorline                  " Enable highlighting of the current line
set mouse=a                     " Enable your mouse
set hidden                      " Required to keep multiple buffers open multiple buffers
set showcmd                     " Show command in the last line of the screen
set showmatch                   " When a bracket is inserted, briefly jump to the matching one
set ruler                       " Show the cursor position all the time
set noshowmode                  " We don't need to see things like -- INSERT -- anymore
set expandtab                   " Converts tabs to spaces
set smarttab                    " When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'
set smartindent                 " Makes indenting smart
set autoindent                  " Copy indent from current line when starting a new line
set nowrap                      " Display long lines as just one line
set splitbelow                  " Horizontal splits will automatically be below
set splitright                  " Vertical splits will automatically be to the right
set encoding=utf-8              " The encoding displayed
set fileencoding=utf-8          " The encoding written to file
set laststatus=2                " Always display the status line
set tabstop=2                   " Insert 2 spaces for a tab
set showtabline=2               " Always show tabs
set shiftwidth=2                " Change the number of space characters inserted for indentation
set background=dark             " Tell vim what the background color looks like
set formatoptions-=cro          " Stop newline continution of comments
set clipboard=unnamedplus       " Copy paste between vim and everything else (Require xclip)
set timeoutlen=500              " By default timeoutlen is 1000 ms
syntax enable                   " Enables syntax highlighing
filetype on
filetype indent on
filetype plugin on

