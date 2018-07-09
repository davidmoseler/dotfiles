"On gnome, install vim-gnome, xsel and xclip for the vimrc to work

"execute pathogen#infect()
"
"
source ~/code/dotfiles/bundles.vim

set nocompatible
" If a file is changed outside of vim, automatically reload it without asking
set autoread
" Use the old vim regex engine (version 1, as opposed to version 2, which was
" introduced in Vim 7.3.969). The Ruby syntax highlighting is significantly
" slower with the new regex engine.
"set re=1

filetype off

set rtp+=~/.vim/bundle/Vundle.vim

colorscheme railscasts
"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59


" set up some custom colors
highlight clear SignColumn
highlight VertSplit    ctermbg=236
highlight ColorColumn  ctermbg=237
highlight LineNr       ctermbg=236 ctermfg=240
highlight CursorLineNr ctermbg=236 ctermfg=240
highlight CursorLine   ctermbg=236
highlight StatusLineNC ctermbg=238 ctermfg=0
highlight StatusLine   ctermbg=240 ctermfg=12
highlight IncSearch    ctermbg=3   ctermfg=1
highlight Search       ctermbg=1   ctermfg=3
highlight Visual       ctermbg=3   ctermfg=0
highlight Pmenu        ctermbg=240 ctermfg=12
highlight PmenuSel     ctermbg=3   ctermfg=1
highlight SpellBad     ctermbg=0   ctermfg=1


" map markdown preview
map <leader>m :!open -a "Atom" %<cr><cr>

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

"easily access to first non-whitespace character
nnoremap 0 ^
nnoremap 00 0

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" map git commands
map <leader>b :Gblame<cr>
map <leader>l :!clear && git log -p %<cr>
map <leader>d :!clear && git diff %<cr>

"map vundle commands
map <leader>pi :PluginInstall<cr>


let g:vroom_use_vimux =1
let g:vroom_use_colors = 1
let g:vroom_use_binstubs=1

"###################
"# general
"###################

" set autochdir

let mapleader = "\<Space>"

"improve speed for ctrlp fuzzy finder
let g:ctrlp_user_command = 'ag %s -l --hidden --ignore tmp --ignore vendor --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_custom_ignore = '\v[\/]\.(DS_Store|vendor|git|hg|svn|optimized|compiled|node_modules|tmp)$'


if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" if executable('ag')
" 		" Note we extract the column as well as the file and line number
" 		set grepprg=ag\ --nogroup\ --nocolor\ --column
" 		set grepformat=%f:%l:%c%m
" endif


syntax on
set shiftwidth=2
set tabstop=2
set expandtab
set lazyredraw            " don't update while executing macros
set history=1000
set scrolloff=4

set backspace=indent,eol,start

se mouse+=a "allow to copy without line numbers

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

nmap <leader>rc :sp $MYVIMRC<cr>
nmap <leader>vt :sp ~/code/dotfiles/tmux.conf<cr>
nmap <leader>vb :sp ~/code/dotfiles/bundles.vim<cr>
nmap <leader>vz :sp ~/code/dotfiles/zshrc<cr>
nmap <leader>vf :sp ~/code/dotfiles/fresh_start.sh<cr>
nmap <leader>vm :sp ~/code/laptop/mac<cr>
nmap <leader>q :q<cr>
nmap <leader>Q :wq<cr>
nmap <leader>W :wq<cr>
nmap <leader>w :w<cr>
nmap <leader>so :source $MYVIMRC<cr>

cnoremap <expr> %% expand('%:h').'/'


function! VimuxSlime()
  call VimuxRunCommand(@v)
  call VimuxSendKeys("Enter")
endfunction

" If text is selected, save it in the v buffer and send that buffer it to tmux
vmap <Leader>vs "vy :call VimuxSlime()<CR>

" Select current paragraph and send it to tmux
nmap <Leader>vs vip<LocalLeader>vs<CR>

" Inspect runner pane map
map <Leader>vi :VimuxInspectRunner<CR>
" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>

nmap k gk
nmap j gj
imap jk <Esc>
imap kj <Esc>

" Copy the entire buffer into the system register
nmap <leader>co ggVG*y

map <Leader>p :set paste<CR><esc>"*]p:set nopaste<cr>
" map <Leader>p "*]p

