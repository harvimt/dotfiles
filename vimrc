execute pathogen#infect()
set background=dark
color solarized
let g:airline_powerline_fonts=1
set mouse=a
set ts=4
set sw=4
set smarttab
set expandtab
set nu
set colorcolumn=80

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_degug=1
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_path="/home/parallels/venvs/syntastic.env/bin/flake8"

nmap ]l0 :lrewind<cr>
nmap ]ln :lnext<cr>
nmap ]lp :lprev<cr>
nmap <leader>gc :Gcommit<cr>
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
nmap <leader>gcl :!git cola<cr>

set list
set listchars=tab:⇥\ 

autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
autocmd Filetype xml setlocal ts=2 sts=2 sw=2
autocmd Filetype coffee setlocal ts=2 sts=2 sw=2
autocmd Filetype java setlocal noexpandtab
