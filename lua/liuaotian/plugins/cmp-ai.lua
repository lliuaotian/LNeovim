return {

  'luozhiya/fittencode.nvim',
  config = function()
    local keymap = vim.keymap
    -- translate test
    keymap.set("v", "<leader>tc", ":<C-u>Fitten translate_text_into_chinese<CR>", { silent = true, noremap = true, desc = "Translate selected text to chinese"})
    keymap.set("v", "<leader>te", ":<C-u>Fitten translate_text_into_english<CR>", { silent = true, noremap = true, desc = "Translate selected text to english"})
    keymap.set("v", "<leader>t", "", { desc = "Translate English or Chinese"})
    require('fittencode').setup {
      completion_mode = 'source',
    }
  end
}
