
call plug#begin(stdpath('data') . '/plugged')
Plug 'dracula/vim'
" InteliSense
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-clangd']
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
" For async completion
"Plug 'Shougo/deoplete.nvim'
" For Denite features
Plug 'Shougo/denite.nvim'
" Linter
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhartington/oceanic-next'
Plug 'godlygeek/tabular'
Plug 'plasticbow/vim-markdown'
call plug#end()

set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=3000
set shortmess+=c
set signcolumn=yes
                                                     
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped b  y other plugin.                                                     
inoremap <silent><expr> <TAB>                                       
  \ pumvisible() ? "\<C-n>" :                                   
  \ <SID>check_back_space() ? "\<TAB>" :                        
  \ coc#refresh()                                               
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.                              
inoremap <silent><expr> <c-space> coc#refresh()                     

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at   current position.                                                  
" Coc only does snippet and additional edit on confirm.             
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"       


" Use `[c` and `]c` to navigate diagnostics                         
nmap <silent> [c <Plug>(coc-diagnostic-prev)                        
nmap <silent> ]c <Plug>(coc-diagnostic-next)                        

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
  autocmd FileType typescript,json setl formatexpr=CocAction('format  Selected')                                                          
  " Update signature help on jump placeholder                       
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignature  Help')                                                              
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for   current paragraph                                                   
xmap <leader>a  <Plug>(coc-codeaction-selected)                     
nmap <leader>a  <Plug>(coc-codeaction-selected)                     

" Remap for do codeAction of current line                           
nmap <leader>ac  <Plug>(coc-codeaction)                             
" Fix autofix problem of current line                               
nmap <leader>qf  <Plug>(coc-fix-current)                            
" Use <tab> for select selections ranges, needs server support, like  : coc-tsserver, coc-python                                          
nmap <silent> <TAB> <Plug>(coc-range-select)                        
xmap <silent> <TAB> <Plug>(coc-range-select)                        
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)             
" Use `:Format` to format current buffer                            
command! -nargs=0 Format :call CocAction('format')                  
" Use `:Fold` to fold current buffer                                
command! -nargs=? Fold :call     CocAction('fold', <f-args>)        
" use `:OR` for organize import of current buffer                   
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.act  ion.organizeImport')                                                

" Add status line support, for integration with other plugin, checko  ut `:h coc-status`                                                  
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
  
autocmd FileType typescript setlocal completeopt+=menu,preview
set rtp+=/usr/bin/fzf
let g:deoplete#enable_at_startup = 1

if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme dracula
command! -nargs=0 Prettier :CocCommand prettier.formatFile
let g:gitgutter_grep                    = 'rg'
let g:gitgutter_map_keys                = 0
let g:gitgutter_sign_added              = '▎'
let g:gitgutter_sign_modified           = '▎'
let g:gitgutter_sign_modified_removed   = '▶'
let g:gitgutter_sign_removed            = '▶'
let g:gitgutter_sign_removed_first_line = '◥'


let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

"  Integrated Terminal
" open new split panes to right and below
set splitright
set splitbelow

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-t> :call OpenTerminal()<CR>

" Fuzzy search
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}


