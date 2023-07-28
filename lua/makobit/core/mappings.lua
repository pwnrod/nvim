-- disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local kmap = vim.keymap

-- [[ general keymaps ]]

-- deleting a character no longer copies it to the register
kmap.set("n", "x", '"_x')

-- window management
kmap.set("n", "<leader>|", "<C-w>v") -- split vertically
kmap.set("n", "<leader>-", "<C-w>s") -- split horizontally
kmap.set("n", "<leader>sx", ":close<CR>") -- close current split

-- quit
kmap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

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

-- bufferline
if vim.fn.exists(":BufferLineCyclePrev") then
	kmap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
	kmap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
	kmap.set("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
	kmap.set("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
else
	kmap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
	kmap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
	kmap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
	kmap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
end
