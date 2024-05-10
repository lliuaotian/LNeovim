-- 禁用掉netrw
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- 禁用掉netrw后 nvim .会进入一个.文件，我怎么想办法，也没办法在VimEnter事件的时候直接NvimTreeOpen 目录，很难受
vim.g.mapleader = " "


require("liuaotian.lazy")
require("liuaotian.core")
