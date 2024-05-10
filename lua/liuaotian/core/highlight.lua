-- 在这个文件中完成所有窗口的颜色设置
-- 设置cmp 自动补全窗口的颜色
vim.api.nvim_set_hl(0, 'Pmenu', {bg=none})
vim.api.nvim_set_hl(0, 'NormalFloat', {bg=none})
-- 设置NvimTree 背景颜色
vim.api.nvim_set_hl(0, 'NvimTreeNormal', {bg=none})
-- 打开NvimTree背景色会显示透明，但我切换到其他文件，这个文件浏览器还显示的时候就不是透明的了
vim.api.nvim_set_hl(0, "NvimTreeNormalNC", {bg=none})
