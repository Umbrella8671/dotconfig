return {
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
    -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    opts = {} 
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
    cmd = {},
    keys = {
      { "<leader>t", "<cmd>NvimTreeToggle<cr>" }
    }
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  { 
    'akinsho/bufferline.nvim',
    lazy = false,
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    cmd = {
      'BufferLineCyclePrev',
      'BufferLineCycleNext'
    },
    keys = {
      { "<C-[>", "<cmd>BufferLineCyclePrev<CR>" },
      { "<C-]>", "<cmd>BufferLineCycleNext<CR>" },
    },
    config = function()
      vim.opt.termguicolors = true
      require("bufferline").setup {
        options = {
          -- 使用 nvim 内置lsp
          diagnostics = "nvim_lsp",
          -- 左侧让出 nvim-tree 的位置
          offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
          }}
        }
      }
    end
  },
  {
    -- code highlighting
    "nvim-treesitter/nvim-treesitter",
    branch = 'master', 
    lazy = false,
    build = ":TSUpdate",
  },
-- --------------------lsp----------------------------------
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = true,
    opts = {},
    dependencies = {
        {
          "mason-org/mason.nvim",
          keys = {
            { "<leader>m", "<cmd>Mason<cr>" }
          },
          config = function()
            require("mason").setup({
--              ui = {
--                icons = {
--                  package_installed = "✓",
--                  package_pending = "➜",
--                  package_uninstalled = "✗"
--                }
--              }
            })
            require("mason-lspconfig").setup({
              -- 确保安装，根据需要填写
              ensure_installed = {
                "lua_ls",
              },
            })
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            require("lspconfig").lua_ls.setup {
              capabilities = capabilities,
            }
          end
        },
        "neovim/nvim-lspconfig",
    },
  },
  -- ----------------------------自动补全---------------------------
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp_status_ok, cmp = pcall(require, "cmp")
      if not cmp_status_ok then
        return
      end
      local snip_status_ok, luasnip = pcall(require, "luasnip")
      if not snip_status_ok then
        return
      end
      require("luasnip.loaders.from_vscode").lazy_load()
      -- 下面会用到这个函数
      local check_backspace = function()
        local col = vim.fn.col "." - 1
        return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
      end
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-e>'] = cmp.mapping.abort(),  -- 取消补全，esc也可以退出
          ['<CR>'] = cmp.mapping.confirm({ select = true }),

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expandable() then
              luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif check_backspace() then
              fallback()
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
        }),
        -- 这里重要, 添加更多的自动补全插件
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        }, {
          { name = 'buffer' },
        })
      })
    end
  },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-path' },
  {
  	"L3MON4D3/LuaSnip",
	  -- follow latest release.
	  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	  -- install jsregexp (optional!).
	  build = "make install_jsregexp"
  },
  { 'saadparwaiz1/cmp_luasnip' },
  { "rafamadriz/friendly-snippets" },
-- 注释与括号配对
  { 'numToStr/Comment.nvim', opts = {}, },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
      local npairs_ok, npairs = pcall(require, "nvim-autopairs")
      if not npairs_ok then
        return
      end
      npairs.setup {
        check_ts = true,
        ts_config = {
          lua = { "string", "source" },
          javascript = { "string", "template_string" },
        },
        fast_wrap = {
          map = '<M-e>',
          chars = { '{', '[', '(', '"', "'" },
          pattern = [=[[%'%"%)%>%]%)%}%,]]=],
          end_key = '$',
          keys = 'qwertyuiopzxcvbnmasdfghjkl',
          check_comma = true,
          highlight = 'Search',
          highlight_grey='Comment'
        },
      }
      -- 配置这个使得自动补全会把括号带上
      local cmp_autopairs = require "nvim-autopairs.completion.cmp"
      local cmp_status_ok, cmp = pcall(require, "cmp")
      if not cmp_status_ok then
        return
      end
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
    end
  },
  
  { 'lewis6991/gitsigns.nvim', opts = {}, },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    end
  }
}
