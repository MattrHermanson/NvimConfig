return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  lazy = true,
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>cF",
      function()
        require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
      end,
      mode = { "n", "v" },
      desc = "Format Injected Langs",
    },
  },
  init = function()
    -- Install the conform formatter on VeryLazy
    LazyVim.on_very_lazy(function()
      LazyVim.format.register({
        name = "conform.nvim",
        priority = 100,
        primary = true,
        format = function(buf)
          require("conform").format({ bufnr = buf })
        end,
        sources = function(buf)
          local ret = require("conform").list_formatters(buf)
          ---@param v conform.FormatterInfo
          return vim.tbl_map(function(v)
            return v.name
          end, ret)
        end,
      })
    end)
  end,
  opts = function()
    ---@type conform.setupOpts
    local opts = {
      default_format_opts = {
        timeout_ms = 3000,
        async = false,
        quiet = false,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        -- Chain the custom formatter to run AFTER stylua
        lua = { "stylua", "double_line_functions" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
      },
      ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
      formatters = {
        injected = { options = { ignore_errors = true } },

        double_line_functions = {
          format = function()
            -- 1. Get the lines from the buffer using the bufnr from the context object.
            -- At this point, `stylua` has already run and modified the buffer.
            local lines = vim.api.nvim_buf_get_lines(vim.api.nvim_get_current_buf(), 0, -1, false)
            local content = table.concat(lines, "\n")

            -- 2. Apply the replacement logic.
            -- This finds `end` followed by one blank line and then `function`,
            -- and replaces it with two blank lines.
            local new_content = content:gsub("(end\n)\n(function)", "%1\n\n%2")

            -- 3. Return the newly modified lines.
            vim.split(new_content, "\n")
          end,
        },
      },
    }
    return opts
  end,
}
