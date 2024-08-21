return {
  "lliuaotian/compile.nvim",

  config = function()
    local compile = require("compile")

    -- Set keymap
    local keymap = vim.keymap
    keymap.set("n", "<leader>cb", function ()
      compile.compile()
    end, { desc = "Build Current Project" })
    -- 请注意这个run不编译程序，所以将快捷键设置为start吧，意为启动程序
    keymap.set("n", "<leader>cs", function ()
      compile.run()
    end, { desc = "Only Run Current Project " })
    -- 这个设置为run，运行程序的时候要编译
    keymap.set("n", "<leader>cr", function ()
      compile.compile_and_run()
    end, { desc = "Compile and Run Current Project" })

    compile.setup()
  end

}
