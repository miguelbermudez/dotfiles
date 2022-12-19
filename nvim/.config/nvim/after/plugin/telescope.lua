local builtin = require('telescope.builtin')
local wk = require("which-key")


wk.register({
  ["<leader>f"] = {
    name = "find",
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    p = { "<cmd>Telescope git_files<cr>", "Find Proj File (git)" },
	s = { function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end, "Search" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
    w = { "<cmd>Telescope grep_string<cr>", "Grep String under cursor" },
    b = { "<cmd>Telescope buffers<cr>", "Search open buffer names" },
    h = { "<cmd>Telescope help_tags<cr>", "Search in help tags" },
    d = { "<cmd>Telescope diagnostics<cr>", "Search in diagnostics" },
  },

  ["<leader><leader>"] = {
	  name = "system",
	x = { "<cmd>Telescope commands<cr>", "Search commands" },
	h = { "<cmd>Telescope command_history<cr>", "Search COMMAND history" },
	s = { "<cmd>Telescope search_history<cr>", "Search SEARCH history" },
	t = { "<cmd>Telescope help_tags<cr>", "Search help_tags" },
	m = { "<cmd>Telescope marks<cr>", "Search marks" },
	c = { "<cmd>Telescope colorscheme<cr>", "Search colorscheme" },
	q = { "<cmd>Telescope quickfix<cr>", "Search quickfix" },
	k = { "<cmd>Telescope keymaps<cr>", "Search keymaps" },
  }
})

wk.register({
  ["<leader>g"] = {
    name = "git",
    b = { "<cmd>Telescope git_branches<cr>", "Branches" },
    r = { "<cmd>Telescope git_bcommits<cr>", "Commits for Current Buffer" },
    s = { "<cmd>Telescope git_status<cr>", "Git status" },
    P = { "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk" },
    S = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
    U = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo Stage Hunk" },
    p = { "<cmd>Gitsigns prev_hunk<cr>", "Previous Hunk" },
    n = { "<cmd>Gitsigns next_hunk<cr>", "Next Hunk" },
    g = { "<cmd>Git<cr>", "Fugitive" },
  }
})


require('telescope').setup {
	defaults = {
		mappings = {
			n = {
				["cd"] = function(prompt_bufnr)
					print('hello find_files')
					local selection = require("telescope.actions.state").get_selected_entry()
					local dir = vim.fn.fnamemodify(selection.path, ":p:h")
					require("telescope.actions").close(prompt_bufnr)
					-- Depending on what you want put `cd`, `lcd`, `tcd`
					vim.cmd(string.format("silent lcd %s", dir))
				end
			}
		}
	}
}

require('telescope').load_extension('emoji')
