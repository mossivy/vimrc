"============================
" Leader Key Mappings Glossary
"============================
" <leader><Tab>  - Toggle NERDTree file explorer
" <leader><D-c>  - Copy visual selection to clipboard (macOS)
" <leader>1-5    - Switch to buffer 1-5
" <leader>n      - Next buffer
" <leader>p      - Previous buffer
" <leader>h      - Help for word under cursor
" <leader>hw     - VimWiki help
" <leader>ha     - Airline help
" <leader>hn     - NERDTree help
" <leader>hc     - CoC help
" <leader>hs     - Surround help
"
" Chemistry shortcuts:
" <leader>s      - Convert selected numbers to subscript (visual mode)
" <leader>S      - Convert selected numbers to superscript (visual mode)
" <leader>->     - Insert yield arrow (→) in insert mode
" <leader><->    - Insert equilibrium arrow (⇌) in insert mode
"
" VimWiki specific (only in .wiki files):
" <leader>i      - Open image under cursor
" <leader>I      - Open all images in file
" <leader>o      - Open file/URL under cursor

"============================
" General Settings
"============================
set number                      " Show line numbers
set relativenumber              " Relative line numbers
set wrap                        " Soft wrap long lines
set encoding=utf-8              " UTF-8 encoding
set laststatus=2                " Always show status line
set tabstop=4                   " Tab width = 4 spaces
set shiftwidth=4                " Auto-indent = 4 spaces
set expandtab                   " Convert tabs to spaces
set signcolumn=yes              " Always show sign column

packloadall                     " Load packages

"============================
" Plugin Management (vim-plug)
"============================
call plug#begin('~/.vim/plugged')

" --- Formatting & Syntax ---
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': [
  \ 'javascript', 'typescript', 'css', 'less', 'scss',
  \ 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'
  \ ] }
Plug 'sbdchd/neoformat'
Plug 'sheerun/vim-polyglot'

" --- Code Support ---
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'davidhalter/jedi-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'chrisbra/vim-commentary'

" --- File Management ---
Plug 'preservim/nerdtree'

" --- Language-specific ---
Plug 'jalvesaq/Nvim-R'

" --- Productivity ---
Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

"============================
" NERDTree
"============================
map <leader><Tab> :NERDTreeToggle<CR>
nnoremap <F3> <C-w>w

"============================
" CoC (Conquer of Completion)
"============================
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <C-Space> coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

"============================
" Airline
"============================
let g:airline_powerline_fonts = 1
let g:airline_theme = 'dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_modified = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#coc#enabled = 1

nnoremap <leader>1 :b1<CR>
nnoremap <leader>2 :b2<CR>
nnoremap <leader>3 :b3<CR>
nnoremap <leader>4 :b4<CR>
nnoremap <leader>5 :b5<CR>
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprevious<CR>

"============================
" VimWiki
"============================
let g:vimwiki_list = [{
  \ 'path': '~/vimwiki/',
  \ 'syntax': 'default',
  \ 'ext': '.wiki'
  \ }]
let g:vimwiki_global_ext = 0
let g:vimwiki_autowriteall = 1
let g:vimwiki_conceallevel = 2

"============================
" Custom Keybindings
"============================
vnoremap <leader><D-c> :w !pbcopy<CR>

"============================
" Chemistry Shortcuts
"============================
" Insert mode: <leader>-> for yield arrow
inoremap <leader>-> →
" Insert mode: <leader><-> for equilibrium arrow
inoremap <leader><-> ⇌

" Quick subscript numbers (visual mode)
" Select number(s) and press <leader>s
vnoremap <leader>s :s/\%V0/₀/ge<CR>:s/\%V1/₁/ge<CR>:s/\%V2/₂/ge<CR>:s/\%V3/₃/ge<CR>:s/\%V4/₄/ge<CR>:s/\%V5/₅/ge<CR>:s/\%V6/₆/ge<CR>:s/\%V7/₇/ge<CR>:s/\%V8/₈/ge<CR>:s/\%V9/₉/ge<CR>:noh<CR>

" Quick superscript numbers (visual mode)
" Select number(s) and press <leader>S
vnoremap <leader>S :s/\%V0/⁰/ge<CR>:s/\%V1/¹/ge<CR>:s/\%V2/²/ge<CR>:s/\%V3/³/ge<CR>:s/\%V4/⁴/ge<CR>:s/\%V5/⁵/ge<CR>:s/\%V6/⁶/ge<CR>:s/\%V7/⁷/ge<CR>:s/\%V8/⁸/ge<CR>:s/\%V9/⁹/ge<CR>:s/\%V+/⁺/ge<CR>:s/\%V-/⁻/ge<CR>:noh<CR>

" Common chemistry abbreviations
iabbrev h2o H₂O
iabbrev o2 O₂
iabbrev co2 CO₂
iabbrev h2so4 H₂SO₄
iabbrev nacl NaCl
iabbrev delta Δ
iabbrev degree °

"============================
" Highlighting
"============================
highlight Todo ctermfg=yellow guifg=yellow
match Todo /TODO/

"============================
" Quick Help / Plugin Manuals
"============================
nnoremap <leader>h :execute 'help ' . expand('<cword>')<CR>
nnoremap <leader>hw :help vimwiki<CR>
nnoremap <leader>ha :help airline<CR>
nnoremap <leader>hn :help NERDTree<CR>
nnoremap <leader>hc :help coc-nvim<CR>
nnoremap <leader>hs :help surround<CR>
