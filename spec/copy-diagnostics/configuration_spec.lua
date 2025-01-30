--- Make sure configuration health checks succeed or fail where they should.
---
---@module 'copy_diagnostics.configuration_spec'
---

local configuration_ = require("copy_diagnostics._core.configuration")

local mock_vim = require("test_utilities.mock_vim")

--- Make sure `data`, whether undefined, defined, or partially defined, works.
---
---@param data copy_diagnostics.Configuration? The user customizations, if any.
---
local function _assert_good(data)
    data = configuration_.resolve_data(data)
    local issues = health.get_issues(data)

    if vim.tbl_isempty(issues) then
        return
    end

    error(
        string.format(
            'Test did not succeed. Configuration "%s fails with "%s" issues.',
            vim.inspect(data),
            vim.inspect(issues)
        )
    )
end

describe("default", function()
    it("works with an #empty configuration", function()
        _assert_good({})
        _assert_good()
    end)

    it("works with a fully defined, custom configuration", function()
        _assert_good({
            commands = {
                goodnight_moon = {
                    read = { phrase = "The Origin of Consciousness in the Breakdown of the Bicameral Mind" },
                },
                hello_world = { say = { ["repeat"] = 12, style = "uppercase" } },
            },
        })
    end)

    it("works with the default configuration", function()
        _assert_good({
            commands = {
                goodnight_moon = { phrase = "A good book" },
                hello_world = { say = { ["repeat"] = 1, style = "lowercase" } },
            },
        })
    end)

    it("works with the partially-defined configuration", function()
        _assert_good({
            commands = {
                goodnight_moon = {},
                hello_world = {},
            },
        })
    end)
end)

---@diagnostic disable: assign-type-mismatch
describe("health.check", function()
    before_each(function()
        mock_vim.mock_vim_health()
    end)
    after_each(mock_vim.reset_mocked_vim_health)

    it("works with an empty configuration", function()
        assert.same({}, mock_vim.get_vim_health_errors())
    end)
end)
---@diagnostic enable: assign-type-mismatch
