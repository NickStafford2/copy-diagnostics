--- The main file that implements `goodnight-moon read` outside of COMMAND mode.
---
---@module 'copy_diagnostics._commands.goodnight_moon.read.runner'
---

local M = {}

--- Print the name of the book.
---
---@param book string The name of the book.
---
function M.run(book)
    vim.notify(string.format("%s: it is a book", book), vim.log.levels.INFO)
end

return M
