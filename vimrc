" requred for ViIMproved
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"
" For Vandle installation run:
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
"Plugin 'itchyny/lightline.vim'
Plugin 'Align'
"Plugin 'tracwiki'
Plugin 'nsmgr8/vitra'
Plugin 'benmills/vimux'
Plugin 'vim-scripts/taglist.vim'
"Plugin 'tpope/vim-commentary' " Just /* */ comment only?
"Plugin 'vimperator/vimperator.vim'
Plugin 'aklt/plantuml-syntax'

" colorschems:
Plugin 'vim-scripts/xoria256.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'whatyouhide/vim-gotham'
"Plugin 'vim-scripts/light2011'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'jonstoler/werewolf.vim'

"Plugin 'Lokaltog/vim-powerline'
"Plugin 'stephenmckinney/vim-solarized-powerline'
"let g:Powerline_theme='short'
"let g:Powerline_colorscheme='solarized256_dark'

"Plugin 'edkolev/tmuxline.vim'
Plugin 'Shougo/unite.vim'
Plugin 'farseer90718/vim-taskwarrior'
"Plugin 'relaxedgreen'

Plugin 'vimwiki/vimwiki'
let taskwiki_disable_concealcursor="yes"
Plugin 'tbabej/taskwiki'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

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
@let g:solarized_termcolors = 256

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline#extensions#keymap#enabled = 0
@"let g:airline_section_z  = '%3p%% %l/%L' "(percentage, line number, column number)
@"let g:airline#extensions#whitespace#trailing_format = 'trailing[%s]'
@if !exists('g:airline_symbols')
@    let g:airline_symbols = {}
@endif
@let g:airline_symbols.linenr = ''
@let g:airline_symbols.whitespace = ''
@let g:airline_left_sep=' '
@let g:airline_right_sep=' '
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

Plugin 'mhinz/vim-signify'
autocmd ColorScheme solarized highlight SignColumn ctermbg=NONE guibg=NONE

Plugin 'tpope/vim-fugitive'

" Disable automatic creating backup files (filename~)
set nobackup
set nowritebackup
set noundofile

" Set string numeration
set number

" Vertical line for control string size
set colorcolumn=80

set encoding=utf-8                                  " set character translation encoding
set termencoding=utf-8                              " set terminal encoding
set fileencoding=utf-8                              " set save encoding
set fileencodings=utf8,koi8-r,cp1251,cp866,ucs-2le  " set list on encoding sort by preference

set cursorline " To highlight the current line use

let Tlist_Use_Right_Window = 1

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
if has('mac')
    set keymap=russian-jcukenmac
else
    set keymap=russian-jcukenwin
endif
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan
"
@let rumap = 'йцукенгшщзхъфывапролджэёячсмитьбюЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ'
@let enmap = 'qwertyuiop[]asdfghjkl;''\zxcvbnm,.QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>' 
@let mapLen = strchars(rumap)
@let i = 0
@while i < mapLen
@    let ruChar = matchstr(rumap, ".", byteidx(rumap, i))
@    let enChar = enmap[i]
@    "echo 'map '.ruChar.' '.enChar
@    execute 'map '.ruChar.' '.enChar
@    execute 'cmap '.ruChar.' '.enChar
@    let i += 1
@endwhile
@map Ё \|
@cmap Ё \|

" For changelog.vim
let g:changelog_username="Efim Trivozhenko <name4ef@gmail.ru>"
"let g:changelog_dateformat="%a %Y-%m-%d"

" For changemind.vim
let g:changemind_username="Efim Trivozhenko <name4ef@gmail.com>"

" vim-7.4: this tags and some others are not indented by default
let g:html_indent_inctags = "html,body,head,tbody"

" Close NERDTree buffer after file selected
let NERDTreeQuitOnOpen = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" My key bindings
"
map <F1> :VimuxInterruptRunner<CR> :VimuxRunLastCommand<CR>
map <F2> :TlistToggle<CR>
" switch between source and header files:
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
map <F5> :silent make\|redraw!<CR>
map <F6> :NERDTreeToggle<CR>
map <F7> :set spelllang=ru spell<CR>
"map <F8> :run<CR>
map <F8> :VimuxRunLastCommand<CR>
"map <F9> :VimuxRunCommand("clear; make && make run")<CR>
map <Leader><Esc> :VimuxCloseRunner<CR>

imap <F2> <C-R>=strftime("%H:%M")." "<CR>
imap <F3> <C-R>=strftime("%d.%m.%y")." "<CR>

"
" Vimux commands (past from :help vimux):
"
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

map <Leader>vm :VimuxRunCommand("clear; make && make run")<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" For enabling modeline (execute commands from editing file)
" Example: /* vim: set ts=8 sw=4 tw=0 noet: */
"
set modeline
set modelines=15 "lines at the beginning and end of the file are checked

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
set statusline=
"set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
"set statusline+=%2*\ %y\                                  "FileType
"set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
"set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
"set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
"set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
"set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%8*\ %=\ %l/%L\                            "Rownumber/total
"set statusline+=%9*\ col:%03c\                            "Colnr
"set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"let g:lightline = { 
"			\ 'colorscheme': 'gotham256',
"			\ 'component': {
"			\   'lineinfo': "%{printf('%d/%d', line('.'),  line('$'))}",
"			\ },
"			\ }
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

"set laststatus=2   " Always show the statusline (for powerline)

try
    source ~/.vimrc.local
catch
endtry
