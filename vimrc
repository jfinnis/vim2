" VIMRC """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" {{{1
" plugin loading ---------------------------------------------------------- {{{2
call plug#begin('~/.vim/plugged')
  Plug 'airblade/vim-gitgutter'
  Plug 'AndrewRadev/switch.vim'
  Plug 'bcicen/vim-jfmt'
  Plug 'benmills/vimux'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'elzr/vim-json'
  Plug 'jceb/vim-textobj-uri'
  Plug 'jfinnis/vim-unimpaired'
  Plug 'kana/vim-altr'
  Plug 'kana/vim-operator-replace'
  Plug 'kana/vim-operator-user'
  Plug 'kana/vim-textobj-entire'
  Plug 'kana/vim-textobj-indent'
  Plug 'kana/vim-textobj-fold'
  Plug 'kana/vim-textobj-line'
  Plug 'kana/vim-textobj-underscore'
  Plug 'kana/vim-textobj-user'
  Plug 'kshenoy/vim-signature'
  Plug 'luochen1990/rainbow'
  Plug 'mileszs/ack.vim'
  Plug 'mxw/vim-jsx'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'paradigm/SkyBison'
  Plug 'PeterRincker/vim-argumentative'
  Plug 'Raimondi/delimitMate'
  Plug 'scrooloose/nerdcommenter'
  Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
  Plug 'tommcdo/vim-exchange'
  Plug 'tommcdo/vim-fubitive'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-sleuth'
  Plug 'tpope/vim-speeddating'
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-scripts/RelOps'
call plug#end()

" general settings -------------------------------------------------------- {{{2
let mapleader=';'
syntax on
set nocompatible
set noautochdir             " don't change directory to the file you opened
set formatoptions=cqrl
set hidden                  " liberal hidden buffers
set history=100
set mouse=a
set shortmess=filmnrxtTI
set scrolloff=4             " lines below cursor while scrolling
set timeoutlen=500          " mappings must be completed within # milliseconds
set ttyfast
set wildmenu                " tab menu completion
set wildmode=longest,list   " tab completion settings

" editing settings -------------------------------------------------------- {{{2
set autoindent
set backspace=indent,eol,start " backspace over everything in insert mode
set gdefault                " always do g option for substitute
set linebreak
set matchtime=3             " tenths of a second to show matching paren
set nojoinspaces
set pastetoggle=<F10>       " paste in a sane manner
set noundofile              " store in .un files the previous changes
set virtualedit+=block      " allows cursor anywhere in visual block mode
set whichwrap+=h,l          " cursor keys wrap lines
set wrap

" tab settings ------------------------------------------------------------ {{{2
set expandtab               " replace tabs with spaces
set shiftwidth=4            " indent width using '<' and '>'
set softtabstop=4           " 4 space tabs
set tabstop=4

" display settings -------------------------------------------------------- {{{2
colorscheme ir_black
set background=light
highlight CursorLine term=none cterm=none ctermbg=0
highlight ColorColumn ctermbg=233
set updatetime=100          " redraw screen faster
set laststatus=2            " always display status line
set nocul                   " highlight current line
set number                  " display line numbers
set ruler                   " show the cursor position always
set cursorline              " highlight cursor line
set title                   " show file in titlebar
set t_Co=256                " number of colors:

" search settings --------------------------------------------------------- {{{2
set hlsearch                " highlight search terms
set ignorecase              " ignore case in searches
set incsearch               " search incrementally
set smartcase               " ... unless capitals are included

" AUTOCOMMANDS """""""""""""""""""""""""""""""""""""""""""""""""""""""""""" {{{1
augroup filetypedetect
    autocmd BufNewFile,BufRead .tmux.conf*,tmux.conf* setfiletype tmux
augroup END

" KEY UNBINDINGS """""""""""""""""""""""""""""""""""""""""""""""""""""""""" {{{1
map ZQ <nop>
map ZZ <nop>

