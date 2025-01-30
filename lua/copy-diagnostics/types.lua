--- A collection of types to be included / used in other Lua files.
---
--- These types are either required by the Lua API or required for the normal
--- operation of this Lua plugin.
---
---@module 'copy_diagnostics.types'
---

---@class copy_diagnostics.Configuration
---    The user's customizations for this plugin.
---@field commands copy_diagnostics.ConfigurationCommands?
---    Customize the fallback behavior of all `:CopyDiagnostics` commands.
---@field logging copy_diagnostics.LoggingConfiguration?
---    Control how and which logs print to file / Neovim.
---@field tools copy_diagnostics.ConfigurationTools?
---    Optional third-party tool integrations.

---@class copy_diagnostics.ConfigurationCommands
---    Customize the fallback behavior of all `:CopyDiagnostics` commands.
---@field goodnight_moon copy_diagnostics.ConfigurationGoodnightMoon?
---    The default values when a user calls `:CopyDiagnostics goodnight-moon`.
---@field hello_world copy_diagnostics.ConfigurationHelloWorld?
---    The default values when a user calls `:CopyDiagnostics hello-world`.

---@class copy_diagnostics.ConfigurationGoodnightMoon
---    The default values when a user calls `:CopyDiagnostics goodnight-moon`.
---@field read copy_diagnostics.ConfigurationGoodnightMoonRead?
---    The default values when a user calls `:CopyDiagnostics goodnight-moon read`.

---@class copy_diagnostics.LoggingConfiguration
---    Control whether or not logging is printed to the console or to disk.
---@field level (
---    | "trace"
---    | "debug"
---    | "info"
---    | "warn" | "error"
---    | "fatal"
---    | vim.log.levels.DEBUG
---    | vim.log.levels.ERROR
---    | vim.log.levels.INFO
---    | vim.log.levels.TRACE
---    | vim.log.levels.WARN)?
---    Any messages above this level will be logged.
---@field use_console boolean?
---    Should print the output to neovim while running. Warning: This is very
---    spammy. You probably don't want to enable this unless you have to.
---@field use_file boolean?
---    Should write to a file.
---@field output_path string?
---    The default path on-disk where log files will be written to.
---    Defaults to "/home/selecaoone/.local/share/nvim/plugin_name.log".

---@class copy_diagnostics.ConfigurationGoodnightMoonRead
---    The default values when a user calls `:CopyDiagnostics goodnight-moon read`.
---@field phrase string
---    The book to read if no book is given by the user.

---@class copy_diagnostics.ConfigurationHelloWorld
---    The default values when a user calls `:CopyDiagnostics hello-world`.
---@field say copy_diagnostics.ConfigurationHelloWorldSay?
---    The default values when a user calls `:CopyDiagnostics hello-world say`.

---@class copy_diagnostics.ConfigurationHelloWorldSay
---    The default values when a user calls `:CopyDiagnostics hello-world say`.
---@field repeat number
---    A 1-or-more value. When 1, the phrase is said once. When 2+, the phrase
---    is repeated that many times.
---@field style "lowercase" | "uppercase"
---    Control how the text is displayed. e.g. "uppercase" changes "hello" to "HELLO".

---@class copy_diagnostics.ConfigurationTools
---    Optional third-party tool integrations.
---@field lualine copy_diagnostics.ConfigurationToolsLualine?
---    A Vim statusline replacement that will show the command that the user just ran.

---@alias copy_diagnostics.ConfigurationToolsLualine table<string, plugin_template.ConfigurationToolsLualineData>
---    Each runnable command and its display text.

---@class copy_diagnostics.ConfigurationToolsLualineData
---    The display values that will be used when a specific `copy_diagnostics`
---    command runs.
---@diagnostic disable-next-line: undefined-doc-name
---@field color vim.api.keyset.highlight?
---    The foreground/background color to use for the Lualine status.
---@field prefix string?
---    The text to display in lualine.
