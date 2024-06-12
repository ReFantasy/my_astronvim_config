return {
  {
    "AstroNvim/astrocore",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- 关闭已有映射
          ["<Leader>fm"] = false,
          ["<Leader>c"] = false,
          gra = false,
          grn = false,
          grr = false,
        },
      },
      config = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--all-scopes-completion",
            "--completion-style=detailed",
            "--j=8",
            "--pch-storage=memory",
          },
          capabilities = {
            offsetEncoding = "utf-8",
          },
        },
      },
    },
  },

  -- LSP 映射
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- 关闭已有映射
          -- ["<Leader>lf"] = false,

          -- 定义新的映射
          K = {
            function() vim.lsp.buf.hover() end,
            desc = "Hover symbol details",
          },
          ["<Leader>fm"] = {
            function() vim.lsp.buf.format { async = true } end,
            desc = "[C] Format code",
          },
          ["<Leader>ca"] = {
            function() vim.lsp.buf.code_action() end,
            desc = "[C] Code action",
          },
          ["<Leader>rn"] = {
            function() vim.lsp.buf.rename() end,
            desc = "[C] Rename",
          },
          gr = {
            -- function() vim.api.nvim_command('Lspsaga finder') end,
            function() vim.lsp.buf.references() end,
            desc = "[C] References",
          },
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@param opts AstroLSPOpts
    opts = function(_, opts)
      opts.mappings.n.gd[1] = function() vim.api.nvim_command "Lspsaga goto_definition" end
      opts.mappings.n.gI[1] = function() require("telescope.builtin").lsp_implementations { reuse_win = true } end
      opts.mappings.n.gr[1] = function() require("telescope.builtin").lsp_references() end
      opts.mappings.n.gy[1] = function() require("telescope.builtin").lsp_type_definitions { reuse_win = true } end
      opts.mappings.n["<Leader>lG"][1] = function()
        vim.ui.input({ prompt = "Symbol Query: (leave empty for word under cursor)" }, function(query)
          if query then
            -- word under cursor if given query is empty
            if query == "" then query = vim.fn.expand "<cword>" end
            require("telescope.builtin").lsp_workspace_symbols {
              query = query,
              prompt_title = ("Find word (%s)"):format(query),
            }
          end
        end)
      end
      opts.mappings.n["<Leader>lR"][1] = function() require("telescope.builtin").lsp_references() end
    end,
  },
}
