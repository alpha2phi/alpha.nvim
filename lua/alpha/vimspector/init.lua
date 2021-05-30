local v = {}

local vimspectorPython = [[
{
  "configurations": {
    "<name>: Launch": {
      "adapter": "debugpy",
      "configuration": {
        "name": "Python: Launch",
        "type": "python",
        "request": "launch",
        "python": "%s",
        "stopOnEntry": true,
        "console": "externalTerminal",
        "debugOptions": [],
        "program": "${file}"
      }
    }
  }
}
]]

function v.generateDebugProfile()
    -- Get current file type
    local buf = vim.api.nvim_get_current_buf()
    local ft = vim.api.nvim_buf_get_option(buf, "filetype")

    if ft == "python" then
        -- Get Python path
        local python3 = vim.fn.exepath("python3")
        local debugProfile = string.format(vimspectorPython, python3)

        -- Generate debug profile in a new window
        vim.api.nvim_exec('vnew', true)
        local win = vim.api.nvim_get_current_win()
        local bufNew = vim.api.nvim_create_buf(true, false)
        vim.api.nvim_buf_set_name(bufNew, ".vimspector.json")
        vim.api.nvim_win_set_buf(win, bufNew)

        lines = {}
        for s in vimspectorPython:gmatch("[^\r\n]+") do
            table.insert(lines, s)
        end
        vim.api.nvim_buf_set_lines(bufNew, 0, -1, false, lines)
    else
        print("Unsupported language!")
    end

end

return v
