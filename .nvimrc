"""""""""""""""""""""""""
" This is final tan jun vimrc
"""""""""""""""""""""""""
" tanjung variables {
    let tjnvimpath = "$HOME/.config/nvim"
    let tjnvimpathplugged = tjnvimpath . "/plugged"
"}

" General {
    " set encoding=utf-8  " UTF8
    set mouse=
    "set mousehide
    
    set tabstop=4       " Number of spaces that a <tab> represents in a file
    set shiftwidth=4    " Use indents of 4 spaces
    set expandtab       " Tabs are spaces, not tabs
    set softtabstop=4   " Number of spaces that a <tab> represents
    " set smarttab
    set cursorline      " Highlight current line
    set nu              " Line numbers on
    set backspace=indent,eol,start      " Backspace for dummies
    set ignorecase
    set smartcase

    " set term=xterm-256color
    " With system clipboard
    "set clipboard=unnamedplus
" }


" Key-mapping {
    let mapleader=","
    " Move to the next & previous buffer
    nmap <F2> :bprevious<CR>
    nmap <F3> :bnext<CR>
" }

"" Programming {
"    " Path to python interpreter for neovim
"     let g:python3_host_prog = '/usr/local/bin/python27'
"    " Skip the check of neovim module
"     let g:python_host_skip_check = 1
"     let g:python3_host_skip_check = 1
"" }

" Plugin - vim-plug{
    " Begin section
    call plug#begin(tjnvimpathplugged)

    " Feel & Look
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'altercation/vim-colors-solarized'

    Plug 'scrooloose/nerdtree'

    " Plugs for everthing
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'


    " Programming
    Plug 'scrooloose/syntastic'
    Plug 'fatih/vim-go'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    "Plug 'zchee/deoplete-go', { 'do': 'make'}
 
    " Python
    "Plug 'davidhalter/jedi-vim'
    "Plug 'Shougo/deoplete.nvim'
    
    "Plug 'ervandew/supertab'
    Plug 'hynek/vim-python-pep8-indent'

    Plug 'majutsushi/tagbar'
    
    "Plug 'MarcWeber/vim-addon-mw-utils'
    "Plug 'tomtom/tlib_vim'
    "Plug 'garbas/vim-snipmate'

    Plug 'honza/vim-snippets'
    Plug 'SirVer/ultisnips'

    Plug 'valloric/youcompleteme', {'dir': '~/.config/nvim/plugged/youcompleteme' , 'do': './install.py --clang-completer --gocode-completer'}
    "Plug 'valloric/youcompleteme', {'dir': '~/.config/nvim/plugged/youcompleteme' , 'do': './install.py --clang-completer'}

    Plug 'pearofducks/ansible-vim'

    call plug#end()
    " End plug
" }

