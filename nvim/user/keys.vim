imap jk <Esc>
tnoremap jk <C-\><C-n> 
vmap u <ESC>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" remap page up / down
noremap <C-j> <PageDown>
noremap <C-k> <PageUp>
noremap <Space> <PageDown>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easier folding
nnoremap <Leader>f za

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" switch windows
tnoremap <C-j> <C-\><C-n><C-w>h
tnoremap <C-k> <C-\><C-n><C-w>j
tnoremap <C-i> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
inoremap <C-j> <C-\><C-n><C-w>h
inoremap <C-k> <C-\><C-n><C-w>j
inoremap <C-i> <C-\><C-n><C-w>k
inoremap <C-l> <C-\><C-n><C-w>l
nnoremap <leader>j <C-w>h
nnoremap <leader>k <C-w>j
nnoremap <leader>i <C-w>k
nnoremap <leader>l <C-w>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy and paste to clipboard
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy

nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" split window
map <Leader>v :vsplit<CR>
map <Leader>s :split<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" press Leader+Space to turn off highlighting
noremap <silent> <Leader><Space> :silent noh<Bar>echo<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" quickly change into directory of current file and print out directory
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" jump to mark row and column using single quote
noremap \ `

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" smart home
nnoremap <silent> 0 :call SmartHome()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl-r performs search and replace of highlighted text
vnoremap <C-r> "hy:%s/<C-r>h//gI<left><left><left>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" disable auto-indenting etc. for code paste
set pastetoggle=<F2>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" toggle wrap
noremap <silent> <Leader>w :call ToggleWrap()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
map <C-b> :CtrlPBuffer<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Insert date 
nmap <Leader>d i<C-R>=strftime("%d.%m.%Y (%A)")<CR> 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Insert date and time
nmap <Leader>dt i<C-R>=strftime("%d.%m.%Y (%A) %H:%M")<CR> 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Insert time
nmap <Leader>t i<C-R>=strftime("%H:%M")<CR> 

" Open calendar
map <F3> :Calendar<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" show color under cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
