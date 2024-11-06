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

call plug#end()

