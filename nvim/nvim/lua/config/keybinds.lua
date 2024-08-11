local opts = { noremap = true, silent = true }
local keymap = vim.keymap

-----------------------------------------------------------------------
----------                TELESCOPE KEYMAPS                  ----------
-----------------------------------------------------------------------
local builtin = require("telescope.builtin")
keymap.set("n", "<leader>ff", builtin.find_files, opts)
keymap.set("n", "<leader>fg", builtin.live_grep, opts)
keymap.set("n", "<leader>fb", builtin.buffers, opts)
keymap.set("n", "<leader>fh", builtin.help_tags, opts)

-----------------------------------------------------------------------
----------                SPLIT VIEW KEYMAPS                 ----------
-----------------------------------------------------------------------
keymap.set("n", "<leader>]", "<cmd>vsplit<CR>")
keymap.set("n", "<leader>[", "<cmd>split<CR>")

keymap.set("n", "<C-h>", "<C-w><C-h>", opts)
keymap.set("n", "<C-l>", "<C-w><C-l>", opts)
keymap.set("n", "<C-j>", "<C-w><C-j>", opts)
keymap.set("n", "<C-k>", "<C-w><C-k>", opts)

keymap.set("n", "<C-left>", ":vertical resize -2<CR>", opts)
keymap.set("n", "<C-right>", ":vertical resize +2<CR>", opts)
keymap.set("n", "<C-up>", ":resize +2<CR>", opts)
keymap.set("n", "<C-down>", ":resize -2<CR>", opts)

-----------------------------------------------------------------------
----------                  FILES KEYMAPS                    ----------
-----------------------------------------------------------------------
keymap.set("n", "<C-s>", ":w<CR>", opts)
keymap.set("n", "<leader>qq", ":q!<CR>", opts)

keymap.set({ "n", "v" }, "<leader>y", '"+y', opts)
keymap.set({ "n", "v" }, "<leader>c", '"+c', opts)
keymap.set({ "n", "v" }, "<leader>p", '"_p', opts)
keymap.set({ "n", "v" }, "<leader>d", '"_d', opts)
keymap.set({ "v", "x" }, "p", '"_dP', opts)

-----------------------------------------------------------------------
----------                  TERMINAL KEYMAPS                 ----------
-----------------------------------------------------------------------
keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)

-----------------------------------------------------------------------
----------                 BUFFER KEYMAPS                    ----------
-----------------------------------------------------------------------
keymap.set("n", "<S-h>", ":bprevious<CR>", opts)
keymap.set("n", "<S-l>", ":bnext<CR>", opts)
keymap.set("n", "<leader>bd", ":bdelete<CR>", opts)

-----------------------------------------------------------------------
----------                   TABS KEYMAPS                    ----------
-----------------------------------------------------------------------
keymap.set("n", "<leader>tn", ":tabnew<CR>", opts)
keymap.set("n", "<leader>tc", ":tabclose<CR>", opts)
keymap.set("n", "<A-,>", ":tabprevious<CR>", opts)
keymap.set("n", "<A-.>", ":tabnext<CR>", opts)

-----------------------------------------------------------------------
----------              PACKAGE MANAGER KEYMAPS              ----------
-----------------------------------------------------------------------
keymap.set("n", "<leader>M", ":Mason<CR>", opts)
keymap.set("n", "<leader>L", ":Lazy<CR>", opts)

-----------------------------------------------------------------------
----------                 GITSIGNS KEYMAPS                  ----------
-----------------------------------------------------------------------
keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", opts)
