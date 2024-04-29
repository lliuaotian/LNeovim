-- set leader
local keymap = vim.keymap
vim.g.mapleader = " "

-- 这是我比较喜欢的，连按jj或kk退出编辑模式
keymap.set("i", "jj", "<ESC>", { desc = "Quick quit insert mode" })
keymap.set("i", "kk", "<ESC>", { desc = "Quick quit insert mode" })

-- to打开新tab，tq退出当前tab tn下一个tab tp上一个tab
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tq", "<cmd>tabclose<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Open new tab" })
