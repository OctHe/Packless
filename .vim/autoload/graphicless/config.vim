" =====================================================================
" 
"  Configuration for plugins
"
" =====================================================================

" Navigation 
" {{{1

" starsearch: Enhanced star keymapping. Avoid jumping to next
function! graphicless#config#starsearch()
endfunction

" TODO: use system-wide fzf
" fzf:
function! graphicless#config#fzf()
endfunction

" LeaderF: 
function! graphicless#config#leaderf()
    let g:Lf_WindowPosition = 'popup'

    " Vista.vim:
    function! NearestMethodOrFunction() abort
      return get(b:, 'vista_nearest_method_or_function', '')
    endfunction

    set statusline+=%{NearestMethodOrFunction()}

endfunction

function! graphicless#config#ctrlp()
endfunction

" Easymotion: The official repo is in easymotion/vim-easymotion.
" timsu92 version fix a bug about easymotion-w/W in fold codes.
function! graphicless#config#easymotion()
    noremap f <Plug>(easymotion-f)
    noremap F <Plug>(easymotion-F)
    noremap t <Plug>(easymotion-t)
    noremap T <Plug>(easymotion-T)
    noremap w <Plug>(easymotion-w)
    noremap W <Plug>(easymotion-W)
    noremap e <Plug>(easymotion-e)
    noremap E <Plug>(easymotion-E)
    noremap b <Plug>(easymotion-b)
    noremap B <Plug>(easymotion-B)
    noremap ge <Plug>(easymotion-ge)
    noremap gE <Plug>(easymotion-gE)
endfunction

" Vim-tmux-navigator: It requires configuration in tmux
function! graphicless#config#tmux_navi()
endfunction

" NERDTree: File explorer.  {{{2
function! s:CloseNERDTree()
    if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()
        quit
    endif

endfunction

function! s:PreventReplacingNERDTree()
    if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1
        let buf=bufnr('%') 
        buffer# 
        execute "normal! \<C-W>w"
        execute 'buffer'.buf
    endif

endfunction

function! graphicless#config#nerdtree()
    let NERTTreeCaseSensitiveSort = 1
    let NERDTreeWinSize = 35

    " Automatic open NERDTree when open vim and go to the previous window
    autocmd VimEnter *.{py,h,c} NERDTree | wincmd p
    " Close vim if the only window left open is a NERDTree
    autocmd BufEnter * :call s:CloseNERDTree()
    " If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
    autocmd BufEnter * :call s:PreventReplacingNERDTree()

    " e means explore 
    nnoremap <silent> <Leader>e :NERDTreeToggle<CR>  

endfunction
" }}}2

" }}}1

" Lint
" {{{1
" Vista: Vista relies on universal-ctags. Please careful to install the
" correct version. 
" In openSUSE:
"   sudo zypper install universal-ctags 
function! graphicless#config#vista()
    let g:vista_sidebar_width = 50

    " t means tag
    nnoremap <silent> <Leader>s :Vista!!<CR>  

endfunction

" Tagbar: 
function! graphicless#config#tagbar()
    " Automatic open Tagbar when open vim
    autocmd VimEnter *.{py,h,c} Tagbar

    " t means tag
    nnoremap <silent> <Leader>s :Tagbar<CR>  

endfunction

" ALE:
function! graphicless#config#ale()

    " :ALEInfo can find the linters that are successfully enabled
    let g:aleers = {
    \   'python': ['pyflakes'],
    \}

endfunction

function! graphicless#config#neomake()
endfunction

function! graphicless#config#vimtable()
endfunction
" }}}1

" Completion
" {{{1

" Surround
function! graphicless#config#surround()
endfunction

" Auto-pair
function! graphicless#config#autopair()
endfunction

" Nerdcomment: 
function! graphicless#config#nerdcomment()
endfunction

" commentary:
function! graphicless#config#commentary()
    xmap <Leader>c  <Plug>Commentary
    vmap <Leader>c  <Plug>Commentary
    omap <Leader>c  <Plug>Commentary
    nmap <Leader>cc <Plug>CommentaryLine
    nmap <Leader>cu <Plug>Commentary<Plug>Commentary
endfunction

" YCM: a powerful completion plugin based on LSP It relies on cmake, 
" make, g++, python3-dev and LSP. YCM does not use LSP from the system. 
" It downloads them by itself.
" Install the prerequisites in Debian with
"   sudo apt install cmake make g++ python3-dev
" In openSUSE with
"   sudo zypper install cmake make g++ python3-deval
function! graphicless#config#ycm()

    let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
    let g:ycm_show_diagnostics_ui = 0

    " Clear the YCM blacklist, so it works for all files
    let g:ycm_filetype_blacklist = {}

endfunction

" vim-snippets: It saves multiple snippets
function! graphicless#config#vimsnippets()
endfunction

