return {
  'nvimdev/dashboard-nvim',
	-- 告诉nvim 打开vim时直接加载
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      -- config
      -- 可以设置头部，闲了在搞吧
      -- config = { header = {} }
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
