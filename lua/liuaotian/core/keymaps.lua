-- set leader
local keymap = vim.keymap
vim.g.mapleader = " "
-- 我发现我配置了bufferline但没有使用，这里更改为使用bufferline插件
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tq", "<cmd>tabclose<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tmn", "<cmd>BufferLineMoveNext<CR>", { desc = "Move next tab" })
keymap.set("n", "<leader>tmp", "<cmd>BufferLineMovePrev<CR>", { desc = "Move prev tab" })
keymap.set("n", "<leader>tpo", "<cmd>BufferLinePick<CR>", { desc = "Pick Buffer tab open" })
keymap.set("n", "<leader>tpc", "<cmd>BufferLinePickClose<CR>", { desc = "Pick Buffer tab close" })
keymap.set("n", "<leader>tse", "<cmd>BufferLineSortByExtension<CR>", { desc = "Sort by extension name" })
keymap.set("n", "<leader>tsd", "<cmd>BufferLineSortByDirectory<CR>", { desc = "Sort by directory name" })
keymap.set("n", "<leader>t", "", { desc = "BufferLine tab" })
keymap.set("n", "<leader>tm", "", { desc = "BufferLine move tab" })
keymap.set("n", "<leader>tp", "", { desc = "BufferLine pick tab" })
keymap.set("n", "<leader>ts", "", { desc = "BufferLine sort tab" })


-- 这是我比较喜欢的，连按jj或kk退出编辑模式
keymap.set("i", "jj", "<ESC>", { desc = "Quick quit insert mode" })
keymap.set("i", "kk", "<ESC>", { desc = "Quick quit insert mode" })

-- 直接leader加数字切换到不同的页面
keymap.set("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", { desc = "Go to 1 tab"})
keymap.set("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", { desc = "Go to 2 tab"})
keymap.set("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", { desc = "Go to 3 tab"})
keymap.set("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>", { desc = "Go to 4 tab"})
keymap.set("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>", { desc = "Go to 5 tab"})
keymap.set("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<CR>", { desc = "Go to 6 tab"})
keymap.set("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<CR>", { desc = "Go to 7 tab"})
keymap.set("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<CR>", { desc = "Go to 8 tab"})
keymap.set("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<CR>", { desc = "Go to 9 tab"})

-- setting window split
keymap.set("n", "<leader>wv", "<cmd>vsplit<CR>", { desc = "Vsplit window right"})
keymap.set("n", "<leader>ws", "<cmd>split<CR>", { desc = "Split window right"})
keymap.set("n", "<leader>w", " ", { desc = "Split Window"})
