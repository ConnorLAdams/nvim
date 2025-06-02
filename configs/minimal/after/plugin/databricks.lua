require('nvim-databricks').setup({
    DBConfigFile = '~/.databrickscfg', -- Set path to Databricks connect config file
    python = 'python3', -- Set Python version for DBRun
    dap = "true", -- Toggle to enable setting nvim-dap python environmental variables for cluster selection
})

-- vim.keymap.set("n", "<leader>dbo", ':lua require("lazydbrix").open()<CR>', {})
-- vim.keymap.set("n", "<leader>dbs", ':lua require("lazydbrix").show()<CR>', {})

vim.keymap.set('n', '<leader>dbo', ':DBOpen')
vim.keymap.set('n', '<leader>dbr', ':DBRun')
vim.keymap.set('n', '<leader>dbp', ':DBPrintState')
