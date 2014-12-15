call pathogen#infect()
syntax on
filetype plugin indent on

colorscheme Tomorrow-Night-Eighties

set autoread     " automatically reload files when changed on disk without prompting
set autowrite    " Automatically save before commands like :next and :make"
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set clipboard=unnamed
set colorcolumn=80
set complete=.,t " only use the current file and ctags when finding keywords
set completeopt+=longest,menu,preview
set encoding=utf-8
set hidden       " can put buffer to the background without writing to disk, will remember history/marks.
set history=200 " remember more Ex commands
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw   " don't update the display while executing macros, speed boost
set list listchars=tab:\ \ ,trail:· " expandtab
set nobackup
set nobackup
set nocompatible " makes vim behave in a more useful way (the default) than the vi-compatible manner
set noswapfile
set nowrap
set nowritebackup
set nowritebackup
set number
set ruler
set shell=bash
set shiftwidth=4
set showcmd
set smartcase
set softtabstop=4
set splitbelow
set splitright
set t_Co=256
set tabstop=4
set ttyfast      " Send more characters at a given time."
set wildignore+=*.o,*.obj,.git,*.rbc,tmp " Tab completion and command-T filtering
set wildmode=list:longest,list:full " Tab completion and command-T filtering

" Don't clobber the unnamed register when pasting over text in visual mode.
vnoremap p pgvy

let mapleader="," " leader key change
let g:ctrlp_map = '<Leader>t' " ctrl-p to ,t
let g:Powerline_symbols = 'fancy'
let g:go_disable_autoinstall = 1 " disables a bunch of vim-go bullshit
let g:syntastic_enable_signs=1 " Enable syntastic syntax checking
let g:syntastic_quiet_messages=1

let NERDTreeIgnore=['\.rbc$', '\~$'] " NERDTree ignore this shit
let g:NERDTreeMapOpenSplit = 's'  " remap NERDTree keys to match my mappings
let g:NERDTreeMapOpenVSplit = 'v'
map <Leader>n :NERDTreeToggle<CR>
map <Leader>fnt :NERDTreeFind<CR>

" map :w save to Enter
nmap <CR> :write!<CR>

" simplify split navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" search highlight cancel
map <Leader><space> :nohl<cr>

" Fugitive mappings
map <Leader>gb :Gblame<CR>
map <Leader>gs :Gstatus<CR>
map <Leader>gd :Gdiff<CR>
map <Leader>gl :Glog<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gp :Gpush<CR>

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Use ,d (or ,dd or ,dj or 20,dd) to delete a line without adding it to the yanked stack (also, in visual mode)
nmap <silent> <leader>d "_d
vmap <silent> <leader>d "_d

" use :w!! to write to a file using sudo if you forgot to 'sudo vim file' (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %

" ,t = ctrlP
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_max_height = 20
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_switch_buffer = 0
map <leader>tb :CtrlPBuffer<cr>
map <leader>tv :CtrlP app/views<cr>
map <leader>tc :CtrlP app/controllers<cr>
map <leader>tm :CtrlP app/models<cr>
map <leader>th :CtrlP app/helpers<cr>
map <leader>td :CtrlP app/decorators<cr>
map <leader>tl :CtrlP lib<cr>
map <leader>tj :CtrlP app/assets/javascripts<cr>
map <leader>ts :CtrlP spec<cr>
map <leader>tf :CtrlP config<cr>

" Open current buffer in a new split
noremap <leader>s <C-w>v<C-w>l
noremap <leader>i <C-w>s<C-w>j

" This uses ack.vim to search for the word under the cursor
nnoremap <bs> :Ack! '\b<c-r><c-w>\b'<cr> 
map <leader>f :AckFromSearch<CR>
map <leader>F :AckFromSearch<space>

" CTags
map <Leader>rt :!ctags --languages=Ruby,JavaScript,HTML --exclude=.git --exclude=log --exclude=tmp --exclude=coverage --exclude=db --extra=+f -R *
map <C-\> :tnext<CR>
set iskeyword+=?,!

" Center search matches when jumping
map N Nzz
map n nzz

" QuickFix navigation
map <C-n> :cn<CR>
map <C-p> :cp<CR>
nnoremap <LEFT> :cprev<CR>
nnoremap <RIGHT> :cnext<CR>

" Tab indenting
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" format the entire file
nmap <leader>fef ggVG=

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
endif

" trim whitespace on the end of lines
function! Preserve(command)
  let _s=@/
  let l = line(".")
  let c = col(".")
  execute a:command
  let @/=_s
  call cursor(l, c)
endfun
nmap <silent> <Leader>rtw :call Preserve("%s/\\s\\+$//e")<CR>

" add custom syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *[Ss]pec.js set filetype=jasmine-javascript.javascript
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby
au BufRead,BufNewFile *.txt call s:setupWrapping()
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} set filetype=markdown
au BufNewFile,BufRead *.thor set filetype=ruby
au BufNewFile,BufRead *.less set filetype=css

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="
