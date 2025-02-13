--- Run the is file before you run unittests to download any extra dependencies.

local _PLUGINS = {
    ["https://github.com/nvim-lua/plenary.nvim"] = os.getenv("PLENARY_DIR") or "/tmp/plenary.nvim",
}

local cloned = false

for url, directory in pairs(_PLUGINS) do
    if vim.fn.isdirectory(directory) ~= 1 then
        print(string.format('Cloning "%s" plug-in to "%s" path.', url, directory))

        vim.fn.system({ "git", "clone", url, directory })

        cloned = true
    end

    vim.opt.rtp:append(directory)
end

if cloned then
    print("Finished cloning.")
end

vim.opt.rtp:append(".")

vim.cmd("runtime plugin/copy_diagnostics.lua")

vim.cmd("runtime plugin/plenary.vim")

require("copy_diagnostics._core.configuration").initialize_data_if_needed()
