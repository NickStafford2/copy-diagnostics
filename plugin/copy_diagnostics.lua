--- All `copy_diagnostics` command definitions.

local cmdparse = require("mega.cmdparse")

local _PREFIX = "CopyDiagnostics"

---@type mega.cmdparse.ParserCreator
local _SUBCOMMANDS = function()
    local arbitrary_thing = require("copy_diagnostics._commands.arbitrary_thing.parser")
    local goodnight_moon = require("copy_diagnostics._commands.goodnight_moon.parser")
    local hello_world = require("copy_diagnostics._commands.hello_world.parser")

    local parser = cmdparse.ParameterParser.new({ name = _PREFIX, help = "The root of all commands." })
    local subparsers = parser:add_subparsers({ "commands", help = "All runnable commands." })

    subparsers:add_parser(arbitrary_thing.make_parser())
    subparsers:add_parser(goodnight_moon.make_parser())
    subparsers:add_parser(hello_world.make_parser())

    return parser
end

cmdparse.create_user_command(_SUBCOMMANDS, _PREFIX)

vim.keymap.set("n", "<Plug>(CopyDiagnosticsSayHi)", function()
    local configuration = require("copy_diagnostics._core.configuration")
    local copy_diagnostics = require("plugin_template")

    configuration.initialize_data_if_needed()

    copy_diagnostics.run_hello_world_say_word("Hi!")
end, { desc = "Say hi to the user." })
