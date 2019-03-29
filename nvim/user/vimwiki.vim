let g:vimwiki_list = [{
  \ 'automatic_nested_syntaxes':1,
  \ 'path_html': '$HOME/doc/Dropbox/wiki/html',
  \ 'path': '$HOME/doc/Dropbox/wiki',
  \ 'template_path': '$HOME/.config/nvim/scripts',
  \ 'syntax': 'markdown',
  \ 'ext':'.md',
  \ 'diary_link_fmt': '%Y-%m-%d',
  \ 'template_default':'markdown',
  \ 'custom_wiki2html': '$HOME/.config/nvim/scripts/wiki2html.sh',
  \ 'template_ext':'.html'
\}]

au BufRead,BufNewFile *.md set filetype=vimwiki

let g:taskwiki_sort_orders={"C": "pri-"}
let g:taskwiki_syntax = 'markdown'
let g:taskwiki_markdown_syntax='markdown'
let g:taskwiki_markup_syntax='markdown'

" name of months
let g:vimwiki_diary_months = {
      \ 1: 'Januar', 2: 'Februar', 3: 'März',
      \ 4: 'April', 5: 'Mai', 6: 'Juni',
      \ 7: 'Juli', 8: 'August', 9: 'September',
      \ 10: 'Oktober', 11: 'November', 12: 'Dezember'
      \ }

" symbol for separating sub-headers
let g:vimwiki_html_header_numbering_sym = '.'

" header numbering
let g:vimwiki_html_header_numbering = 2

au FileType vimwiki nnoremap <Leader>n :call <SID>NewNote()<CR>

function! s:NewNote()
  let g:title = input("Note title: ")
  let g:time = strftime("%H:%M")

  let g:numLines = line('$')
  if g:numLines == 1
    call setline(g:numLines, "## " . g:title)        
  else
    call append(line('$'), "")
    call append(line('$'), "## " . g:title)
  endif
  call append(line('$'), "Zeit: " . g:time)
  call append(line('$'), "Tags: ")
  let l:lastLine = line('$')
  call append(line('$'), "")
  execute "normal " . lastLine . "ggA" | startinsert | call cursor( line('.'), col('.') + 1) 
endfunction
