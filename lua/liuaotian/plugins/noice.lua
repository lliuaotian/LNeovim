return {
  "folke/noice.nvim",
  event = "VeryLazy",

  dependencies = {
    -- 需要的基础库
    "MunifTanjim/nui.nvim",

    "rcarriga/nvim-notify",
  },


  config = function()
    -- 添加对Telescope的支持
    vim.keymap.set('n', '<leader>fn', "<cmd>Telescope noice<CR>", { desc = "Telescope Find Noice Message" })

    require("noice").setup({
      cmdline = {
        format = {
          cmdline = { kind = "Liuaotian" },
        }
      },
			views = {
				cmdline_popup = {
					position = {
						row = 5,
						col = "50%",
					},
					size = {
						width = 60,
						height = "auto",
					},
				},
				-- popupmenu = {
				-- 	relative = "editor",
				-- 	position = {
				-- 		row = 8,
				-- 		col = "50%",
				-- 	},
				-- 	size = {
				-- 		width = 60,
				-- 		height = 10,
				-- 	},
				-- 	border = {
				-- 		style = "rounded",
				-- 		padding = { 0, 1 },
				-- 	},
				-- 	win_options = {
				-- 		winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
				-- 	},
				-- },
			},
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = false, -- use a classic bottom cmdline for search
				command_palette = false, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
		})
  end
}
