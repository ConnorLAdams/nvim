function IndentFour()
    vim.opt.shiftwidth = 4
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.expandtab = true

    vim.cmd([[
        %s/^\( \{2}\)\+/\=repeat(' ', len(submatch(0)) * 2)/g
    ]])
end

function IndentTwo()
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.expandtab = true

    vim.cmd([[
        %s#^\( \{4}\)\+#\=repeat(' ', len(submatch(0))/2)#g
    ]])
end


