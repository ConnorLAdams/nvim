
vim.g.vimtex_view_method = 'zathura'
-- vim.g.vimtex_view_general_viewer = 'okular'
-- vim.g.vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
-- vim.g.vimtex_compiler_method = 'tectonic'
vim.g.vimtex_compiler_latexmk_engines = {_= '-lualatex'}
vim.g.vimtex_compiler_latexmk = {
    options = {
        "-shell-escape",
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
    }
}
