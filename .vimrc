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
call plug#end()

autocmd VimEnter * NERDTree
map <f2> :NERDTreeToggle<CR>
nnoremap <F3> <C-w>w

