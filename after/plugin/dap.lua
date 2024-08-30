require("dap-python").setup("python")
-- If using the above, then `python -m debugpy --version`
-- must work in the shell

dap = require('dap')
vim.keymap.set('n', '<leader>dr', dap.continue)
vim.keymap.set('n', '<leader>dbp', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>dc', dap.repl.toggle)
vim.keymap.set('n', '<leader>ddc', dap.disconnect)
vim.keymap.set('n', '<leader>dso', dap.step_over)
vim.keymap.set('n', '<leader>dsi', dap.step_into)
