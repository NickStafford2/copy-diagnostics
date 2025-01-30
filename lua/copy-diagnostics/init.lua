--- All function(s) that can be called externally by other Lua modules.
---
--- If a function's signature here changes in some incompatible way, this
--- package must get a new **major** version.
---
---@module 'copy_diagnostics'
---

local M = {}

local configuration = require("copy-diagnostics._core.configuration")
configuration.initialize_data_if_needed()

vim.keymap.set("n", configuration.DATA.keymap, function()
    local diagnostics = vim.diagnostic.get(0, {})
    if not diagnostics or #diagnostics == 0 then
        print("No next diagnostic")
        return
    end

    -- Extract the diagnostic messages
    local diagnostic_messages = {}
    for _, diagnostic in ipairs(diagnostics) do
        table.insert(diagnostic_messages, diagnostic.message)
    end

    -- Join the messages into a single string
    local diagnostic_text = table.concat(diagnostic_messages, "\n")
    -- Copy to system clipboard
    vim.fn.setreg("+", diagnostic_text)
    print("Copied diagnostics to clipboard.")
end, { desc = "Copy Diagnostics" })

return M
