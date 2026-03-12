return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        -- Overrides the default behavior of these keys
        ["<CR>"] = { "fallback" },
        ["<Tab>"] = { "fallback" },
        ["<S-Tab>"] = { "fallback" },

        -- C-y, C-p, and C-n are already mapped perfectly in the default preset,
        -- but you can explicitly define C-y here just in case:
        ["<C-y>"] = { "select_and_accept" },
      },
    },
  },
}
