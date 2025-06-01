require('quarto').setup{
  debug = false,
  closePreviewOnExit = true,
  lspFeatures = {
    enabled = true,
    chunks = "curly",
    languages = { "r", "python", "julia", "bash", "html" },
    diagnostics = {
      enabled = true,
      triggers = { "BufWritePost" },
    },
    completion = {
      enabled = true,
    },
  },
  codeRunner = {
    enabled = true,
    default_method = 'molten', -- 'molten' or 'slime'
    ft_runners = {}, -- filetype to runner, ie. `{ python = "molten" }`.
                     -- Takes precedence over `default_method`
    never_run = { "yaml" }, -- filetypes which are never sent to a code runner
  },
}

local quarto = require("quarto")
vim.keymap.set("n", "<leader>qa", quarto.activate, {})

local runner = require("quarto.runner")
vim.keymap.set("n", "<leader>qrr", runner.run_cell,  { desc = "run cell", silent = true })
vim.keymap.set("n", "<leader>qra", runner.run_above, { desc = "run cell and above", silent = true })
vim.keymap.set("n", "<leader>qrb", runner.run_below, { desc = "run cell and below", silent = true })
vim.keymap.set("n", "<leader>qrA", runner.run_all,   { desc = "run all cells", silent = true })
vim.keymap.set("n", "<leader>qrl", runner.run_line,  { desc = "run line", silent = true })
vim.keymap.set("v", "<leader>qr",  runner.run_range, { desc = "run visual range", silent = true })
vim.keymap.set("n", "<leader>qRA", function()
  runner.run_all(true)
end, { desc = "run all cells of all languages", silent = true })
