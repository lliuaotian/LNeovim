-- 使当前窗口快速最大化且可以恢复

return {
  "szw/vim-maximizer",

  keys = {
    { "<leader>wm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
  },
}
