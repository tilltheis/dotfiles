" ---------------------------------------------------------------------------
" operational settings
set nocompatible                " vim defaults, not vi!
syntax on                       " syntax on
set hidden                      " allow editing multiple unsaved buffers
set more                        " the 'more' prompt
filetype on                     " automatic file type detection
filetype plugin on              " load plugins which are filetype dependent
filetype plugin indent on       " load indent plugins which are filetype dependent
set autoread                    " watch for file changes by other programs
set visualbell                  " visual beep
set nobackup                    " don't produce *~ backup files
set mouse=a                     " enable mouse support
set enc=utf-8                   " use utf-8 encoding

" ---------------------------------------------------------------------------
" window spacing
set ruler                       " show the line number on bar
set number                      " show line number on each line
if v:version >= 703
    set relativenumber
endif

" ---------------------------------------------------------------------------
" global editing settings
set autoindent smartindent      " turn on auto/smart indenting
set expandtab                   " use spaces, not tabs
set smarttab                    " make <tab> and <backspace> smarter
set tabstop=4                   " tabstops of 4
set shiftwidth=4                " indents of 4
set backspace=eol,start,indent  " allow backspacing over indent, eol, & start
set undolevels=1000             " number of forgivable mistakes
"set updatecount=100             " write swap file to disk every 100 chars
set complete=.,w,b,u,U,t,i,d    " do lots of scanning on tab completion
set viminfo=%100,'100,/100,h,\"500,:100,n~/.viminfo

" ---------------------------------------------------------------------------
" searching...
set hlsearch                   " enable search highlight globally
set incsearch                  " show matches as soon as possible
set showmatch                  " show matching brackets when typing

" ---------------------------------------------------------------------------
" MacVIM / GVIM
if has("gui_running")
    set guioptions=egmrt
    set guifont=Menlo:h13

    colorscheme paintbox
else
    set background=dark
    colorscheme molokai
endif


" ---------------------------------------------------------------------------
" miscellaneous

"helptags ~/.vim/doc            " update helptags on startup
                                " this is now done by pathogen.vim


"write file as root
cmap w!! %!sudo tee > /dev/null %




" ---------------------------------------------------------------------------
" automatically insert closing brace after opening code block
" tis is now done by delimitMate

"function! CleverBrace()
"    if strpart( getline('.'), col('.')-2, 1 ) =~ '{'
"        return "\<CR>}\<ESC>O"
"    else
"        return "\<CR>"
"endfunction
"inoremap <CR> <C-R>=CleverBrace()<CR>


" ---------------------------------------------------------------------------
" highlight columns which are too long (above 80 characters)
if v:version >= 703
    set colorcolumn=80
    hi ColorColumn guibg=#2d2d2d
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif


autocmd BufNewFile,BufReadPost *.m set filetype=objc


" ---------------------------------------------------------------------------
" exuberant ctags (required for taglist plugin - currently not installed)
" let Tlist_Ctags_Cmd = '/opt/local/bin/ctags'


" ---------------------------------------------------------------------------
" Omni Completion
if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
                \   if &omnifunc == "" |
                \       setlocal omnifunc=syntaxcomplete#Complete |
                \   endif
endif

:imap <C-Space> <C-X><C-O>

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1


" ---------------------------------------------------------------------------
" delimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1


" ---------------------------------------------------------------------------
" miscellaneous

" Be able to to use <C-c> to exit from visual block mode after prepending
" multiple lines with new string. i.e. <C-v>5ji"smth"<Esc>
vmap <C-c> <Esc> 


" ---------------------------------------------------------------------------
" textobj-rubyblock
runtime macros/matchit.vim


" ---------------------------------------------------------------------------
" pathogen
call pathogen#runtime_append_all_bundles() 
call pathogen#helptags()
