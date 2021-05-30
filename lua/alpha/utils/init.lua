local utils = {}

function utils.createFloatingWindow()
    local stats = vim.api.nvim_list_uis()[1]
    local width = stats.width
    local height = stats.height

    print("Window size", width, height)

    local buf = vim.api.nvim_create_buf(false, true)
    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width - 8,
        height = height - 8,
        col = 2,
        row = 2,
        border = "double"
    })
end

function utils.onResize()
    local stats = vim.api.nvim_list_uis()[1]
    local width = stats.width
    local height = stats.height

    print("Window size", width, height)
end

return utils

