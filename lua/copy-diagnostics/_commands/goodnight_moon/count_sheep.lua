--- The main file that implements `goodnight-moon count-sheep` outside of COMMAND mode.
---
---@module 'copy_diagnostics._commands.goodnight_moon.count_sheep.runner'
---

local configuration = require("copy_diagnostics._core.configuration")

local M = {}

--- Count a sheep for each `count`.
---
---@param count number Prints 1 sheep per `count`. A value that is 1-or-greater.
---
function M.run(count)
    configuration.initialize_data_if_needed()

    if count < 1 then
        count = 1
    end

    for index = 1, count do
        vim.notify(string.format("%s Sheep", index), vim.log.levels.INFO)
    end
end

return M
