return {
  -- tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        "shfmt",
        "tailwindcss-language-server",
        "css-lsp",
      })
    end,
  },

  -- ts tools
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
    config = function()
      require("typescript-tools").setup({
        server = {
          cmd = { "typescript-language-server", "--stdio" },
        },
      })
    end,
  },

  -- nvim-java
  {
    "nvim-java/nvim-java",
    config = false,
    dependencies = {
      {
        "neovim/nvim-lspconfig",
        opts = {
          servers = {
            jdtls = {
              settings = {
                java = {
                  format = {
                    settings = {
                      indent_size = 4,
                      useTabs = false,
                    },
                  },
                },
              },
            },
          },
          setup = {
            jdtls = function()
              require("java").setup({})
            end,
          },
        },
      },
    },
  },

  -- lsp servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      ---@type lspconfig.options
      servers = {
        cssls = {},
        tailwindcss = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
        },
        html = {},
        yamlls = {
          settings = {
            yaml = {
              keyOrdering = false,
            },
          },
        },
        lua_ls = {
          single_file_support = true,
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                workspaceWord = true,
                callSnippet = "Both",
              },
              misc = {
                parameters = {},
              },
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
              },
              doc = {
                privateName = { "^_" },
              },
              type = {
                castNumberToInteger = true,
              },
              diagnostics = {
                disable = { "incomplete-signature-doc", "trailing-space" },
                groupSeverity = {
                  strong = "Warning",
                  strict = "Warning",
                },
                groupFileStatus = {
                  ["ambiguity"] = "Opened",
                  ["await"] = "Opened",
                  ["codestyle"] = "None",
                  ["duplicate"] = "Opened",
                  ["global"] = "Opened",
                  ["luadoc"] = "Opened",
                  ["redefined"] = "Opened",
                  ["strict"] = "Opened",
                  ["strong"] = "Opened",
                  ["type-check"] = "Opened",
                  ["unbalanced"] = "Opened",
                  ["unused"] = "Opened",
                },
                unusedLocalExclude = { "_*" },
              },
              format = {
                enable = false,
                defaultConfig = {
                  indent_style = "space",
                  indent_size = "2",
                  continuation_indent_size = "2",
                },
              },
            },
          },
        },
      },
      setup = {},
    },
  },

  -- keymaps setup for LSP actions
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      vim.list_extend(keys, {
        {
          "gd",
          function()
            -- DO NOT REUSE WINDOW
            require("telescope.builtin").lsp_definitions({ reuse_win = false })
          end,
          desc = "Goto Definition",
          has = "definition",
        },

        --common to most languages
        {
          "<leader>co",
          function()
            local filetype = vim.bo.filetype
            if filetype == "typescript" or filetype == "javascript" or filetype == "typescriptreact" then
              vim.cmd(":TSToolsOrganizeImports")
              return
            end
            LazyVim.lsp.action["source.organizeImports"]()
          end,
          desc = "Organize Imports",
        },
        {
          "<leader>cM",
          function()
            local filetype = vim.bo.filetype
            if filetype == "typescript" or filetype == "javascript" or filetype == "typescriptreact" then
              vim.cmd(":TSToolsAddMissingImports")
              return
            end
            LazyVim.lsp.action["source.addMissingImports"]()
          end,
          desc = "Add missing imports",
        },
        {
          "<leader>cu",
          function()
            local filetype = vim.bo.filetype
            if filetype == "typescript" or filetype == "javascript" or filetype == "typescriptreact" then
              vim.cmd(":TSToolsRemoveUnusedImports")
              return
            end
            LazyVim.lsp.action["source.removeUnused"]()
          end,
          desc = "Organize Imports",
        },

        -- java
        { "<leader>js", ":!mvn spring-boot:run<CR>", desc = "Run Spring Boot Project" },
        { "<leader>jt", ":JavaTestRunCurrentClass<CR>", desc = "Run Tests" },
        { "<leader>jg", LazyVim.lsp.action["source.generate"], desc = "Generate" },
        { "<leader>jA", LazyVim.lsp.action["source.generate.accessors"], desc = "Generate Accessors" },
        { "<leader>jq", LazyVim.lsp.action["quickassist"], desc = "Assist" },
      })
    end,
  },
}
