return {
  {
    "nvim-mini/mini.map",
    event = "VeryLazy",
    dependencies = { "vague-theme/vague.nvim" },
    config = function()
      -- Define 'minimap' by requiring the module
      local minimap = require("mini.map") -- [!code focus]

      -- Now you can use the 'minimap' variable
      minimap.setup({
        -- Highlight integrations (none by default)
        integrations = nil,

        -- Symbols used to display data
        symbols = {
          -- This line now works!
          encode = minimap.gen_encode_symbols.dot("2x1"),

          -- Scrollbar parts for view and line. Use empty string to disable any.
          scroll_line = "█",
          scroll_view = "┃",
        },

        -- Window options
        window = {
          focusable = false,
          side = "right",
          show_integration_count = true,
          width = 10,
          winblend = 25,
          zindex = 10,
        },
      })
    end,
  },
}
