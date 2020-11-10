syntax on
set expandtab
set number "line numbers
set hlsearch
set ignorecase
set smartcase "search ignorecase if lower
set backspace=indent,eol,start "backspace normally
set wildmode=longest,list "bashlike file open

" Status bar configuration:
set laststatus=2
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction
au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15
set statusline=
set statusline +=\ %n\ %*            "buffer number
set statusline +=%y%*                "file type
set statusline +=\ %<%F%*            "full path
set statusline +=%m%*                "modified flag
set statusline +=%=%5l%*             "current line
set statusline +=/%L%*               "total lines
set statusline +=%4v\ %*             "virtual column number
