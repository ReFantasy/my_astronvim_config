return {
  {
    "nvimdev/lspsaga.nvim",
    config = function() 
        require("lspsaga").setup ({
        -- right_width = 1.0,
        finder = {
          layout = 'float',
          max_height = 0.7,
        }
      })
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
  },
}
