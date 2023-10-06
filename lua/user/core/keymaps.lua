local utils = require("user.core.utils")
local keymap = utils.keymap

-- Yank and hold current cursor
keymap("v", "y", "ygv<Esc>")

-- Ctrl+s is save file
keymap("n", "<C-s>", "<cmd>w!<cr>")
keymap("i", "<C-s>", "<cmd>w!<cr>")

-- Navigator between window
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Resize pane
keymap("n", "<M-Right>", "<C-w>>")
keymap("n", "<M-Left>", "<C-w><")

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>")
keymap("n", "<S-h>", ":bprevious<CR>")

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>")

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==")
keymap("v", "<A-k>", ":m .-2<CR>==")
keymap("v", "p", '"_dP')

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv")
keymap("x", "K", ":move '<-2<CR>gv-gv")
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv")
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- Nvim Hlslens
keymap("n", "n", "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>")
keymap("n", "N", "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>")
keymap("n", "*", "*<Cmd>lua require('hlslens').start()<CR>")
keymap("n", "#", "#<Cmd>lua require('hlslens').start()<CR>")
keymap("n", "g*", "g*<Cmd>lua require('hlslens').start()<CR>")
keymap("n", "g#", "g#<Cmd>lua require('hlslens').start()<CR>")

-- Telescope
keymap("n", "<leader>sf", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
keymap("n", "<leader>sg", "<cmd>Telescope live_grep<cr>", { desc = "Find text" })
keymap("n", "<leader>sc", "<cmd>Telescope grep_string<cr>", { desc = "Find text current cursor" })
keymap("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>", { desc = "Find oldfiles" })
keymap("n", "<leader>sb", "<cmd>Telescope git_branches<cr>", { desc = "Find branches" })
keymap("n", "<leader>ss", "<cmd>Telescope git_stash<cr>", { desc = "Find stashes" })
keymap("n", "<leader>si", "<cmd>Telescope media_files<cr>", { desc = "Find media files" })

-- NvimTree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle NvimTree" })
keymap("n", "<leader>.", "<cmd>NvimTreeFindFile<cr>", { desc = "Find file in NvimTree" })

-- Fold
keymap("n", "<Leader>zR", "<cmd>lua require('ufo').openAllFolds()<CR>", { desc = "Open all folds" })
keymap("n", "<Leader>zM", "<cmd>lua require('ufo').closeAllFolds()<CR>", { desc = "Close all folds" })
keymap("n", "<Leader>zr", "<cmd>lua require('ufo').openFoldsExceptKinds()<CR>")
keymap("n", "<Leader>zm", "<cmd>lua require('ufo').closeFoldsWith()<CR>")
keymap("n", "<Leader>zp", "<cmd>lua require('ufo').peekFoldedLinesUnderCursor()<CR>", { desc = "Preview fold " })

-- Move in term mode
keymap("t", "<C-o>", "<C-\\><C-n>")
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h")
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j")
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k")
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l")

-- Common
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Disable hlsearch" })
keymap("n", "<Leader>f", "<cmd>Format<cr>", { desc = "Format" })
keymap("n", "<Leader>g", "<cmd>Gtabedit:<cr>", { desc = "Open fugitive" })
keymap("n", "<Leader>c", "<cmd>Bdelete<cr>", { desc = "Close buffer" })
keymap("n", "<Leader>d", "<cmd>lua require('dropbar.api').pick()<cr>", { desc = "Dropbar" })

-- Git conflit
keymap("n", "<Leader>Cc", "<cmd>GitConflictChooseOurs<cr>", { desc = "Select current" })
keymap("n", "<Leader>Ci", "<cmd>GitConflictChooseTheirs<cr>", { desc = "Select incomming" })
keymap("n", "<Leader>Cb", "<cmd>GitConflictChooseBoth<cr>", { desc = "Select both" })
keymap("n", "<Leader>Cn", "<cmd>GitConflictNextConflict<cr>", { desc = "Next" })
keymap("n", "<Leader>Cp", "<cmd>GitConflictPrevConflict<cr>", { desc = "Previous" })

-- GitSign
keymap("n", "<Leader>;P", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Preview hunk" })
keymap("n", "<Leader>;s", "<cmd>Gitsigns stage_hunk<cr>", { desc = "Stage hunk" })
keymap("n", "<Leader>;r", "<cmd>Gitsigns reset_hunk<cr>", { desc = "Discard hunk" })
keymap("n", "<Leader>;u", "<cmd>Gitsigns undo_stage_hunk<cr>", { desc = "Unstage hunk" })
keymap("n", "<leader>;n", "<cmd>Gitsigns next_hunk<cr>", { desc = "Next hunk" })
keymap("n", "<leader>;p", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Previous hunk" })

-- Harpoon
keymap("n", "<Leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "Add to marks" })
keymap("n", "<Leader>l", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = "List marks" })

-- Diffview
keymap("n", "<Leader>Do", "<cmd>DiffviewOpen<cr>", { desc = "Open Diffiview" })
keymap("n", "<Leader>Dc", "<cmd>DiffviewClose<cr>", { desc = "Close Diffiview" })
keymap("n", "<Leader>Dh", "<cmd>DiffviewFileHistory<cr>", { desc = "Open files history" })

-- Quit
keymap("n", "<C-q>", function()
	-- close current win if there are more than 1 win
	-- else close current tab if there are more than 1 tab
	-- else close current vim
	if #vim.api.nvim_tabpage_list_wins(0) > 1 then
		vim.cmd([[close]])
	elseif #vim.api.nvim_list_tabpages() > 1 then
		vim.cmd([[tabclose]])
	else
		vim.cmd([[qa]])
	end
end, { desc = "Super <C-q>" })

-- Select folder in ~/Dev
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww '~/.local/bin/scripts/tmux-sessionizer'<CR>")

keymap("n", "<leader>b", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })

keymap("n", "yr", function()
	local relative_filepath = vim.fn.expand("%:.")
	vim.fn.setreg("+", relative_filepath)
end, { desc = "Copy relative filepath" })

keymap("n", "<C-d>", "<C-d>zz", { desc = "Center cursor after moving down half-page" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Center cursor after moving up half-page" })