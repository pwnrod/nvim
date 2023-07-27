-- disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local kmap = vim.keymap

-- [[ general keymaps ]]

-- deleting a character no longer copies it to the register
kmap.set('n', 'x', '"_x')

-- window management
kmap.set('n', '<leader>|', '<C-w>v') -- split vertically
kmap.set('n', '<leader>-', '<C-w>s') -- split horizontally
kmap.set('n', '<leader>sx', ':close<CR>') -- close current split

-- [[ plugin keymaps ]]
kmap.set('n', '<leader>e', ":NvimTreeToggle<CR>")

-- telescope
kmap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
kmap.set('n', '<leader>fw', '<cmd>Telescope live_grep<cr>')
kmap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
kmap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
kmap.set('n', '<leader>fk', '<cmd>Telescope keymaps<cr>')
