local wk = require("which-key")

vim.cmd.colorscheme("nightfly")
wk.add({
  { "<leader>pc", "<CMD>Telescope colorscheme<CR>", desc = "Change colorscheme", mode = "n" },
})
