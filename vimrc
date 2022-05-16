" requred for ViIMproved
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
"Plugin 'itchyny/lightline.vim'
Plugin 'Align'
"Plugin 'tracwiki'
"Plugin 'nsmgr8/vitra'
Plugin 'vim-scripts/taglist.vim'
"Plugin 'tpope/vim-commentary' " Just /* */ comment only?
"Plugin 'vimperator/vimperator.vim'
Plugin 'aklt/plantuml-syntax'

" colorschems:
"Plugin 'vim-scripts/xoria256.vim'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'whatyouhide/vim-gotham'
"Plugin 'vim-scripts/light2011'
"Plugin 'NLKNguyen/papercolor-theme'
"Plugin 'jonstoler/werewolf.vim'

"Plugin 'Lokaltog/vim-powerline'
"Plugin 'stephenmckinney/vim-solarized-powerline'
"let g:Powerline_theme='short'
"let g:Powerline_colorscheme='solarized256_dark'

"Plugin 'edkolev/tmuxline.vim'
"Plugin 'Shougo/unite.vim'
"Plugin 'farseer90718/vim-taskwarrior'
"Plugin 'relaxedgreen'
Plugin 'peterhoeg/vim-qml'
Plugin 'vimwiki/vimwiki'

Plugin 'tbabej/taskwiki'
let taskwiki_disable_concealcursor="yes"
let g:taskwiki_sort_order="urgency-"
let g:vimwiki_folding = ''
let g:taskwiki_sort_orders={"D": "entered+"}
" For taskwiki may be helpfull: pip3 install --user six tasklib
Plugin 'powerman/vim-plugin-AnsiEsc' " for colors in charts

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 0
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = ' '
let g:airline_symbols.colnr = ' '
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.crypt = 'Crypt:'
let g:airline#extensions#keymap#enabled = 0
let g:airline#extensions#tabline#enabled = 0

Plugin 'mhinz/vim-signify'
autocmd ColorScheme solarized highlight SignColumn ctermbg=NONE guibg=NONE

Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'

" For markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1

Plugin 'yegappan/grep'
let Grep_Skip_Files = '*.bak *~ tags'
let Grep_Skip_Dirs = 'doxygen'
map <F3> :Rgrep <cword> * <CR><CR>

Plugin 'preservim/vimux'
"let VimuxRunnerName="vo"
"let VimuxRunnerType="window"

Plugin 'ap/vim-css-color'
Plugin 'preservim/tagbar'
Plugin 'vim-syntastic/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on   " required
" To ignore plugin indent changes, instead use:
filetype plugin on

" Set color scheme
"colorscheme pablo
"colorscheme darkblue
"colorscheme delek
"colorscheme desert
"colorscheme xoria256
"colorscheme gotham256
"
"colorscheme PaperColor
"set background=dark " value: light|dark
"set t_Co=256
"
colorscheme solarized
set background=dark " value: light|dark
"let g:solarized_termcolors = 256

" Disable automatic creating backup files (filename~)
set nobackup
set nowritebackup
set noundofile

set number relativenumber
set colorcolumn=75

"set encoding=ascii
set termencoding=utf-8
set fileencoding=ascii
set fileencodings=ascii,utf-8,cp1251,koi8-r,cp866,ucs-2le

set cursorline " To highlight the current line use

let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_GainFocus_On_ToggleOpen = 1

set nocp
filetype plugin on
filetype indent on
set omnifunc=syntaxcomplete#Complete

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" For smart Russian layout (http://habrahabr.ru/post/98393/)
set keymap=russian-jcukenwin
"set keymap=russian-jcukenmac
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan
"
"let rumap = 'йцукенгшщзхъфывапролджэёячсмитьбюЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ'
"let enmap = 'qwertyuiop[]asdfghjkl;''\zxcvbnm,.QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>'
"let mapLen = strchars(rumap)
"let i = 0
"while i < mapLen
"    let ruChar = matchstr(rumap, ".", byteidx(rumap, i))
"    let enChar = enmap[i]
"    "echo 'map '.ruChar.' '.enChar
"    execute 'map '.ruChar.' '.enChar
"    execute 'cmap '.ruChar.' '.enChar
"    let i += 1
"endwhile
"map Ё \|
"cmap Ё \|

" For changelog.vim
let g:changelog_username="Efim Trivozhenko <name4ef@gmail.ru>"
"let g:changelog_dateformat="%a %Y-%m-%d"

" For changemind.vim
let g:changemind_username="Efim Trivozhenko <name4ef@gmail.com>"

" vim-7.4: this tags and some others are not indented by default
let g:html_indent_inctags = "html,body,head,tbody"

" Close NERDTree buffer after file selected
"let NERDTreeQuitOnOpen = 1
let NERDTreeHighlightCursorline = 1

