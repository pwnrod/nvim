-- disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local kmap = vim.keymap

-- [[ general keymaps ]]

-- deleting a character no longer copies it to the register
kmap.set("n", "x", '"_x')

-- window management
kmap.set("n", "<leader>|", "<C-w>v")      -- split vertically
kmap.set("n", "<leader>-", "<C-w>s")      -- split horizontally
kmap.set("n", "<leader>wh", "<C-w>h")     -- move left one window
kmap.set("n", "<leader>wj", "<C-w>j")     -- move down one window
kmap.set("n", "<leader>wk", "<C-w>k")     -- move up one window
kmap.set("n", "<leader>wl", "<C-w>l")     -- move right one window
kmap.set("n", "<leader>sx", ":close<CR>") -- close current split

-- quit
kmap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- center cursor when moving through files
kmap.set("n", "<C-d>", "<C-d>zz")
kmap.set("n", "<C-u>", "<C-u>zz")

-- center cursor when jumping between search results
kmap.set("n", "n", "nzzzv")
kmap.set("n", "N", "Nzzzv")

-- just remove Q, nobody needs Q
kmap.set("n", "Q", "<nop>")

-- [[ plugin keymaps ]]

-- nvim-tree
kmap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
kmap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
kmap.set("n", "<leader>fw", "<cmd>Telescope live_grep<cr>")
kmap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
kmap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
kmap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>")

-- lazygit
kmap.set("n", "<leader>gg", ":LazyGit<CR>")

-- trouble.nvim
kmap.set("n", "<leader>xx", function()
    require("trouble").open()
end)
kmap.set("n", "<leader>xw", function()
    require("trouble").open("workspace_diagnostics")
end)
kmap.set("n", "<leader>xd", function()
    require("trouble").open("document_diagnostics")
end)
kmap.set("n", "<leader>xl", function()
    require("trouble").open("quickfix")
end)
kmap.set("n", "<leader>xq", function()
    require("trouble").open("loclist")
end)
kmap.set("n", "gR", function()
    require("trouble").open("lsp_references")
end)

-- harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-j>", function()
    ui.nav_file(1)
end, { desc = "Jump to that beautiful first file" })
vim.keymap.set("n", "<C-k>", function()
    ui.nav_file(2)
end)
vim.keymap.set("n", "<C-l>", function()
    ui.nav_file(3)
end)
vim.keymap.set("n", "<C-;>", function()
    ui.nav_file(4)
end)
