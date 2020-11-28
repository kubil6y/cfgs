""solving json quotation problem
"enter nvim as su
":e $VIMRUNTIME/syntax/json.vim
":g/if has('conceal')/s//& \&\& 0/
":wq

call plug#begin('~/.vim/plugged')
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'commit': '4f40c16a15336b589b1b5b509df4e00300d755eb'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'mbbill/undotree'
Plug 'lifepillar/vim-gruvbox8'
Plug 'mattn/emmet-vim' 
Plug 'airblade/vim-gitgutter'
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'peitalin/vim-jsx-typescript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'iamcco/coc-tailwindcss'
Plug 'honza/vim-snippets'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'matze/vim-move'
Plug 'yggdroot/indentline'
Plug 'easymotion/vim-easymotion'
Plug 'KabbAmine/vCoolor.vim'
Plug 'ap/vim-css-color'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' 
call plug#end()

" FZF SETUP
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-n> :Buffers<CR>
let g:fzf_buffers_jump = 1
nnoremap <A-`> :b#<CR>

" this shit is a godsent
command! -nargs=* W w

" solves floating message problem (temp fix)
"autocmd CursorMoved,CursorMovedI * call coc#util#float_hide()

" easy movement between screens
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

syntax on
set expandtab
set smarttab
set number relativenumber
set noswapfile
set cindent
set tabstop=2
set shiftwidth=2
set mouse=a
set clipboard+=unnamed
set ignorecase
set signcolumn=yes
set nocursorline
set guicursor=

"Enable true color 启用终端24位色
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"autocmd ColorScheme * highlight CocHighlightText     guibg=#45413b "badwolf matching terms for coc
set background=dark
colorscheme gruvbox8_hard
let g:airline_theme = 'zenburn' 

" folding html
setlocal foldmethod=manual
nnoremap qj zfit
nnoremap qk za

nnoremap ,ut :UndotreeToggle<CR>

" save bindings
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" sort tailwind classes
nnoremap ,tw :CocCommand tailwindCSS.headwind.sortTailwindClasses<CR>
" delete search results
nnoremap ,ds :noh<CR>
" refresh init.vim
nnoremap ,so :source ~/.config/nvim/init.vim<CR>
"global clipboard
vnoremap  ,y  "+y
nnoremap  ,y  "+y
" search&replace & under-cursor s&r
nnoremap ,sr :%s/
nnoremap ,ur :,$s/

"react jsx commenting solution??
let g:NERDCustomDelimiters={
	\ 'javascript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
	\ 'typescript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\}
" disabling commenting the new line after a comment
autocmd FileType * set formatoptions-=cro
" sudo apt install yad //for vCoolor (color picker)
"alt-r rgb
"alt-v hsl
"alt-w rgba
"alt-c #hex
" indent lines on/off
nnoremap ,2 :IndentLinesToggle<CR>
" smarter tab line
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#enabled = 1 
let g:airline_powerline_fonts = 1"
let g:airline#extensions#tabline#formatter = 'default'
nnoremap H gT
nnoremap L gt
" closetag file names setup
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx,*.ts,*.tsx'
" let b:coc_pairs_disabled = ['<']
" prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap ,P :Prettier<CR>
" emmet only for html/css(+react/js)
let g:user_emmet_install_global = 0
autocmd FileType html,css,scss,javascript,jsx,typescript,typescript.tsx EmmetInstall
let g:user_emmet_leader_key = ','
let g:user_emmet_leader_key='<c-e>'

let g:user_emmet_mode='i'
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}
" leader key mapping
let mapleader= ','
" for marks only in normal mode
nnoremap ' `
noremap <Leader>n :NERDTreeToggle<CR>
nnoremap <F9> :NERDTreeRefreshRoot<CR>
let NERDTreeChDirMode = 2
let g:NERDTreeIgnore = ['^node_modules']
"VIM-EASYMOTION
let g:EasyMotion_smartcase = 1
nnoremap S <nop>
nnoremap Q <nop>
nnoremap q <nop>
let g:EasyMotion_do_mapping = 0 " Disable default mappings
map s <Plug>(easymotion-s)
" coc snippets thingy
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

highlight clear SignColumn

"deleted:  "\ 'coc-eslint', 
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-tsserver',
  \ 'coc-tslint-plugin', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-styled-components', 
  \ ]

" DEFAULT SHIT FOR COC PLUGIN FROM HERE AND UNDER
"let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
