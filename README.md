# A Neovim Plugin Template

A template repository used to create Neovim plugins.

| <!-- -->     | <!-- -->                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
|--------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Build Status | [![unittests](https://img.shields.io/github/actions/workflow/status/NickStafford2/copy-diagnostics.nvim/test.yml?branch=main&style=for-the-badge&label=Unittests)](https://github.com/ColinKennedy/copy-diagnostics.nvim/actions/workflows/test.yml)  [![documentation](https://img.shields.io/github/actions/workflow/status/ColinKennedy/copy-diagnostics.nvim/documentation.yml?branch=main&style=for-the-badge&label=Documentation)](https://github.com/ColinKennedy/copy-diagnostics.nvim/actions/workflows/documentation.yml)  [![luacheck](https://img.shields.io/github/actions/workflow/status/ColinKennedy/copy-diagnostics.nvim/luacheck.yml?branch=main&style=for-the-badge&label=Luacheck)](https://github.com/ColinKennedy/copy-diagnostics.nvim/actions/workflows/luacheck.yml) [![llscheck](https://img.shields.io/github/actions/workflow/status/ColinKennedy/copy-diagnostics.nvim/llscheck.yml?branch=main&style=for-the-badge&label=llscheck)](https://github.com/ColinKennedy/copy-diagnostics.nvim/actions/workflows/llscheck.yml) [![stylua](https://img.shields.io/github/actions/workflow/status/ColinKennedy/copy-diagnostics.nvim/stylua.yml?branch=main&style=for-the-badge&label=Stylua)](https://github.com/ColinKennedy/copy-diagnostics.nvim/actions/workflows/stylua.yml)  [![urlchecker](https://img.shields.io/github/actions/workflow/status/ColinKennedy/copy-diagnostics.nvim/urlchecker.yml?branch=main&style=for-the-badge&label=URLChecker)](https://github.com/ColinKennedy/copy-diagnostics.nvim/actions/workflows/urlchecker.yml)  |
| License      | [![License-MIT](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)](https://github.com/NickStafford2/copy-diagnostics.nvim/blob/main/LICENSE)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| Social       | [![RSS](https://img.shields.io/badge/rss-F88900?style=for-the-badge&logo=rss&logoColor=white)](https://github.com/NickStafford2/copy-diagnostics.nvim/commits/main/doc/news.txt.atom)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |


# Features
- Follows [nvim-best-practices](https://github.com/nvim-neorocks/nvim-best-practices)
- Fast start-up (~1 ms)
- Auto-release to [luarocks](https://luarocks.org) & [GitHub](https://github.com/NickStafford2/copy-diagnostics.nvim/releases)
- Automated user documentation (using [panvimdoc](https://github.com/kdheepak/panvimdoc))
- Automated API documentation (using [mini.doc](https://github.com/echasnovski/mini.doc))
- Vimtags generation
- Built-in Vim commands
- A high quality command mode parser
- Auto-completes your commands at any cursor position
- No external dependencies[*](https://github.com/NickStafford2/copy-diagnostics.nvim/wiki/External-Dependencies-Disclaimer)
- [LuaCATS](https://luals.github.io/wiki/annotations/) annotations and type-hints, everywhere
- [RSS feed support](https://github.com/NickStafford2/copy-diagnostics.nvim/commits/main/doc/news.txt.atom)
- Built-in logging to stdout / files
- Unittests use the full power of native [busted](https://github.com/lunarmodules/busted)
- Automated testing matrix supports 9 Neovim/OS combinations
    - neovim: `[v0.10.0, stable, nightly]`
    - os: `[ubuntu-latest, macos-latest, windows-latest]`
- 100% Lua
- Uses [Semantic Versioning](https://semver.org)
- Integrations
    - [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
    - [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
    - `:checkhealth`
- Github actions for:
    - [StyLua](https://github.com/JohnnyMorganz/StyLua) - Auto-formats Lua code
    - [llscheck](https://github.com/jeffzi/llscheck) - Checks for Lua type mismatches
    - [luacheck](https://github.com/mpeterv/luacheck) - Checks for Lua code issues
    - [luarocks](https://luarocks.org) auto-release ([LUAROCKS_API_KEY secret](https://github.com/nvim-neorocks/sample-luarocks-plugin?tab=readme-ov-file#publishing-to-luarocks) configuration required)
    - [GitHub](https://github.com/NickStafford2/copy-diagnostics.nvim/releases) auto-release ([PERSONAL_ACCESS_TOKEN secret](https://github.com/nvim-neorocks/sample-luarocks-plugin?tab=readme-ov-file#installing-release-please-recommended) configuration required)
    - [mini.doc](https://github.com/echasnovski/mini.doc) - API documentation auto-generator
    - [panvimdoc](https://github.com/kdheepak/panvimdoc) - User documentation auto-generator
    - [urlchecker](https://github.com/urlstechie/urlchecker-action) - Checks for broken URL links
    - PR reviews - Reminds users to update `doc/news.txt`


# Using This Template
1. Follow the [Wiki instructions](https://github.com/NickStafford2/copy-diagnostics.nvim/wiki/Using-This-Template)
2. Once you're done, remove this section (the rest of this README.md file should be kept / customized to your needs)


# Installation
<!-- TODO: (you) - Adjust and add your dependencies as needed here -->
- [lazy.nvim](https://github.com/folke/lazy.nvim)
```lua
{
    "NickStafford2/copy-diagnostics.nvim",
    dependencies = { "NickStafford2/mega.cmdparse", "ColinKennedy/mega.logging" },
    -- TODO: (you) - Make sure your first release matches v1.0.0 so it auto-releases!
    version = "v1.*",
}
```


# Configuration
(These are default values)

<!-- TODO: (you) - Remove / Add / Adjust your configuration here -->

- [lazy.nvim](https://github.com/folke/lazy.nvim)
```lua
{
    "NickStafford2/copy-diagnostics.nvim",
    config = function()
        vim.g.copy_diagnostics_configuration = {
            commands = {
                goodnight_moon = { read = { phrase = "A good book" } },
                hello_world = {
                    say = { ["repeat"] = 1, style = "lowercase" },
                },
            },
            logging = {
                level = "info",
                use_console = false,
                use_file = false,
            },
            tools = {
                lualine = {
                    arbitrary_thing = {
                        color = "Visual",
                        text = " Arbitrary Thing",
                    },
                    copy_logs = {
                        color = "Comment",
                        text = "󰈔 Copy Logs",
                    },
                    goodnight_moon = {
                        color = "Question",
                        text = " Goodnight moon",
                    },
                    hello_world = {
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
    end
}
```


## Lualine

<!-- TODO: (you) - Remove this is you do not want lualine -->

> Note: You can customize lualine colors here or using
> `vim.g.copy_diagnostics_configuration`.

[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
```lua
require("lualine").setup {
    sections = {
        lualine_y = {
            -- ... Your other configuration ...
            {
                "copy_diagnostics",
                -- NOTE: These will override default values
                -- display = {
                --     goodnight_moon = {color={fg="#FFFFFF"}, text="Custom message 1"}},
                --     hello_world = {color={fg="#333333"}, text="Custom message 2"},
                -- },
            },
        }
    }
}
```


## Telescope

<!-- TODO: (you) - Remove this is you do not want telescope -->

> Note: You can customize telescope colors here or using
> `vim.g.copy_diagnostics_configuration`.

[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
```lua
{
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    config = function()
        -- ... Your other configuration ...
        require("telescope").load_extension("copy_diagnostics")
    end,
    dependencies = {
        "NickStafford2/copy-diagnostics.nvim",
        "nvim-lua/plenary.nvim",
    },
    version = "0.1.*",
},
```


### Colors
This plugin provides two default highlights

- `CopyDiagnosticsTelescopeEntry`
- `CopyDiagnosticsTelescopeSecondary`

Both come with default colors that should look nice. If you want to change them, here's how:
```lua
vim.api.nvim_set_hl(0, "CopyDiagnosticsTelescopeEntry", {link="Statement"})
vim.api.nvim_set_hl(0, "CopyDiagnosticsTelescopeSecondary", {link="Question"})
```


# Commands
Here are some example commands:

<!-- TODO: (you) - You'll probably want to change all this or remove it. See -->
<!-- plugin/copy_diagnostics.lua for details. -->

```vim
" A typical subcommand
:CopyDiagnostics hello-world say phrase "Hello, World!" " How are you?"
:CopyDiagnostics hello-world say phrase "Hello, World!" --repeat=2 --style=lowercase

" An example of a flag this repeatable and 3 flags, -a, -b, -c, as one dash
:CopyDiagnostics arbitrary-thing -vvv -abc -f

" Separate commands with completely separate, flexible APIs
:CopyDiagnostics goodnight-moon count-sheep 42
:CopyDiagnostics goodnight-moon read "a book"
:CopyDiagnostics goodnight-moon sleep -z -z -z
```


# Tests
## Initialization
Run this line once before calling any `busted` command

```sh
eval $(luarocks path --lua-version 5.1 --bin)
```


## Running
Run all tests
```sh
# Using the package manager
luarocks test --test-type busted
# Or manually
busted .
# Or with Make
make test
```

Run test based on tags
```sh
busted . --tags=simple
```


# Tracking Updates
See [doc/news.txt](doc/news.txt) for updates.

You can watch this plugin for changes by adding this URL to your RSS feed:
```
https://github.com/NickStafford2/copy-diagnostics.nvim/commits/main/doc/news.txt.atom
```


# Other Plugins
This template is full of various features. But if your plugin is only meant to
be a simple plugin and you don't want the bells and whistles that this template
provides, consider instead using
[nvim-copy-diagnostics](https://github.com/ellisonleao/nvim-plugin-template)
