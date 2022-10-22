local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
  ["b"] = {
    "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    "Buffers",
  },
  ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
  ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  ["t"] = { "<cmd>TroubleToggle<cr>", "Toggle Trouble"},
  ["g"] = { "<cmd>Gtabedit:<cr>", "Open fugitive in new tab"},
  ["l"] = { string.format("<cmd>luafile %s<cr>", vim.env.MYVIMRC), "Reload neovim config"},

  P = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    C = { "<cmd>PackerClean<cr>", "Clean" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    S = { "<cmd>PackerSync<cr>", "Sync" },
    s = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

  S = {
    name = "+Search",
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
  },

  T = {
    name = "+Test",
    c = {"<cmd>TestNearest<cr>", "Run test bellow cursor"},
    f = {"<cmd>TestFile<cr>", "Run current test file"},
    s = {"<cmd>TestSuite<cr>", "Run all test files"},
    l = {"<cmd>TestLast<cr>", "Run last test file"},
    v = {"<cmd>TestVisit<cr>", "Open last test file"}
  },

  G = {
    name = "+Git",
    b = {"<cmd>Telescope git_branches<cr>", "Show branches"},
    f = {"<cmd>Telescope git_status<cr>", "Show files changed"},
    c = {"<cmd>Telescope git_commits<cr>", "Show commits"},
    s = {"<cmd>Telescope git_stash<cr>", "Show list stash"}
  },

  D = {
    name = "+Diffview",
    o = { "<cmd>DiffviewOpen<cr>", "Open diffview" },
    h = { "<cmd>DiffviewFileHistory<cr>", "Open commits history"},
    c = { "<cmd>DiffviewClose<cr>", "Close diffview" },
  },

  C = {
    name = "+Git Conflict",
    c = {"<cmd>GitConflictChooseOurs<cr>", "Select the current changes"},
    i = {"<cmd>GitConflictChooseTheirs<cr>", "Select the incoming changes"},
    b = {"<cmd>GitConflictChooseBoth<cr>", "Select both changes"},
    N = {"<cmd>GitConflictChooseNone<cr>", "Select none of the changes"},
    n = {"<cmd>GitConflictNextConflict<cr>", "Move to the next conflict"},
    p = {"<cmd>GitConflictPrevConflict<cr>", "Move to the previous conflict"},
    l = {"<cmd>GitConflictListQf<cr>", "Get all conflict to quickfix"}
  }
}

which_key.setup(setup)
which_key.register(mappings, opts)