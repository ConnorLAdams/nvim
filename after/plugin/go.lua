vim.keymap.set('n', '<leader>gr', ':!go run %<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gm', function()
    local cwd = vim.fn.getcwd()
    local folder_path = vim.fn.expand('%:p:h')
    local mod_path = vim.fn.input('Enter module path: ')
    
    vim.cmd('cd ' .. folder_path)
    vim.cmd('!go mod init ' .. mod_path)
    vim.cmd('cd ' .. cwd)
end, { noremap = true, silent = true })

