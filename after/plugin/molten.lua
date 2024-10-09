-- When this package update you will want to replace the path in 'nvim-data/rplugin.vim' with the below path
-- 'C:\\\\Users\\\\ConnorAdams\\\\AppData\\\\Local\\\\nvim-data\\\\site\\\\pack\\\\packer\\\\start\\\\molten-nvim\\\\rplugin\\\\python3\\\\moten'
-- Use the following command instead
--      - cp $env:XDG_CONFIG_HOME/nvim/rplugin_molten.txt $env:LOCALAPPDATA/nvim-data/rplugin.vim
-- When creating a new virtual env you must install the following packages:
--      - pip install pynvim jupyter_client Pillow cairosvg pnglatex plotly kaleido pyperclip

vim.keymap.set("n", "<leader>me", ":MoltenEvaluateOperator<CR>", { desc = "evaluate operator", silent = true })
vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>", { desc = "init molten", silent = true })
vim.keymap.set("n", "<leader>mdi", ":MoltenDeinit<CR>", { desc = "init molten", silent = true })
vim.keymap.set("n", "<leader>mri", ":MoltenRestart<CR>", { desc = "restart molten", silent = true })
vim.keymap.set("n", "<leader>mos", ":noautocmd MoltenEnterOutput<CR>", { desc = "open output window", silent = true })

-- I find auto open annoying, keep in mind setting this option will require setting
-- a keybind for `:noautocmd MoltenEnterOutput` to open the output again
vim.g.molten_auto_open_output = false

-- this guide will be using image.nvim
-- Don't forget to setup and install the plugin if you want to view image outputs
--vim.g.molten_image_provider = "image.nvim"

-- optional, I like wrapping. works for virt text and the output window
vim.g.molten_wrap_output = true

-- Output as virtual text. Allows outputs to always be shown, works with images, but can
-- be buggy with longer images
vim.g.molten_virt_text_output = true

-- this will make it so the output shows up below the \`\`\` cell delimiter
vim.g.molten_virt_lines_off_by_1 = true

vim.keymap.set("n", "<leader>mrr", ":MoltenReevaluateCell<CR>", { desc = "re-eval cell", silent = true })
vim.keymap.set("v", "<leader>mr", ":<C-u>MoltenEvaluateVisual<CR>gv", { desc = "execute visual selection", silent = true })
vim.keymap.set("n", "<leader>moh", ":MoltenHideOutput<CR>", { desc = "close output window", silent = true })
vim.keymap.set("n", "<leader>mmd", ":MoltenDelete<CR>", { desc = "delete Molten cell", silent = true })

-- if you work with html outputs:
vim.keymap.set("n", "<leader>mx", ":MoltenOpenInBrowser<CR>", { desc = "open output in browser", silent = true })
vim.keymap.set("n", "<leader>mip", ":MoltenInit python3<CR>", { desc = "Molten init python", silent = true })

-- Provide a command to create a blank new Python notebook
-- note: the metadata is needed for Jupytext to understand how to parse the notebook.
-- if you use another language than Python, you should change it in the template.
local default_notebook = [[
  {
    "cells": [
     {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        ""
      ]
     }
    ],
    "metadata": {
     "kernelspec": {
      "display_name": "Python 3",
      "language": "python",
      "name": "python3"
     },
     "language_info": {
      "codemirror_mode": {
        "name": "ipython"
      },
      "file_extension": ".py",
      "mimetype": "text/x-python",
      "name": "python",
      "nbconvert_exporter": "python",
      "pygments_lexer": "ipython3"
     }
    },
    "nbformat": 4,
    "nbformat_minor": 5
  }
]]

local function new_notebook(filename)
  local path = filename .. ".ipynb"
  local file = io.open(path, "w")
  if file then
    file:write(default_notebook)
    file:close()
    vim.cmd("edit " .. path)
  else
    print("Error: Could not open new notebook file for writing.")
  end
end

vim.api.nvim_create_user_command('NewNotebook', function(opts)
  new_notebook(opts.args)
end, {
  nargs = 1,
  complete = 'file'
})
