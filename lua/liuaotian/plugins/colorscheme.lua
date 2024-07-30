return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,

  config = function()
    require("catppuccin").setup({
      transparent_background = true, 
    })
    -- load colorscheme
    vim.cmd.colorscheme "catppuccin-frappe"
  end
}

