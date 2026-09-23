return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            pyright = {
              disableOrganizeImports = true,
            },
          },
        },
        ruff = {
          init_options = {
            settings = {
              lint = {
                enable = false,
              },
            },
          },
        },
      },
    },
  },
}
