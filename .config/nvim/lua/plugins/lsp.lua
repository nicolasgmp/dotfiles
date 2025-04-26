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
        "ktlint",
      })
    end,
  },

  -- -- ts tools
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },

  {
    "nvim-java/nvim-java",
    config = false,
    dependencies = {
      {
        "neovim/nvim-lspconfig",
        opts = {
          servers = {
            jdtls = {
              format = {
                insertSpaces = true,
                tabSize = 4,
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
        kotlin_language_server = {},
        cssls = {},
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
        { "<leader>jm", ":!mvn spring-boot:run<CR>", desc = "Run Maven SB" },
        { "<leader>jg", ":./gradlew bootRun", desc = "Run Gradle SB" },
        { "<leader>jc", ":w<CR>:!javac % && java %:r<CR>", desc = "Run Main Class" },
        { "<leader>jt", ":JavaTestRunCurrentClass<CR>", desc = "Run Tests" },
        { "<leader>cg", LazyVim.lsp.action["source.generate"], desc = "Generate" },
        { "<leader>cA", LazyVim.lsp.action["source.generate.accessors"], desc = "Generate Accessors" },
        { "<leader>cq", LazyVim.lsp.action["quickassist"], desc = "Assist" },
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = { kotlin = { "ktlint" } },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.formatting.ktlint,
        nls.builtins.diagnostics.ktlint,
      })
    end,
  },
}
