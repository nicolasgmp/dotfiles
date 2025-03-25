return {
  -- Notificações e UI de comandos
  {
    "folke/noice.nvim",
    require("noice").setup({
      routes = {
        {
          filter = {
            event = "lsp",
            kind = "progress",
            find = "jdtls",
          },
          opts = { skip = true },
        },
      },
      views = {
        cmdline_popup = {
          border = {
            style = "none",
            padding = { 1, 2 },
          },
          filter_options = {},
          win_options = {
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          },
        },
      },
    }),
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })

      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })

      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = "notify_send",
        opts = { stop = false },
      })

      opts.commands = {
        all = {
          view = "split",
          opts = { enter = true, format = "details" },
        },
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })

      opts.presets.lsp_doc_border = true
    end,
  },

  {
    "rcarriga/nvim-notify",
    opts = { timeout = 3000, render = "compact", stages = "fade_in_slide_out", fps = 60, top_down = false },
  },

  -- Bufferline (gerenciamento de abas)
  {
    "akinsho/bufferline.nvim",
    dependencies = { "echasnovski/mini.icons" },
    config = function()
      require("bufferline").setup({
        options = {
          numbers = "ordinal",
          tab_size = 16,
        },
      })
    end,
  },

  -- Exibição de nome de arquivo no topo da tela
  {
    "b0o/incline.nvim",
    dependencies = { "craftzdog/solarized-osaka.nvim", "rebelot/kanagawa.nvim" },
    event = "BufReadPre",
    priority = 1200,
    opts = function()
      local colors = require("kanagawa.colors").setup()
      local palette = colors.palette
      local theme = colors.theme
      return {
        highlight = {
          groups = {
            InclineNormal = { guibg = palette.sumiInk0, guifg = theme.syn.fun },
            InclineNormalNC = { guifg = theme.syn.fun, guibg = palette.sumiInk0 },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = { cursorline = true },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end

          local icon, color = require("mini.icons").get("file", filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      }
    end,
  },

  -- Statusline (barra de status)
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local LazyVim = require("lazyvim.util")
      opts.sections.lualine_c[4] = {
        LazyVim.lualine.pretty_path({
          length = 0,
          relative = "cwd",
          modified_hl = "MatchParen",
          directory_hl = "",
          filename_hl = "Bold",
          modified_sign = "",
          readonly_icon = " ¾░î¥ ",
        }),
      }
    end,
  },

  -- Modo Zen
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },

  -- Desativa o scroll automático do snacks.nvim
  {
    "snacks.nvim",
    opts = { scroll = { enabled = false } },
    keys = {},
  },

  -- icons
}
