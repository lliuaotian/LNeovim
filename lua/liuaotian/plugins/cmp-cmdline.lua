return {
  "hrsh7th/cmp-cmdline",
  config = function ()
    local cmp = require("cmp")
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline({
        ["<CR>"] = {
          c = cmp.mapping.confirm( {select = false } ),
        },
      }),
      sources = cmp.config.sources({
        {name = "path", max_item_count = 5},
        {name = "cmdline", max_item_count = 5},
      })
    })
  end,
}
