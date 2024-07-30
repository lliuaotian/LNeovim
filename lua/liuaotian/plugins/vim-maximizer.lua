-- 使当前窗口快速最大化且可以恢复
-- BUG: 我发现你把当前窗口放到最大后，保存文件就不能恢复到原来的窗口了，所以在保存文件前要恢复原来的窗口
-- BUG: 也就是先恢复窗口在保存内容要养成这个习惯

return {
  "szw/vim-maximizer",

  keys = {
    { "<leader>wm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
  },
}
