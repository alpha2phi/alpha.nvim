local v = {}

local function v.createFloatingWindow()
    local stats = vim.api.nvim_list_uis()[1]
    local width = stats.width
    local height = stats.height

    print("Window size", width, height)


return v

