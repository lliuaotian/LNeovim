return {
  'nvim-telescope/telescope.nvim', tag = '0.1.6',
  dependencies = { 'nvim-lua/plenary.nvim',
    "folke/todo-comments.nvim",
    "folke/which-key.nvim"
  },

  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Telescope Find filename" })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Telescope Find File For 'string'" })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Telescope Find Buffer" })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Telescope Find Help Txt" })
    vim.keymap.set('n', '<leader>ft', "<cmd>TodoTelescope<CR>", { desc = "Telescope Find TODO" })

    local wk = require("which-key")

    wk.add({
      { "<leader>f", group = "Telescope by file" },
    })

  end
}
