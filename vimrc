"execute pathogen#infect()

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Other Vundle plugins
Plugin 'tpope/vim-fugitive'
Plugin 'thoughtbot/vim-rspec'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'Konfekt/FastFold'
Plugin 'dense-analysis/ale'
"Plugin 'kien/rainbow_parentheses.vim'
Plugin 'luochen1990/rainbow'
Plugin 'smerrill/vcl-vim-plugin'
Plugin 'edkolev/tmuxline.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'mhinz/vim-signify'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-sensible'
"Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'PProvost/vim-ps1'
Plugin 'junegunn/vim-easy-align'
Plugin 'lepture/vim-jinja'
Plugin 'tarekbecker/vim-yaml-formatter'
Plugin 'chrisbra/DynamicSigns'
Plugin 'vim-scripts/bats.vim'
Plugin 'vim-test/vim-test'
Plugin 'benmills/vimux'
Plugin 'pearofducks/ansible-vim'
Plugin 'GEverding/vim-hocon'
Plugin 'hashivim/vim-terraform'

call vundle#end()            " required
filetype plugin indent on    " required


" Plugin 'myint/syntastic-extras'
" Plugin 'vim-syntastic/syntastic'

"if has("termguicolors")
    "let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    "let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    "set termguicolors
"endif

let g:airline_powerline_fonts=1
"let g:solarized_termcolors=256
set background=dark
colorscheme solarized
set mouse=a
set ts=4
set sw=4
set smarttab
set expandtab
set nu
set colorcolumn=120
set updatetime=100

"
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:ale_sign_error      = '🚫'
let g:ale_sign_warning    = '⚠ '

"let g:ale_sign_error      = ''
"let g:ale_sign_warning    = ''
let g:signify_sign_change = '~'

let g:ale_linters         = {'python': ['flake8']}
let g:ale_fixers          = {'ruby': ['rubocop'], 'yaml': ['prettier']}


nmap ]l0 :lrewind<cr>
nmap ]ln :lnext<cr>
nmap ]lp :lprev<cr>
nmap <leader>gc :Gcommit<cr>
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
nmap <leader>gcl :!git cola<cr>
nmap <leader>pdb oimport pdb; pdb.set_trace()  # noqa<esc>
nmap <leader>pry orequire 'pry'; binding.pry<esc>
nmap <leader>fsl o# frozen_string_literal: true<esc>
nmap <f6> :NERDTreeTabsToggle<cr>
nmap <f7> :TagbarToggle<cr>
nmap <leader>tf :TestFile<cr>
nmap <leader>tl :TestFile<cr>
"Test all
nmap <leader>ta :TestSuite<cr>
nmap <leader>an :ALENext<cr>
nmap <leader>ap :ALEPrev<cr>
nmap <leader>af :ALEFix<cr>
nmap <leader>al :ALELint<cr>

set list
set listchars=tab:⇥\ ,extends:›,precedes:‹,nbsp:·,trail:·

augroup vagrant
  au!
  au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END

augroup berkshelf
  au!
  au BufRead,BufNewFile Berksfile set filetype=ruby
augroup END

augroup ansible
  au!
  au BufRead,BufNewFile ~/Development/icm-ansible/**/*.yml set filetype=yaml.ansible
  au BufRead,BufNewFile .ansible-lint set filetype=yaml
augroup END

augroup hocon
  au!
  au BufRead,BufNewFile ocibuild.conf set filetype=hocon
augroup END

autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
let g:yaml_formatter_indent_collection=0
autocmd Filetype json setlocal ts=2 sts=2 sw=2
autocmd Filetype lua setlocal ts=2 sts=2 sw=2
autocmd Filetype xml setlocal ts=2 sts=2 sw=2
autocmd Filetype coffee setlocal ts=2 sts=2 sw=2
autocmd Filetype java setlocal noexpandtab
" supposedly syntastic is ok with BATS but not when invoked by syntastic... or
" something... I don't care enough to investigate
autocmd BufReadPre *.bats let b:syntastic_skip_checks = 1

" FZF Options
"let g:fzf_dir = '~/.fzf'
"imap <c-x><c-k> <plug>(fzf-complete-word)
"imap <c-x><c-f> <plug>(fzf-complete-path)
"imap <c-x><c-j> <plug>(fzf-complete-file-ag)
"imap <c-x><c-l> <plug>(fzf-complete-line)

" Rainbow Options
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
set clipboard=unnamed

" RSpec.vim mappings
"nmap <Leader>t :call RunCurrentSpecFile()<CR>
let g:rspec_command = "!bundle exec rspec {spec}"
nmap <Leader>rn :call RunNearestSpec()<CR>
nmap <Leader>rl :call RunLastSpec()<CR>
nmap <Leader>ra :call RunAllSpecs()<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