" Ultisnips: snippets engine that uses snippet database
" vim-snippets: snippet database
function! graphicless#config#ultisnips()

    " Trigger configuration. Change this to something other than <tab> if use one 
    " of the following:
    " - https://github.com/Valloric/YouCompleteMe
    " - https://github.com/nvim-lua/completion-nvim
    let g:UltiSnipsExpandTrigger="<CR>"

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"

endfunction

" }}}1

" Runner
" {{{1

" genutils: It gives general functions that some plugins rely on
function! graphicless#config#genutils()
endfunction

" floaterm:
function! graphicless#config#floaterm()
    map <Leader>t :FloattermToggle<CR>
    tmap <Leader>t <C-\><C-n>:FloattermToggle<CR>
endfunction

" asyncrun
function! graphicless#config#asyncrun()
endfunction

" vimtex: latex plugin for vim. It relies on texlive
"   sudo apt install texlive-full
" The backward search and forward search requires xdotool according to the
" author
"   sudo apt install xdotool 
function! graphicless#config#vimtex()

    " Plugin indent on follows is necessary for VimTeX to load properly. The "indent" is optional.
    " Note that most plugin managers will do this automatically.

    " Viewer is required  i.e., evince in Ubuntu, okular, or zathura
    " vimtex internally supports forward and backward search
    " Forward search works when type <LocalLeader>lv
    " Backward/Inverse search only works for gvim since it relies on the
    " clientserver feature.
    "   For example, if the viewer is zathura, just open the latex file with
    "   gvim, and compile it with <LocalLeader>ll.
    "   Then, type <CTRL>+<LeftMouse> to use backward search.
    let g:vimtex_view_method = 'zathura'

    " VimTeX uses latexmk as the default compiler backend. 
    " If you use it, you probably don't need to configure anything.
    " If you want another compiler backend, you can change it as follows. 
    " The list of supported backends and further explanation is provided in the documentation, see ':help vimtex-compiler'.
    let g:vimtex_compiler_method = 'latexmk'

    " Project with multiple files.
    "   To support multiple files (with '\input') in a project, user must open the 
    "   main file (e.g., main.tex) at first. For more details, please see the help
    "   document with ':h vimtex-multi-file'

    " Most VimTeX mappings rely on localleader and this can be changed with the
    " following line. The default is usually fine and is the symbol "\".
    let maplocalleader = " "

endfunction

" Vim-markdown: It provides better markdown highlight
function! graphicless#config#mdhl()

    let g:vim_markdown_folding_disabled = 1
    let g:vim_markdown_conceal = 0
    let g:vim_markdown_conceal_code_blocks = 0

endfunction

" Markdown-preview:
" If it does not work well, Use :messages in vim to see the output
function! graphicless#config#mdp()
endfunction

" csv.vim:
function! graphicless#config#csv()
endfunction
" }}}1

" VCS
" {{{1
" fugitive: Provide common git options (diff, status, add, commit, etc)
function! graphicless#config#fugitive()

    " g means git
    nnoremap <silent> <Leader>gd :Git diff<CR><C-W>L
    nnoremap <silent> <Leader>gs :Git status<CR>

endfunction

" gitgutter: Show diff sign on the left
function! graphicless#config#gitgutter()
endfunction
" }}}1

" View: Colorscheme, status line, indent, and UI-related plugins 
" {{{1
" airline:
function! graphicless#config#airline()
    " Enhanced tabline
    let g:airline#extensions#tabline#enabled = 1
    " Show buffer number so I can quickly pick a buffer
    let g:airline#extensions#tabline#buffer_nr_show = 1

endfunction

function! graphicless#config#lightline()
endfunction

function! graphicless#config#indentline()
endfunction

function! graphicless#config#indentguide()
endfunction

function! graphicless#config#whichkey()
    let g:which_key_map = {}
    let g:which_key_map.g = {
                            \ 'name': '+git',
                            \ 'd': '+diff',
                            \ }
    let g:which_key_map.h = {
                            \ 'name': '+GitGutter',
                            \ }

    let g:which_key_map.s = {
                            \ 'name': '+symbol',
                            \ }
    call which_key#register('<Space>', "g:which_key_map")

    nnoremap <silent> <Leader> :<c-u>WhichKey '<Leader>'<CR>
    vnoremap <silent> <Leader> :<c-u>WhichKeyVisual '<leader>'<CR>

endfunction

" rainbow: Rainbow brackets
function! graphicless#config#rainbow()
   " Set to 0 if you want to enable it later via :RainbowToggle
   let g:rainbow_active = 1 

endfunction

function! graphicless#config#context()
endfunction


" gruvbox: 
function! graphicless#config#gruvbox()
endfunction

" colortable:
function! graphicless#config#colortable()
endfunction

" }}}1

" vim: set sw=4 sts=4 et fdm=marker: