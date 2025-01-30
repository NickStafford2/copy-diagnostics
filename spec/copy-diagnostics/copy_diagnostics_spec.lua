--- Basic API tests.
---
--- This module is pretty specific to this plugin template so you'll most
--- likely want to delete or heavily modify this file. But it does give a quick
--- look how to mock a test and some things you can do with Neovim/busted.
---
---@module 'copy_diagnostics.plugin_template_spec'
---

---@class copy_diagnostics.Configuration
local _CONFIGURATION_DATA

---@type string[]
local _DATA = {}

local _ORIGINAL_NOTIFY = vim.notify

--- Keep track of text that would have been printed. Save it to a variable instead.
---
---@param data string Some text to print to stdout.
---
local function _save_prints(data)
    table.insert(_DATA, data)
end

--- Mock all functions / states before a unittest runs (call this before each test).
local function _initialize_prints()
    vim.notify = _save_prints
end

--- Reset all functions / states to their previous settings before the test had run.
local function _reset_prints()
    vim.notify = _ORIGINAL_NOTIFY
    _DATA = {}
end

describe("help API", function()
    before_each(_initialize_prints)
    after_each(_reset_prints)

    describe("fallback help", function()
        it("works on a nested subparser - 003", function()
            vim.cmd("CopyDiagnostics hello-world say")
            assert.same({ "Usage: {say} {phrase,word} [--help]" }, _DATA)
        end)
    end)
end)
