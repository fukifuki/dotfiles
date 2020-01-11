call plug#begin('~/.local/share/nvim/plugged')

" Plug 'pangloss/vim-javascript'
" Plug 'ctrlpvim/ctrlp.vim'

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

""" Startup page
Plug 'mhinz/vim-startify'

""" Theme
Plug 'arcticicestudio/nord-vim'
Plug 'jeffkreeftmeijer/vim-dim'

""" Status bar
Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'aswathkk/darkscene.vim'
" Plug 'iCyMind/NeoSolarized'

""" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc.nvim', {'do': -> coc#util#install() }}

""" Syntax higlighting
Plug 'sheerun/vim-polyglot'

""" Unit testing support
Plug 'janko/vim-test'

""" Commenting
Plug 'joom/vim-commentary'

""" Autoclosing brackets
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'

Plug 'tpope/vim-unimpaired'

""" File search
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

""" Search everywhere
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'gilsondev/searchtasks.vim'

""" Session management
Plug 'tpope/vim-obsession'

""" Project navigation, .eg toggle between source and test
Plug 'tpope/vim-projectionist'
Plug 'airblade/vim-rooter'

""" Tags
Plug 'universal-ctags/ctags'

""" Support for Git
Plug 'tpope/vim-fugitive'

""" Note taking
Plug 'jceb/vim-orgmode'

""" Smooth scrolling
Plug 'psliwka/vim-smoothie'

