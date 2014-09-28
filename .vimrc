" ---------------------------------------------------------------------------
"   Ethan Schoonover
"   es@ethanschoonover.com
"   vimrc
"   last changed:
"   Modified: 2014 Sept 18
" ---------------------------------------------------------------------------

"   Props   -----------------------------------------------------------------
"
"   most recent crib sources:
"   skwp's dotfiles

"   Frontmatter   -----------------------------------------------------------

set nocompatible                " explicitly leave vi-compatibility mode
                                " (must be first as may impact options below)

"   General   ---------------------------------------------------------------

set number                      " line numbering
set showcmd                     " incomplete cmds displayed at bottom
set showmode                    " active mode displayed at bottom
set history=300                 " num lines of :cmdline history to retain
set gcr=a:blinkon0              " no cursor blink
set visualbell                  " no beep
set autoread                    " reload file on external changes
set backspace=indent,eol,start  " backspace on in insert mode
syntax on                       " colorized syntax highlighting

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all 
" the plugins.
let mapleader=","

"   Environment   -----------------------------------------------------------

set encoding=utf-8              " unicode encoding by default
set title                       " show title in terminal
set clipboard+=unnamed          " unnamed buffer set to gui register *
                                " so that dd == "*dd
set hidden                      " buffers hidden, not closed, when abandoned
set noexrc                      " don't use local version of .(g)vimrc, .exrc

" save the whole buffer for undo when reloading it.  This applies to the ":e!"
" command and reloading for when the buffer buffer changed outside of Vim.
v:vimrc>702 ? set undoreload=10000

    " Compatible Options    {{{
    " ------------------------------------------------------------------
        set cpoptions=aABceFsmq
        "             |||||||||
        "             ||||||||`---- When joining lines, leave the cursor 
        "             ||||||||      between joined lines
        "             ||||||||
        "             |||||||`----- When a new match is created (showmatch) 
        "             |||||||       pause for .5
        "             |||||||
        "             ||||||`------ Set buffer options when entering the buffer
        "             ||||||
        "             |||||`------- :write command updates current file name
        "             |||||
        "             ||||`-------- Automatically add <CR> to the last line 
        "             ||||          when using :@r
        "             ||||
        "             |||`--------- Searching continues at the end of the match 
        "             |||           at the cursor position
        "             |||
        "             ||`---------- A backslash has no special meaning in
        "             ||            mappings
        "             ||
        "             |`----------- :write updates alternative file name
        "             |
        "             `------------ :read updates alternative file name

    " Colors                {{{
    " ------------------------------------------------------------------
        if has('gui_running')
            set background=light
        else
            set background=dark
        endif
        let g:solarized_visibility="low"
        syntax enable               " syntax highlighting on
        colorscheme solarized       " detects background value (light/dark)


" =============== Vundle Initialization ===============
" This loads all the plugins specified in ~/.vim/vundles.vim
" Use Vundle plugin to manage all other plugins
"if filereadable(expand("~/.vim/vundles.vim"))
"  source ~/.vim/vundles.vim
"endif

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"
" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1


" ================ Custom Settings ========================
set laststatus=2
