return {
  'akinsho/bufferline.nvim', version = "*",
  dependencies = {"nvim-tree/nvim-web-devicons"},

  opts = {
    options = {
      mode = "tabs",
      separator_style = "slant",
      show_close_icon = false,
      disagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				if context.buffer:current() then
					return ''
				end
				if level:match('error') then
					return ' ' .. vim.g.diagnostic_icons.Error
				elseif level:match('warning') then
					return ' ' .. vim.g.diagnostic_icons.Warning
				end
				return ''
			end,
			custom_filter = function(buf_number, buf_numbers)
				if vim.bo[buf_number].filetype ~= 'oil' then
					return true
				end
			end,
    },
  },
}
