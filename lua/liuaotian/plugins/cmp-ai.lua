return{
  "tzachar/cmp-tabnine",
  build = "./install.sh",

  dependencies = "hrsh7th/nvim-cmp",

  config = function ()
    local tabnine = require("cmp_tabnine.config")
    -- local source_mapping = {
    --   buffer = "[Buffer]",
    --   nvim_lsp = "[LSP]",
    --   nvim_lua = "[Lua]",
    --   cmp_tabnine = "[AI]",
    --   path = "[Path]",
    -- }
    -- local lspkind = require("lspkind")

    tabnine:setup({
			max_lines = 1000,
      -- 返回的结果，我觉得十个就够了
			max_num_results = 20,
			sort = true,
      -- 每次输入产生新的内容 这是肯定的了
			run_on_every_keystroke = true,
			ignored_file_types = {
        -- 如果lua = true就忽略lua文件的cmp-ai
				-- lua = true
			},
			show_prediction_strength = false,
      -- 最小百分比，提示的代码是有概率的，百分之多少会是以下代码，这个值设置好之后低于这个值就不会提示了
			min_percent = 0,
      snippet_placeholder = "..",
      -- 设置cmp
      -- format = function(entry, vim_item)
      --   vim_item.kind = lspkind.presets.default[vim_item.kind]
      --   local menu = source_mapping[entry.source.name]
      --   if entry.source.name == "cmp_tabnine" then
      --     if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
      --       menu = entry.completion_item.data.detail
      --     end
      --     vim_item.kind = "󰀂"
      --   end
      --   vim_item.menu = menu
      --
      --   return vim_item
      -- end
    })
  end
}
