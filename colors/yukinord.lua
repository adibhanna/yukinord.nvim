-- Yukinord color scheme for Neovim
-- Based on the VSCode theme inspired by Nord and Nord Deep
---@diagnostic disable: undefined-global

-- Color palette
local colors = {
  -- Base colors
  bg0 = "#1D2129", -- editor.background (VSCode: #1D2129)
  bg1 = "#14171d", -- panel.background, terminal.background
  bg2 = "#292e39", -- dropdown.background, editorHoverWidget.background
  bg3 = "#2e3440", -- commandCenter.activeBackground
  bg4 = "#434c5e", -- editor.lineHighlightBorder
  bg5 = "#4c566a", -- button.secondaryBackground

  -- Foreground colors
  fg0 = "#eceff4", -- editorCursor.foreground, active foreground
  fg1 = "#e5e9f0", -- terminal.ansiWhite
  fg2 = "#d8dee9", -- editor.foreground, default foreground
  fg3 = "#8d929c", -- comments color
  fg4 = "#616e88", -- editorLineNumber.foreground

  -- Border colors
  border = "#3b4252", -- activityBar.border, editorGroup.border

  -- Accent colors
  cyan = "#88c0d0",        -- keywords, activityBar.activeBorder
  blue = "#81a1c1",        -- info, charts.blue
  blue_bright = "#5e81ac", -- selection background
  green = "#a3be8c",       -- types, classes, charts.green
  yellow = "#ebcb8b",      -- numbers, functions, warnings, charts.yellow
  orange = "#d08770",      -- strings, charts.orange
  red = "#bf616a",         -- errors, charts.red
  purple = "#b48ead",      -- keyword.control, charts.purple
  teal = "#8fbcbb",        -- debugConsole.sourceForeground

  -- Special colors
  gold = "#ffd700", -- editorLightBulb.foreground
}

-- Helper function to set highlight groups
local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Clear existing highlights
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

-- Set background and foreground
vim.g.colors_name = "yukinord"
vim.o.background = "dark"
vim.o.termguicolors = true

-- Base highlights
hl("Normal", { fg = colors.fg2, bg = colors.bg0 })
hl("NormalFloat", { fg = colors.fg2, bg = colors.bg2 })
hl("NormalNC", { fg = colors.fg2, bg = colors.bg1 }) -- Darker for inactive windows (like file explorer)
hl("EndOfBuffer", { fg = colors.bg0 })
hl("WinSeparator", { fg = colors.border })
hl("FloatBorder", { fg = colors.border, bg = colors.bg2 })

-- Cursor
hl("Cursor", { fg = colors.bg0, bg = colors.fg0 })
hl("CursorLine", { bg = colors.bg0 })
hl("CursorLineNr", { fg = colors.fg0, bg = colors.bg0, bold = true })
hl("CursorColumn", { bg = colors.bg0 })
hl("TermCursor", { fg = colors.bg0, bg = colors.fg0 })
hl("TermCursorNC", { fg = colors.bg0, bg = colors.fg2 })

-- Line numbers
hl("LineNr", { fg = colors.fg4 })
hl("LineNrAbove", { fg = colors.fg4 })
hl("LineNrBelow", { fg = colors.fg4 })

-- Status line (matching VSCode: statusBar.background="#1d2129", statusBar.foreground="#d8dee9")
-- Using bg1 for slightly darker background
hl("StatusLine", { fg = colors.fg2, bg = colors.bg1 })
hl("StatusLineNC", { fg = colors.fg2, bg = colors.bg1 })
hl("StatusLineTerm", { fg = colors.fg2, bg = colors.bg1 })
hl("StatusLineTermNC", { fg = colors.fg2, bg = colors.bg1 })

-- Tab line
hl("TabLine", { fg = colors.fg2, bg = colors.bg1 })
hl("TabLineFill", { bg = colors.bg1 })
hl("TabLineSel", { fg = colors.fg0, bg = colors.bg0, bold = true })
hl("TabLineSelModified", { fg = colors.cyan, bg = colors.bg0 })

-- Sign column
hl("SignColumn", { bg = colors.bg0 })
hl("FoldColumn", { fg = colors.fg4, bg = colors.bg0 })

-- Folding
hl("Folded", { fg = colors.fg3, bg = colors.bg0, italic = true })
hl("FoldColumn", { fg = colors.fg4, bg = colors.bg0 })

-- Search
hl("Search", { fg = colors.orange, bg = colors.orange, blend = 80, underline = true })
hl("IncSearch", { fg = colors.orange, bg = colors.orange, blend = 80, underline = true })
hl("CurSearch", { fg = colors.orange, bg = colors.orange, blend = 80, underline = true })

-- Visual selection (VSCode: #445B77)
hl("Visual", { bg = "#445B77" })
hl("VisualNOS", { bg = "#445B77", blend = 20 })
hl("VisualInDiff", { bg = "#445B77" })

-- Messages
hl("ErrorMsg", { fg = colors.red, bold = true })
hl("WarningMsg", { fg = colors.yellow, bold = true })
hl("ModeMsg", { fg = colors.fg2 })
hl("MoreMsg", { fg = colors.cyan })
hl("Question", { fg = colors.cyan })

-- Popup menu
hl("Pmenu", { fg = colors.fg2, bg = colors.bg0 })
hl("PmenuSel", { fg = colors.cyan, bg = colors.bg4 })
hl("PmenuSbar", { bg = colors.bg2 })
hl("PmenuThumb", { bg = colors.bg4 })
hl("WildMenu", { fg = colors.cyan, bg = colors.bg4 })

-- Diff
hl("DiffAdd", { fg = colors.green, bg = colors.green, blend = 80 })
hl("DiffChange", { fg = colors.yellow, bg = colors.yellow, blend = 80 })
hl("DiffDelete", { fg = colors.red, bg = colors.red, blend = 80 })
hl("DiffText", { fg = colors.fg2, bg = colors.yellow, blend = 60 })
hl("DiffAdded", { fg = colors.green })
hl("DiffRemoved", { fg = colors.red })
hl("DiffFile", { fg = colors.cyan })
hl("DiffNewFile", { fg = colors.green })
hl("DiffLine", { fg = colors.cyan })

-- Spelling
hl("SpellBad", { fg = colors.red, undercurl = true, sp = colors.red })
hl("SpellCap", { fg = colors.yellow, undercurl = true, sp = colors.yellow })
hl("SpellLocal", { fg = colors.blue, undercurl = true, sp = colors.blue })
hl("SpellRare", { fg = colors.purple, undercurl = true, sp = colors.purple })

-- Syntax highlighting
hl("Comment", { fg = colors.fg3, italic = true })
hl("Constant", { fg = colors.yellow })
hl("String", { fg = colors.orange })
hl("Character", { fg = colors.yellow })
hl("Number", { fg = colors.yellow })
hl("Boolean", { fg = colors.cyan })
hl("Float", { fg = colors.yellow })

hl("Identifier", { fg = colors.fg2 })
hl("Function", { fg = colors.yellow })
hl("Method", { fg = colors.yellow })

hl("Statement", { fg = colors.cyan })
hl("Conditional", { fg = colors.purple })
hl("Repeat", { fg = colors.purple })
hl("Label", { fg = colors.cyan })
hl("Operator", { fg = colors.fg2 })
hl("Keyword", { fg = colors.cyan })
hl("Exception", { fg = colors.purple })

hl("PreProc", { fg = colors.cyan })
hl("Include", { fg = colors.cyan })
hl("Define", { fg = colors.cyan })
hl("Macro", { fg = colors.cyan })
hl("PreCondit", { fg = colors.cyan })

hl("Type", { fg = colors.green })
hl("StorageClass", { fg = colors.cyan })
hl("Structure", { fg = colors.green })
hl("Typedef", { fg = colors.green })

hl("Special", { fg = colors.orange })
hl("SpecialChar", { fg = colors.yellow })
hl("Tag", { fg = colors.cyan })
hl("Delimiter", { fg = colors.fg2 })
hl("SpecialComment", { fg = colors.fg3 })
hl("Debug", { fg = colors.purple })

hl("Underlined", { underline = true })
hl("Ignore", { fg = colors.fg4 })
hl("Error", { fg = colors.red, bold = true })
hl("Todo", { fg = colors.yellow, bold = true })

-- Treesitter highlights
hl("@comment", { link = "Comment" })
hl("@error", { link = "Error" })
hl("@preproc", { link = "PreProc" })
hl("@define", { link = "Define" })
hl("@operator", { link = "Operator" })

hl("@punctuation.delimiter", { fg = colors.fg2 })
hl("@punctuation.bracket", { fg = colors.fg2 })
hl("@punctuation.special", { fg = colors.fg2 })

hl("@string", { link = "String" })
hl("@string.regex", { fg = colors.yellow })
hl("@string.escape", { fg = colors.yellow })
hl("@string.special", { fg = colors.orange })

hl("@character", { link = "Character" })
hl("@character.special", { fg = colors.yellow })

hl("@number", { link = "Number" })
hl("@boolean", { link = "Boolean" })
hl("@float", { link = "Float" })

hl("@function", { link = "Function" })
hl("@function.builtin", { fg = colors.yellow })
hl("@function.call", { fg = colors.yellow })
hl("@function.macro", { fg = colors.yellow, bold = true })

hl("@method", { link = "Method" })
hl("@method.call", { fg = colors.yellow })

hl("@constructor", { fg = colors.green })
hl("@parameter", { fg = colors.fg2 })
hl("@parameter.reference", { fg = colors.fg2 })

hl("@field", { fg = colors.fg2 })
hl("@property", { fg = colors.fg2 })
hl("@variable", { fg = colors.fg2 })
hl("@variable.builtin", { fg = colors.cyan })
hl("@variable.parameter", { fg = colors.fg2 })
hl("@variable.member", { fg = colors.fg2 })

hl("@type", { link = "Type" })
hl("@type.builtin", { fg = colors.green })
hl("@type.definition", { fg = colors.green })
hl("@type.qualifier", { fg = colors.cyan })

hl("@keyword", { link = "Keyword" })
hl("@keyword.function", { fg = colors.cyan })
hl("@keyword.operator", { fg = colors.fg2 })
hl("@keyword.return", { fg = colors.purple })
hl("@keyword.conditional", { fg = colors.purple })
hl("@keyword.repeat", { fg = colors.purple })
hl("@keyword.exception", { fg = colors.purple })
hl("@keyword.import", { fg = colors.cyan })
hl("@keyword.modifier", { fg = colors.cyan })

hl("@namespace", { fg = colors.green })
hl("@module", { fg = colors.green })
hl("@symbol", { fg = colors.fg2 })

hl("@constant", { fg = colors.cyan })
hl("@constant.builtin", { fg = colors.cyan })
hl("@constant.macro", { fg = colors.cyan })

hl("@tag", { fg = colors.cyan })
hl("@tag.delimiter", { fg = colors.fg2 })
hl("@tag.attribute", { fg = colors.fg2 })

hl("@text", { fg = colors.fg2 })
hl("@text.strong", { bold = true })
hl("@text.emphasis", { italic = true })
hl("@text.underline", { underline = true })
hl("@text.strike", { strikethrough = true })
hl("@text.title", { fg = colors.cyan, bold = true })
hl("@text.literal", { fg = colors.yellow })
hl("@text.uri", { fg = colors.cyan, underline = true })
hl("@text.math", { fg = colors.fg2 })
hl("@text.environment", { fg = colors.fg2 })
hl("@text.environment.name", { fg = colors.green })
hl("@text.reference", { fg = colors.purple })

hl("@text.diff.add", { link = "DiffAdd" })
hl("@text.diff.delete", { link = "DiffDelete" })

-- LSP highlights
hl("LspReferenceText", { bg = colors.blue_bright, blend = 80 })
hl("LspReferenceRead", { bg = colors.blue_bright, blend = 80 })
hl("LspReferenceWrite", { bg = colors.blue_bright, blend = 80 })

hl("DiagnosticError", { fg = colors.red })
hl("DiagnosticWarn", { fg = colors.yellow })
hl("DiagnosticInfo", { fg = colors.blue })
hl("DiagnosticHint", { fg = colors.yellow })
hl("DiagnosticUnderlineError", { undercurl = true, sp = colors.red })
hl("DiagnosticUnderlineWarn", { undercurl = true, sp = colors.yellow })
hl("DiagnosticUnderlineInfo", { undercurl = true, sp = colors.blue })
hl("DiagnosticUnderlineHint", { undercurl = true, sp = colors.yellow })

hl("DiagnosticVirtualTextError", { fg = colors.red, bg = colors.red, blend = 90 })
hl("DiagnosticVirtualTextWarn", { fg = colors.yellow, bg = colors.yellow, blend = 90 })
hl("DiagnosticVirtualTextInfo", { fg = colors.blue, bg = colors.blue, blend = 90 })
hl("DiagnosticVirtualTextHint", { fg = colors.yellow, bg = colors.yellow, blend = 90 })

hl("DiagnosticSignError", { fg = colors.red })
hl("DiagnosticSignWarn", { fg = colors.yellow })
hl("DiagnosticSignInfo", { fg = colors.blue })
hl("DiagnosticSignHint", { fg = colors.yellow })

hl("LspCodeLens", { fg = colors.fg3 })
hl("LspCodeLensSeparator", { fg = colors.fg4 })

-- LSP semantic tokens
hl("@lsp.type.namespace", { link = "@namespace" })
hl("@lsp.type.type", { link = "@type" })
hl("@lsp.type.class", { link = "@type" })
hl("@lsp.type.enum", { link = "@type" })
hl("@lsp.type.interface", { fg = colors.green, italic = true })
hl("@lsp.type.struct", { link = "@type" })
hl("@lsp.type.parameter", { link = "@parameter" })
hl("@lsp.type.variable", { link = "@variable" })
hl("@lsp.type.property", { link = "@property" })
hl("@lsp.type.enumMember", { fg = colors.green, bold = true })
hl("@lsp.type.function", { link = "@function" })
hl("@lsp.type.method", { link = "@method" })
hl("@lsp.type.macro", { link = "@function.macro" })
hl("@lsp.type.decorator", { fg = colors.fg2 })
hl("@lsp.type.keyword", { link = "@keyword" })
hl("@lsp.type.comment", { link = "@comment" })
hl("@lsp.type.string", { link = "@string" })
hl("@lsp.type.number", { link = "@number" })
hl("@lsp.type.regexp", { link = "@string.regex" })
hl("@lsp.type.operator", { link = "@operator" })

-- Git signs
hl("GitSignsAdd", { fg = colors.green })
hl("GitSignsChange", { fg = colors.yellow })
hl("GitSignsDelete", { fg = colors.red })
hl("GitSignsAddNr", { fg = colors.green })
hl("GitSignsChangeNr", { fg = colors.yellow })
hl("GitSignsDeleteNr", { fg = colors.red })
hl("GitSignsAddLn", { bg = colors.green, blend = 80 })
hl("GitSignsChangeLn", { bg = colors.yellow, blend = 80 })
hl("GitSignsDeleteLn", { bg = colors.red, blend = 80 })

-- Indent guides
hl("IndentBlanklineChar", { fg = colors.fg4, blend = 70 })
hl("IndentBlanklineContextChar", { fg = colors.fg4 })
hl("IndentBlanklineSpaceChar", { fg = colors.fg4, blend = 70 })
hl("IndentBlanklineContextSpaceChar", { fg = colors.fg4 })

-- NvimTree
hl("NvimTreeNormal", { fg = colors.fg2, bg = colors.bg1 })
hl("NvimTreeNormalNC", { fg = colors.fg2, bg = colors.bg1 })
hl("NvimTreeRootFolder", { fg = colors.cyan })
hl("NvimTreeGitDirty", { fg = colors.yellow })
hl("NvimTreeGitNew", { fg = colors.green })
hl("NvimTreeGitDeleted", { fg = colors.red })
hl("NvimTreeSpecialFile", { fg = colors.cyan })
hl("NvimTreeIndentMarker", { fg = colors.fg4 })
hl("NvimTreeImageFile", { fg = colors.purple })
hl("NvimTreeSymlink", { fg = colors.cyan })
hl("NvimTreeFolderIcon", { fg = colors.blue })
hl("NvimTreeOpenedFolderName", { fg = colors.cyan })
hl("NvimTreeClosedFolderName", { fg = colors.blue })

-- Telescope
hl("TelescopePromptBorder", { fg = colors.border })
hl("TelescopeResultsBorder", { fg = colors.border })
hl("TelescopePreviewBorder", { fg = colors.border })
hl("TelescopePromptTitle", { fg = colors.cyan })
hl("TelescopeResultsTitle", { fg = colors.cyan })
hl("TelescopePreviewTitle", { fg = colors.cyan })
hl("TelescopeSelection", { fg = colors.cyan, bg = colors.bg4 })
hl("TelescopeSelectionCaret", { fg = colors.cyan })
hl("TelescopeMatching", { fg = colors.cyan })

-- WhichKey
hl("WhichKey", { fg = colors.cyan })
hl("WhichKeyGroup", { fg = colors.blue })
hl("WhichKeySeparator", { fg = colors.fg4 })
hl("WhichKeyDesc", { fg = colors.fg2 })
hl("WhichKeyFloat", { bg = colors.bg2 })

-- Cmp
hl("CmpItemAbbr", { fg = colors.fg2 })
hl("CmpItemAbbrDeprecated", { fg = colors.fg3, strikethrough = true })
hl("CmpItemAbbrMatch", { fg = colors.cyan })
hl("CmpItemAbbrMatchFuzzy", { fg = colors.cyan })
hl("CmpItemMenu", { fg = colors.fg3 })
hl("CmpItemKind", { fg = colors.purple })
hl("CmpItemKindFunction", { fg = colors.yellow })
hl("CmpItemKindMethod", { fg = colors.yellow })
hl("CmpItemKindVariable", { fg = colors.fg2 })
hl("CmpItemKindKeyword", { fg = colors.cyan })
hl("CmpItemKindProperty", { fg = colors.fg2 })
hl("CmpItemKindUnit", { fg = colors.green })
hl("CmpItemKindText", { fg = colors.fg2 })
hl("CmpItemKindSnippet", { fg = colors.orange })
hl("CmpItemKindFile", { fg = colors.blue })
hl("CmpItemKindFolder", { fg = colors.blue })
hl("CmpItemKindClass", { fg = colors.green })
hl("CmpItemKindInterface", { fg = colors.green, italic = true })
hl("CmpItemKindModule", { fg = colors.green })
hl("CmpItemKindStruct", { fg = colors.green })
hl("CmpItemKindEnum", { fg = colors.green })
hl("CmpItemKindEnumMember", { fg = colors.green, bold = true })
hl("CmpItemKindConstant", { fg = colors.cyan })
hl("CmpItemKindConstructor", { fg = colors.green })
hl("CmpItemKindField", { fg = colors.fg2 })
hl("CmpItemKindEvent", { fg = colors.purple })
hl("CmpItemKindOperator", { fg = colors.fg2 })
hl("CmpItemKindReference", { fg = colors.purple })
hl("CmpItemKindTypeParameter", { fg = colors.green })
hl("CmpItemKindValue", { fg = colors.fg2 })

-- Notify
hl("NotifyERRORBorder", { fg = colors.red })
hl("NotifyWARNBorder", { fg = colors.yellow })
hl("NotifyINFOBorder", { fg = colors.blue })
hl("NotifyDEBUGBorder", { fg = colors.fg4 })
hl("NotifyTRACEBorder", { fg = colors.purple })
hl("NotifyERRORIcon", { fg = colors.red })
hl("NotifyWARNIcon", { fg = colors.yellow })
hl("NotifyINFOIcon", { fg = colors.blue })
hl("NotifyDEBUGIcon", { fg = colors.fg4 })
hl("NotifyTRACEIcon", { fg = colors.purple })
hl("NotifyERRORTitle", { fg = colors.red })
hl("NotifyWARNTitle", { fg = colors.yellow })
hl("NotifyINFOTitle", { fg = colors.blue })
hl("NotifyDEBUGTitle", { fg = colors.fg4 })
hl("NotifyTRACETitle", { fg = colors.purple })
hl("NotifyERRORBody", { fg = colors.fg2 })
hl("NotifyWARNBody", { fg = colors.fg2 })
hl("NotifyINFOBody", { fg = colors.fg2 })
hl("NotifyDEBUGBody", { fg = colors.fg2 })
hl("NotifyTRACEBody", { fg = colors.fg2 })

-- Bufferline
hl("BufferLineFill", { bg = colors.bg1 })
hl("BufferLineBackground", { fg = colors.fg2, bg = colors.bg1 })
hl("BufferLineBufferVisible", { fg = colors.fg2, bg = colors.bg1 })
hl("BufferLineBufferSelected", { fg = colors.fg0, bg = colors.bg0, bold = true })
hl("BufferLineIndicatorSelected", { fg = colors.cyan, bg = colors.bg0 })
hl("BufferLineModified", { fg = colors.yellow, bg = colors.bg1 })
hl("BufferLineModifiedSelected", { fg = colors.cyan, bg = colors.bg0 })
hl("BufferLineModifiedVisible", { fg = colors.yellow, bg = colors.bg1 })
hl("BufferLineCloseButton", { fg = colors.fg2, bg = colors.bg1 })
hl("BufferLineCloseButtonVisible", { fg = colors.fg2, bg = colors.bg1 })
hl("BufferLineCloseButtonSelected", { fg = colors.fg0, bg = colors.bg0 })
hl("BufferLineTab", { fg = colors.fg2, bg = colors.bg1 })
hl("BufferLineTabSelected", { fg = colors.fg0, bg = colors.bg0 })
hl("BufferLineTabClose", { fg = colors.fg2, bg = colors.bg1 })
hl("BufferLineSeparator", { fg = colors.border, bg = colors.bg1 })
hl("BufferLineSeparatorSelected", { fg = colors.border, bg = colors.bg0 })
hl("BufferLineSeparatorVisible", { fg = colors.border, bg = colors.bg1 })

-- Noice
hl("NoiceCmdlinePopup", { bg = colors.bg2 })
hl("NoiceCmdlinePopupBorder", { fg = colors.border })
hl("NoiceCmdlineIcon", { fg = colors.cyan })
hl("NoiceConfirm", { bg = colors.bg2 })
hl("NoiceConfirmBorder", { fg = colors.border })

-- Mini.nvim statusline (all sections link to StatusLine for consistent single color)
hl("MiniStatuslineModeNormal", { link = "StatusLine" })
hl("MiniStatuslineModeInsert", { link = "StatusLine" })
hl("MiniStatuslineModeVisual", { link = "StatusLine" })
hl("MiniStatuslineModeReplace", { link = "StatusLine" })
hl("MiniStatuslineModeCommand", { link = "StatusLine" })
hl("MiniStatuslineModeOther", { link = "StatusLine" })
hl("MiniStatuslineDevinfo", { link = "StatusLine" })
hl("MiniStatuslineFilename", { link = "StatusLine" })
hl("MiniStatuslineFileinfo", { link = "StatusLine" })
hl("MiniStatuslineInactive", { link = "StatusLine" })

-- Winbar
hl("WinBar", { fg = colors.fg2, bg = colors.bg0 })
hl("WinBarNC", { fg = colors.fg3, bg = colors.bg0 })

-- MatchParen
hl("MatchParen", { fg = colors.cyan, bg = colors.blue_bright, blend = 80, bold = true })

-- Whitespace
hl("Whitespace", { fg = colors.fg4 })

-- Quickfix
hl("QuickFixLine", { bg = colors.blue_bright, blend = 80 })
hl("qfFileName", { fg = colors.cyan })
hl("qfLineNr", { fg = colors.fg4 })
hl("qfError", { fg = colors.red })
hl("qfWarning", { fg = colors.yellow })

-- ColorColumn
hl("ColorColumn", { bg = colors.bg1 })

-- Conceal
hl("Conceal", { fg = colors.fg4 })

-- Directory
hl("Directory", { fg = colors.blue })

-- NonText
hl("NonText", { fg = colors.fg4 })

-- SpecialKey
hl("SpecialKey", { fg = colors.fg4 })

-- Title
hl("Title", { fg = colors.cyan, bold = true })

-- Lazy.nvim plugin manager
hl("LazyNormal", { fg = colors.fg2, bg = colors.bg0 })
hl("LazyButton", { fg = colors.fg2, bg = colors.bg2 })
hl("LazyButtonActive", { fg = colors.cyan, bg = colors.bg4 })
hl("LazyH1", { fg = colors.cyan, bg = colors.bg0, bold = true })
hl("LazyH2", { fg = colors.fg2, bg = colors.bg0 })
hl("LazyValue", { fg = colors.yellow, bg = colors.bg0 })
hl("LazyTaskOutput", { fg = colors.fg2, bg = colors.bg0 })
hl("LazyTaskError", { fg = colors.red, bg = colors.bg0 })
hl("LazyTaskSuccess", { fg = colors.green, bg = colors.bg0 })
hl("LazySpecial", { fg = colors.cyan, bg = colors.bg0 })
hl("LazyProgressDone", { fg = colors.cyan, bg = colors.bg0 })
hl("LazyProgressTodo", { fg = colors.fg4, bg = colors.bg0 })
hl("LazyReasonCmd", { fg = colors.orange, bg = colors.bg0 })
hl("LazyReasonEvent", { fg = colors.yellow, bg = colors.bg0 })
hl("LazyReasonFt", { fg = colors.blue, bg = colors.bg0 })
hl("LazyReasonImport", { fg = colors.green, bg = colors.bg0 })
hl("LazyReasonKeys", { fg = colors.purple, bg = colors.bg0 })
hl("LazyReasonPlugin", { fg = colors.cyan, bg = colors.bg0 })
hl("LazyReasonRuntime", { fg = colors.teal, bg = colors.bg0 })
hl("LazyReasonSource", { fg = colors.orange, bg = colors.bg0 })
hl("LazyReasonStart", { fg = colors.green, bg = colors.bg0 })
hl("LazyReasonRequire", { fg = colors.blue, bg = colors.bg0 })

-- Snacks.nvim highlights
-- Picker (Telescope-like interface)
hl("SnacksPickerNormal", { fg = colors.fg2, bg = colors.bg0 })
hl("SnacksPickerBorder", { fg = colors.border, bg = colors.bg0 })
hl("SnacksPickerTitle", { fg = colors.cyan, bg = colors.bg0, bold = true })
hl("SnacksPickerPrompt", { fg = colors.fg2, bg = colors.bg0 })
hl("SnacksPickerPromptBorder", { fg = colors.border, bg = colors.bg0 })
hl("SnacksPickerResults", { fg = colors.fg2, bg = colors.bg0 })
hl("SnacksPickerResultsBorder", { fg = colors.border, bg = colors.bg0 })
hl("SnacksPickerPreview", { fg = colors.fg2, bg = colors.bg2 })
hl("SnacksPickerPreviewBorder", { fg = colors.border, bg = colors.bg2 })
hl("SnacksPickerSelection", { fg = colors.cyan, bg = colors.bg4 })
hl("SnacksPickerSelectionCaret", { fg = colors.cyan })
hl("SnacksPickerMatching", { fg = colors.cyan })
hl("SnacksPickerCounter", { fg = colors.fg3, bg = colors.bg0 })

-- Notifier
hl("SnacksNotifierNormal", { fg = colors.fg2, bg = colors.bg2 })
hl("SnacksNotifierBorder", { fg = colors.border, bg = colors.bg2 })
hl("SnacksNotifierTitle", { fg = colors.fg0, bg = colors.bg2, bold = true })
hl("SnacksNotifierBody", { fg = colors.fg2, bg = colors.bg2 })
hl("SnacksNotifierIcon", { fg = colors.cyan, bg = colors.bg2 })
hl("SnacksNotifierERROR", { fg = colors.red, bg = colors.bg2 })
hl("SnacksNotifierWARN", { fg = colors.yellow, bg = colors.bg2 })
hl("SnacksNotifierINFO", { fg = colors.blue, bg = colors.bg2 })
hl("SnacksNotifierDEBUG", { fg = colors.fg4, bg = colors.bg2 })
hl("SnacksNotifierTRACE", { fg = colors.purple, bg = colors.bg2 })
hl("SnacksNotifierERRORBorder", { fg = colors.red, bg = colors.bg2 })
hl("SnacksNotifierWARNBorder", { fg = colors.yellow, bg = colors.bg2 })
hl("SnacksNotifierINFOBorder", { fg = colors.blue, bg = colors.bg2 })
hl("SnacksNotifierDEBUGBorder", { fg = colors.fg4, bg = colors.bg2 })
hl("SnacksNotifierTRACEBorder", { fg = colors.purple, bg = colors.bg2 })

-- Zen mode
hl("SnacksZenNormal", { fg = colors.fg2, bg = colors.bg0 })
hl("SnacksZenBorder", { fg = colors.border, bg = colors.bg0 })

-- Scratch buffer
hl("SnacksScratchNormal", { fg = colors.fg2, bg = colors.bg0 })
hl("SnacksScratchBorder", { fg = colors.border, bg = colors.bg0 })
hl("SnacksScratchTitle", { fg = colors.cyan, bg = colors.bg0, bold = true })

-- Terminal
hl("SnacksTerminalNormal", { fg = colors.fg2, bg = colors.bg1 })
hl("SnacksTerminalBorder", { fg = colors.border, bg = colors.bg1 })
hl("SnacksTerminalTitle", { fg = colors.cyan, bg = colors.bg1, bold = true })

-- Git browse
hl("SnacksGitBrowseNormal", { fg = colors.fg2, bg = colors.bg0 })
hl("SnacksGitBrowseBorder", { fg = colors.border, bg = colors.bg0 })

-- Dashboard
hl("SnacksDashboardNormal", { fg = colors.fg2, bg = colors.bg0 })
hl("SnacksDashboardBorder", { fg = colors.border, bg = colors.bg0 })
hl("SnacksDashboardTitle", { fg = colors.cyan, bg = colors.bg0, bold = true })
hl("SnacksDashboardKey", { fg = colors.cyan, bg = colors.bg0 })
hl("SnacksDashboardDesc", { fg = colors.fg2, bg = colors.bg0 })
hl("SnacksDashboardIcon", { fg = colors.blue, bg = colors.bg0 })
hl("SnacksDashboardFooter", { fg = colors.fg3, bg = colors.bg0 })

-- Win (floating windows)
hl("SnacksWinNormal", { fg = colors.fg2, bg = colors.bg2 })
hl("SnacksWinBorder", { fg = colors.border, bg = colors.bg2 })
hl("SnacksWinTitle", { fg = colors.cyan, bg = colors.bg2, bold = true })

-- Debug
hl("SnacksDebugNormal", { fg = colors.fg2, bg = colors.bg0 })
hl("SnacksDebugBorder", { fg = colors.border, bg = colors.bg0 })
hl("SnacksDebugTitle", { fg = colors.purple, bg = colors.bg0, bold = true })

-- Toggle
hl("SnacksToggleNormal", { fg = colors.fg2, bg = colors.bg0 })
hl("SnacksToggleActive", { fg = colors.cyan, bg = colors.bg0, bold = true })
hl("SnacksToggleInactive", { fg = colors.fg3, bg = colors.bg0 })

-- Dim
hl("SnacksDimNormal", { fg = colors.fg3, bg = colors.bg0 })
hl("SnacksDimBuffer", { fg = colors.fg3, bg = colors.bg0 })

-- Words (word navigation)
hl("SnacksWordsMatch", { fg = colors.cyan, bg = colors.blue_bright, blend = 80, underline = true })
hl("SnacksWordsCurrent", { fg = colors.orange, bg = colors.orange, blend = 80, underline = true })

-- Common snack components
hl("SnacksNormal", { fg = colors.fg2, bg = colors.bg0 })
hl("SnacksBorder", { fg = colors.border, bg = colors.bg0 })
hl("SnacksFloatBorder", { fg = colors.border, bg = colors.bg2 })
hl("SnacksTitle", { fg = colors.cyan, bg = colors.bg0, bold = true })
hl("SnacksIcon", { fg = colors.cyan, bg = colors.bg0 })
hl("SnacksKey", { fg = colors.cyan, bg = colors.bg0 })
hl("SnacksDesc", { fg = colors.fg2, bg = colors.bg0 })
hl("SnacksSeparator", { fg = colors.border, bg = colors.bg0 })
hl("SnacksSelected", { fg = colors.cyan, bg = colors.bg4 })
hl("SnacksMatching", { fg = colors.cyan })
hl("SnacksCounter", { fg = colors.fg3, bg = colors.bg0 })
hl("SnacksPrompt", { fg = colors.fg2, bg = colors.bg0 })
hl("SnacksPromptPrefix", { fg = colors.cyan, bg = colors.bg0 })
