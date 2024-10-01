local M = {}

-- colors
local c = {
  background = '#ffffff',
  primary = '#03045E',
  -- noir_0 = '#03045E',
  noir_1 = '#1D1E6F',
  noir_2 = '#373981',
  noir_3 = '#515392',
  noir_4 = '#6B6EA4',
  noir_5 = '#8588B5',
  noir_6 = '#9FA3C7',
  noir_7 = '#B9BDD8',
  noir_8 = '#D3D8EA',
  noir_9 = '#EDF2FB',
  error = '#CE4257',
  warning = '#ffac81',
  info = '#B9BDD8',
  hint = '#B9BDD8',
  diff_add = '#40916C',
  diff_change = '#B9BDD8',
  diff_delete = '#CE4257',
}

local theme = {
  ColorColumn = { bg = c.noir_9, fg = c.primary },
  CursorLine = { bg = c.noir_9 },
  Normal = { bg = c.background, fg = c.primary },
  DiagnosticError = { fg = c.error },
  DiagnosticWarn = { fg = c.warning },
  DiagnosticInfo = { fg = c.info },
  DiagnosticHint = { fg = c.hint },
  DiagnosticSignError = { fg = c.error },
  DiagnosticSignWarn = { fg = c.warning },
  DiagnosticSignInfo = { fg = c.info },
  DiagnosticSignHint = { fg = c.hint },
  DiffAdd = { fg = c.diff_add },
  DiffChange = { fg = c.diff_change },
  DiffDelete = { fg = c.diff_delete },
  DiffText = { fg = c.noir_9 },
  ErrorMsg = { fg = c.error },
  WarningMsg = { fg = c.warning },
}

function M.colorscheme()
  if vim.g.colors_name then
    vim.cmd('hi clear')
  end

  vim.g.colors_name = 'le-grand-bleu'
  for group, style in pairs(theme) do
    vim.api.nvim_set_hl(0, group, style)
  end
end

return M
