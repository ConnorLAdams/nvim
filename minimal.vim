" ===========================
" Basic Neovim Configuration
" ===========================

" Set encoding and file formats
set encoding=utf-8
set fileformat=unix

" Line numbers and relative numbers
set number
set relativenumber

" Enable syntax highlighting
syntax on

" Enable mouse support
set mouse=a

" Set tabs and indentation
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
autocmd FileType javascript,typescript,css setlocal tabstop=2 shiftwidth=2 expandtab

" Search settings
" set ignorecase
" set smartcase
set incsearch
" set hlsearch

" Better UI experience
" set cursorline
set termguicolors
set guicursor=""
" set background=dark

" Split behavior
" set splitbelow
" set splitright

set scrolloff=8
" ===========================
" Key Mappings
" ===========================

" Leader key
let mapleader = " "

" ===========================
" Remap Keybindings
" ===========================
lua << EOF
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


vim.keymap.set("n", "<C-d>pv", "<C-d>zz")
vim.keymap.set("n", "<C-u>pv", "<C-u>zz")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("v", "<leader>'", "c''<C-c>P")
vim.keymap.set("v", "<leader>\"", "c\"\"<C-c>P")

-- Copy to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Tabing
vim.keymap.set("n", "<Tab>", ">>_")
vim.keymap.set("n", "<S-Tab>", "<<_") 
vim.keymap.set("i", "<S-Tab>", "<C-D>")
vim.keymap.set("v", "<S-Tab>", "<gv")
vim.keymap.set("v", "<Tab>", ">gv")

-- Resize window
vim.keymap.set("n", "<C-l>", "<C-w><")
vim.keymap.set("n", "<C-h>", "<C-w>>")
vim.keymap.set("n", "<C-j>", "<C-w>-")
vim.keymap.set("n", "<C-k>", "<C-w>+")
EOF

" ===========================
" Plugin Management (vim-plug)
" ===========================

" " Specify the directory for plugins
" call plug#begin('~/.config/nvim/plugin')
"
" " Example plugins
" Plug 'tpope/vim-sensible'          " Sensible defaults
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Better syntax highlighting
" Plug 'neovim/nvim-lspconfig'       " LSP support
" Plug 'hrsh7th/nvim-cmp'            " Autocompletion
"
" " Initialize plugins
" call plug#end()

" ===========================
" Additional Plugin Settings
" ===========================

" Treesitter configuration
" lua << EOF
" require'nvim-treesitter.configs'.setup {
"   ensure_installed = "maintained",
"   highlight = {
"     enable = true,
"   },
" }
" EOF

" LSP configuration example
" lua << EOF
" local lspconfig = require'lspconfig'
" lspconfig.pyright.setup{}  -- Example for Python
" EOF

set packpath+=~/.local/share/nvim/site
set runtimepath+=~/.local/share/nvim/site/pack/packer/start/packer.nvim
packadd packer.nvim

luafile ~/.config/nvim/plugin/minimal_packer_compiled.lua

lua << EOF
function ColorMyPencils(color)
	color = color or "melange"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils("habamax")
EOF

