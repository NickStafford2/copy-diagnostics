--- The main file that implements `goodnight-moon sleep` outside of COMMAND mode.
---
---@module 'copy_diagnostics._commands.goodnight_moon.sleep.runner'
---

local M = {}

--- Print Zzz each `count`.
---
---@param count number? Prints 1 Zzz per `count`. A value that is 1-or-greater.
---
function M.run(count)
    if count == nil then
        count = 1
    end

    if count < 1 then
        count = 1
    end

    for _ = 1, count do
        vim.notify("Zzz", vim.log.levels.INFO)
    end
end

return M
