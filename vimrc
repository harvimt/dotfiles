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
nmap <leader>dbg oimport pdb; pdb.set_trace()  # noqa<esc>

set list
set listchars=tab:⇥\ 

augroup vagrant
  au!
  au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END

augroup berkshelf
  au!
  au BufRead,BufNewFile Berksfile set filetype=ruby
augroup END

autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
autocmd Filetype xml setlocal ts=2 sts=2 sw=2
autocmd Filetype coffee setlocal ts=2 sts=2 sw=2
autocmd Filetype java setlocal noexpandtab

" FZF Options
let g:fzf_dir = '~/.fzf'
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

"Rainbow Options
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16

let g:rbpt_loadcmd_toggle = 0
