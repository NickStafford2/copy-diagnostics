--- Make sure `copy_diagnostics` will work as expected.
---
--- At minimum, we validate that the user's configuration is correct. But other
--- checks can happen here if needed.
---
---@module 'copy_diagnostics.health'
---

local configuration_ = require("copy_diagnostics._core.configuration")

local M = {}

-- NOTE: This file is defer-loaded so it's okay to run this in the global scope
configuration_.initialize_data_if_needed()

--- Check `data` for problems and return each of them.
---
---@param data copy_diagnostics.Configuration? All extra customizations for this plugin.
---@return string[] # All found issues, if any.
---
function M.get_issues(data)
    if not data or vim.tbl_isempty(data) then
        data = configuration_.resolve_data(vim.g.copy_diagnostics_configuration)
    end

    local output = {}
    vim.list_extend(output, _get_command_issues(data))

    return output
end

--- Make sure `data` will work for `copy_diagnostics`.
---
---@param data copy_diagnostics.Configuration? All extra customizations for this plugin.
---
function M.check(data)
    vim.health.start("Configuration")

    local issues = M.get_issues(data)

    if vim.tbl_isempty(issues) then
        vim.health.ok("Your vim.g.copy_diagnostics_configuration variable is great!")
    end

    for _, issue in ipairs(issues) do
        vim.health.error(issue)
    end
end

return M
