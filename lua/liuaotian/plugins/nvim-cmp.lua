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
    local compare = require("cmp.config.compare")

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
        -- 因为这个c-space在很多系统中是切换输入法 故更换为C-f
        ["<C-f>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),

      }),
      -- max_item_count设置的是对应的匹配条目输出的最大数量
      sources = cmp.config.sources({
        { name = "nvim_lsp", max_item_count = 2, priority_weight = 2},
        { name = "luasnip", max_item_count = 2, priority_weight = 2}, -- snippets
        { name = "buffer", max_item_count = 2, priority_weight = 1}, -- text within current buffer
        { name = "path", max_item_count = 2, priority_weight = 3}, -- file system paths
        { name = "cmp-nvim-lua" },
        { name = "fittencode", max_item_count = 3, priority_weight = 2},
      }),
      -- 输出样式
			formatting = {
       format = lspkind.cmp_format({
          mode = "symbol",
          max_width = 30,
          symbol_map = { FittenCode = "" }
        })
			},
     -- 排序，哪个提示靠前哪个靠后
      sorting = {
        priority_weight = 2,
        comparators = {
          compare.exact,
          compare.sort_text,
          compare.recently_used,
          compare.offset,
          compare.score,
          compare.kind,
          compare.order,
          compare.length,
        },
      },
    })
  end,
}
