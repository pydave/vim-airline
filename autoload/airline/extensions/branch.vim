" MIT license. Copyright (c) 2013 Bailey Ling.
" vim: ts=2 sts=2 sw=2 fdm=indent

function! airline#extensions#branch#apply()
  if exists('w:airline_left_only')
    return
  endif
  let w:airline_section_b =
        \ exists('*fugitive#head') && strlen(fugitive#head()) > 0
          \ ? g:airline_branch_prefix.fugitive#head()
          \ : exists('*lawrencium#statusline') && strlen(lawrencium#statusline()) > 0
            \ ? g:airline_branch_prefix.lawrencium#statusline()
            \ : ''
endfunction

function! airline#extensions#branch#init(ext)
  call a:ext.add_statusline_funcref(function('airline#extensions#branch#apply'))
endfunction

