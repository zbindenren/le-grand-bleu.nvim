local config = {
  groups = {
    background    = 'white',
    panel         = 'blue4',
    border        = 'blue3',
    comment       = 'blue3',
    link          = 'blue2',
    punctuation   = 'blue0',
    text          = 'blue0',

    error         = 'rose0',
    hint          = 'black2',
    info          = 'blue2',
    warn          = 'yellow0',

    git_add       = 'green0',
    git_add_bg    = 'green4',
    git_change    = 'blue0',
    git_change_bg = 'blue4',
    git_delete    = 'rose0',
    git_delete_bg = 'rose4',
    git_dirty     = 'black2',
    git_ignore    = 'black2',
    git_merge     = 'black2',
    git_rename    = 'green2',
    git_stage     = 'green2',
    git_text      = 'blue0',

    dark_blue     = 'blue0',
    blue          = 'blue2',
    light_blue    = 'blue4',

    black         = 'black0',
    grey          = 'black2',
    light_grey    = 'black4',

    dark_rose     = 'rose0',
    rose          = 'rose2',
    light_rose    = 'rose4',

    dark_green    = 'green0',
    green         = 'green2',
    light_green   = 'green4',

    dark_yellow   = 'yellow0',
    yellow        = 'yellow2',
    light_yellow  = 'yellow4',

    headings      = {
      h1 = 'blue0',
      h2 = 'blue1',
      h3 = 'blue2',
      h4 = 'black2',
      h5 = 'black3',
      h6 = 'black4',
    },
  },
  highlight_groups = {},
}

local M = {}

local utils = require('le-grand-bleu.utils')

function M.colorscheme()
  if vim.g.colors_name then
    vim.cmd 'hi clear'
  end

  vim.opt.termguicolors = true
  vim.g.colors_name = 'le-grand-bleu'


  local theme = require('le-grand-bleu.theme').get(config)

  -- Set theme highlights
  for group, color in pairs(theme) do
    -- Skip highlight group if user overrides
    if config.highlight_groups[group] == nil then
      utils.highlight(group, color)
    end
  end
end

function M.setup(opts)
  opts = opts or {}
  -- vim.g.le-grand-bleu_variant = opts.dark_variant or 'main'

  if opts.groups and type(opts.groups.headings) == 'string' then
    opts.groups.headings = {
      h1 = opts.groups.headings,
      h2 = opts.groups.headings,
      h3 = opts.groups.headings,
      h4 = opts.groups.headings,
      h5 = opts.groups.headings,
      h6 = opts.groups.headings,
    }
  end

  config.user_variant = opts.dark_variant or nil
  config = vim.tbl_deep_extend('force', config, opts)
end

return M
