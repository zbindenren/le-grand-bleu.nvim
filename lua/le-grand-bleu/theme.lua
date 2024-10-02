local blend = require('le-grand-bleu.utils').blend

local M = {}

function M.get(config)
  local p = require('le-grand-bleu.palette')

  local theme = {}
  local g = config.groups or {}
  local styles = {
    -- italic = (config.disable_italics and p.none) or 'italic',
    vert_split = g.light_blue,
    background = p.white,
    float_background = g.light_blue,
  }
  styles.nc_background = styles.background

  theme = {
    ColorColumn = { bg = g.blue },
    Conceal = { bg = p.none },
    CurSearch = { link = 'IncSearch' },
    Cursor = { fg = g.text, bg = g.light_blue },
    CursorColumn = { bg = g.light_blue },
    CursorLine = { bg = g.light_blue },
    CursorLineNr = { fg = g.text },
    DarkenedPanel = { bg = g.panel },
    DarkenedStatusline = { bg = g.panel },
    DiffAdd = { bg = blend(g.git_add, g.background, 0.5) },
    DiffChange = { bg = blend(g.git_change, g.background, 0.5) },
    DiffDelete = { bg = blend(g.git_delete, g.background, 0.5) },
    DiffText = { bg = blend(g.git_text, g.background, 0.5) },
    diffAdded = { link = 'DiffAdd' },
    diffChanged = { link = 'DiffChange' },
    diffRemoved = { link = 'DiffDelete' },
    Directory = { fg = g.blue, bg = p.none },
    ErrorMsg = { fg = g.dark_rose, style = 'bold' },
    FloatBorder = { fg = g.border },
    FloatTitle = { fg = g.blue },
    FoldColumn = { fg = g.blue },
    Folded = { fg = g.text, bg = g.panel },
    IncSearch = { fg = g.text, bg = g.light_blue },
    LineNr = { fg = g.blue },
    MatchParen = { fg = p.white, bg = p.black2 },
    ModeMsg = { fg = p.blue3 },
    MoreMsg = { fg = p.blue3 },
    NonText = { fg = p.blue4 },
    Normal = { fg = g.text, bg = styles.background },
    NormalFloat = { fg = g.text, bg = styles.float_background },
    NormalNC = { fg = g.text, bg = styles.nc_background },
    NvimInternalError = { fg = p.white, bg = g.dark_rose },
    Pmenu = { fg = g.text, bg = styles.float_background },
    PmenuSbar = { bg = styles.float_background },
    PmenuSel = { fg = g.text, bg = g.light_blue },
    PmenuThumb = { bg = g.blue },
    Question = { fg = g.dark_yellow },
    -- QuickFixLine = {},
    -- RedrawDebugNormal = {}
    RedrawDebugClear = { fg = p.white, bg = g.dark_rose },
    RedrawDebugComposed = { fg = p.white, bg = g.black },
    RedrawDebugRecompose = { fg = p.white, bg = g.black },
    Search = { fg = p.white, bg = g.blue },
    SpecialKey = { fg = g.green },
    SpellBad = { sp = g.dark_rose, style = 'undercurl' },
    SpellCap = { sp = g.blue, style = 'undercurl' },
    SpellLocal = { sp = g.yellow, style = 'undercurl' },
    SpellRare = { sp = g.blue, style = 'undercurl' },
    SignColumn = { fg = g.text, bg = p.none },
    StatusLine = { fg = g.blue, bg = styles.float_background },
    StatusLineNC = { fg = g.blue, bg = styles.background },
    StatusLineTerm = { link = 'StatusLine' },
    StatusLineTermNC = { link = 'StatusLineNC' },
    TabLine = { fg = g.blue, bg = styles.float_background },
    TabLineFill = { bg = styles.float_background },
    TabLineSel = { fg = g.text, bg = g.light_blue },
    Title = { fg = g.text },
    VertSplit = { fg = g.border, bg = styles.vert_split },
    Visual = { fg = p.white, bg = g.blue },
    WarningMsg = { fg = g.dark_yellow },
    Whitespace = { fg = g.blue },
    WildMenu = { link = 'IncSearch' },

    ---

    Constant = { fg = g.text, style = 'bold' }, -- (preferred) any constant
    String = { fg = g.text },                   --   a string constant: "this is a string"
    Character = { fg = g.text },                --  a character constant: 'c', '\n'
    Number = { fg = g.text },                   --   a number constant: 234, 0xff
    Boolean = { fg = g.text },                  --  a boolean constant: TRUE, false
    Float = { fg = g.text },                    --    a floating point constant: 2.3e10

    Identifier = { fg = g.text },               -- (preferred) any variable name
    Function = { link = 'Constant' },           -- function name (also: methods for classes)

    Statement = { fg = g.text },                -- (preferred) any statement
    Conditional = { link = 'Constant' },        --  if, then, else, endif, switch, etc.
    Repeat = { link = 'Constant' },             --   for, do, while, etc.
    Label = { fg = p.text },                    --    case, default, etc.
    Operator = { link = 'Constant' },           -- "sizeof", "+", "*", etc.
    Keyword = { link = 'Constant' },            --  any other keyword
    Exception = { link = 'Constant' },          --  try, catch, throw

    PreProc = { fg = g.text },                  -- (preferred) generic Preprocessor
    Include = { fg = g.text },                  --  preprocessor #include

    Type = { link = 'Constant' },               -- (preferred) int, long, char, etc.

    Special = { fg = g.text },                  -- (preferred) any special symbol
    Tag = { fg = g.text },                      --    you can use CTRL-] on this
    Delimiter = { fg = g.blueGray1 },           --  character that needs attention
    Comment = { fg = g.blue },                  -- (preferred) any special symbol

    SpecialComment = { link = 'Comment' },      -- special things inside a comment


    Underlined = { style = 'underline' }, -- (preferred) text that stands out, HTML links
    Bold = { style = 'bold' },
    Italic = { style = 'italic' },

    Error = { fg = g.dark_rose }, -- (preferred) any erroneous construct
    --
    --   qfLineNr = { fg = p.blueGray3 },
    --   qfFileName = { fg = p.blueGray2 },
    --
    --   htmlH1 = { fg = p.teal1, style = 'bold' },
    --   htmlH2 = { fg = p.teal1, style = 'bold' },
    --
    --   -- mkdHeading = { fg = c.orange, style = "bold" },
    --   -- mkdCode = { bg = c.terminal_black, fg = c.fg },
    --   mkdCodeDelimiter = { bg = p.background3, fg = p.text },
    --   mkdCodeStart = { fg = p.teal2, style = 'bold' },
    --   mkdCodeEnd = { fg = p.teal2, style = 'bold' },
    --   mkdLink = { fg = p.blue1, style = 'underline' },
    --
    --   markdownHeadingDelimiter = { fg = p.blue4, style = 'bold' },
    --   markdownCode = { fg = p.blueGray1 },
    --   markdownCodeBlock = { fg = p.teal2 },
    --   markdownH1 = { fg = p.blue2, style = 'bold' },
    --   markdownH2 = { fg = p.blue2, style = 'bold' },
    --   markdownH3 = { fg = p.blue2, style = 'bold' },
    --   markdownH4 = { fg = p.blue2, style = 'bold' },
    --   markdownLinkText = { fg = p.blue1, style = 'underline' },
    --
    --   debugPC = { bg = p.background1 },                       -- used for highlighting the current line in terminal-debug
    --   debugBreakpoint = { bg = p.background2, fg = p.pink3 }, -- used for breakpoint colors in terminal-debug
    --   DiagnosticError = { fg = g.error },
    --   DiagnosticHint = { fg = g.hint },
    --   DiagnosticInfo = { fg = g.info },
    --   DiagnosticWarn = { fg = g.warn },
    --   DiagnosticDefaultError = { fg = g.error },
    --   DiagnosticDefaultHint = { fg = g.hint },
    --   DiagnosticDefaultInfo = { fg = g.info },
    --   DiagnosticDefaultWarn = { fg = g.warn },
    --   DiagnosticFloatingError = { fg = g.error },
    --   DiagnosticFloatingHint = { fg = g.hint },
    --   DiagnosticFloatingInfo = { fg = g.info },
    --   DiagnosticFloatingWarn = { fg = g.warn },
    --   DiagnosticSignError = { fg = g.error },
    --   DiagnosticSignHint = { fg = g.hint },
    --   DiagnosticSignInfo = { fg = g.info },
    --   DiagnosticSignWarn = { fg = g.warn },
    --   DiagnosticStatusLineError = { fg = g.error, bg = groups.panel },
    --   DiagnosticStatusLineHint = { fg = g.hint, bg = groups.panel },
    --   DiagnosticStatusLineInfo = { fg = g.info, bg = groups.panel },
    --   DiagnosticStatusLineWarn = { fg = g.warn, bg = groups.panel },
    --   DiagnosticUnderlineError = { sp = g.error, style = 'undercurl' },
    --   DiagnosticUnderlineHint = { sp = g.hint, style = 'undercurl' },
    --   DiagnosticUnderlineInfo = { sp = g.info, style = 'undercurl' },
    --   DiagnosticUnderlineWarn = { sp = g.warn, style = 'undercurl' },
    --   DiagnosticVirtualTextError = { fg = g.error },
    --   DiagnosticVirtualTextHint = { fg = g.hint },
    --   DiagnosticVirtualTextInfo = { fg = g.info },
    --   DiagnosticVirtualTextWarn = { fg = g.warn },
    --
    --   -- Treesitter
    --   ['@variable'] = { fg = p.text },
    --   -- TSAttribute = {},
    --   -- TSKeywordReturn = { fg = p.teal2 },
    --   ['@boolean'] = { link = 'Boolean' },
    --   -- TSCharacter = { link = 'Character' },
    --   ['@comment'] = { link = 'Comment' },
    --   -- TSConditional = { link = 'Conditional' },
    --   ['@variable.builtin'] = { fg = p.blue2 },
    --   ['@constant.builtin'] = { fg = p.blue2 },
    --   ['@constant.falsy'] = { fg = p.pink3 },
    --   -- TSConstMacro = {},
    --   -- TSConstant = { fg = p.text },
    --   ['@constructor'] = { fg = p.teal1 },
    --   -- TSEmphasis = {},
    --   -- TSError = {},
    --   -- TSException = {},
    --   ['field'] = { fg = p.text },
    --   -- TSFloat = {},
    --   ['@function.builtin'] = { fg = p.blue2 },
    --   -- TSFuncMacro = {},
    --   ['@function'] = { link = 'Function' },
    --   ['@function.call'] = { fg = p.blueGray1 },
    --   TSInclude = { fg = p.blue2 },
    --   ['@keyword'] = { link = 'Keyword' },
    --   ['@keyword.return'] = { fg = p.teal2 },
    --   ['@keyword.function'] = { fg = p.blue2 },
    --   ['@keyword.operator'] = { fg = p.teal1 },
    --   ['@label'] = { fg = p.blue3 },
    --   -- TSLiteral = {},
    --   ['@method'] = { fg = p.teal1 },
    --   -- TSNamespace = {},
    --   -- TSNone = {},
    --   -- TSNumber = { link = 'Number' },
    --   ['@operator'] = { link = 'Operator' },
    --   ['@parameter'] = { fg = p.text },
    --   -- TSParameterReference = {},
    --   ['@property'] = { fg = p.blue2 },
    --   ['@punctuation.delimiter'] = { fg = g.punctuation },
    --   ['@punctuation.special'] = { fg = g.punctuation },
    --   ['@punctuation.bracket'] = { fg = p.text },
    --   -- TSRepeat = {},
    --   -- TSStrike = {},
    --   ['@string'] = { link = 'String' },
    --   ['@string.escape'] = { fg = p.pink3 },
    --   -- TSStringRegex = {},
    --   -- TSStringSpecial = { fg = p.teal1 },
    --   -- TSSymbol = {},
    --   ['@tag'] = { fg = p.teal1 },
    --   ['@tag.delimiter'] = { fg = p.text },
    --   ['@tag.attribute'] = { fg = p.blue3, style = styles.italic },
    --   ['@text'] = { fg = p.text },
    --   ['@title'] = { fg = g.headings.h1, style = 'bold' },
    --   ['@type'] = { link = 'Type' },
    --   ['@type.builtin'] = { link = 'Type' },
    --   TSURI = { fg = g.link },
    --   -- TSUnderline = {},
    --
    --   -- tsx
    --   ['@keyword.export.tsx'] = { fg = p.teal1 },
    --   ['@keyword.import.tsx'] = { fg = p.teal1 },
    --   ['@import.identifier.tsx'] = { fg = p.blue2 },
    --
    --   -- typescript
    --   ['@keyword.export.typescript'] = { fg = p.teal1 },
    --   ['@keyword.import.typescript'] = { fg = p.teal1 },
    --   ['@import.identifier.typescript'] = { fg = p.blue2 },
    --   typescriptVariable = { fg = p.blue2 },
    --   typescriptExport = { fg = p.teal1 },
    --   typescriptDefault = { fg = p.teal1 },
    --   typescriptConstraint = { fg = p.teal1 },
    --   typescriptBlock = { fg = p.text },
    --   typescriptIdentifierName = { fg = p.blueGray2 },
    --   typescriptTSInclude = { fg = p.teal1 },
    --   typescriptCastKeyword = { fg = p.blueGray2 },
    --   typescriptEnum = { fg = p.blue4 },
    --   typescriptTypeCast = { fg = p.blueGray2 },
    --   typescriptParenExp = { fg = p.blueGray2 },
    --   typescriptObjectType = { fg = p.blueGray1 },
    --
    --   -- lua
    --   luaTSConstructor = { fg = p.blueGray1 },
    --
    --   -- css
    --   cssTSFunction = { fg = p.blueGray1 },
    --   cssTSProperty = { fg = p.blue2 },
    --   cssTSType = { fg = p.teal1 },
    --   cssTSKeyword = { fg = p.blueGray1 },
    --   cssClassName = { fg = p.teal2, style = styles.italic },
    --   cssPseudoClass = { fg = p.blue3, style = styles.italic },
    --   cssDefinition = { fg = p.blue2 },
    --   cssTSError = { link = 'cssClassName' },
    --
    --   -- vim.lsp.buf.document_highlight()
    --   LspReferenceText = { bg = p.blue2 },
    --   LspReferenceRead = { bg = p.blue2 },
    --   LspReferenceWrite = { bg = p.blue2 },
    --
    --   -- lsp-highlight-codelens
    --   LspCodeLens = { fg = p.blueGray1 },          -- virtual text of code lens
    --   LspCodeLensSeparator = { fg = p.blueGray3 }, -- separator between two or more code lens
    --
    --   -- nvim-ts-rainbow
    --   rainbowcol1 = { fg = p.blue1 },
    --   rainbowcol2 = { fg = p.teal1 },
    --   rainbowcol3 = { fg = p.yellow },
    --   rainbowcol4 = { fg = p.blue2 },
    --   rainbowcol5 = { fg = p.teal2 },
    --   rainbowcol6 = { fg = p.pink3 },
    --   rainbowcol7 = { fg = p.blue3 },
    --
    --   -- romgrk/barbar.nvim
    --   BufferCurrent = { fg = p.text, bg = p.background2 },
    --   BufferCurrentIndex = { fg = p.text, bg = p.background2 },
    --   BufferCurrentMod = { fg = p.teal1, bg = p.background2 },
    --   BufferCurrentSign = { fg = p.blueGray1, bg = p.background2 },
    --   BufferCurrentTarget = { fg = p.yellow, bg = p.background2 },
    --   BufferInactive = { fg = p.blueGray1 },
    --   BufferInactiveIndex = { fg = p.blueGray1 },
    --   BufferInactiveMod = { fg = p.teal1 },
    --   BufferInactiveSign = { fg = p.blueGray2 },
    --   BufferInactiveTarget = { fg = p.yellow },
    --   BufferTabpageFill = { fg = g.background, bg = groups.background },
    --   BufferVisible = { fg = p.blueGray1 },
    --   BufferVisibleIndex = { fg = p.blueGray1 },
    --   BufferVisibleMod = { fg = p.teal1 },
    --   BufferVisibleSign = { fg = p.blueGray2 },
    --   BufferVisibleTarget = { fg = p.yellow },
    --
    --   -- lewis6991/gitsigns.nvim
    --   GitSignsAdd = { fg = g.git_add },
    --   GitSignsChange = { fg = g.git_change },
    --   GitSignsDelete = { fg = g.git_delete },
    --   SignAdd = { link = 'GitSignsAdd' },
    --   SignChange = { link = 'GitSignsChange' },
    --   SignDelete = { link = 'GitSignsDelete' },
    --
    --   -- mvllow/modes.nvim
    --   ModesCopy = { bg = p.yellow },
    --   ModesDelete = { bg = p.pink3 },
    --   ModesInsert = { bg = p.teal1 },
    --   ModesVisual = { bg = p.yellow },
    --
    --   -- kyazdani42/nvim-tree.lua
    --   NvimTreeEmptyFolderName = { fg = p.blueGray3 },
    --   NvimTreeFileDeleted = { fg = p.pink3 },
    --   NvimTreeFileDirty = { fg = p.blue4 },
    --   NvimTreeFileMerge = { fg = p.blue2 },
    --   NvimTreeFileNew = { fg = p.teal1 },
    --   NvimTreeFileRenamed = { fg = p.blueGray3 },
    --   NvimTreeFileStaged = { fg = p.blue1 },
    --   NvimTreeFolderIcon = { fg = p.blue3 },
    --   NvimTreeFolderName = { fg = p.blue3 },
    --   NvimTreeGitDeleted = { fg = g.git_delete },
    --   NvimTreeGitDirty = { fg = g.git_dirty },
    --   NvimTreeGitIgnored = { fg = g.git_ignore },
    --   NvimTreeGitMerge = { fg = g.git_merge },
    --   NvimTreeGitNew = { fg = g.git_add },
    --   NvimTreeGitRenamed = { fg = g.git_rename },
    --   NvimTreeGitStaged = { fg = g.git_stage },
    --   NvimTreeImageFile = { fg = p.text },
    --   NvimTreeNormal = { fg = p.text },
    --   NvimTreeOpenedFile = { fg = p.text, bg = p.background1 },
    --   NvimTreeOpenedFolderName = { link = 'NvimTreeFolderName' },
    --   NvimTreeRootFolder = { fg = p.teal1 },
    --   NvimTreeSpecialFile = { link = 'NvimTreeNormal' },
    --   NvimTreeWindowPicker = { fg = g.bg, bg = p.blueGray1 },
    --
    --   -- folke/which-key.nvim
    --   WhichKey = { fg = p.text },
    --   WhichKeyGroup = { fg = p.text },
    --   WhichKeySeparator = { fg = p.text },
    --   WhichKeyDesc = { fg = p.text },
    --   WhichKeyFloat = { bg = g.panel },
    --   WhichKeyValue = { fg = p.text },
    --
    --   -- luka-reineke/indent-blankline.nvim
    --   IndentBlanklineChar = { fg = p.background1 },
    --   IndentBlanklineContextChar = { fg = p.yellow, gui = 'nocombine' },
    --   IndentBlanklineContextStart = { fg = p.yellow, gui = 'underline' },
    --   IndentBlanklineSpaceChar = { link = 'Whitespace' },
    --   IndentBlanklineSpaceCharBlankline = { link = 'Whitespace' },
    --
    --   -- hrsh7th/nvim-cmp
    --   CmpItemAbbr = { fg = p.blueGray2 },
    --   CmpItemAbbrDeprecated = { fg = p.pink3, style = 'strikethrough' },
    --   CmpItemAbbrMatch = { fg = p.text, style = 'bold' },
    --   CmpItemAbbrMatchFuzzy = { fg = p.teal1, style = 'bold' },
    --   CmpItemKind = { fg = p.blue3 },
    --   CmpItemKindClass = { fg = p.yellow },
    --   CmpItemKindFunction = { fg = p.blue1 },
    --   CmpItemKindInterface = { fg = p.blue2 },
    --   CmpItemKindMethod = { fg = p.pink3 },
    --   CmpItemKindSnippet = { fg = p.blueGray1 },
    --   CmpItemKindVariable = { fg = p.teal1 },
    --
    --   -- ray-x/lsp_signature.nvim
    --   LspSignatureActiveParameter = { bg = p.blueGray1 },
    --
    --   -- rlane/pounce.nvim
    --   PounceAccept = { fg = p.pink3, bg = p.text },
    --   PounceAcceptBest = { fg = p.text, bg = p.text },
    --   PounceGap = { link = 'Search' },
    --   PounceMatch = { link = 'Search' },
    --
    --   -- nvim-telescope/telescope.nvim
    --   TelescopeMatching = { fg = p.teal1 },
    --   TelescopeNormal = { fg = p.text },
    --   TelescopeSelection = { fg = p.text, bg = p.background1 },
    --   TelescopeTitle = { fg = p.blueGray2 },
    --   TelescopeBorder = { fg = p.background1 },
    --   TelescopePromptBorder = { fg = p.background1 },
    --   TelescopePromptNormal = { fg = p.text },
    --   TelescopePromptPrefix = { fg = p.blueGray2 },
    --   TelescopePreviewTitle = { fg = p.background2, bg = p.teal1 },
    --   TelescopePromptTitle = { fg = p.background2, bg = p.blue1 },
    --   TelescopeResultsDiffAdd = { fg = p.teal1 },
    --   TelescopeResultsDiffChange = { fg = p.yellow },
    --   TelescopeResultsDiffDelete = { fg = p.pink3 },
    --
    --   -- phaazon/hop.nvim
    --   HopNextKey = { fg = p.blue1 },
    --   HopNextKey1 = { fg = p.teal1 },
    --   HopNextKey2 = { fg = p.teal2 },
    --   HopUnmatched = { fg = p.blueGray3 },
    --   HopCursor = { fg = p.blue3 },
    --
    --   -- ggandor/leap.nvim
    --   LeapMatch = { fg = p.background2, bg = p.pink2 },
    --   LeapLabelPrimary = { fg = p.background2, bg = p.teal1 },
    --   LeapLabelSecondary = { fg = p.background2, bg = p.blue1 },
    --   LeapLabelSelected = { fg = p.background2, bg = p.yellow },
    --   LeapBackground = { bg = p.background1 },
    --
    --   -- rcarriga/nvim-notify
    --   NotifyINFOBorder = { fg = p.teal1 },
    --   NotifyINFOTitle = { link = 'NotifyINFOBorder' },
    --   NotifyINFOIcon = { link = 'NotifyINFOBorder' },
    --   NotifyWARNBorder = { fg = p.yellow },
    --   NotifyWARNTitle = { link = 'NotifyWARNBorder' },
    --   NotifyWARNIcon = { link = 'NotifyWARNBorder' },
    --   NotifyDEBUGBorder = { fg = p.blue1 },
    --   NotifyDEBUGTitle = { link = 'NotifyDEBUGBorder' },
    --   NotifyDEBUGIcon = { link = 'NotifyDEBUGBorder' },
    --   NotifyTRACEBorder = { fg = p.blue1 },
    --   NotifyTRACETitle = { link = 'NotifyTRACEBorder' },
    --   NotifyTRACEIcon = { link = 'NotifyTRACEBorder' },
    --   NotifyERRORBorder = { fg = p.pink3 },
    --   NotifyERRORTitle = { link = 'NotifyERRORBorder' },
    --   NotifyERRORIcon = { link = 'NotifyERRORBorder' },
    --
    --   -- glepnir/lspsaga.nvim
    --   TitleString = { fg = p.blue2 },
    --   TitleIcon = { fg = p.blue2 },
    --   SagaBorder = { bg = p.background2, fg = p.blueGray2 },
    --   SagaNormal = { bg = p.background2 },
    --   SagaExpand = { fg = p.teal2 },
    --   SagaCollapse = { fg = p.teal2 },
    --   SagaBeacon = { bg = p.yellow },
    --   -- code action
    --   ActionPreviewNormal = { link = 'SagaNormal' },
    --   ActionPreviewBorder = { link = 'SagaBorder' },
    --   ActionPreviewTitle = { fg = p.blueGray2, bg = p.background2 },
    --   CodeActionNormal = { link = 'SagaNormal' },
    --   CodeActionBorder = { link = 'SagaBorder' },
    --   CodeActionText = { fg = p.yellow },
    --   CodeActionNumber = { fg = p.blue3 },
    --   -- finder
    --   FinderSelection = { fg = p.blueGray2, bold = true },
    --   FinderFileName = { fg = p.white },
    --   FinderCount = { link = 'Label' },
    --   FinderIcon = { fg = p.yellow },
    --   FinderType = { fg = p.teal1 },
    --   --finder spinner
    --   FinderSpinnerTitle = { fg = p.pink3, bold = true },
    --   FinderSpinner = { fg = p.pink3, bold = true },
    --   FinderPreviewSearch = { link = 'Search' },
    --   FinderVirtText = { fg = p.blue1 },
    --   FinderNormal = { link = 'SagaNormal' },
    --   FinderBorder = { link = 'SagaBorder' },
    --   FinderPreviewBorder = { link = 'SagaBorder' },
    --   -- definition
    --   DefinitionBorder = { link = 'SagaBorder' },
    --   DefinitionNormal = { link = 'SagaNormal' },
    --   DefinitionSearch = { link = 'Search' },
    --   -- hover
    --   HoverNormal = { link = 'SagaNormal' },
    --   HoverBorder = { link = 'SagaBorder' },
    --   -- rename
    --   RenameBorder = { link = 'SagaBorder' },
    --   RenameNormal = { fg = p.white, p.background2 },
    --   RenameMatch = { link = 'Search' },
    --   -- diagnostic
    --   DiagnosticBorder = { link = 'SagaBorder' },
    --   DiagnosticSource = { fg = p.blueGray2 },
    --   DiagnosticNormal = { link = 'SagaNormal' },
    --   DiagnosticErrorBorder = { link = 'DiagnosticError' },
    --   DiagnosticWarnBorder = { link = 'DiagnosticWarn' },
    --   DiagnosticHintBorder = { link = 'DiagnosticHint' },
    --   DiagnosticInfoBorder = { link = 'DiagnosticInfo' },
    --   DiagnosticPos = { fg = p.blueGray2 },
    --   DiagnosticWord = { fg = p.white },
    --   -- Call Hierachry
    --   CallHierarchyNormal = { link = 'SagaNormal' },
    --   CallHierarchyBorder = { link = 'SagaBorder' },
    --   CallHierarchyIcon = { fg = p.pink2 },
    --   CallHierarchyTitle = { fg = p.pink2 },
    --   -- lightbulb
    --   LspSagaLightBulb = { link = 'DiagnosticSignHint' },
    --   -- shadow
    --   SagaShadow = { bg = p.background3 },
    --   -- Outline
    --   OutlineIndent = { fg = p.blue2 },
    --   OutlinePreviewBorder = { link = 'SagaNormal' },
    --   OutlinePreviewNormal = { link = 'SagaBorder' },
    --   -- Float term
    --   TerminalBorder = { link = 'SagaBorder' },
    --   TerminalNormal = { link = 'SagaNormal' },
  }
  --
  -- vim.g.terminal_color_0 = p.background3 -- black
  -- vim.g.terminal_color_8 = p.background3 -- bright black
  -- vim.g.terminal_color_1 = p.pink3       -- red
  -- vim.g.terminal_color_9 = p.pink3       -- bright red
  -- vim.g.terminal_color_2 = p.teal1       -- green
  -- vim.g.terminal_color_10 = p.teal1      -- bright green
  -- vim.g.terminal_color_3 = p.yellow      -- yellow
  -- vim.g.terminal_color_11 = p.yellow     -- bright yellow
  -- vim.g.terminal_color_4 = p.blue1       -- blue
  -- vim.g.terminal_color_12 = p.blue2      -- bright blue
  -- vim.g.terminal_color_5 = p.pink2       -- magenta
  -- vim.g.terminal_color_13 = p.pink2      -- bright magenta
  -- vim.g.terminal_color_6 = p.blue1       -- cyan
  -- vim.g.terminal_color_14 = p.blue2      -- bright cyan
  -- vim.g.terminal_color_7 = p.white       -- white
  -- vim.g.terminal_color_15 = p.white      -- bright white
  --

  return theme
end

return M
