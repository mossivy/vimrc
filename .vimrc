set number
set relativenumber
set wrap
set encoding=utf-8
set laststatus=2
set tabstop=4
set shiftwidth=4
set expandtab

packloadall

"Need to download vim-plug and run :PlugInstall
call plug#begin()

":Prettier to autoformat code
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

Plug 'leafgarland/typescript-vim'               " TypeScript if you're using it with Three.js
Plug 'peitalin/vim-jsx-typescript'              " JSX and TypeScript support together
Plug 'jalvesaq/Nvim-R'                          " R support
Plug 'sbdchd/neoformat'                         " Another autoformat
Plug 'preservim/nerdtree'                       " File explorer
Plug 'davidhalter/jedi-vim'                     " Python autocomplete
Plug 'tpope/vim-surround'                       " Editing/mapping for surround things IE: () {} [] 
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Setup below... great autocomplete
Plug 'sheerun/vim-polyglot'

"gcc to comment
Plug 'chrisbra/vim-commentary' 
call plug#end()



"NerdTree Settings
"R to reload nerdtree
"F2 Keybinding for toggling NERDTree
"F3 Keybinding for switching focus between NERDTree and file
map <f2> :NERDTreeToggle<CR>
nnoremap <F3> <C-w>w
"autocmd VimEnter * NERDTree

"coc settings
":CocInstall coc-json coc-tsserver
set signcolumn=yes
"TAB Keybinding for coc autocomplete
"inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"F4 maps to copy to mac clipboard
vnoremap <F4> :w !pbcopy<CR>

"Highlight \T0DO in yellow 
highlight Todo ctermfg=yellow guifg=yellow
match Todo /TODO/
