vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }

  use "nvim-lua/plenary.nvim"

  use 'kyazdani42/nvim-web-devicons' -- optional, for file icons


  -- Improve startup time for neovim
  use "lewis6991/impatient.nvim"

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    config = function()
      require "plugins.configs.telescope"
    end
  }

  use {
    "nvim-telescope/telescope-project.nvim",
    config = function()
      require "plugins.configs.telescope.project"
    end
  }

  -- Explorer file and folder
  use {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require "plugins.configs.nvim-tree"
    end
  }

  -- Dashboard
  use {
    'goolord/alpha-nvim',
    config = function ()
      require "plugins.configs.alpha"
    end
  }

  -- Indent line
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "plugins.configs.indent-blankline"
    end
  }

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  -- Syntax highlight
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require "plugins.configs.treesitter"
    end
  }

  -- Buffer
  use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    config = function()
      require "plugins.configs.bufferline"
    end
  }

  -- Theme tokyonight
  use 'folke/tokyonight.nvim'

  -- Status button line
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require "plugins.configs.lualine"
    end
  }

  use {
    "karb94/neoscroll.nvim",
    config = function()
      require "plugins.configs.neoscroll"
    end
  }

  use { "ggandor/lightspeed.nvim" }

  -- Mason: like lsp-installer
  use {
    "williamboman/mason.nvim",
    config = function()
      require "plugins.configs.mason"
    end
  }

  use {
    "williamboman/mason-lspconfig.nvim"
  }

  -- Lsp config
  use {
    'neovim/nvim-lspconfig'
  }

  use "jose-elias-alvarez/null-ls.nvim"

  -- Cmp
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/nvim-cmp"

  use {
    "folke/trouble.nvim"
  }

  -- Which key
  use {
    "folke/which-key.nvim",
    config = function()
      require "plugins.configs.whichkey"
    end
  }

  -- Delete buffer
  use "famiu/bufdelete.nvim"
end)
