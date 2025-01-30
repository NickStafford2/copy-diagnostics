# nvim-copy-diagnostics

A very simple Neovim plugin for copying diagnostics from the current line to the clipboard.

| <!-- -->     | <!-- -->                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| ------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Build Status | [![unittests](https://img.shields.io/github/actions/workflow/status/NickStafford2/copy-diagnostics.nvim/test.yml?branch=main&style=for-the-badge&label=Unittests)](https://github.com/ColinKennedy/copy-diagnostics.nvim/actions/workflows/test.yml) [![documentation](https://img.shields.io/github/actions/workflow/status/ColinKennedy/copy-diagnostics.nvim/documentation.yml?branch=main&style=for-the-badge&label=Documentation)](https://github.com/ColinKennedy/copy-diagnostics.nvim/actions/workflows/documentation.yml) [![luacheck](https://img.shields.io/github/actions/workflow/status/ColinKennedy/copy-diagnostics.nvim/luacheck.yml?branch=main&style=for-the-badge&label=Luacheck)](https://github.com/ColinKennedy/copy-diagnostics.nvim/actions/workflows/luacheck.yml) [![llscheck](https://img.shields.io/github/actions/workflow/status/ColinKennedy/copy-diagnostics.nvim/llscheck.yml?branch=main&style=for-the-badge&label=llscheck)](https://github.com/ColinKennedy/copy-diagnostics.nvim/actions/workflows/llscheck.yml) [![stylua](https://img.shields.io/github/actions/workflow/status/ColinKennedy/copy-diagnostics.nvim/stylua.yml?branch=main&style=for-the-badge&label=Stylua)](https://github.com/ColinKennedy/copy-diagnostics.nvim/actions/workflows/stylua.yml) [![urlchecker](https://img.shields.io/github/actions/workflow/status/ColinKennedy/copy-diagnostics.nvim/urlchecker.yml?branch=main&style=for-the-badge&label=URLChecker)](https://github.com/ColinKennedy/copy-diagnostics.nvim/actions/workflows/urlchecker.yml) |
| License      | [![License-GNU3](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)](https://github.com/NickStafford2/copy-diagnostics.nvim/blob/main/LICENSE)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| Social       | [![RSS](https://img.shields.io/badge/rss-F88900?style=for-the-badge&logo=rss&logoColor=white)](https://github.com/NickStafford2/copy-diagnostics.nvim/commits/main/doc/news.txt.atom)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |

## 🔑 Usage

1. Place your cursor on the code causing the error/warning/message.
2. Press `<leader>cy`
3. Profit

# Installation

- [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
    "NickStafford2/copy-diagnostics.nvim",
}
```

# Configuration

- [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
    "NickStafford2/copy-diagnostics.nvim",
    config = function()
        vim.g.copy_diagnostics_configuration = {
            commands = {},
        }
    end
}
```

# Tracking Updates

See [doc/news.txt](doc/news.txt) for updates.

You can watch this plugin for changes by adding this URL to your RSS feed:

```
https://github.com/NickStafford2/copy-diagnostics.nvim/commits/main/doc/news.txt.atom
```
