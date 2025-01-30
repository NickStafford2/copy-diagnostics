--- Make that the Lualine component works as expected.
---
---@module 'copy_diagnostics.lualine_spec'
---

local highlight = require("lualine.highlight")
local loader = require("lualine.utils.loader")
local lualine_copy_diagnostics = require("lualine.components.plugin_template")
local mock_test = require("test_utilities.mock_test")
local copy_diagnostics = require("plugin_template")

---@return table # The generated Lualine component.
local function _make_component()
    return lualine_copy_diagnostics({ self = { section = "y" } })
end

--- Delete all existing highlight groups and recreate them (so we can keep tests clean).
local function _refresh_highlight_groups()
    local theme = loader.load_theme("gruvbox")
    highlight.create_highlight_groups(theme)
end

--- Enable lualine so we can create lualine component(s) and other various tasks.
local function _setup_lualine()
    lualine_copy_diagnostics.PREVIOUS_COMMAND = nil

    mock_test.silence_all_internal_prints()

    _refresh_highlight_groups()
end

describe("default", function()
    before_each(_setup_lualine)
    after_each(mock_test.reset_mocked_vim_inspect)

    it("displays nothing if no command has been run yet", function()
        local component = _make_component()

        assert.is_nil(component:update_status())
    end)
end)

describe("API calls", function()
    before_each(_setup_lualine)

    it("works with #arbitrary-thing", function()
        local component = _make_component()

        assert.is_nil(component:update_status())

        copy_diagnostics.run_arbitrary_thing()

        assert.equal("%#lualine_y_copy_diagnostics_arbitrary_thing# Arbitrary Thing", component:update_status())
    end)

    it("works with #copy-logs", function()
        local component = _make_component()

        assert.is_nil(component:update_status())

        copy_diagnostics.run_copy_logs()

        assert.equal("%#lualine_y_copy_diagnostics_copy_logs#󰈔 Copy Logs", component:update_status())
    end)

    it("works with #goodnight-moon #count-sheep", function()
        local component = _make_component()

        assert.is_nil(component:update_status())

        copy_diagnostics.run_goodnight_moon_count_sheep(10)

        assert.equal("%#lualine_y_copy_diagnostics_goodnight_moon#⏾ Goodnight moon", component:update_status())
    end)

    it("works with #goodnight-moon #read", function()
        local component = _make_component()

        assert.is_nil(component:update_status())

        copy_diagnostics.run_goodnight_moon_read("a book")

        assert.equal("%#lualine_y_copy_diagnostics_goodnight_moon#⏾ Goodnight moon", component:update_status())
    end)

    it("works with #goodnight-moon #sleep", function()
        local component = _make_component()

        assert.is_nil(component:update_status())

        copy_diagnostics.run_goodnight_moon_sleep()

        assert.equal("%#lualine_y_copy_diagnostics_goodnight_moon#⏾ Goodnight moon", component:update_status())
    end)

    it("works with #hello-world #say phrase", function()
        local component = _make_component()

        assert.is_nil(component:update_status())

        copy_diagnostics.run_hello_world_say_phrase({ "A phrase!" })

        assert.equal("%#lualine_y_copy_diagnostics_hello_world# Hello, World!", component:update_status())
    end)

    it("works with #hello-world #say word", function()
        local component = _make_component()

        assert.is_nil(component:update_status())

        copy_diagnostics.run_hello_world_say_word("some_text_here")

        assert.equal("%#lualine_y_copy_diagnostics_hello_world# Hello, World!", component:update_status())
    end)
end)

describe("Command calls", function()
    before_each(_setup_lualine)

    it("works with #arbitrary-thing", function()
        local component = _make_component()

        assert.is_nil(component:update_status())

        vim.cmd([[CopyDiagnostics arbitrary-thing]])

        assert.equal("%#lualine_y_copy_diagnostics_arbitrary_thing# Arbitrary Thing", component:update_status())
    end)

    it("works with #copy-logs", function()
        local component = _make_component()

        assert.is_nil(component:update_status())

        vim.cmd([[CopyDiagnostics copy-logs]])

        assert.equal("%#lualine_y_copy_diagnostics_copy_logs#󰈔 Copy Logs", component:update_status())
    end)

    it("works with #goodnight-moon #count-sheep", function()
        local component = _make_component()

        assert.is_nil(component:update_status())

        vim.cmd([[CopyDiagnostics goodnight-moon count-sheep 10]])

        assert.equal("%#lualine_y_copy_diagnostics_goodnight_moon#⏾ Goodnight moon", component:update_status())
    end)

    it("works with #goodnight-moon #read", function()
        local component = _make_component()

        assert.is_nil(component:update_status())

        vim.cmd([[CopyDiagnostics goodnight-moon read "a book"]])

        assert.equal("%#lualine_y_copy_diagnostics_goodnight_moon#⏾ Goodnight moon", component:update_status())
    end)

    it("works with #goodnight-moon #sleep", function()
        local component = _make_component()

        assert.is_nil(component:update_status())

        vim.cmd([[CopyDiagnostics goodnight-moon sleep -zzz]])

        assert.equal("%#lualine_y_copy_diagnostics_goodnight_moon#⏾ Goodnight moon", component:update_status())
    end)

    it("works with #hello-world #say phrase", function()
        local component = _make_component()

        assert.is_nil(component:update_status())

        vim.cmd([[CopyDiagnostics hello-world say phrase "something more text"]])

        assert.equal("%#lualine_y_copy_diagnostics_hello_world# Hello, World!", component:update_status())
    end)

    it("works with #hello-world #say word", function()
        local component = _make_component()

        assert.is_nil(component:update_status())

        vim.cmd([[CopyDiagnostics hello-world say word some_text_here]])

        assert.equal("%#lualine_y_copy_diagnostics_hello_world# Hello, World!", component:update_status())
    end)
end)
