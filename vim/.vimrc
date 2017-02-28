" setup pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on
colorscheme monokai

set visualbell " disable bell

" Load Custom Settings
source ~/.vim/startup/mappings.vim


set number
set tabstop=4
set shiftwidth=4
"set colorcolumn=110

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Open NERDTree automaticall when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd VimEnter * if argc() != 0 && exists("s:std_in") | NERDTree | wincmd p | endif
autocmd VimEnter * NERDTree
autocmd VimEnter * if exists("s:std_in") | wincmd p | endif
" Open NERDTree on startup, and have my cursor start in the other window
" autocmd vimenter * NERDTree
" autocmd vimenter * wincmd p

"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"let g:Powerline_symbols = 'fancy'
call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')