map <Leader>i mmgg=G`m<cr>


map <Leader>cs :call SearchForCallSitesCursor()<CR>

"
" Use the same symbols as TextMate for tabstops and EOLs
"set list
"set listchars=tab:▸\ ,eol:¬,trail:.
"set lcs=tab:>-,eol:<

" search with / faster
set incsearch
set hlsearch
" Use Silver Searcher instead of grep
set grepprg=ag

set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter

set magic " Set magic on, for regex

" set clipboard^=unnamed "allow to copy to clipboard
set clipboard^=unnamed,unnamedplus "allow to copy to clipboard


set autoindent " automatically set indent of new line
set smartindent

set laststatus=2 " show the satus line all the time

" Numbers
set number
"set numberwidth=5
"set relativenumber

function! NumberToggle()
  if(&relativenumber ==1)
    set norelativenumber
    set number
  else
    set relativenumber
    set number
  endif
endfunction

nnoremap <leader>n :call NumberToggle()<cr>
""" SYSTEM CLIPBOARD COPY & PASTE SUPPORT
set pastetoggle=<F2> "F2 before pasting to preserve indentation
"Copy paste to/from clipboard
vnoremap <C-c> "*y

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

"more split configs
set winwidth=84
set winheight=5
set winminheight=5
set winheight=999

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" resize panes
" map <ESC> <M>
" noremap <M-Left> :vertical resize +5<cr>
" noremap <M-Right> :vertical resize -5<cr>
" noremap <M-Up> :resize +5<cr>
" noremap <M-Down> :resize -5<cr>

autocmd Filetype help nmap <buffer> q :q<cr>

"###################
"# Ctags
"###################
" nnoremap <space>ct :!ctags --fields=+l -R -f ./.git/tags --exclude=*.js .<CR>
nnoremap <space>ct :!ctags --fields=+l -R --exclude=*.js .<CR>

" set tags directory for goto definition
" set tags=./.git/tags;

let g:ycm_collect_identifiers_from_tags_files = 1

"###################

" add match to module, class, def, etc using % or ]]
runtime macros/matchit.vim
" fix error in NERDTree as per
" http://superuser.com/questions/387777/what-could-cause-strange-characters-in-vim
let g:NERDTreeDirArrows=0

"###################
"# git integration
"###################
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gp :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :call VimuxRunCommand("git push")<CR>
nnoremap <space>gpl :call VimuxRunCommand("git pull")<CR>
" nnoremap <space>gs :call VimuxRunCommand("git status -s")<CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gl :call VimuxRunCommand("git log")<CR>

"###################
"# Plugin setup
"###################

" let g:gitgutter_realtime = 0
" let g:gitgutter_eager = 0


let g:vimwiki_list = [{'path':'~/code/wiki', 'path_html':'~/code/export/html/'}]

au BufRead,BufNewFile *.wiki set filetype=vimwiki
:autocmd FileType vimwiki map <leader>d :VimwikiMakeDiaryNote<cr>
function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction
:autocmd FileType vimwiki map <leader>c :call ToggleCalendar()<cr>
:autocmd FileType vimwiki map <leader>u :VimwikiDiaryGenerateLinks<cr>



"adding spec config to dispatch
let g:rspec_command = "Dispatch bin/rspec {spec}"


map <Leader>r :! chrome-cli reload<CR><CR>
map <Leader>bi :Bundle install<cr>


"NERDTree configurations
"autocmd vimenter * NERDTree
map <Leader>n :NERDTreeToggle<CR>

"mappings for tabs
map <Leader>tn :tabnext<CR>
map <Leader>tp :tabprev<CR>

"mappings for rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

set formatoptions-=t

"closetag
let g:closetag_filenames = '*.html,*.php'

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

"#### Not empty buffer when leaving
" autocmd VimLeave * call system("xsel -ib", getreg('+'))
autocmd VimLeave * call system("echo -n $'" . escape(getreg(), "'") . "' | xsel -ib")

"######
"# Functions
"#########
"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RemoveFancyCharacters COMMAND
" Remove smart quotes, etc.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RemoveFancyCharacters()
  let typo = {}
  let typo["“"] = '"'
  let typo["”"] = '"'
  let typo["‘"] = "'"
  let typo["’"] = "'"
  let typo["–"] = '--'
  let typo["—"] = '---'
  let typo["…"] = '...'
  :exe ":%s/".join(keys(typo), '\|').'/\=typo[submatch(0)]/ge'
endfunction
command! RemoveFancyCharacters :call RemoveFancyCharacters()



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.e\?rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" function! MapCR()
" 	nnoremap <cr> :call RunTestFile()<cr>
" endfunction
" call MapCR()

nnoremap <leader>T :call RunNearestTest()<cr>
nnoremap <leader>a :call RunTests('')<cr>
nnoremap <leader>c :w\|:!script/features<cr>
nnoremap <leader>w :w\|:!script/features --profile wip<cr>

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " Run the tests for the previously-marked file.
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|test_.*\.py\|_test.py\)$') != -1
  if in_test_file
    call SetTestFile(command_suffix)
  elseif !exists("t:grb_test_file")
    return
  end
  call RunTests(t:grb_test_file)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number)
endfunction

function! SetTestFile(command_suffix)
  " Set the spec file that tests will be run for.
  let t:grb_test_file=@% . a:command_suffix
endfunction

function! RunTests(filename)
  " Write the file and run tests for the given filename
  if expand("%") != ""
    :w
  end
  if match(a:filename, '\.feature$') != -1
    exec ":!script/features " . a:filename
  else
    " First choice: project-specific test script
    if filereadable("script/test")
      exec ":!script/test " . a:filename
      " Fall back to the .test-commands pipe if available, assuming someone
      " is reading the other side and running the commands
    elseif filewritable(".test-commands")
      let cmd = 'rspec --color --format progress --require "~/lib/vim_rspec_formatter" --format VimFormatter --out tmp/quickfix'
      exec ":!echo " . cmd . " " . a:filename . " > .test-commands"

      " Write an empty string to block until the command completes
      sleep 100m " milliseconds
      :!echo > .test-commands
      redraw!
      " Fall back to a blocking test run with Bundler
    elseif filereadable("Gemfile")
      exec ":!bundle exec rspec --color " . a:filename
      " If we see python-looking tests, assume they should be run with Nose
    elseif strlen(glob("test/**/*.py") . glob("tests/**/*.py"))
      exec "!nosetests " . a:filename
      " Fall back to a normal blocking test run
    else
      exec ":!rspec --color " . a:filename
    end
  end
endfunction

function! SearchForCallSitesCursor()
  let searchTerm = expand("<cword>")
  execute ":Ack" searchTerm
  " call SearchForCallSites(searchTerm)
endfunction

" function! SearchForCallSites(term)
"     cexpr system('ag ' . shellescape(a:term) . '\| grep -v def')
" endfunction
