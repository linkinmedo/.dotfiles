set nocompatible
set termguicolors
set encoding=utf-8
"filetype off

call plug#begin('~/.local/share/nvim/plugged')

Plug 'w0rp/ale'
Plug 'altercation/vim-colors-solarized'
Plug 'joshdick/onedark.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'tomtom/tcomment_vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'tpope/vim-repeat'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'ntpeters/vim-better-whitespace'
Plug 'junegunn/vim-easy-align'
Plug 'Valloric/MatchTagAlways'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'junegunn/vim-easy-align'
Plug 'shime/vim-livedown'

" All of your Plugins must be added before the following line
call plug#end()

" General maping

" Ctrl+a to jump to end of line
:imap <C-a> <Esc>A

" Keep lines selected after indentation
vmap > >gv
vmap < <gv

" Play @q with Q
nnoremap Q @q

" remap j and k to scroll by visual lines
nnoremap j gj
nnoremap k gk

" Ctrl h & l move tabs
noremap <C-l> gt
noremap <C-h> gT

" Ctrl+c will copy to clipboard
map <C-c> "+y

"Airline
let g:airline_powerline_fonts=1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
"let g:Powerline_symbols='unicode'

" maping TComment
let mapleader=','
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

" Use deoplete.
let g:deoplete#enable_at_startup = 1
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Setup Closetag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml, *.ejs, *.js"

" FZF
nnoremap <c-p> :FZF<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup    " do not keep a backup file, use versions instead
else
  set backup    " keep a backup file
endif
set history=50    " keep 50 lines of command line history
set ruler   " show the cursor position all the time
set showcmd   " display incomplete commands
set incsearch   " do incremental searching
set noswapfile  " Does not create swap files for VIM

" Don't use Ex mode, use Q for formatting
" map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
noremap j gj
noremap k gk

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent    " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif

nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
nnoremap <C-h> gT
nnoremap <C-l> gt
set nu

" map <F3> :execute "noautocmd vimgrep /" . expand("<cword>") . "/gj **/*." .  expand("%:e") <Bar> cw<CR>
map <F3> :execute "noautocmd vimgrep /" . expand("<cword>") . "/gj **/*." .  expand("%:e") <Bar> cw

function! CmdLine(str)
  exe "menu Foo.Bar :" . a:str
  emenu Foo.Bar
  unmenu Foo
endfunction

" From an idea by Michael Naumann
function! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  elseif a:direction == 'gv'
    "call CmdLine("noautocmd vimgrep " . '/'. l:pattern . '/gj' . ' **/*')
    "execute "noautocmd vimgrep " . '/'. l:pattern . '/gj' . ' **/*'
    execute "Rgrep -i " . l:pattern
  elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

vnoremap <silent> * :call VisualSearch('b')<CR>
vnoremap <silent> # :call VisualSearch('f')<CR>
vnoremap <silent> gv :call VisualSearch('gv') <Bar> cw<CR>

set undofile
set undodir=~/.vim/undodir
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

map <Tab> :NERDTreeFind<CR>
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1
set tabstop=2
set shiftwidth=2
set expandtab

set nobackup

autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

"nmap <silent> <Leader><space> :call <SID>StripTrailingWhitespace()<CR>
nmap <Leader><space> :StripWhitespace<CR>

map <leader>cc :botright cope<cr>
map <leader>n :cn<cr>
map <leader>p :cp<cr>

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c


function! CurDir()
    let curdir = substitute(getcwd(), '/home/waleed/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction

set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
"let g:Powerline_symbols = 'unicode'

au BufNewFile,BufRead *.ejs set filetype=html

autocmd QuickFixCmdPost *grep* cwindow
au FileType python  set tabstop=4 shiftwidth=4 textwidth=140 softtabstop=4

" hi CursorColumn cterm=NONE ctermbg=black
"ctermfg=white guibg=darkred guifg=white
" set cursorcolumn

" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces

" let g:rbpt_colorpairs = [
"     \ ['brown',       'RoyalBlue3'],
"     \ ['Darkblue',    'SeaGreen3'],
"     \ ['darkgreen',   'firebrick3'],
"     \ ['darkcyan',    'RoyalBlue3'],
"     \ ['darkred',     'SeaGreen3'],
"     \ ['darkmagenta', 'DarkOrchid3'],
"     \ ['brown',       'firebrick3'],
"     \ ['darkmagenta', 'DarkOrchid3'],
"     \ ['Darkblue',    'firebrick3'],
"     \ ['darkgreen',   'RoyalBlue3'],
"     \ ['darkcyan',    'SeaGreen3'],
"     \ ['darkred',     'DarkOrchid3'],
"     \ ['red',         'firebrick3'],
"     \ ]
" Syntastic
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list            = 1
" let g:syntastic_check_on_open            = 1
" let g:syntastic_check_on_wq              = 0
" let g:syntastic_javascript_checkers = ['jshint']
" let g:syntastic_ruby_checkers = ['rubocop']
" let g:syntastic_haml_checkers = ['haml_lint']

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:vim_markdown_folding_disabled=1

set relativenumber
set number
set autoindent
set wildmenu

set wildignore+=*/tmp/*
set wildignore+=.git,.svn,CVS
set wildignore+=*.o,*.a,*.class,*.obj,*.so,*~,*.swp,*.zip
set wildignore+=*.log,*.log.*
set wildignore+=*.jpg,*.png,*.xpm,*.gif,*.pdf

" Ignore case if search pattern is all lowercase, case-sensitive otherwise
set ignorecase
set smartcase

" ColorScheme
syntax enable
set background=dark
colorscheme solarized8_dark_flat

" Don't use ignorecase for * and #
:nnoremap * /\C\<<C-R>=expand('<cword>')<CR>\><CR>
:nnoremap # ?\C\<<C-R>=expand('<cword>')<CR>\><CR>
