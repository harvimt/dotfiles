set encoding=utf-8
scriptencoding utf-8
filetype off

" set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim
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
Plugin 'luochen1990/rainbow'
Plugin 'smerrill/vcl-vim-plugin'
Plugin 'edkolev/tmuxline.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'mhinz/vim-signify'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-sensible'
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
Plugin 'moon-musick/vim-logrotate'
Plugin 'vim-python/python-syntax'
Plugin 'tpope/vim-surround'
Plugin 'jszakmeister/vim-togglecursor'
Plugin 'dracula/vim', { 'name': 'dracula' }

call vundle#end()            " required
filetype plugin indent on    " required

"if has("termguicolors")
    "let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    "let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    "set termguicolors
"endif

set guifont=SourceCodeProForPowerline-Regular:h18

let g:airline_powerline_fonts=1
set background=dark
colorscheme dracula
set mouse=a
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set number
set colorcolumn=120
set updatetime=100
set clipboard=unnamed
"set ambiwidth=double
set list
set listchars=tab:⇥\ ,extends:›,precedes:‹,nbsp:·,trail:·

let g:ale_sign_error      = '🚫'
let g:ale_sign_warning    = '⚠️'
let g:ale_sign_info       = 'ℹ️'

let g:signify_sign_change = '~'

let g:ale_linters         = {
            \ 'python': ['flake8'],
            \ 'ruby': ['rubocop'],
            \ 'chef': ['cookstyle'],
            \ 'json': ['jsonlint'],
            \ 'toml': ['dprint'],
            \ 'terraform': ['tflint'],
            \ }
let g:ale_fixers          = {
            \ 'ruby': ['rubocop'],
            \ 'chef': ['rubocop'],
            \ 'yaml': ['prettier'],
            \ 'toml': ['dprint'],
            \ }
"let g:json_jsonlint_executable = 

" enable the vim-python, python3 syntax (like f-strings)
let g:python_highlight_all = 1

let test#strategy = 'asyncrun'

vmap <leader>" c""<esc>P
nmap ]l0 :lrewind<cr>
nmap ]ln :lnext<cr>
nmap ]lp :lprev<cr>
nmap <leader>gc :Git commit -a<cr>
nmap <leader>gp :Git push<cr>
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
"
" RSpec.vim mappings
let g:rspec_command = '!bundle exec rspec {spec}'
nmap <Leader>rn :call RunNearestSpec()<CR>
nmap <Leader>rl :call RunLastSpec()<CR>
nmap <Leader>ra :call RunAllSpecs()<CR>
nmap <Leader>rf :call RunCurrentSpecFile()<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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

augroup logrotate
    au!
    au BufRead,BufNewFile */logrotate.d/* set filetype=logrotate
augroup END

augroup sudoers
    au!
    au BufRead,BufNewFile */sudoers.d/* set filetype=sudoers
augroup END

autocmd BufNewFile,BufRead */recipes/*.rb set ft=chef syntax=ruby

augroup ruby
    au!
    autocmd Filetype ruby   setlocal tabstop=2 sts=2 shiftwidth=2
augroup END

augroup chef
    au!
    autocmd Filetype chef   setlocal tabstop=2 sts=2 shiftwidth=2
augroup END

augroup Mkdir
  autocmd!
  autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
augroup END

let g:yaml_formatter_indent_collection=0
autocmd Filetype yaml   setlocal tabstop=2 sts=2 shiftwidth=2
autocmd Filetype json   setlocal tabstop=2 sts=2 shiftwidth=2
autocmd Filetype lua    setlocal tabstop=2 sts=2 shiftwidth=2
autocmd Filetype xml    setlocal tabstop=2 sts=2 shiftwidth=2
autocmd Filetype coffee setlocal tabstop=2 sts=2 shiftwidth=2
autocmd Filetype java   setlocal noexpandtab

" 1 or 0 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar
" Insert Mode
" let &t_SI .= "\<Esc>[6 q"
" Normal Mode
" let &t_EI .= "\<Esc>[2 q"
" let &t_SR = "\<Esc>[3 q"
" autocmd VimLeave * let &t_me="\<Esc>]50;CursorShape=1\x7"
let g:togglecursor_default = "block"
let g:togglecursor_insert = "line"
let g:togglecursor_leave = "line"
" let g:togglecursor_disable_tmux = 0
let g:togglecursor_force = 'xterm'
