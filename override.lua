return {
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      opts.section.header.val = {
        "███████ ███████    ██    ██████  ██    ██",
      }
    end,
  },
  -- customize cmp mappings
  {
    "hrsh7th/nvim-cmp",
    -- override the options table that is used
    -- in the `require("cmp").setup()` call
    opts = function(_, opts)
      require("luasnip/loaders/from_vscode").lazy_load()
      local cmp = require "cmp"
      opts.mapping["<C-x>"] = cmp.mapping.select_next_item()
      opts.mapping["<CR>"] = cmp.mapping.confirm { select = true }
    end,
  },
  -- customize treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- list like portions of a table cannot be merged naturally and require the user to merge it manually
      -- check to make sure the key exists
      if not opts.ensure_installed then opts.ensure_installed = {} end
      vim.list_extend(opts.ensure_installed, {
        "lua",
        "vim",
        "python",
        "cpp",
        "vimdoc",
      })
    end,
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      formatting = {
        format_on_save = false, -- enable or disable automatic formatting on save
      },
    },
  },
  -- 添加自动安装的 lsp and formatter 列表
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts) opts.ensure_installed = { "pylsp", "clangd", "cmake" } end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts) opts.ensure_installed = { "black", "clang-format" } end,
  },
}
