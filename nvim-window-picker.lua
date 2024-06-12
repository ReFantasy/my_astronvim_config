return {
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    version = "2.*",
    config = function()
      require("window-picker").setup {
        filter_rules = {
          -- whether you want to include the window you are currently on to window
          -- selection or not
          include_current_win = true,

          -- filter using buffer options
          bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { "NvimTree", "neo-tree", "notify" },

            -- if the file type is one of following, the window will be ignored
            buftype = { "terminal" },
          },
        },
      }

      -- 选择窗口函数
      local pick_win = function()
        local window_number = require("window-picker").pick_window()
        if window_number then vim.api.nvim_set_current_win(window_number) end
      end

      vim.keymap.set("n", "<leader>pw", pick_win, { desc = "[C] Pick Window" })
    end,
  },
}
