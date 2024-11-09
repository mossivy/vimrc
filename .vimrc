set number
set relativenumber
set wrap
set encoding=utf-8
set laststatus=2
set tabstop=4
set shiftwidth=4
set expandtab

packloadall


call plug#begin()
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

Plug 'leafgarland/typescript-vim'         " TypeScript if you're using it with Three.js
Plug 'peitalin/vim-jsx-typescript'        " JSX and TypeScript support together
Plug 'jalvesaq/Nvim-R'
Plug 'sbdchd/neoformat'
Plug 'preservim/nerdtree'
Plug 'davidhalter/jedi-vim'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
call plug#end()

"NerdTree Settings
autocmd VimEnter * NERDTree
"F2 Keybinding for toggling NERDTree
map <f2> :NERDTreeToggle<CR>
"F3 Keybinding for switching focus between NERDTree and file
nnoremap <F3> <C-w>w

"coc settings
"must run 
":CocInstall coc-json coc-tsserver
"to install
set signcolumn=yes
"TAB Keybinding for coc autocomplete
"inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

highlight Todo ctermfg=yellow guifg=yellow
match Todo /TODO/
