--- All functions and data to help customize `copy_diagnostics` for this user.
---
---@module 'copy_diagnostics._core.configuration'
---

local say_constant = require("copy_diagnostics._commands.hello_world.say.constant")

local M = {}

-- NOTE: Don't remove this line. It makes the Lua module much easier to reload
vim.g.loaded_copy_diagnostics = false

---@type copy_diagnostics.Configuration
M.DATA = {}

-- It's recommended to keep the `display` section in any case.
--
---@type copy_diagnostics.Configuration
local _DEFAULTS = {}

-- TODO: (you) Update these sections depending on your intended plugin features.
local _EXTRA_DEFAULTS = {
    commands = {
        goodnight_moon = { read = { phrase = "A good book" } },
        hello_world = {
            say = { ["repeat"] = 1, style = say_constant.Keyword.style.lowercase },
        },
    },
    tools = {
        lualine = {
            arbitrary_thing = {
                -- color = { link = "#555555" },
                color = "Visual",
                text = " Arbitrary Thing",
            },
            goodnight_moon = {
                -- color = { fg = "#0000FF" },
                color = "Question",
                text = "⏾ Goodnight moon",
            },
            hello_world = {
                -- color = { fg = "#FFA07A" },
                color = "Title",
                text = " Hello, World!",
            },
        },
        telescope = {
            goodnight_moon = {
                { "Foo Book", "Author A" },
                { "Bar Book Title", "John Doe" },
                { "Fizz Drink", "Some Name" },
                { "Buzz Bee", "Cool Person" },
            },
            hello_world = { "Hi there!", "Hello, Sailor!", "What's up, doc?" },
        },
    },
}

_DEFAULTS = vim.tbl_deep_extend("force", _DEFAULTS, _EXTRA_DEFAULTS)

--- Setup `copy_diagnostics` for the first time, if needed.
function M.initialize_data_if_needed()
    if vim.g.loaded_copy_diagnostics then
        return
    end

    M.DATA = vim.tbl_deep_extend("force", _DEFAULTS, vim.g.copy_diagnostics_configuration or {})

    vim.g.loaded_copy_diagnostics = true
end

--- Merge `data` with the user's current configuration.
---
---@param data copy_diagnostics.Configuration? All extra customizations for this plugin.
---@return copy_diagnostics.Configuration # The configuration with 100% filled out values.
---
function M.resolve_data(data)
    M.initialize_data_if_needed()

    return vim.tbl_deep_extend("force", M.DATA, data or {})
end

return M