" KEY BINDINGS """""""""""""""""""""""""""""""""""""""""""""""""""""""""""" {{{1
" clear current search ---------------------------------------------------- {{{2
nnoremap <silent> <C-L> :noh<CR>

" quick file access ------------------------------------------------------- {{{2
map <Leader>S :source ~/.vimrc<cr>:filetype detect<cr>:echo "Sourced vimrc"<cr>
map <leader>cd :cd %:h<cr>
map <leader>V :e ~/.vim/vimrc <bar> :cd ~/.vim<cr>
map <leader>T :e ~/.tmux/tmux.conf <bar> :cd ~/.tmux<cr>
map <leader>Z :e ~/.zsh/zshrc <bar> :cd ~/.zsh<cr>

" formatting mappings ----------------------------------------------------- {{{2
" reindent whole file and return cursor position
nmap g= gg=G<C-O><C-O>

" yanking/pasting improvements -------------------------------------------- {{{2
" make Y behave like other capitals
map Y y$

" indent the just pasted text
nnoremap <Leader>> g'[>']
nnoremap <Leader>< g'[<']

" vreplace mode ----------------------------------------------------------- {{{2
nnoremap gr gR

" split line at the current cursor position ------------------------------- {{{2
nnoremap S i<cr><esc>

" remove all trailing whitespace ------------------------------------------ {{{2
nnoremap <Leader>W :%s/\s\+$//<cr>:let @/=''<cr>:echo "Removed trailing whitespace"<cr>

" use M to lookup with man ------------------------------------------------ {{{2
nnoremap M K

" word completion --------------------------------------------------------- {{{2
" remap tab
inoremap <tab><tab> <tab>
inoremap <tab><space> <tab>
" complete defined identifiers
imap <tab>d	<C-X><C-D>
" scroll up in insert mode
imap <tab>e	<C-X><C-E>
" complete file names
imap <tab>f	<C-X><C-F>
" complete identifiers
imap <tab>i	<C-X><C-I>
" complete identifiers from dictionary
imap <tab>k	<C-X><C-K>
" complete whole lines
imap <tab>l	<C-X><C-L>
" next completion
imap <tab>n	<C-X><C-N>
" omni completion
imap <tab>o	<C-X><C-O>
" previous completion
imap <tab>p	<C-X><C-P>
" spelling suggestions
imap <tab>s	<C-X><C-S>
" complete identifiers from thesaurus
imap <tab>t	<C-X><C-T>
" complete with 'completefunc'
imap <tab>u	<C-X><C-U>
" complete like in : command line
imap <tab>v	<C-X><C-V>
" scroll down in insert mode
imap <tab>y	<C-X><C-Y>
" complete tags
imap <tab>]	<C-X><C-]>

" add number object for modification (cin, etc) --------------------------- {{{2
onoremap n :<c-u>call <SID>NumberTextObject(0)<cr>
xnoremap n :<c-u>call <SID>NumberTextObject(0)<cr>
onoremap an :<c-u>call <SID>NumberTextObject(1)<cr>
xnoremap an :<c-u>call <SID>NumberTextObject(1)<cr>
onoremap in :<c-u>call <SID>NumberTextObject(1)<cr>
xnoremap in :<c-u>call <SID>NumberTextObject(1)<cr>

" WINDOW/BUFFER MAPPINGS """""""""""""""""""""""""""""""""""""""""""""""""" {{{1
" window management ------------------------------------------------------- {{{2
map <Leader>h <C-W>h        " ;[hjkl] to navigate split window--s
map <Leader>j <C-W>j
map <Leader>k <C-W>k
map <Leader>l <C-W>l
nnoremap + <C-W>_           " max window
nnoremap _ <C-W>=           " same size

" location list popup ----------------------------------------------------- {{{2
map <leader>L :llist<cr>

" window resizing --------------------------------------------------------- {{{2
nnoremap <silent> <C-W>< <C-W><:let g:LastWindowResize="in-horiz"<cr>
nnoremap <silent> <C-W>> <C-W>>:let g:LastWindowResize="out-horiz"<cr>
nnoremap <silent> <C-W>+ <C-W>+:let g:LastWindowResize="out-vert"<cr>
nnoremap <silent> <C-W>- <C-W>-:let g:LastWindowResize="in-vert"<cr>

" buffer management ------------------------------------------------------- {{{2
map <Leader>, :e #<cr>                " open alternate buffer
map <Leader>q :bd<cr>                 " close current buffer and close window
map <Leader>Q :Bclose<cr>             " close current buffer and keep window
map <Leader>bo :BufOnly<cr>           " close all buffers and windows except this

" automatically centering text -------------------------------------------- {{{2
" can use zz/t/b in visual mode to center/top/bottom selection
xnoremap <silent> zz :<C-u>call setpos('.',[0,(line("'>")-line("'<"))/2+line("'<"),0,0])<Bar>normal! zzgv<cr>
xnoremap <silent> zt :<C-u>call setpos('.',[0,line("'<"),0,0])<Bar>normal! ztgv<cr>
xnoremap <silent> zb :<C-u>call setpos('.',[0,line("'>"),0,0])<Bar>normal! zbgv<cr>

" center screen for searches, foldcloses ---------------------------------- {{{2
nnoremap n nzz
nnoremap N Nzz
nnoremap zc zczz
nnoremap zo zozz

" ... and marks (thanks to bairui)
:for m in map(map(range(10), 'nr2char(48+v:val)'), '"nnoremap ''".v:val." ''".v:val."zz"') | exe m | endfor
:for m in map(map(range(26), 'nr2char(65+v:val)'), '"nnoremap ''".v:val." ''".v:val."zz"') | exe m | endfor
:for m in map(map(range(26), 'nr2char(97+v:val)'), '"nnoremap ''".v:val." ''".v:val."zz"') | exe m | endfor

" PLUGIN SPECIFIC BINDINGS """""""""""""""""""""""""""""""""""""""""""""""" {{{1
" Ack command/shortcut ---------------------------------------------------- {{{2
let g:ackprg="ack -i -H --nocolor --nogroup --column --ignore-directory=vendor --ignore-directory=coverage --ignore-directory=dist --ignore-file=match:widget.html --ignore-file=match:debug.ejs --ignore-file=match:tags --ignore-directory=jest --ignore-directory=jest_0 --ignore-file=match:npm-debug.log --ignore-file=match:package-lock.json --ignore-file=match:debug.html --ignore-file=match:index.html --ignore-file=match:jasmine.css --ignore-file=match:jasmine-html.js --ignore-directory=bin --ignore-file=match:app.build.js --ignore-file=match:app.build.json --ignore-directory=bower_components --ignore-directory=.sass_cache --ignore-directory=.nyc_output --ignore-directory=.sass-cache --ignore-directory=libs --ignore-directory=lib --ignore-directory=.tags --ignore-directory=dist --ignore-file=match:app.css --ignore-file=match:_SpecRunner.html --ignore-directory=test-results"
nnoremap <leader>a :Ack ""<left>
nnoremap <leader>A :Ack <C-R><C-W><cr>
nnoremap <leader>K :AckHelp 

" Airline settings -------------------------------------------------------- {{{2
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#csv#enabled=1
let g:airline#extensions#hunks#enabled=1
"let g:airline#extensions#syntastic#enabled=1 "TODO
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail_improved'
let g:airline#extensions#tabline#left_sep=''
let g:airline#extensions#tabline#left_alt_sep=''
"let g:airline#extensions#tagbar#enabled=1
let g:airline#extensions#whitespace#enabled=1
let g:airline#extensions#wordcount#enabled=1
let g:airline#extensions#wordcount#filetypes=['help', 'markdown', 'rst', 'org', 'text', 'asciidoc', 'tex', 'mail', 'txt']

" altr alternate file ----------------------------------------------------- {{{2
nmap <leader>. <Plug>(altr-forward)
nmap <leader>> <Plug>(altr-back)
"TODO

" Argumentative settings -------------------------------------------------- {{{2
nmap [a <Plug>Argumentative_Prev
nmap ]a <Plug>Argumentative_Next
xmap [a <Plug>Argumentative_XPrev
xmap ]a <Plug>Argumentative_XNext
nmap <a <Plug>Argumentative_MoveLeft
nmap >a <Plug>Argumentative_MoveRight
xmap ia <Plug>Argumentative_InnerTextObject
xmap aa <Plug>Argumentative_OuterTextObject
omap ia <Plug>Argumentative_OpPendingInnerTextObject
omap aa <Plug>Argumentative_OpPendingOuterTextObject

" ctrlp ------------------------------------------------------------------- {{{2
let g:ctrlp_map='<Leader>n'
let g:ctrlp_by_filename=1
let g:ctrlp_match_window_bottom=0
let g:ctrlp_match_window_reversed=0
let g:ctrlp_max_height=15
let g:ctrlp_working_path_mode='rw'
let g:ctrlp_show_hidden=1
let g:ctrlp_open_multiple_files='3vr'
let g:ctrlp_types = ['fil', 'mru']
let g:ctrlp_custom_ignore = {
 \ 'dir': '\v[\/](\.(git|hg|svn)|node_modules)$',
 \ 'file': '\v\.class$'
 \ }
nnoremap <leader>] :CtrlPTag<cr> "TODO

" delimitmate ------------------------------------------------------------- {{{2
let delimitMate_expand_cr=1
let delimitMate_expand_space=1

" easymotion -------------------------------------------------------------- {{{2
map H <Plug>(easymotion-overwin-f)
map L <Plug>(easymotion-bd-jk)
let g:EasyMotion_prompt='>>> '
let g:EasyMotion_verbose=0

" fugitive git wrapping --------------------------------------------------- {{{2
map <Leader>ga :Git add %<cr>
map <Leader>gb :Gblame<cr>
map <Leader>gc :Gcommit -a<cr>
map <Leader>gd :Gdiff<cr>
map <silent> <Leader>gl :Gllog<cr><cr>:lopen<cr>
map <Leader>gm :Gmerge<cr>
map <Leader>gp :Gpush<cr>
map <Leader>gr :Gread<cr>
map <Leader>gs :Gstatus<cr>
map <Leader>gv :Gmove 
map <Leader>gw :Gbrowse<cr>
autocmd BufReadPost fugitive://* set bufhidden=delete

" fix Gbrowse open web page
augroup ft_fugitive
  au!
  au User Fugitive let g:netrw_browsex_viewer = "git web--browse"
  au BufNewFile,BufRead .git/index setlocal nolist
augroup END

" gitgutter git changes in signs ------------------------------------------ {{{2
nmap <leader>ca <Plug>GitGutterStageHunk
nmap <leader>cr <Plug>GitGutterUndoHunk
nmap <leader>cp <Plug>GitGutterPreviewHunk

" indent-guides ----------------------------------------------------------- {{{2
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_default_mapping=0
let g:indent_guides_auto_colors=0
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=236

" javascript better defaults ---------------------------------------------- {{{2
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

syntax match jsOperator "!==" conceal cchar=≠
syntax match jsOperator "===" conceal cchar=〓
syntax match jsOperator ">=" conceal cchar=≥
syntax match jsOperator "<=" conceal cchar=≤
hi! link jsOperator Operator

setlocal conceallevel=1
let g:javascript_conceal_function             = "λ"
let g:javascript_conceal_null                 = "∅"
let g:javascript_conceal_this                 = "の"
let g:javascript_conceal_return               = "←"
let g:javascript_conceal_arrow_function       = "→"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"

" javascript library syntax ----------------------------------------------- {{{2
let g:used_javascript_libs = 'underscore,backbone,jquery,react,jasmine,chai'

" jfmt json formatting ---------------------------------------------------- {{{2
let g:jfmt_on_save = 0
nnoremap <Leader>J :Jfmt<cr>

" nerdcommenter ----------------------------------------------------------- {{{2
let NERDRemoveExtraSpaces=1
let NERDSpaceDelims=1
let NERDTrimTrailingWhitespace=1

" nerdtree bindings and settings ------------------------------------------ {{{2
map <silent> <Leader>N :NERDTreeToggle<cr>
let NERDChDirMode=2
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\~$', '\.aux$', '\.blg$', '\.bbl$', '\.log$', '\.dvi$', '\.gif$', '\.png$', '\.jpg$', '\.doc$', '\.bmp$']

" close vim if NERDTree is last window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" rainbow parentheses ------------------------------------------------------- {{{2
let g:rainbow_active=1
let g:rainbow_conf = {
    \    'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \    'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \    'operators': '_,_',
    \    'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \    'separately': {
    \        '*': {},
    \        'tex': {
    \            'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \        },
    \        'lisp': {
    \            'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \        },
    \        'vim': {
    \            'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \        },
    \        'html': {
    \            'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \        },
    \        'css': 0,
    \    }
    \}

" relops additional compatibility ----------------------------------------- {{{2
let g:relops_mappings=['R', 'ys']

" replace operator -------------------------------------------------------- {{{2
map R <Plug>(operator-replace)

" signature mark settings ------------------------------------------------- {{{2
let g:SignatureMarkTextHLDynamic=1
let g:SignatureMarkerTextHLDynamic=1

" skybison mappings ------------------------------------------------------- {{{2
nnoremap <leader>: :<c-u>call SkyBison("")<cr>
nnoremap K :<c-u>call SkyBison("b ")<cr>
let g:skybison_fuzz=1                "substring match

" switch bindings --------------------------------------------------------- {{{2
nnoremap - :Switch<cr>
"autocmd FileType html let b:switch_definitions = [
"\   [ 'before', 'after' ]
"\ ]

" Vim-Plug settings ------------------------------------------------------- {{{2
nnoremap <leader>Pi :PlugInstall<cr>
nnoremap <leader>PI :PlugInstall<cr>
nnoremap <leader>Pu :PlugUpdate<cr>
nnoremap <leader>PU :PlugUpdate<cr>
nnoremap <leader>Ps :PlugStatus<cr>
nnoremap <leader>PS :PlugStatus<cr>
nnoremap <leader>Pd :PlugDiff<cr>
nnoremap <leader>Pd :PlugDiff<cr>
nnoremap <leader>PD :PlugDiff<cr>

" vimux commands ---------------------------------------------------------- {{{2
map ! :call VimuxPromptCommand()<cr>
map <leader>! :call VimuxRunLastCommand()<cr>
map <leader>@ :CloseVimTmuxPanes<cr>
let g:VimuxUseNearest=0

" COMMANDS """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" {{{1
" alias for ex commands --------------------------------------------------- {{{2
fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
          \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
          \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun
