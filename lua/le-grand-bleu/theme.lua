local M = {}

function M.get(config)
	local p = require("le-grand-bleu.palette")

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
		CurSearch = { link = "IncSearch" },
		Cursor = { fg = g.text, bg = g.light_blue },
		CursorColumn = { bg = g.light_blue },
		CursorLine = { bg = g.light_blue },
		CursorLineNr = { fg = g.text },
		DarkenedPanel = { bg = g.panel },
		DarkenedStatusline = { bg = g.panel },
		DiffAdd = { fg = g.text, bg = g.git_add_bg },
		DiffChange = { fg = g.text, bg = g.git_change_bg },
		DiffDelete = { fg = g.text, bg = g.git_delete_bg },
		DiffText = { link = "DiffChange" },
		diffAdded = { link = "DiffAdd" },
		diffChanged = { link = "DiffChange" },
		diffRemoved = { link = "DiffDelete" },
		Directory = { fg = g.blue, bg = p.none },
		ErrorMsg = { fg = g.error, style = "bold" },
		FloatBorder = { fg = g.border },
		FloatTitle = { fg = g.blue },
		FoldColumn = { fg = g.blue },
		Folded = { fg = g.text, bg = g.panel },
		IncSearch = { fg = g.text, bg = g.light_blue },
		LineNr = { fg = g.blue },
		MatchParen = { fg = g.text, bg = g.light_blue },
		ModeMsg = { fg = p.blue3 },
		MoreMsg = { fg = p.blue3 },
		NonText = { fg = g.text, bg = styles.background },
		Normal = { fg = g.text, bg = styles.background },
		NormalFloat = { fg = g.text, bg = styles.float_background },
		NormalNC = { fg = g.text, bg = styles.nc_background },
		NvimInternalError = { fg = p.white, bg = g.dark_rose },
		Pmenu = { fg = g.text, bg = styles.float_background },
		PmenuSbar = { bg = styles.float_background },
		PmenuSel = { fg = p.white, bg = g.blue },
		PmenuThumb = { bg = g.blue },
		Question = { fg = g.dark_yellow },
		-- QuickFixLine = {},
		-- RedrawDebugNormal = {}
		RedrawDebugClear = { fg = p.white, bg = g.dark_rose },
		RedrawDebugComposed = { fg = p.white, bg = g.black },
		RedrawDebugRecompose = { fg = p.white, bg = g.black },
		Search = { link = "IncSearch" },
		SpecialKey = { fg = g.green },
		SpellBad = { sp = g.dark_rose, style = "undercurl" },
		SpellCap = { sp = g.blue, style = "undercurl" },
		SpellLocal = { sp = g.yellow, style = "undercurl" },
		SpellRare = { sp = g.blue, style = "undercurl" },
		SignColumn = { fg = g.text, bg = p.none },
		StatusLine = { fg = g.blue, bg = styles.float_background },
		StatusLineNC = { fg = g.blue, bg = styles.background },
		StatusLineTerm = { link = "StatusLine" },
		StatusLineTermNC = { link = "StatusLineNC" },
		TabLine = { fg = g.blue, bg = styles.float_background },
		TabLineFill = { bg = styles.float_background },
		TabLineSel = { fg = g.text, bg = g.light_blue },
		Title = { fg = g.text },
		Visual = { fg = p.white, bg = g.blue },
		WarningMsg = { fg = g.dark_yellow },
		Whitespace = { fg = g.blue },
		WildMenu = { link = "IncSearch" },
		WinSeparator = { fg = g.border, bg = g.light_blue },

		---

		Constant = { fg = g.text, style = "bold" }, -- (preferred) any constant
		String = { fg = g.text }, --   a string constant: "this is a string"
		Character = { fg = g.text }, --  a character constant: 'c', '\n'
		Number = { fg = g.text }, --   a number constant: 234, 0xff
		Boolean = { fg = g.text }, --  a boolean constant: TRUE, false
		Float = { fg = g.text }, --    a floating point constant: 2.3e10

		Identifier = { fg = g.text }, -- (preferred) any variable name
		Function = { link = "Constant" }, -- function name (also: methods for classes)

		Statement = { fg = g.text }, -- (preferred) any statement
		Conditional = { link = "Constant" }, --  if, then, else, endif, switch, etc.
		Repeat = { link = "Constant" }, --   for, do, while, etc.
		Label = { fg = p.text }, --    case, default, etc.
		Operator = { link = "Constant" }, -- "sizeof", "+", "*", etc.
		Keyword = { link = "Constant" }, --  any other keyword
		Exception = { link = "Constant" }, --  try, catch, throw

		PreProc = { fg = g.text }, -- (preferred) generic Preprocessor
		Include = { fg = g.text }, --  preprocessor #include

		Type = { link = "Constant" }, -- (preferred) int, long, char, etc.

		Special = { fg = g.text }, -- (preferred) any special symbol
		Tag = { fg = g.text }, --    you can use CTRL-] on this
		Delimiter = { fg = g.text }, --  character that needs attention
		Comment = { fg = g.blue }, -- (preferred) any special symbol

		SpecialComment = { link = "Comment" }, -- special things inside a comment

		Underlined = { style = "underline" }, -- (preferred) text that stands out, HTML links
		Bold = { style = "bold" },
		Italic = { style = "italic" },

		Error = { fg = g.error }, -- (preferred) any erroneous construct
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
		DiagnosticError = { fg = g.error },
		DiagnosticHint = { fg = g.hint },
		DiagnosticInfo = { fg = g.info },
		DiagnosticWarn = { fg = g.warn },
		DiagnosticDefaultError = { fg = g.error },
		DiagnosticDefaultHint = { fg = g.hint },
		DiagnosticDefaultInfo = { fg = g.info },
		DiagnosticDefaultWarn = { fg = g.warn },
		DiagnosticFloatingError = { fg = g.error },
		DiagnosticFloatingHint = { fg = g.hint },
		DiagnosticFloatingInfo = { fg = g.info },
		DiagnosticFloatingWarn = { fg = g.warn },
		DiagnosticSignError = { fg = g.error },
		DiagnosticSignHint = { fg = g.hint },
		DiagnosticSignInfo = { fg = g.info },
		DiagnosticSignWarn = { fg = g.warn },
		DiagnosticStatusLineError = { fg = g.error, bg = g.panel },
		DiagnosticStatusLineHint = { fg = g.hint, bg = g.panel },
		DiagnosticStatusLineInfo = { fg = g.info, bg = g.panel },
		DiagnosticStatusLineWarn = { fg = g.warn, bg = g.panel },
		DiagnosticUnderlineError = { sp = g.error, style = "undercurl" },
		DiagnosticUnderlineHint = { sp = g.hint, style = "undercurl" },
		DiagnosticUnderlineInfo = { sp = g.info, style = "undercurl" },
		DiagnosticUnderlineWarn = { sp = g.warn, style = "undercurl" },
		DiagnosticVirtualTextError = { fg = g.error },
		DiagnosticVirtualTextHint = { fg = g.hint },
		DiagnosticVirtualTextInfo = { fg = g.info },
		DiagnosticVirtualTextWarn = { fg = g.warn },

		--   -- Treesitter
		["@boolean"] = { link = "Identifier" },
		["@string.special.url.gomod"] = { link = "Identifier" },
		["@variable"] = { link = "Identifier" },
		["@character"] = { link = "Identifier" },
		["@character.special"] = { link = "Identifier" },
		["@comment"] = { link = "Comment" },
		["@conditional"] = { link = "Identifier" },
		["@constant.builtin"] = { link = "Identifier" },
		["@constant"] = { link = "Constant" },
		["@constant.macro"] = { link = "Identifier" },
		["@constructor"] = { link = "Identifier" },
		["@debug"] = { link = "Identifier" },
		["@define"] = { link = "Identifier" },
		["@exception"] = { link = "Identifier" },
		["@field"] = { link = "Identifier" },
		["@float"] = { link = "Identifier" },
		["@function.builtin"] = { link = "Identifier" },
		["@function.call"] = { link = "Identifier" },
		["@function"] = { link = "Identifier" },
		["@function.macro"] = { link = "Identifier" },
		["@identifier"] = { link = "Identifier" },
		["@include"] = { link = "Identifier" },
		["@label"] = { link = "Identifier" },
		["@lsp.type.function"] = { link = "Identifier" },
		["@lsp.type.macro"] = { link = "Identifier" },
		["@lsp.type.method"] = { link = "Identifier" },
		["@macro"] = { link = "Identifier" },
		["@method.call"] = { link = "Identifier" },
		["@method"] = { link = "Identifier" },
		["@module"] = { link = "Identifier" },
		["@namespace"] = { link = "Identifier" },
		["@none"] = { link = "Identifier" },
		["@number"] = { link = "Identifier" },
		["@operator"] = { link = "Constant" },
		["@parameter"] = { link = "Identifier" },
		["@preproc"] = { link = "Identifier" },
		["@property"] = { link = "Identifier" },
		["@keyword"] = { link = "Constant" },
		["@keyword.function"] = { link = "Constant" },
		["@punctuation.bracket"] = { link = "Identifier" },
		["@punctuation.delimiter"] = { link = "Identifier" },
		["@punctuation"] = { link = "Identifier" },
		["@punctuation.special"] = { link = "Identifier" },
		["@repeat"] = { link = "Identifier" },
		["@storageclass"] = { link = "Identifier" },
		["@string.escape"] = { link = "Identifier" },
		["@string"] = { link = "Identifier" },
		["@string.special"] = { link = "Identifier" },
		["@structure"] = { link = "Identifier" },
		["@tag.attribute"] = { link = "Identifier" },
		["@tag.delimiter"] = { link = "Identifier" },
		["@tag"] = { link = "Identifier" },
		["@text.literal"] = { link = "Identifier" },
		["@text.reference"] = { link = "Identifier" },
		["@text.title"] = { link = "Identifier" },
		["@text.todo"] = { link = "Identifier" },
		["@text.underline"] = { link = "Identifier" },
		["@text.uri"] = { link = "Identifier" },
		["@type.builtin"] = { link = "Identifier" },
		["@type.definition"] = { link = "Identifier" },
		["@type"] = { fg = g.text, style = "bold,italic" },
		["@variable.builtin"] = { link = "Identifier" },
		--
		--   -- markup
		["@markup.heading.1"] = { fg = p.blue0, bg = p.white },
		["@markup.heading.2"] = { fg = p.blue1, bg = p.white },
		["@markup.heading.3"] = { fg = p.blue2, bg = p.white },
		["@markup.heading.4"] = { fg = p.blue3, bg = p.white },
		["@markup.heading.5"] = { fg = p.blue3, bg = p.white },
		["@markup.heading.6"] = { fg = p.blue3, bg = p.white },
		["@markup.italic"] = { fg = g.blue, style = "italic" },
		["@markup.strikethrough"] = { style = "strikethrough" },

		--
		--   -- lua
		luaTSConstructor = { link = "Constant" },
		--
		--   -- css
		cssTSFunction = { link = "Identifier" },
		cssTSProperty = { link = "Identifier" },
		cssTSType = { link = "Constant" },
		cssTSKeyword = { link = "Constant" },
		cssClassName = { link = "Identifier" },
		cssPseudoClass = { link = "Identifier" },
		cssDefinition = { link = "Identifier" },
		cssTSError = { link = "cssClassName" },
		--
		--   -- vim.lsp.buf.document_highlight()
		LspReferenceText = { link = "IncSearch" },
		LspReferenceRead = { link = "IncSearch" },
		LspReferenceWrite = { link = "IncSearch" },
		--
		--   -- lsp-highlight-codelens
		LspCodeLens = { fg = g.blue }, -- virtual text of code lens
		LspCodeLensSeparator = { fg = g.light_blue }, -- separator between two or more code lens
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
		GitSignsAdd = { fg = g.git_add },
		GitSignsChange = { fg = g.git_change },
		GitSignsDelete = { fg = g.git_delete },
		SignAdd = { link = "GitSignsAdd" },
		SignChange = { link = "GitSignsChange" },
		SignDelete = { link = "GitSignsDelete" },
		--
		--   -- kyazdani42/nvim-tree.lua
		NvimTreeEmptyFolderName = { fg = g.grey },
		NvimTreeExecFile = { fg = g.green },
		NvimTreeFileDeleted = { fg = g.dark_rose },
		NvimTreeFileDirty = { fg = g.blue },
		NvimTreeFileMerge = { fg = g.light_blue },
		NvimTreeFileNew = { fg = g.dark_yellow },
		NvimTreeFileRenamed = { fg = g.grey },
		NvimTreeFileStaged = { fg = g.dark_green },
		NvimTreeFolderIcon = { fg = g.blue },
		NvimTreeFolderName = { fg = g.blue },
		NvimTreeGitDeleted = { fg = g.git_delete },
		NvimTreeGitDirty = { fg = g.git_dirty },
		NvimTreeGitIgnored = { fg = g.git_ignore },
		NvimTreeGitMerge = { fg = g.git_merge },
		NvimTreeGitNew = { fg = g.git_add },
		NvimTreeGitRenamed = { fg = g.git_rename },
		NvimTreeGitStaged = { fg = g.git_stage },
		NvimTreeImageFile = { fg = g.text },
		NvimTreeNormal = { fg = g.text },
		NvimTreeOpenedFile = { fg = g.text, bg = g.light_blue },
		NvimTreeOpenedFolderName = { link = "NvimTreeFolderName" },
		NvimTreeRootFolder = { fg = g.blue },
		NvimTreeSpecialFile = { link = "NvimTreeNormal" },
		NvimTreeWindowPicker = { fg = g.text, bg = g.light_blue },
		--
		--   -- nvim-neotest/neotest
		NeotestFailed = { fg = g.error, style = "bold" },
		NeotestRunning = { fg = g.blue, style = "bold" },
		NeotestSkipped = { fg = g.dark_yellow, style = "bold" },
		NeotestUnknown = { fg = g.dark_yellow, style = "bold" },
		NeotestPassed = { fg = g.green, style = "italic" },
		--
		--   -- folke/which-key.nvim
		WhichKey = { fg = g.text },
		WhichKeyGroup = { fg = g.text },
		WhichKeySeparator = { fg = g.text },
		WhichKeyDesc = { fg = g.text },
		WhichKeyFloat = { bg = g.panel },
		WhichKeyValue = { fg = g.text },
		--
		--   -- luka-reineke/indent-blankline.nvim
		IndentBlanklineChar = { fg = g.light_blue },
		IndentBlanklineContextChar = { fg = g.yellow, gui = "nocombine" },
		IndentBlanklineContextStart = { fg = g.yellow, gui = "underline" },
		IndentBlanklineSpaceChar = { link = "Whitespace" },
		IndentBlanklineSpaceCharBlankline = { link = "Whitespace" },
		--
		--   -- hrsh7th/nvim-cmp
		--   CmpItemAbbr = { fg = p.blueGray2 },
		CmpItemAbbrDeprecated = { fg = g.text, style = "strikethrough" },
		CmpItemAbbrMatch = { fg = g.text, style = "bold" },
		--
		--   -- ray-x/lsp_signature.nvim
		LspSignatureActiveParameter = { bg = g.light_blue },
		--
		--   -- nvim-telescope/telescope.nvim
		TelescopeMatching = { fg = g.dark_yellow, style = "bold" },
		TelescopeNormal = { fg = g.text },
		TelescopeSelection = { fg = p.white, bg = g.blue },
		TelescopeBorder = { fg = g.blue },
		TelescopePromptBorder = { fg = g.blue },
		TelescopePromptNormal = { fg = g.text },
		TelescopePromptPrefix = { fg = g.blue },
		TelescopeResultsDiffAdd = { fg = g.git_add },
		TelescopeResultsDiffChange = { fg = g.git_change },
		TelescopeResultsDiffDelete = { fg = g.git_delete },
		--
		--   -- rcarriga/nvim-notify
		NotifyINFOBorder = { fg = g.blue },
		NotifyINFOBody14 = { fg = g.rose, bg = g.yellow },
		NotifyINFOTitle = { link = "NotifyINFOBorder" },
		NotifyINFOIcon = { link = "NotifyINFOBorder" },
		NotifyWARNBorder = { fg = g.dark_yellow },
		NotifyWARNTitle = { link = "NotifyWARNBorder" },
		NotifyWARNIcon = { link = "NotifyWARNBorder" },
		NotifyDEBUGBorder = { fg = g.grey },
		NotifyDEBUGTitle = { link = "NotifyDEBUGBorder" },
		NotifyDEBUGIcon = { link = "NotifyDEBUGBorder" },
		NotifyTRACEBorder = { fg = g.grey },
		NotifyTRACETitle = { link = "NotifyTRACEBorder" },
		NotifyTRACEIcon = { link = "NotifyTRACEBorder" },
		NotifyERRORBorder = { fg = g.dark_rose },
		NotifyERRORTitle = { link = "NotifyERRORBorder" },
		NotifyERRORIcon = { link = "NotifyERRORBorder" },
		--
		--   -- TimUntersberger/neogit
		NeogitDiffAdd = { link = "DiffAdd" },
		NeogitDiffAddHighlight = { link = "DiffAdd" },
		NeogitDiffChange = { link = "DiffChange" },
		NeogitDiffChangeHighlight = { link = "DiffChange" },
		NeogitDiffDelete = { link = "DiffDelete" },
		NeogitDiffDeleteHighlight = { link = "DiffDelete" },
		NeogitDiffText = { link = "DiffText" },
		NeogitDiffTextHighlight = { link = "DiffText" },
		NeogitDiffContextHighlight = { link = "Normal" },
		--
		--   -- yetone/avante.nvim
		AvanteTitle = { fg = p.white, bg = g.dark_blue }, -- Title
		AvanteReversedTitle = { fg = g.dark_blue, bg = p.white }, -- Used for rounded border
		AvanteSubtitle = { link = "AvanteTitle" }, -- Selected code title
		AvanteReversedSubtitle = { link = "AvanteReversedTitle" }, -- Used for rounded border
		AvanteThirdTitle = { link = "AvanteTitle" }, -- Prompt title
		AvanteReversedThirdTitle = { link = "AvanteReversedTitle" }, -- Used for rounded border
		AvantePopupHint = { link = "DiagnosticHint" }, -- Usage hints in popup menus
		AvanteInlineHint = { link = "DiagnosticHint" }, -- The end-of-line hint displayed in visual mode
		AvanteConflictCurrent = { link = "DiffDelete" }, -- Current conflict highlight  Default to `Config.highlights.diff.current`
		AvanteConflictIncoming = { link = "DiffAdd" }, -- Incoming conflict highlight  Default to `Config.highlights.diff.incoming`
		AvanteSidebarWinSeparator = { fg = g.light_blue },
		-- AvanteConflictCurrentLabel        = {},                                 -- Current conflict label highlight  Default to shade of `AvanteConflictCurrent`
		-- AvanteConflictIncomingLabel       = {},                                 -- Incoming conflict label highlight  Default to shade of `AvanteConflictIncoming`
		--
		--   -- MeanderingProgrammer/render-markdown.nvim
		RenderMarkdownH1Bg = { bg = p.blue4 }, -- H1 background line
		RenderMarkdownH2Bg = { bg = p.blue4 }, -- H2 background line
		RenderMarkdownH3Bg = { bg = p.blue4 }, -- H3 background line
		RenderMarkdownH4Bg = { bg = p.blue4 }, -- H4 background line
		RenderMarkdownH5Bg = { bg = p.blue4 }, -- H5 background line
		RenderMarkdownH6Bg = { bg = p.blue4 }, -- H6 background line
		RenderMarkdownCode = { bg = p.blue4 }, -- Code block background
		RenderMarkdownCodeInline = { bg = p.blue4 }, -- Inline code background
		RenderMarkdownBullet = { fg = p.blue2 }, -- List item bullet points
		RenderMarkdownQuote = { link = "RenderMarkdownBullet" }, -- Block quote marker
		RenderMarkdownLink = { link = "RenderMarkdownBullet" }, -- Image & hyperlink icons
		RenderMarkdownUnchecked = { link = "RenderMarkdownBullet" }, -- Unchecked checkbox
		RenderMarkdownChecked = { link = "RenderMarkdownBullet" }, -- Checked checkbox
		RenderMarkdownInfo = { link = "DiagnosticInfo" }, -- Info related callouts
		RenderMarkdownHint = { link = "DiagnosticHint" }, -- Hint related callouts
		RenderMarkdownWarn = { link = "DiagnosticWarn" }, -- Warning related callouts
		RenderMarkdownError = { link = "DiagnosticError" }, -- Error related callouts

		--   -- folke/scnacks.nvim
		SnacksPickerDir = { fg = g.text }, -- Otherwise not visible

		BlinkCmpGhostText = { fg = g.blue },
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