""""""""""
" Plugin config {
    " vim-airline {
        set laststatus=2
        let g:airline_theme='solarized'
        let g:airline#extensions#branch#enabled=1
        let g:airline#extension#syntastic#enabled=1
        let g:airline_powerline_fonts=1

        " Enable the list of buffers
        let g:airline#extensions#tabline#enabled=1
        " Show just the file name
        "let g:airline#extensions#tabline#fnamemod=':t'
    " }


    " NERDTree {
        map <F4> :NERDTreeToggle<CR>

        let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.sw[op]$', '^\.git$']
        let NERDTreeQuitOnOpen=1  " Close the tree window after opening a file
    " }

    " Jedi Python {
        "let g:jedi#completions_command='÷'
    " }

    " deoplete.nvim {
        "let g:deoplete#enable_at_startup=0
        "let g:deoplete#keyword_patterns = {}
		"let g:deoplete#keyword_patterns.tex = '\\?[a-zA-Z_]\w*'

        "set completeopt+=noselect
    " }

    " deoplete-go settings {
        let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
        let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
    " }


    "" EasyMotion {
    "    " <Leader>f{char} to move to {char}
    "    map  <Leader>f <Plug>(easymotion-bd-f)
    "    nmap <Leader>f <Plug>(easymotion-overwin-f)

    "    " s{char}{char} to move to {char}{char}
    "    nmap s <Plug>(easymotion-overwin-f2)

    "    " Move to line
    "    map <Leader>L <Plug>(easymotion-bd-jk)
    "    nmap <Leader>L <Plug>(easymotion-overwin-line)

    "    " Move to word
    "    map  <Leader>w <Plug>(easymotion-bd-w)
    "    nmap <Leader>w <Plug>(easymotion-overwin-w)
    "" }

    " { fzf: Fuzzy file finder
        nnoremap <c-p> :FZF<cr>
        " This is the default extra key bindings
        let g:fzf_action = {
                    \ 'ctrl-t': 'tab split',
                    \ 'ctrl-x': 'split',
                    \ 'ctrl-v': 'vsplit' }

        " Default fzf layout
        " - down / up / left / right
        " - window (nvim only)
        " let g:fzf_layout = { 'down': '~40%' }


        " Customize fzf colors to match your color scheme
"        let g:fzf_colors =
"                    \ { 'fg':      ['fg', 'Normal'],
"                    \ 'bg':      ['bg', 'Normal'],
"                    \ 'hl':      ['fg', 'Comment'],
"                    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"                    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"                    \ 'hl+':     ['fg', 'Statement'],
"                    \ 'info':    ['fg', 'PreProc'],
"                    \ 'prompt':  ['fg', 'Conditional'],
"                    \ 'pointer': ['fg', 'Exception'],
"                    \ 'marker':  ['fg', 'Keyword'],
"                    \ 'spinner': ['fg', 'Label'],
"                    \ 'header':  ['fg', 'Comment'] }
    " }


        "" syntastic recommanded settings {
           " set statusline+=%#warningmsg#
           " set statusline+=%{SyntasticStatuslineFlag()}
           " set statusline+=%*

           " let g:syntastic_always_populate_loc_list = 1
           " let g:syntastic_auto_loc_list = 1
           " let g:syntastic_check_on_open = 1
           " let g:syntastic_check_on_wq = 0

           " "let g:syntastic_python_checkers=['pylint']
           " "let g:syntastic_python_pylint_quiet_messages = { "regex": ['^\[missing-docstring\]', '^\[invalid-name\]'] }

           " let g:syntastic_python_checkers=['pep8', 'python']
           " let g:syntastic_python_pep8_quiet_messages = { "regex": '^E501' }

            "let g:syntastic_error_symbol = "X"
            "let g:syntastic_warning_symbol = "₩"
        "" }
    " python-syntax {
        "let python_highlight_all = 1
        "let g:pymode_indent = 1
    " }
    
    "" {
    "    " By default syntax-highlighting for Functions,
    "    " Methods and Structs is disabled.
    "    " To change it:
    "    let g:go_highlight_functions = 1
    "    let g:go_highlight_methods = 1
    "    let g:go_highlight_structs = 1
    "    let g:go_highlight_interfaces = 1
    "    let g:go_highlight_operators = 1
    "    let g:go_highlight_build_constraints = 1

    "    " Enable goimports
    "    let g:go_fmt_command = "goimports"

    "    " Syntastic
    "    let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
    "    let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

    "    let g:go_list_type = "quickfix"


    "" }
    "" Plug vim-indent-guides {
    "    "hi IndentGuidesOdd  ctermbg=white
	"	"hi IndentGuidesEven ctermbg=lightgrey
    "    let g:indent_guides_enable_on_vim_startup = 1
    "    let g:indent_guides_auto_colors = 1
    "    "autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
    "    "autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
    "    set ts=4 sw=2 et
    "    let g:intend_guides_start_level = 2
    "    let g:intend_guides_guide_size = 1
    "" }

    let g:airline#extensions#ycm#enabled = 1
    let g:airline#extensions#ycm#error_symbol = 'E:'
    let g:airline#extensions#ycm#warning_symbol = 'W:'

    " YouCompleteMe settings: {
        let g:ycm_auto_trigger = 1
        let g:ycm_complete_in_comments = 0
        let g:ycm_complete_in_strings = 1
        let g:ycm_semantic_triggers =  {
                \   'go' : ['.'],
                \   'python' : ['.', 'abcdefghizklmnhpqrstuvwxyzABCDEFGHIZKLMNOPQRSTUVWXYZ'],
                \   'c' : ['->', '.'],
                \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
                \             're!\[.*\]\s'],
                \   'ocaml' : ['.', '#'],
                \   'cpp,objcpp' : ['->', '.', '::'],
                \   'perl' : ['->'],
                \   'php' : ['->', '::'],
                \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
                \   'ruby' : ['.', '::'],
                \   'lua' : ['.', ':'],
                \   'erlang' : [':'],
        \ }
        "let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
        "let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

        let g:ycm_use_ultisnips_completer = 1
        
        let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
        let g:ycm_key_invoke_completion = '÷'
        let g:ycm_collect_identifiers_from_tags_files = 1
        let g:ycm_seed_identifiers_with_syntax = 1
        let g:ycm_confirm_extra_conf = 0

        let g:ycm_show_diagnostics_ui = 1
        let g:ycm_always_populate_location_list = 1


        "let g:python3_host_prog = '/usr/local/bin/python3'
        "let g:ycm_python_binary_path = '/usr/local/bin/python3'

        "let g:ycm_server_python_interpreter = '/usr/bin/python2.7'
    " }

    " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
    let g:UltiSnipsExpandTrigger="<c-1>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
    
    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"


    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_python_python_exec = '/usr/bin/python2.7'
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0


    let g:syntastic_ignore_files=[".*\.cpp$", ".*\.h$"]
    
    let g:syntastic_python_checkers=['pep8', 'python']
    let g:syntastic_python_pep8_quiet_messages = { "regex": '^E501' }

    " {
        " By default syntax-highlighting for Functions,
        " Methods and Structs is disabled.
        " To change it:
        "let g:ycm_filetype_blacklist = { 'go': 1 , 'vimgo': 1}

        let g:go_highlight_functions = 1
        let g:go_highlight_methods = 1
        let g:go_highlight_structs = 1
        let g:go_highlight_interfaces = 1
        let g:go_highlight_operators = 1
        let g:go_highlight_build_constraints = 1

        " Enable goimports
        let g:go_fmt_command = "goimports"

        " Syntastic
        let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
        let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

        let g:go_list_type = "quickfix"
    " }

    " vim-ansible
    let g:ansible_extra_syntaxes = "sh.vim ruby.vim"
    let g:ansible_attribute_highlight = "ob"
    let g:ansible_name_highlight = 'd'
    let g:ansible_extra_keywords_highlight = 1
" }

"	nnoremap <silent> <F8> :TlistToggle<CR>
	nnoremap <silent> <F9> :TagbarToggle<CR>

" Copy to system clipboard
" map <C-c> "+y

" Save file
nmap <C-s> :w<CR>

" Last Modify
map <C-q> `^
set scrolloff=5
""""""""""
"set vbs=4

autocmd FileType python map gr :YcmCompleter GoToReferences<CR> | map gd :YcmCompleter GoToDefinition<CR>
autocmd FileType go     map gr :GoReferrers<CR> | map =f :GoFmt<CR> | map =i :GoImports<CR> | nmap <C-1> :GoRename<CR>


imap <C-d> <C-o>dd
imap <C-k> <C-o>C
imap <C-a> <C-o>^
imap <C-e> <C-o>$

imap ˙ <left>
imap ∆ <down>
imap ˚ <up>
imap ¬ <right>

imap ∫ <C-o>b
imap ∑ <C-o>w

imap ø <C-o>o
imap Ø <C-o>O

