" ***********
" * PLUGINS *
" ***********
call plug#begin('~/.config/nvim/plugged')
" COLORSCHEMES
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'joshdick/onedark.vim'
" AIRLINE
Plug 'vim-airline/vim-airline' "cool status bar
Plug 'vim-airline/vim-airline-themes' "themes for airline

" BUFFERLINE
Plug 'akinsho/nvim-bufferline.lua'
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)

" NERDTREE
Plug 'scrooloose/nerdtree' "tree file manager
Plug 'jistr/vim-nerdtree-tabs' "tree file manager
Plug 'ryanoasis/vim-devicons'

" SURROUND
Plug 'tpope/vim-surround'

" LINTING
Plug 'dense-analysis/ale' "linting

" C#
Plug 'OmniSharp/omnisharp-vim' "C#

" COC COMPLETION
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/coc-tailwindcss',  {'do': 'yarn install --frozen-lockfile && yarn run build'}

" HTML
Plug 'mattn/emmet-vim'
Plug 'gko/vim-coloresque'
" CSS
Plug 'ap/vim-css-color'

" JS
Plug 'jelera/vim-javascript-syntax'

" PYTHON
Plug 'vim-python/python-syntax'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" REACTJS
Plug 'maxmellon/vim-jsx-pretty'

" SYMFONY
Plug 'evidens/vim-twig'

" Install snipmate:
Plug 'SirVer/ultisnips'

" Install snippets:
Plug 'sudar/vim-wordpress-snippets'

" PRETTIER
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/0.x'
  \ }

" INDENTATION
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-sleuth'
" AUTOPAIRS
Plug 'jiangmiao/auto-pairs'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" COMMENTS
Plug 'tpope/vim-commentary' "esasy comments typing gcc

call plug#end()

" ***************
" * VIM CONFIG *
" **************
set number
set noshowmode  " to get rid of thing like --INSERT--
set noshowcmd  " to get rid of display of last command

" WINDOW NAVIGATION
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

" AUTOCMDS
autocmd VimEnter * NERDTree
autocmd BufWritePost * ALEEnable

:highlight CursorLine ctermfg=White ctermbg=1 cterm=bold

" INDENTATION
let g:CSApprox_loaded = 1

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

" ****************
" * COLORSCHEMES *
" ****************
" colorscheme dracula
colorscheme onedark
syntax enable
hi Normal guibg=NONE ctermbg=NONE
set termguicolors

" **************
" * ALE CONFIG *
" **************

 let g:ale_linters = {
      \   'python': ['pylint'],
      \   'javascript': ['eslint', 'prettier'],
      \   'cs': ['OmniSharp'],
      \}

 let g:ale_fixers = {
      \    'python': ['yapf'],
      \    'javascript': ['prettier'],
      \    'jsx': ['prettier'],
      \    'css': ['prettier']
      \}


let g:ale_fix_on_save=1


let g:ale_linters_explicit=1

let g:ale_sign_error='✘'
let g:ale_sign_warning='⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" identifying jsx files as javascript files
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

" ************
" * PRETTIER *
" ************
let g:prettier#autoformat = 1
" let g:prettier#autoformat_require_pragma = 0
" *******************
" * KITE COMPLETION *
" *******************
let g:kite_supported_languages = ['*']

" *************
" * OMNISHARP *
" *************
let g:OmniSharp_loglevel = 'DEBUG'
let g:OmniSharp_server_stdio = 1
" let g:OmniSharp_server_path = '/home/andres/omnisharp/omnisharp.http-linux-x64/run'
let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_highlighting = 3

" *********
" * EMMET *
" *********
let g:user_emmet_leader_key=','

" *******
" * FZF *
" *******
let g:ctrlp_user_command = {
\    'types': {
\      1: [
\        '.git',
\        'cd %s &&
\         git ls-files . -co --exclude-standard
\         | awk ''{ print length, $0 }''
\         | sort -n -s
\         | cut -d" " -f2-'
\      ],
\    },
\    'fallback': 'find %s -type f'
\  }
" ************
" * NERDTREE *
" ************
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 25
let NERDTreeMinimalUI = 1

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>


"**************
"* COPY/PASTE *
"**************
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

" ******************
" * AIRLINE CONFIG *
" ******************

let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1


let g:airline_theme = "ayu_mirage" "transparent if not termguicolors
let g:airline_theme = "onedark"

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
"   let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
"   let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

"   " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif


"*****************
"* ABBREVIATIONS *
"*****************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
cnoreabbrev tnew tabnew
cnoreabbrev tn tabnext
cnoreabbrev tp tabprevious
cnoreabbrev tc tabclose

"************
"* MAPPINGS *
"************

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>



" PHP
set tabstop=4
set shiftwidth=4
