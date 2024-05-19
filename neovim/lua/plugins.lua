local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "nordtheme/vim",
    config = function()
      vim.cmd.colorscheme('nord')
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "c", "lua", "vim", "vimdoc", "query",
          "rust", "go",
          "typescript", "javascript", "json", "yaml",
          "java", "sql",
          "python", "markdown"
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@function.inner",
              ["as"] = "@scope",
            }
          },
          selection_modes = {
            ["@parameter.outer"] = "v",
            ["@function.outer"] = "V",
            ["@class.outer"] = "<c-v>",
          },
          include_surrounding_whitespace = true,
        },
        auto_install = true,

        highlight = {
          enable = true
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  "nvim-treesitter/nvim-treesitter-context",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    ft = { 'rust' },
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        config = {
          week_header = {
            enable = true, --boolean use a week header
          },
        }

      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  },
  {
    "cuducos/yaml.nvim",
    ft = { "yaml" }, -- optional
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
    },
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      local rainbow_delimiters = require('rainbow-delimiters')
      require('rainbow-delimiters.setup').setup {
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          vim = rainbow_delimiters.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
        },
        priority = {
          [''] = 110,
          lua = 210,
        },
        highlight = {
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },
      }
    end
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp"
      }
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end
        },
        window = {},
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<TAB>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'buffer' },
        })
      })

      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
        }, {
          { name = 'buffer' },
        })
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
      })
    end
  },
  {
    "neoclide/coc.nvim"
  },
  -- init.lua:
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      -- disable netrw at the very start of your init.lua
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- optionally enable 24-bit colour
      vim.opt.termguicolors = true

      -- empty setup using defaults
      require("nvim-tree").setup {
        update_focused_file = { enable = true }

      }
      local api = require "nvim-tree.api"
      vim.keymap.set('n', '<C-n>', api.tree.toggle)
    end

  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },
  "tpope/vim-repeat",

  {
    'smoka7/hop.nvim',
    config = function()
      local hop = require('hop')
      hop.setup { keys = 'etovxqpdygfblzhckisuran' }
      -- place this in one of your configuration file(s)
      local directions = require('hop.hint').HintDirection
      vim.keymap.set('', 'f', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
      end, { remap = true })
      vim.keymap.set('', 'F', function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
      end, { remap = true })
      vim.keymap.set('', 't', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
      end, { remap = true })
      vim.keymap.set('', 'T', function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
      end, { remap = true })
    end
  },
  {
    "NTBBloodbath/galaxyline.nvim",
    -- your statusline
    config = function()
      require("galaxyline.themes.eviline")
    end,
    -- some optional icons
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
  "mfussenegger/nvim-dap"
  ,
  "leoluz/nvim-dap-go",
  "theHamsta/nvim-dap-virtual-text",
  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
  {
    "kevinhwang91/nvim-fundo",
    config = function()
      require("fundo").install()
      vim.o.undofile = true
    end,
  },
  -- markdown inline-renderer
  {"ellisonleao/glow.nvim", config = true, cmd = "Glow"},
  {
  "aznhe21/actions-preview.nvim",
  config = function()
    vim.keymap.set({ "v", "n" }, "<C-CR>", require("actions-preview").code_actions)
  end,
}
})



require('lsp')
