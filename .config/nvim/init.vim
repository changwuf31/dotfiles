"
" Plugins
"

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

"
" Load Plug and plugins
"

" Dependencies

" General plugins
"Plug 'tpope/vim-fugitive'
"Plug 'scrooloose/nerdtree'
"Plug 'scrooloose/syntastic'
"Plug 'kien/ctrlp.vim'
"Plug 'airblade/vim-gitgutter'
"Plug 'godlygeek/tabular'
Plug 'vim-airline/vim-airline'
" highlight current line
Plug 'miyakogi/conoline.vim'
"Plug 'https://gitlab.com/dbeniamine/todo.txt-vim.git'

" Language support
"Plug 'aklt/plantuml-syntax'                    " PlantUML syntax highlighting
"Plug 'cespare/vim-toml'                        " toml syntax highlighting
"Plug 'chr4/nginx.vim'                          " nginx syntax highlighting
"Plug 'dag/vim-fish'                            " Fish syntax highlighting
"Plug 'hashivim/vim-terraform'                  " Terraform syntax highlighting
"Plug 'kylef/apiblueprint.vim'                  " API Blueprint syntax highlighting
"Plug 'leafgarland/typescript-vim'              " TypeScript syntax highlighting
"Plug 'lifepillar/pgsql.vim'                    " PostgreSQL syntax highlighting
"Plug 'mxw/vim-jsx'                             " JSX syntax highlighting
"Plug 'pangloss/vim-javascript'                 " JavaScript syntax highlighting
"Plug 'plasticboy/vim-markdown'                 " Markdown syntax highlighting
Plug 'tpope/vim-markdown'
"Plug 'zimbatm/haproxy.vim'                     " HAProxy syntax highlighting
"
" Colorschemes
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'https://gitlab.com/protesilaos/tempus-themes-vim.git'

" Initialize plugin system
call plug#end()

"
" Shortcuts
"
" [DateTime](#http://blog.erw.dk/2016/04/19/entering-dates-and-times-in-vim/)
noremap! <expr> ,T strftime("%H:%M:%S")
noremap! <expr> ,d strftime("%Y-%m-%d")
noremap! <expr> ,l strftime("%Y-%m-%d %H:%M")

"
" Theme Settings
"

" Turn on TrueColor
set termguicolors

" Activate ColorScheme
set bg=light
colorscheme tempus_day
let g:airline_theme='zenburn'

" Deactivate airline tmuxline
let g:airline#extensions#tmuxline#enabled = 0

" Blinking cursor
"set guicursor=a:blinkwait700-blinkon400-blinkoff250

" [Automatically strip trailing spaces on save](https://unix.stackexchange.com/questions/75430/how-to-automatically-strip-trailing-spaces-on-save-in-vi-and-vim)
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Copy Paste
xnoremap "+y y:call system("wl-copy", @")<cr>
nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p
vmap <F6> "+yi
