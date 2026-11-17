return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      -- 1. Setup the options
      require("gruvbox").setup({
        contrast = "soft",
        transparent_mode = true,
      })
      -- 2. Force Neovim to apply it immediately
      vim.cmd("colorscheme gruvbox")
    end,
  },
  -- Keep the LazyVim spec for UI consistency
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