" Switch editing between .c* and .h* files (and more).
" Since .h file can be in a different dir, call find.
" https://vim.fandom.com/wiki/Easily_switch_between_source_and_header_file
"set path=.,,..,../..,./*,./*/*,../*,~/,~/**,/usr/include/*
function! SourceHeaderToggle()
    if match(expand("%"),'\.c') > 0
        let s:flipname = substitute(expand("%"),'\.c\(.*\)','.h\1',"")
        execute ":open " s:flipname
    elseif match(expand("%"),"\\.h") > 0
        let s:flipname = substitute(expand("%"),'\.h\(.*\)','.c\1',"")
        execute ":open " s:flipname
    endif
endfun

map <F2> :TagbarToggle(f)<CR>
" switch between source and header files:
map <F4> :call SourceHeaderToggle()<CR>
map <F5> :silent make\|redraw!<CR>
map <F6> :NERDTreeToggle<CR>
map <F7> :set spelllang=ru spell<CR>
map <F12> :set invlist<CR>
imap <F2> <C-R>=strftime("%H:%M")<CR>
imap <F3> <C-R>=strftime("%d.%m.%y")<CR>

" Run the current file with rspec
map <Leader>rb :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>
" Run command without sending a return
map <Leader>rq :call VimuxRunCommand("clear; rspec " . bufname("%"), 0)<CR>
" Prompt for a command to run map
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vm :VimuxPromptCommand("make")<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane map
map <Leader>vi :VimuxInspectRunner<CR>
" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>
" Interrupt any command running in the runner pane map
map <Leader>vs :VimuxInterruptRunner<CR>
" Clear the tmux history of the runner pane
map <Leader>vc :VimuxClearRunnerHistory<CR>
" Zoom the tmux runner page
map <Leader>vz :VimuxZoomRunner<CR>
map <Leader>vm :VimuxRunCommand("make run")<CR>

map <F9> :VimuxInterruptRunner<CR>
map <Leader><Esc> :VimuxCloseRunner<CR>

map <Esc>[19;2~ <S-F8>
map <F8> :VimuxInterruptRunner<CR> :VimuxRunLastCommand<CR>
if !exists('g:VimuxLastCommand')
    let VimuxLastCommand = "make"
endif
nnoremap <S-F8> :VimuxPromptCommand(VimuxLastCommand)<CR>


" For enabling modeline (execute commands from editing file)
" Example: /* vim: set ts=8 sw=4 tw=0 noet: */
set modeline
set modelines=15 "lines at the beginning and end of the file are checked

function! HighlightSearch()
    if &hls
        return 'H'
    else
        return ''
    endif
endfunction

" Colors adapted from ligh2011:
hi User1 guifg=#ffdad8  guibg=#880c0e
hi User2 guifg=#000000  guibg=#F4905C
hi User3 guifg=#292b00  guibg=#f4f597
hi User4 guifg=#112605  guibg=#aefe7B
hi User5 guifg=#051d00  guibg=#7dcc7d
hi User7 guifg=#ffffff  guibg=#880c0e gui=bold
hi User8 guifg=#ffffff  guibg=#5b7fbb
hi User9 guifg=#ffffff  guibg=#810085
hi User0 guifg=#ffffff  guibg=#094afe

"let g:lightline = {
"            \ 'colorscheme': 'gotham256',
"            \ 'component': {
"            \   'lineinfo': "%{printf('%d/%d', line('.'),  line('$'))}",
"            \ },
"            \ }
"
" Man pages viewer
runtime ftplugin/man.vim

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

"source ~/.vim/php-doc.vim
"inoremap <C-C> <ESC>:call PhpDocSingle()<CR>i
"nnoremap <C-C> :call PhpDocSingle()<CR>
"vnoremap <C-C> :call PhpDocRange()<CR>

"set laststatus=2 " Always show the statusline (for powerline)

set scrolloff=0

" Makes interface minimalist by Shift + H
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        AirlineToggle
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
        "set tabline=%
        set nonumber
        set norelativenumber
        set colorcolumn=0
        "set lines+=1
        set signcolumn=no
        set nocursorline
    else
        let s:hidden_all = 0
        AirlineToggle
        set showmode
        set ruler
        set laststatus=2
        set showcmd
        "set tabline=%!airline#extensions#tabline#get()
        set number
        set relativenumber
        set colorcolumn=80
        "set lines-=1
        set signcolumn=yes
        set cursorline
    endif
endfunction
nnoremap <S-h> :call ToggleHiddenAll()<CR>

set listchars=eol:$,tab:>·,trail:~,extends:>,precedes:<,space:␣

" Disable (hide through color) '~' character at start of empty line
highlight NonText ctermfg=bg

syntax match nonascii "[^\x00-\x7f]"
            \ containedin=cComment,vimLineComment,pythonComment |
function HighlightNonAscii()
    highlight nonascii
                \ cterm=underline ctermfg=red ctermbg=none term=underline
endfunction
function NoHighlightNonAscii()
    highlight nonascii
                \ cterm=none ctermfg=none ctermbg=none term=none
endfunction
autocmd BufNewFile,BufReadPost * call HighlightNonAscii()
