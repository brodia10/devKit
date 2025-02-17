---[[
--[[
lvim is the global options object
Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]

-- General
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.transparent_window = false


-- Theme
lvim.colorscheme = "onedarkpro"
require("onedarkpro").load()
-- to load onedark
vim.o.background = "dark"

-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- lvim.bultin.project.datapath = "/Users/brook/code/"
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
-- lvim.builtin.nvimtree.show_icons.git =  L
lvim.builtin.nvimtree.setup.git.enable = true
-- if you don't want all the parsers change this to a table of the ones you want
----------------------------
-- Treesitter
----------------------------
lvim.builtin.treesitter = {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
  },
  context_commentstring = {
    enable = true
  },
  autotag = {
    enable = true
  },
}
-- Lua Line Config
-- lvim.builtin.lualine.style = "default"
lvim.builtin.lualine.inactive_sections = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = { 'filename' },
  lualine_x = { 'filetype' },
  lualine_y = {},
  lualine_z = {}
}
lvim.builtin.lualine.sections.lualine_a = { "filename", }
lvim.builtin.lualine.sections.lualine_b = { "branch", "diagnostics", "python_env" }
-- lvim.builtin.lualine.sections.lualine_c = { "python_env" }
lvim.builtin.lualine.sections.lualine_x = { "location", "progress" }
lvim.builtin.lualine.sections.lualine_y = { "diff", "filetype" }
lvim.builtin.lualine.sections.lualine_z = { "mode" }
lvim.builtin.lualine.options = {
  icons_enabled = true,
  theme = 'auto',
  component_separators = { left = '', right = '' },
  section_separators = { left = '', right = '' },
  disabled_filetypes = {},
  --   always_divide_middle = true,
  -- globalstatus = true,
  path = 1
}

-- Additional Plugins
lvim.plugins = {
  { 'olimorris/onedarkpro.nvim' },
  { 'martinsione/darkplus.nvim' },
  { 'lukas-reineke/indent-blankline.nvim' },
  { 'kdheepak/lazygit.nvim' },
  -- { 'mg979/vim-visual-multi' },
  { "ray-x/lsp_signature.nvim" },
  { 'folke/lsp-colors.nvim' },
  {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  { "ellisonleao/glow.nvim", branch = 'main' },
  {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  },
  -- { "iamcco/markdown-preview.nvim", run = "cd app && npm install",
  --   setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, },
  { 'christoomey/vim-tmux-navigator' },
  { "AckslD/nvim-neoclip.lua",
    requires = {
      { 'kkharji/sqlite.lua', module = 'sqlite' },
      -- you'll need at least one of these
      -- {'nvim-telescope/telescope.nvim'},
      -- {'ibhagwan/fzf-lua'},
    },
    config = function()
      require('neoclip').setup()
    end,
  },
  { 'cljoly/telescope-repo.nvim' },
  { 'preservim/tagbar' }
  -- {
  --   'dhruvmanila/telescope-bookmarks.nvim',
  --   -- Uncomment if the selected browser is Firefox
  --   requires = {
  --     'tami5/sqlite.lua',
  --   }
  -- },

}

lvim.builtin.telescope.extensions.repo = {
  list = {
    fd_opts = {
      "--no-ignore-vcs",
    },
    search_dirs = {
      "~/code",
    },
  },
}

vim.cmd([[
  "Add blank line above the current line without exiting normal mode"
  "leader + O"
  nnoremap <leader>o o<Esc>0"_D
  
  "Add blank line below current line without exiting normal mode
  nnoremap <leader>O O<Esc>0"_D
  
  "Glow Markdown Preview - leader + p + p
  noremap <leader>- :MarkdownPreview<CR>"

   "Telescop Git Repos
  noremap <leader>k :Telescope repo list<CR>"

  noremap <leader>m :TagbarToggle<CR>"
  
 " "Telescop Bookmakrks
  " noremap <leader>si :Telescope bookmarks<CR>"

  " Tlelscope neoclip"
  noremap <leader>j :Telescope neoclip<CR>"
  "Nvim-transparent- leader + t
  " noremap <leader>m :TransparentToggle<CR>"
  
  "Soft wrap text
  set wrap 

  
]])

vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append("space: ")

require("indent_blankline").setup {
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6",
  },
}
-- Persist Terminal
vim.o.hidden = true

-- LSP, Linting and Formatting
-------------------------------------
-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  { command = "isort", filetypes = { "python" } },
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettier",
    --........arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--print-with", "100" },
    -- -speci.............fy which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "typescriptreact", "tsx", "html", "css", "jsx", "javascript" },
  },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } },
  {
    -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "shellcheck",
    -- -argum.............ents to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--severity", "warning" },
  },
  {
    command = "codespell",
    -- -speci.............fy which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "javascript", "python" },
  },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.json", "*.jsonc" },
  -- enable wrap mode for json files only
  command = "setlocal wrap",
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    -- let treesitter use bash highlight for zsh files as well
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})


local onedarkpro = require("onedarkpro")
onedarkpro.options = {
  bold = true, -- Use the themes opinionated bold styles?
  italic = true, -- Use the themes opinionated italic styles?
  undercurl = true, -- Use the themes opinionated undercurl styles?
  cursorline = true, -- Use cursorline highlighting?
  transparency = true, -- Use a transparent background?
  terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
  window_unfocussed_color = true
}


-- lvim.builtin.telescope.extensions.bookmarks = {
--   -- Available: 'brave', 'buku', 'chrome', 'chrome_beta', 'edge', 'safari', 'firefox', 'vivaldi'
--   selected_browser = 'firefox',

--   -- Either provide a shell command to open the URL
--   url_open_command = 'open',

--   -- Or provide the plugin name which is already installed
--   -- Available: 'vim_external', 'open_browser'
--   url_open_plugin = nil,

--   -- Show the full path to the bookmark instead of just the bookmark name
--   full_path = true,

--   -- Provide a custom profile name for Firefox
--   firefox_profile_name = 'default-release',
-- }

-- require('telescope').extensions.bookmarks.bookmarks(
--   require('telescope.themes').get_dropdown {
--     layout_config = {
--       width = 0.8,
--       height = 0.8,
--     },
--     previewer = false,
--   }
-- )


-- Telescope Extensions and other stuff do after config()
lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "repo")
  pcall(telescope.load_extension, "neoclip")
  -- any other extensions loading
end
