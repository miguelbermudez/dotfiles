
-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- Credit: https://github.com/MeirKriheli/dotneovim/blob/5728f528f275bd075fe0d246fdfe25d9db1d20b1/lua/user/plugins.lua#L23
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}


packer.startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} },
  }

  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  })

  use 'kyazdani42/nvim-web-devicons'

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use 'echasnovski/mini.nvim'

  use('ThePrimeagen/harpoon')

  use('mbbill/undotree')

  use('tpope/vim-fugitive')

  use "lewis6991/gitsigns.nvim"

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }

  use('j-hui/fidget.nvim')

  use('github/copilot.vim')

  use 'nvim-lualine/lualine.nvim' -- Fancier statusline

  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines

  -- https://github.com/numToStr/Comment.nvim
  -- "gc" to comment visual regions/lines
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  use('xiyaowong/telescope-emoji')

  -- rust
  use 'simrat39/rust-tools.nvim'   -- Rust LSP

  use {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup({
	window = {
	  border = 'single'
	},
	plugins = {
	  spelling = {
	    enabled = true,
	  },
	},
      })
    end
  }



end)