""" Emmet
Plug 'mattn/emmet-vim'

Plug 'terryma/vim-multiple-cursors'

call plug#end()


" ┌──────────┐
" │ Settings │
" └──────────┘

" General
filetype plugin indent on
syntax on
set number relativenumber
set encoding=utf-8
set tabstop=2
set expandtab
set autoindent
set shiftwidth=2
set scrolloff=3
set showcmd
set hidden
set wildmenu
set visualbell
set splitright 
set splitbelow
set ttyfast
set ruler
set backspace=indent,eol,start
set number
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set wrap
set linebreak
set nolist
set shortmess+=c
set autoread
set modifiable
set autoread
set formatoptions-=cro
au CursorHold * checktime

" Theme
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_ut=                " fix 256 colors in tmux http://sunaku.github.io/vim-256color-bce.html
if has("termguicolors")  " set true colors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif
set t_Co=256
set background=dark
colorscheme nord
" colorscheme dim

" air-line
" let g:airline_powerline_fonts = 1
let g:airline_extensions = ['branch', 'hunks', 'coc', 'tabline']
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]
let g:airline_skip_empty_sections = 1
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
" Configure error/warning section to use coc.nvim
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" let g:airline#extensions#tabline#buffer_idx_format = {
"      \ '0': '0 ',
"      \ '1': '1 ',
"      \ '2': '2 ',
"      \ '3': '3 ',
"      \ '4': '4 ',
"      \ '5': '5 ',
"      \ '6': '6 ',
"      \ '7': '7 ',
"      \ '8': '8 ',
"      \ '9': '9 '
"      \}

" let g:airline_solarized_bg='dark'
let g:airline_theme = 'nord'

" COC
" NOTE: coc.nvim has main configuration file in `$DOTFILES/nvim/coc-settings.json`

hi! link CocErrorSign WarningMsg
hi! link CocWarningSign Number
hi! link CocInfoSign Type
let g:coc_global_extensions = ["coc-css",
            \ "coc-docker",
            \ "coc-eslint",
            \ "coc-html",
            \ "coc-java",
            \ "coc-json",
            \ "coc-prettier",
            \ "coc-snippets",
            \ "coc-tslint",
            \ "coc-tsserver",
            \ "coc-ultisnips",
            \ "coc-tailwindcss",
            \ "coc-vetur"]

" Configuration mostly borrowed from suggestions here:
" https://github.com/neoclide/coc.nvim#example-vim-configuration

" if hidden is not set, TextEdit might fail.
set hidden

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"pumvisible() ? "\" : "\

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

augroup cocsettings
  autocmd!
  " Setup formatexpr specified filetype(s).
  " autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" === Plugin Config === {{{1

" === coc-git === {{{2

" Shortcut for Git chunk info
nnoremap <silent> <leader>hs :CocCommand git.chunkStage<cr>
nnoremap <silent> <leader>hu :CocCommand git.chunkUndo<cr>
nnoremap <silent> <leader>hi :CocCommand git.chinkInfo<cr>

" navigate chunks of current buffer
nmap [h <Plug>(coc-git-prevchunk)
nmap ]h <Plug>(coc-git-nextchunk)
" show chunk diff at current position
"
"
" nmap hs <Plug>(coc-git-chunkinfo)
"
"
" create text object for git chunks
omap ic <Plug>(coc-text-object-inner)
xmap ic <Plug>(coc-text-object-inner)
omap ac <Plug>(coc-text-object-outer)
xmap ac <Plug>(coc-text-object-outer)


" NERDTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinPos = 'rightbelow'
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" FZF
let $FZF_DEFAULT_OPTS = '--layout=reverse'

"Open FZF and choose floating window
let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }

function! OpenFloatingWin()

  " 90% of the height
  let height = float2nr(&lines * 0.7)
  " 60% of the height
  let width = float2nr(&columns * 0.5)
  " horizontal position (centralized)
  let left = float2nr((&columns - width) / 2)
  let top = float2nr((&lines - height) / 2)

  "Set the position, size, etc. of the floating window.
  "The size configuration here may not be so flexible, and there's room for further improvement.
  let opts = {
        \ 'relative': 'editor',
        \ 'row': top,
        \ 'col': left,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }

  let top = "╭" . repeat("─", width - 2) . "╮"
  let mid = "│" . repeat(" ", width - 2) . "│"
  let bot = "╰" . repeat("─", width - 2) . "╯"
  let lines = [top] + repeat([mid], height - 2) + [bot]

  let s:buf = nvim_create_buf(v:false, v:true)
  call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
  call nvim_open_win(s:buf, v:true, opts)
  set winhl=Normal:Normal
  let opts.row += 1
  let opts.height -= 2
  let opts.col += 2
  let opts.width -= 4
  call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
  au BufWipeout <buffer> exe 'bw '.s:buf

  setlocal
        \ buftype=nofile
        \ nobuflisted
        \ bufhidden=hide
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
endfunction


let g:wintabs_ui_buffer_name_format = " %o %t "
let g:wintabs_display = 'tabline'

" vim-devicons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_vimfiler = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_enable_flagship_statusline = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:webdevicons_enable_denite = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderPatternMatching = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1
let WebDevIconsUnicodeDecorateFolderNodesExactMatches = 1


" Terminal
" Floating Term
let s:float_term_border_win = 0
let s:float_term_win = 0
function! FloatTerm(...)
  " Configuration
  let height = float2nr((&lines - 2) * 0.6)
  let row = float2nr((&lines - height) / 2)
  let width = float2nr(&columns * 0.6)
  let col = float2nr((&columns - width) / 2)
  " Border Window
  let border_opts = {
        \ 'relative': 'editor',
        \ 'row': row - 1,
        \ 'col': col - 2,
        \ 'width': width + 4,
        \ 'height': height + 2,
        \ 'style': 'minimal'
        \ }
  " Terminal Window
  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }
  let top = "╭" . repeat("─", width + 2) . "╮"
  let mid = "│" . repeat(" ", width + 2) . "│"
  let bot = "╰" . repeat("─", width + 2) . "╯"
  let lines = [top] + repeat([mid], height) + [bot]
  let bbuf = nvim_create_buf(v:false, v:true)
  call nvim_buf_set_lines(bbuf, 0, -1, v:true, lines)
  let s:float_term_border_win = nvim_open_win(bbuf, v:true, border_opts)
  let buf = nvim_create_buf(v:false, v:true)
  let s:float_term_win = nvim_open_win(buf, v:true, opts)
  " Styling
  call setwinvar(s:float_term_border_win, '&winhl', 'Normal:Normal')
  call setwinvar(s:float_term_win, '&winhl', 'Normal:Normal')
  if a:0 == 0
    terminal
  else
    call termopen(a:1)
  endif
  startinsert
  " Close border window when terminal window close
  autocmd TermClose * ++once :bd! | call nvim_win_close(s:float_term_border_win, v:true)
endfunction

" ┌──────────────┐
" │ Key Mappings │
" └──────────────┘

let mapleader = "\<Space>"
nnoremap <leader>vv :vsplit $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>
let maplocalleader = ","
nmap qq :q!<CR>
" create new line (staying in normal mode)
map <Enter> o<ESC>
map <S-Enter> O<ESC>

" run
nnoremap <F9> :!%:p<Enter><Enter>

" buffers
nnoremap <leader>x :bd<Enter>

vmap <leader>y :w! /tmp/vitmp<CR>
nmap <leader>p :r! cat /tmp/vitmp<CR>

" move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" moving through text
nnoremap AG :$<Enter>o<Enter>
nnoremap AA A

" floating terminal
tnoremap <Esc> <C-\><C-n>:q!<CR>
nnoremap <Leader>at :call FloatTerm()<CR>

" alaternate between source and test file 
nnoremap <Leader>tt :A<CR>

" testing mappings
nnoremap <leader>ta :TestSuite<cr>
nnoremap <leader>tf :TestFile<cr>
nnoremap <leader>tn :TestNearest<cr>
nnoremap <leader>tt :TestLast<cr>

nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :NERDTreeFind<CR>
let g:NERDTreeChDirMode = 2  " Change cwd to parent node
let NERDTreeShowHidden = 1  " Show hidden files
let g:NERDTreeMinimalUI = 1  " Hide help text
let g:NERDTreeAutoDeleteBuffer = 1


" Emmet
" (redefine trigger key)
" let g:user_emmet_leader_key='<C-M>'
