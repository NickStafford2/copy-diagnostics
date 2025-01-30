--- The main parser for the `:CopyDiagnostics copy-logs` command.
---
---@module 'copy_diagnostics._commands.copy_logs.parser'
---

local cmdparse = require("mega.cmdparse")

local M = {}

---@return mega.cmdparse.ParameterParser # The main parser for the `:CopyDiagnostics copy-logs` command.
function M.make_parser()
    local parser = cmdparse.ParameterParser.new({ "copy-logs", help = "Get debug logs for CopyDiagnostics." })

    parser:add_parameter({
        "log",
        required = false,
        help = "The path on-disk to look for logs. If no path is given, a fallback log path is used instead.",
    })

    parser:set_execute(function(data)
        ---@cast data mega.cmdparse.NamespaceExecuteArguments
        local runner = require("copy_diagnostics._commands.copy_logs.runner")

        runner.run(data.namespace.log)
    end)

    return parser
end

return M
