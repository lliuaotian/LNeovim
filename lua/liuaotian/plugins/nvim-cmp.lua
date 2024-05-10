return {
  -- 需要安装的全部插件如下
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
  },
  -- settings
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")
    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()
    -- 这一段应该是不需要，先注释掉，不影响使用后删除
    -- cmp.setup.cmdline(':', {
    --   mapping = cmp.mapping.preset.cmdline(),
    --   sources = cmp.config.sources({
    --     -- { name = 'path' }
    --   }, {
    --         { name = 'cmdline' }
    --     }),
    --   matching = { disallow_symbol_nonprefix_matching = false }
    -- })

    local compare = require("cmp.config.compare")
    local source_mapping = {
      buffer = "[Buffer]",
      nvim_lsp = "[LSP]",
      nvim_lua = "[Lua]",
      cmp_tabnine = "[AI]",
      path = "[Path]",
    }
    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
        -- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      -- max_item_count设置的是对应的匹配条目输出的最大数量
      sources = cmp.config.sources({
        { name = "nvim_lsp", max_item_count = 5},
        { name = "luasnip", max_item_count = 5 }, -- snippets
        { name = "buffer", max_item_count = 3}, -- text within current buffer
        { name = "path", max_item_count = 2}, -- file system paths
        { name = "cmp-nvim-lua" },
        { name = "cmp_tabnine", max_item_count = 3},
      }),
      -- configure lspkind for vs-code like pictograms in completion menu
      -- formatting = {
      --   format = lspkind.cmp_format({
      --     mode = 'symbol',
      --     maxwidth = 50,
      --     ellipsis_char = "...",
      --   }),
      --   
      -- },
      -- 设置cmp

      -- formatting = {
      --   format = function(entry, vim_item)
      --     vim_item.kind = lspkind.presets.default[vim_item.kind]
      --     local menu = source_mapping[entry.source.name]
      --     if entry.source.name == "cmp_tabnine" then
      --       if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
      --         menu = entry.completion_item.data.detail
      --       end
      --       vim_item.kind = "󰀂"
      --     end
      --     vim_item.menu = menu
      --
      --     return vim_item
      --   end
      -- },
      -- 输出样式
			formatting = {
				format = function(entry, vim_item)
					-- if you have lspkind installed, you can use it like
					-- in the following line:
					vim_item.kind = lspkind.symbolic(vim_item.kind, {mode = "symbol"})
					vim_item.menu = source_mapping[entry.source.name]
					if entry.source.name == "cmp_tabnine" then
						local detail = (entry.completion_item.labelDetails or {}).detail
						vim_item.kind = ""
						if detail and detail:find('.*%%.*') then
							vim_item.kind = vim_item.kind .. ' ' .. detail
						end
						if (entry.completion_item.data or {}).multiline then
							vim_item.kind = vim_item.kind .. ' ' .. '[ML]'
						end
					end
					local maxwidth = 80
					vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
					return vim_item
				end,
			},
      -- set lsp show bg
      -- vim.api.nvim_set_hl(0, 'Pmenu', {bg=none}),
      -- vim.api.nvim_set_hl(0, 'CmpItemAbbr', {bg=none}),
      -- vim.api.nvim_set_hl(0, )
      -- 排序，哪个提示靠前哪个靠后
      sorting = {
        priority_weight = 2,
        comparators = {
          require('cmp_tabnine.compare'),
          compare.offset,
          compare.exact,
          compare.score,
          compare.recently_used,
          compare.kind,
          compare.sort_text,
          compare.length,
          compare.order,
        },
      },
    })
  end,
}
