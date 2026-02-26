return {
  "ibhagwan/fzf-lua",
  opts = function(_, opts)
    local actions = require("fzf-lua.actions")
    -- Ensure the tables exist
    opts.files = opts.files or {}
    opts.files.actions = opts.files.actions or {}
    opts.grep = opts.grep or {}
    opts.grep.actions = opts.grep.actions or {}
    -- Explicitly map ctrl-g to toggle git ignored files for both file search and live grep
    opts.files.actions["ctrl-g"] = { actions.toggle_ignore }
    opts.grep.actions["ctrl-g"] = { actions.toggle_ignore }
  end,
}
