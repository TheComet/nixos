vim.keymap.set({"n","v","i"}, "<A-h>", "<CMD>TmuxNavigateLeft<CR>")
vim.keymap.set({"n","v","i"}, "<A-l>", "<CMD>TmuxNavigateRight<CR>")
vim.keymap.set({"n","v","i"}, "<A-k>", "<CMD>TmuxNavigateUp<CR>")
vim.keymap.set({"n","v","i"}, "<A-j>", "<CMD>TmuxNavigateDown<CR>")
vim.g.tmux_navigator_no_mappings = 1
