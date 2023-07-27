-- set leader remap before anything else
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- lua functions that many plugins use
    {"nvim-lua/plenary.nvim"},

    -- [[ basics ]]

    -- colorscheme setup
    {
        'catppuccin/nvim', 
        name = 'catppuccin', 
        priority = 1000,
        config = function()
            vim.cmd.colorscheme 'catppuccin'
        end,
    },

    -- get that fancy 'jk' -> <ESC> remap
    {
        'max397574/better-escape.nvim',
        config = function()
            require('better_escape').setup()
        end,
    },

    -- get some autopairs
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {},
    },

    -- tmux & split window navigation
    {
        'christoomey/vim-tmux-navigator'
    },

    -- crazy good text surround keymaps
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    -- very helpful plugin for managing commenting blocks
    {
        "numToStr/Comment.nvim",
        config = function()
            require('Comment').setup()
        end
    },

    -- file explorer
    {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup({
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                },
            },
        })
 	end,
    },
    
    -- get a status bar on the bottom of the screen
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'ayu_mirage'
                },
            })
        end
    },

    -- fuzzy find all the things!
    {
        'nvim-telescope/telescope.nvim', 
        tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('telescope').setup({})
        end
    },
    
    -- autocompletion
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },

    -- snippets
    { 
        "L3MON4D3/LuaSnip",
        version = "2.*",
        build = "make install_jsregexp"
    },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'rafamadriz/friendly-snippets' },
    
})
