require('telescope').setup{
    extension = {
        media_files = {
            filetypes = {"png", "webp", "jpg", "jpeg"},
            find_cmd = 'rg'
        }
    },
}
require('telescope').load_extension('media_files')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>ph', function()
	builtin.find_files({ hidden = true, no_ignore = true })
end)
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
