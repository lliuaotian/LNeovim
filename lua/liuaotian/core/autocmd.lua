-- 自动命令 如果nvim打开的是目录直接调用nvimtree打开它
-- vim.api.nvim_create_user_command('Test', function() end, 
-- autocmd VimEnter * if vim.fn.isdirectory(vim.fn.expand('%:p')) | NvimTreeOpen . vim.fn.expand('%:p') | endif
--


-- vim.keymap.set("n", "aaa", "<cmd>lua print('HelloWorld!')", { desc = "Quick quit insert mode" })
-- 如果最后只剩下NvimTree的时候自动关闭
vim.cmd [[ autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif ]]



-- 打开nvim .的时候还是会进入nvimtree，这样让他进入的时候直接到NvimTree
-- function NetrwToNvimtree() 
--   vim.api.nvim_command('NvimTreeOpen ' .. vim.fn.expand("%:p"))
-- end
-- 
-- vim.api.nvim_create_autocmd("BufEnter", {
--   once = true,
--   callback = function()
--     NetrwToNvimtree()
--   end,
-- })

