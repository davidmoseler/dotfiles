set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

Plugin 'bronson/vim-trailing-whitespace'
Plugin 'terryma/vim-multiple-cursors'



"Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/nerdtree'
Plugin 'easymotion/vim-easymotion'
"Powerline alternative
Plugin 'vim-airline/vim-airline'

" ctr w o to zoom window

Plugin 'vim-scripts/ZoomWin'
" Pairs of handy bracket mappings
Plugin 'tpope/vim-unimpaired'

Plugin 'ervandew/supertab'
"Surround words lines and blocks with { [ "' EVERYTHING
Plugin 'tpope/vim-surround.git'
Plugin 'PeterRincker/vim-argumentative.git'
" allow to repeat more things with . command
Plugin 'tpope/vim-repeat'

"use :CtrlP to search for files
Plugin 'ctrlpvim/ctrlp.vim'

"autocompletion
Plugin 'Valloric/YouCompleteMe'

"rails plugin
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-rake'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'skalnik/vim-vroom'

"ack to search for patterns
Plugin 'mileszs/ack.vim'

"snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
" " Optional:
Plugin 'honza/vim-snippets'

"pluralize, etc
Plugin 'tpope/vim-abolish'

"plugins to facilitate motions
Plugin 'vim-scripts/argtextobj.vim'

"git
Plugin 'gregsexton/gitv'

"tmux integration
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'benmills/vimux'


"run specs, etc
Plugin 'tpope/vim-dispatch'

"maximize window with F3
Plugin 'szw/vim-maximizer'

"personal wiki
Plugin 'vimwiki/vimwiki'
Plugin 'mattn/calendar-vim'

"commentary
Plugin 'tpope/vim-commentary'

Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'kana/vim-textobj-user'

Plugin 'alvan/vim-closetag'

call vundle#end()
filetype plugin indent on


