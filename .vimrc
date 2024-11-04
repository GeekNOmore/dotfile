" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Initialize vim-plug
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'easymotion/vim-easymotion'         " EasyMotion for quick navigation
Plug 'justinmk/vim-sneak'                   " Vim-sneak for quick motions
Plug 'inkarkat/vim-ReplaceWithRegister'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-surround'

call plug#end()

" EasyMotion settings
let g:EasyMotion_do_mapping = 1
nmap <Leader><Leader> <Plug>(easymotion-overwin-f)

" Sneak settings
let g:sneak#label = 1
let g:sneak#use_ignorecase = 1
let g:sneak#use_smartcase = 1

" set ignorecase
set smartcase

" Highlight yanked text
let g:highlightedyank_highlight_duration = 200
" au TextYankPost * silent! lua vim.highlight.on_yank()

" Enable relative line numbers
set relativenumber

" Set leader key to space
let mapleader = " "

" Use system clipboard
set clipboard+=unnamedplus,unnamed

" Replace with register functionality
" nnoremap <leader>r "_dP

" Smart relative line numbering
autocmd InsertEnter * :set number! relativenumber!
autocmd InsertLeave * :set number! relativenumber!

" Syntax Highlights
syntax on
filetype on
filetype plugin on
filetype indent on

" Specific file types
autocmd BufNewFile,BufRead *.md setlocal syntax=markdown
autocmd BufNewFile,BufRead *.py setlocal syntax=python