call SetupCommandAlias("Vs", "vs")
" close buffer without closing window ------------------------------------- {{{2
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")
   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif
   if bufnr("%") == l:currentBufNum
     new
   endif
   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" hexdumps the file (as a toggle) ----------------------------------------- {{{2
function! ToggleHexdump()
    if !exists("s:xxd")
        let s:xxd=1 "zero: not enabled
    endif
    if s:xxd
        %!xxd
        let s:xxd=0
    else
        %!xxd -r
        let s:xxd=1
    endif
endfunction
map <leader>X :call ToggleHexdump()<cr>

" number text object (e.g., for accessing "afajl123456-aiajf")
" ------------ {{{2
function! s:NumberTextObject(whole)
  normal! v
  while getline('.')[col('.')] =~# '\v[0-9]'
    normal! l
  endwhile
  if a:whole
    normal! o
    while col('.') > 1 && getline('.')[col('.') - 2] =~# '\v[0-9]'
      normal! h
    endwhile
  endif
endfunction

" resize window according to last resize -------------------------------- {{{2
function! RepeatResize()
    if exists("g:LastWindowResize")
        if match(g:LastWindowResize, "in-horiz") == 0
            normal! <
        elseif match(g:LastWindowResize, "out-horiz") == 0
            normal! >
        elseif match(g:LastWindowResize, "out-vert") == 0
            normal! +
        else
            normal! -
        endif
    endif
endfunction
map <silent> , :call RepeatResize()<cr>

" sudo save file ---------------------------------------------------------- {{{2
command! -bar -nargs=0 Sudow 	:silent exe "write !sudo tee % >/dev/null"|silent edit

" syntax highlight group under cursor ------------------------------------ {{{2
" From Scriptease plugin by Tim Pope
function! Synnames(...) abort
  if a:0
    let [line, col] = [a:1, a:2]
  else
    let [line, col] = [line('.'), col('.')]
  endif
  return reverse(map(synstack(line, col), 'synIDattr(v:val,"name")'))
endfunction

function! ZS(count)
  if a:count
    let name = get(Synnames(), a:count-1, '')
    if name !=# ''
      return 'syntax list '.name
    endif
  else
    echo join(Synnames(), ' ')
  endif
  return ''
endfunction

nnoremap <silent> Synnames :<C-U>exe ZS(v:count)<CR>
nmap zS Synnames
"{{{1 vim:fdm=marker
