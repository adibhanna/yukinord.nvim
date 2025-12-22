-- Yukinord color scheme for Neovim
-- Based on the VSCode theme inspired by Nord and Nord Deep
---@diagnostic disable: undefined-global

-- Load configuration
local config = require("yukinord").config

-- Transparent background helper
local function transparent_bg(color)
  if config.transparent then
    return "NONE"
  end
  return color
end

local function transparent_sidebar_bg(color)
  if config.transparent_sidebar or config.transparent then
    return "NONE"
  end
  return color
end

-- Dark color palette
local colors_dark = {
  -- Base colors
  bg0 = "#1D2129", -- editor.background (matching buffer and explorer)
  bg1 = "#14171d", -- panel.background, terminal.background
  bg2 = "#292e39", -- dropdown.background, editorHoverWidget.background
  bg3 = "#2e3440", -- commandCenter.activeBackground
  bg4 = "#434c5e", -- editor.lineHighlightBorder
  bg5 = "#4c566a", -- button.secondaryBackground

  -- Custom colors
  statusbar_bg = "#2D3441", -- mini.nvim statusline background

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

  -- Diff colors (subtle, VSCode-like backgrounds)
  diff_add_bg = "#2a3325",      -- subtle green-tinted background for added lines
  diff_delete_bg = "#362c2e",   -- subtle red-tinted background for deleted lines
  diff_change_bg = "#2d3340",   -- subtle blue-tinted background for changed lines
  diff_text_bg = "#3d4a5c",     -- slightly brighter for changed text within line
  diff_add_char = "#3d4f35",    -- deeper green for inserted characters
  diff_delete_char = "#4d3538", -- deeper red for deleted characters

  -- Visual selection
  visual = "#445B77",

  -- Cursor line
  cursorline = "#252b35",

  -- Cursor
  cursor_fg = "#1D2129",
  cursor_bg = "#eceff4",
}

-- Light color palette
local colors_light = {
  -- Base colors (inverted - light backgrounds)
  bg0 = "#ECEFF4", -- editor.background (snow storm 3)
  bg1 = "#E5E9F0", -- panel.background, terminal.background (snow storm 2)
  bg2 = "#D8DEE9", -- dropdown.background (snow storm 1)
  bg3 = "#CDD4E0", -- commandCenter.activeBackground
  bg4 = "#B8C4D4", -- editor.lineHighlightBorder
  bg5 = "#A5B1C5", -- button.secondaryBackground

  -- Custom colors
  statusbar_bg = "#D8DEE9", -- mini.nvim statusline background

  -- Foreground colors (inverted - dark foregrounds)
  fg0 = "#2E3440", -- editorCursor.foreground, active foreground (polar night 1)
  fg1 = "#3B4252", -- terminal.ansiWhite (polar night 2)
  fg2 = "#434C5E", -- editor.foreground, default foreground (polar night 3)
  fg3 = "#667084", -- comments color
  fg4 = "#7B8394", -- editorLineNumber.foreground

  -- Border colors
  border = "#C5CDD9", -- activityBar.border, editorGroup.border

  -- Accent colors (adjusted for light background visibility)
  cyan = "#0B7285",        -- keywords (deeper for contrast)
  blue = "#4A6F9A",        -- info (deeper)
  blue_bright = "#5E81AC", -- selection background
  green = "#4C8B2F",       -- types, classes (deeper)
  yellow = "#BF8C00",      -- numbers, functions, warnings (deeper)
  orange = "#C35A1E",      -- strings (deeper)
  red = "#BF3B4A",         -- errors (deeper)
  purple = "#8A5DAB",      -- keyword.control (deeper)
  teal = "#2E8B8B",        -- debugConsole.sourceForeground (deeper)

  -- Special colors
  gold = "#D4A500", -- editorLightBulb.foreground (adjusted for light bg)

  -- Diff colors (subtle, light-theme backgrounds)
  diff_add_bg = "#D5E8D4",      -- subtle green-tinted background for added lines
  diff_delete_bg = "#F5D5D5",   -- subtle red-tinted background for deleted lines
  diff_change_bg = "#D5E1F0",   -- subtle blue-tinted background for changed lines
  diff_text_bg = "#B8D0F0",     -- slightly brighter for changed text within line
  diff_add_char = "#B8D9B0",    -- deeper green for inserted characters
  diff_delete_char = "#F0B8B8", -- deeper red for deleted characters

  -- Visual selection
  visual = "#B4C8E0",

  -- Cursor line
  cursorline = "#DFE5ED",

  -- Cursor (high contrast for visibility)
  cursor_fg = "#FFFFFF",
  cursor_bg = "#000000",
}

-- Select color palette based on style
local style = config.style or "dark"
local colors = (style == "light") and colors_light or colors_dark

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
vim.o.background = style
vim.o.termguicolors = true

-- Base highlights
hl("Normal", { fg = colors.fg2, bg = transparent_bg(colors.bg0) })
hl("NormalFloat", { fg = colors.fg2, bg = colors.statusbar_bg })
hl("NormalNC", { fg = colors.fg2, bg = transparent_bg(colors.bg0) }) -- Same as Normal for consistent background
hl("EndOfBuffer", { fg = transparent_bg(colors.bg0) })
hl("WinSeparator", { fg = colors.border })
hl("FloatBorder", { fg = colors.statusbar_bg, bg = colors.statusbar_bg })

-- Cursor
hl("Cursor", { fg = colors.cursor_fg, bg = colors.cursor_bg })
hl("CursorLine", { bg = transparent_bg(colors.cursorline) })
hl("CursorLineNr", { fg = colors.fg0, bg = transparent_bg(colors.cursorline), bold = true })
hl("CursorColumn", { bg = transparent_bg(colors.cursorline) })
hl("TermCursor", { fg = colors.cursor_fg, bg = colors.cursor_bg })
hl("TermCursorNC", { fg = colors.cursor_fg, bg = colors.fg2 })

-- Line numbers
hl("LineNr", { fg = colors.fg4 })
hl("LineNrAbove", { fg = colors.fg4 })
hl("LineNrBelow", { fg = colors.fg4 })

-- Status line (using custom statusbar_bg color)
hl("StatusLine", { fg = colors.fg2, bg = colors.statusbar_bg })
hl("StatusLineNC", { fg = colors.fg2, bg = colors.statusbar_bg })
hl("StatusLineTerm", { fg = colors.fg2, bg = colors.statusbar_bg })
hl("StatusLineTermNC", { fg = colors.fg2, bg = colors.statusbar_bg })

-- Tab line
hl("TabLine", { fg = colors.fg2, bg = colors.bg1 })
hl("TabLineFill", { bg = colors.bg1 })
hl("TabLineSel", { fg = colors.fg0, bg = colors.bg0, bold = true })
hl("TabLineSelModified", { fg = colors.cyan, bg = colors.bg0 })

-- Sign column
hl("SignColumn", { bg = transparent_bg(colors.bg0) })
hl("FoldColumn", { fg = colors.fg4, bg = transparent_bg(colors.bg0) })

-- Folding
hl("Folded", { fg = colors.fg3, bg = transparent_bg(colors.bg0), italic = true })
hl("FoldColumn", { fg = colors.fg4, bg = transparent_bg(colors.bg0) })

-- Search
hl("Search", { fg = colors.bg0, bg = colors.orange, blend = 80 })
hl("IncSearch", { fg = colors.bg0, bg = colors.yellow, blend = 80 })
hl("CurSearch", { fg = colors.bg0, bg = colors.orange, blend = 80 })

-- Visual selection
hl("Visual", { bg = colors.visual })
hl("VisualNOS", { bg = colors.visual, blend = 20 })
hl("VisualInDiff", { bg = colors.visual })

-- Messages
hl("ErrorMsg", { fg = colors.red, bold = true })
hl("WarningMsg", { fg = colors.yellow, bold = true })
hl("ModeMsg", { fg = colors.fg2 })
hl("MoreMsg", { fg = colors.cyan })
hl("Question", { fg = colors.cyan })

-- Popup menu (completion menu and documentation)
hl("Pmenu", { fg = colors.fg2, bg = colors.statusbar_bg })
hl("PmenuSel", { fg = colors.fg0, bg = colors.bg4 })
hl("PmenuSbar", { bg = colors.statusbar_bg })
hl("PmenuThumb", { bg = colors.bg4 })
hl("PmenuBorder", { fg = colors.border, bg = colors.statusbar_bg })
hl("WildMenu", { fg = colors.cyan, bg = colors.bg4 })

-- Diff (subtle VSCode-like backgrounds)
hl("DiffAdd", { bg = colors.diff_add_bg })
hl("DiffChange", { bg = colors.diff_change_bg })
hl("DiffDelete", { bg = colors.diff_delete_bg })
hl("DiffText", { bg = colors.diff_text_bg })
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

-- Markup highlights (for lazy.nvim and other plugins)
hl("@markup.link", { fg = colors.cyan, underline = true })
hl("@markup.link.label", { fg = colors.cyan })
hl("@markup.link.url", { fg = colors.cyan, underline = true })
hl("@markup.raw", { fg = colors.orange })
hl("@markup.raw.markdown_inline", { fg = colors.orange })
hl("@markup.heading", { fg = colors.cyan, bold = true })
hl("@markup.italic", { italic = true })
hl("@markup.strong", { bold = true })
hl("@markup.strikethrough", { strikethrough = true })

-- LSP highlights
hl("LspReferenceText", { bg = colors.bg4, blend = 50 })
hl("LspReferenceRead", { bg = colors.bg4, blend = 50 })
hl("LspReferenceWrite", { bg = colors.bg4, blend = 50 })

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

-- LSP Hover/Documentation
hl("LspInfoBorder", { fg = colors.statusbar_bg, bg = colors.statusbar_bg })
hl("LspFloatWinNormal", { fg = colors.fg2, bg = colors.statusbar_bg })
hl("LspFloatWinBorder", { fg = colors.statusbar_bg, bg = colors.statusbar_bg })

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

-- Git signs (gutter signs and line highlights)
hl("GitSignsAdd", { fg = colors.green })
hl("GitSignsChange", { fg = colors.yellow })
hl("GitSignsDelete", { fg = colors.red })
hl("GitSignsAddNr", { fg = colors.green })
hl("GitSignsChangeNr", { fg = colors.yellow })
hl("GitSignsDeleteNr", { fg = colors.red })
hl("GitSignsAddLn", { bg = colors.diff_add_bg })
hl("GitSignsChangeLn", { bg = colors.diff_change_bg })
hl("GitSignsDeleteLn", { bg = colors.diff_delete_bg })
-- GitSigns inline word diff (for deleted/added characters within a line)
hl("GitSignsAddInline", { bg = colors.diff_add_char })
hl("GitSignsDeleteInline", { bg = colors.diff_delete_char })
hl("GitSignsChangeInline", { bg = colors.diff_text_bg })
-- GitSigns virtual lines for deleted content
hl("GitSignsDeleteVirtLn", { fg = colors.fg3, bg = colors.diff_delete_bg })
hl("GitSignsDeleteVirtLnInline", { bg = colors.diff_delete_char })
-- GitSigns staged changes
hl("GitSignsStagedAdd", { fg = colors.green })
hl("GitSignsStagedChange", { fg = colors.yellow })
hl("GitSignsStagedDelete", { fg = colors.red })
hl("GitSignsStagedAddNr", { fg = colors.green })
hl("GitSignsStagedChangeNr", { fg = colors.yellow })
hl("GitSignsStagedDeleteNr", { fg = colors.red })
hl("GitSignsStagedAddLn", { bg = colors.diff_add_bg })
hl("GitSignsStagedChangeLn", { bg = colors.diff_change_bg })
hl("GitSignsStagedDeleteLn", { bg = colors.diff_delete_bg })

-- Indent guides
hl("IndentBlanklineChar", { fg = colors.fg4, blend = 70 })
hl("IndentBlanklineContextChar", { fg = colors.fg4 })
hl("IndentBlanklineSpaceChar", { fg = colors.fg4, blend = 70 })
hl("IndentBlanklineContextSpaceChar", { fg = colors.fg4 })

-- NvimTree
hl("NvimTreeNormal", { fg = colors.fg2, bg = transparent_sidebar_bg(colors.bg1) })
hl("NvimTreeNormalNC", { fg = colors.fg2, bg = transparent_sidebar_bg(colors.bg1) })
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
hl("WhichKeyBorder", { fg = colors.border, bg = colors.bg2 })
hl("WhichKeyNormal", { fg = colors.fg2, bg = colors.bg2 })
hl("WhichKeyValue", { fg = colors.fg3 })

-- Mason
hl("MasonNormal", { fg = colors.fg2, bg = colors.bg2 })
hl("MasonHeader", { fg = colors.bg0, bg = colors.cyan, bold = true })
hl("MasonHeaderSecondary", { fg = colors.bg0, bg = colors.orange, bold = true })
hl("MasonHighlight", { fg = colors.cyan })
hl("MasonHighlightBlock", { fg = colors.cyan })
hl("MasonHighlightBlockBold", { fg = colors.cyan, bold = true })
hl("MasonHighlightSecondary", { fg = colors.orange })
hl("MasonHighlightBlockSecondary", { fg = colors.orange })
hl("MasonHighlightBlockBoldSecondary", { fg = colors.orange, bold = true })
hl("MasonMuted", { fg = colors.fg4 })
hl("MasonMutedBlock", { fg = colors.fg4 })
hl("MasonMutedBlockBold", { fg = colors.fg4, bold = true })
hl("MasonError", { fg = colors.red })
hl("MasonWarning", { fg = colors.yellow })
hl("MasonHeading", { fg = colors.fg0, bold = true })

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

-- Cmp documentation window
hl("CmpDoc", { fg = colors.fg2, bg = colors.statusbar_bg })
hl("CmpDocBorder", { fg = colors.statusbar_bg, bg = colors.statusbar_bg })

-- Blink.cmp (alternative completion plugin)
hl("BlinkCmpMenu", { fg = colors.fg2, bg = colors.statusbar_bg })
hl("BlinkCmpMenuBorder", { fg = colors.border, bg = colors.statusbar_bg })
hl("BlinkCmpMenuSelection", { fg = colors.fg0, bg = colors.bg4 })
hl("BlinkCmpDoc", { fg = colors.fg2, bg = colors.statusbar_bg })
hl("BlinkCmpDocBorder", { fg = colors.border, bg = colors.statusbar_bg })
hl("BlinkCmpDocSeparator", { fg = colors.border, bg = colors.statusbar_bg })
hl("BlinkCmpSignatureHelp", { fg = colors.fg2, bg = colors.statusbar_bg })
hl("BlinkCmpSignatureHelpBorder", { fg = colors.border, bg = colors.statusbar_bg })
hl("BlinkCmpLabel", { fg = colors.fg2 })
hl("BlinkCmpLabelMatch", { fg = colors.cyan })
hl("BlinkCmpLabelDeprecated", { fg = colors.fg3, strikethrough = true })
hl("BlinkCmpKind", { fg = colors.purple })
hl("BlinkCmpKindFunction", { fg = colors.yellow })
hl("BlinkCmpKindMethod", { fg = colors.yellow })
hl("BlinkCmpKindField", { fg = colors.fg2 })
hl("BlinkCmpKindVariable", { fg = colors.fg2 })
hl("BlinkCmpKindClass", { fg = colors.green })
hl("BlinkCmpKindInterface", { fg = colors.green, italic = true })
hl("BlinkCmpKindModule", { fg = colors.green })
hl("BlinkCmpKindProperty", { fg = colors.fg2 })
hl("BlinkCmpKindKeyword", { fg = colors.cyan })
hl("BlinkCmpKindText", { fg = colors.fg2 })
hl("BlinkCmpKindSnippet", { fg = colors.orange })
hl("BlinkCmpKindFile", { fg = colors.blue })
hl("BlinkCmpKindFolder", { fg = colors.blue })
hl("BlinkCmpKindEnum", { fg = colors.green })
hl("BlinkCmpKindEnumMember", { fg = colors.green, bold = true })
hl("BlinkCmpKindConstant", { fg = colors.cyan })
hl("BlinkCmpKindStruct", { fg = colors.green })
hl("BlinkCmpKindTypeParameter", { fg = colors.green })
hl("BlinkCmpSource", { fg = colors.fg3 })

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
hl("NoiceCmdlinePopup", { bg = colors.bg1 })
hl("NoiceCmdlinePopupBorder", { fg = colors.border, bg = colors.bg1 })
hl("NoiceCmdlineIcon", { fg = colors.cyan })
hl("NoiceConfirm", { bg = colors.bg1 })
hl("NoiceConfirmBorder", { fg = colors.border, bg = colors.bg1 })
hl("NoiceLspProgressTitle", { fg = colors.fg2, bg = colors.bg1 })
hl("NoicePopup", { fg = colors.fg2, bg = colors.bg1 })
hl("NoicePopupBorder", { fg = colors.border, bg = colors.bg1 })

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
hl("WinBar", { fg = colors.fg2, bg = transparent_bg(colors.bg0) })
hl("WinBarNC", { fg = colors.fg3, bg = transparent_bg(colors.bg0) })

-- MatchParen
hl("MatchParen", { fg = colors.cyan, bg = colors.bg4, bold = true })

-- Whitespace
hl("Whitespace", { fg = colors.fg4 })

-- Quickfix
hl("QuickFixLine", { bg = colors.bg4 })
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

-- Lazy.nvim plugin manager (complete highlight groups from https://lazy.folke.io/configuration/highlights)
hl("LazyNormal", { fg = colors.fg2, bg = colors.bg2 })
hl("LazyBackdrop", { bg = colors.bg1 })
hl("LazyBold", { bold = true })
hl("LazyButton", { fg = colors.fg2, bg = colors.bg3 })
hl("LazyButtonActive", { fg = colors.bg0, bg = colors.cyan, bold = true })
hl("LazyComment", { fg = colors.fg3, italic = true })
hl("LazyCommit", { fg = colors.cyan })
hl("LazyCommitIssue", { fg = colors.yellow })
hl("LazyCommitScope", { fg = colors.fg3, italic = true })
hl("LazyCommitType", { fg = colors.cyan, bold = true })
hl("LazyDimmed", { fg = colors.fg4 })
hl("LazyDir", { fg = colors.cyan, underline = true })
hl("LazyError", { fg = colors.red })
hl("LazyH1", { fg = colors.bg0, bg = colors.cyan, bold = true })
hl("LazyH2", { fg = colors.cyan, bold = true })
hl("LazyInfo", { fg = colors.blue })
hl("LazyItalic", { italic = true })
hl("LazyLocal", { fg = colors.cyan })
hl("LazyNoCond", { fg = colors.yellow })
hl("LazyProgressDone", { fg = colors.cyan })
hl("LazyProgressTodo", { fg = colors.fg4 })
hl("LazyProp", { fg = colors.fg4 })
hl("LazyReasonCmd", { fg = colors.orange })
hl("LazyReasonEvent", { fg = colors.yellow })
hl("LazyReasonFt", { fg = colors.blue })
hl("LazyReasonImport", { fg = colors.green })
hl("LazyReasonKeys", { fg = colors.purple })
hl("LazyReasonPlugin", { fg = colors.cyan })
hl("LazyReasonRequire", { fg = colors.blue })
hl("LazyReasonRuntime", { fg = colors.teal })
hl("LazyReasonSource", { fg = colors.orange })
hl("LazyReasonStart", { fg = colors.green })
hl("LazySpecial", { fg = colors.cyan })
hl("LazyTaskOutput", { fg = colors.fg2 })
hl("LazyUrl", { fg = colors.cyan, underline = true })
hl("LazyValue", { fg = colors.orange })
hl("LazyWarning", { fg = colors.yellow })

-- Snacks.nvim highlights
-- Picker (Telescope-like interface)
hl("SnacksPickerNormal", { fg = colors.fg2, bg = transparent_bg(colors.bg0) })
hl("SnacksPickerBorder", { fg = colors.border, bg = transparent_bg(colors.bg0) })
hl("SnacksPickerTitle", { fg = colors.cyan, bg = transparent_bg(colors.bg0), bold = true })
hl("SnacksPickerPrompt", { fg = colors.fg2, bg = transparent_bg(colors.bg0) })
hl("SnacksPickerPromptBorder", { fg = colors.border, bg = transparent_bg(colors.bg0) })
hl("SnacksPickerResults", { fg = colors.fg2, bg = transparent_bg(colors.bg0) })
hl("SnacksPickerResultsBorder", { fg = colors.border, bg = transparent_bg(colors.bg0) })
hl("SnacksPickerPreview", { fg = colors.fg2, bg = transparent_bg(colors.bg0) })
hl("SnacksPickerPreviewBorder", { fg = colors.border, bg = transparent_bg(colors.bg0) })
hl("SnacksPickerSelection", { fg = colors.cyan, bg = colors.bg4 })
hl("SnacksPickerSelectionCaret", { fg = colors.cyan })
hl("SnacksPickerMatching", { fg = colors.orange })
hl("SnacksPickerCounter", { fg = colors.fg3, bg = transparent_bg(colors.bg0) })
-- hl("SnacksPickerSearch", { fg = colors.orange, bg = colors.bg0 })
hl("SnacksPicker", { fg = colors.fg2, bg = transparent_bg(colors.bg0) })
hl("SnacksPickerIdx", { fg = colors.cyan, bg = "NONE" })
hl("SnacksPickerToggle", { fg = colors.cyan, bg = "NONE" })

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
hl("SnacksZenNormal", { fg = colors.fg2, bg = transparent_bg(colors.bg0) })
hl("SnacksZenBorder", { fg = colors.border, bg = transparent_bg(colors.bg0) })

-- Scratch buffer
hl("SnacksScratchNormal", { fg = colors.fg2, bg = transparent_bg(colors.bg0) })
hl("SnacksScratchBorder", { fg = colors.border, bg = transparent_bg(colors.bg0) })
hl("SnacksScratchTitle", { fg = colors.cyan, bg = transparent_bg(colors.bg0), bold = true })

-- Terminal
hl("SnacksTerminalNormal", { fg = colors.fg2, bg = transparent_sidebar_bg(colors.bg1) })
hl("SnacksTerminalBorder", { fg = colors.border, bg = transparent_sidebar_bg(colors.bg1) })
hl("SnacksTerminalTitle", { fg = colors.cyan, bg = transparent_sidebar_bg(colors.bg1), bold = true })

-- Git browse
hl("SnacksGitBrowseNormal", { fg = colors.fg2, bg = transparent_bg(colors.bg0) })
hl("SnacksGitBrowseBorder", { fg = colors.border, bg = transparent_bg(colors.bg0) })

-- Dashboard
hl("SnacksDashboardNormal", { fg = colors.fg2, bg = transparent_bg(colors.bg0) })
hl("SnacksDashboardBorder", { fg = colors.border, bg = transparent_bg(colors.bg0) })
hl("SnacksDashboardTitle", { fg = colors.cyan, bg = transparent_bg(colors.bg0), bold = true })
hl("SnacksDashboardKey", { fg = colors.cyan, bg = transparent_bg(colors.bg0) })
hl("SnacksDashboardDesc", { fg = colors.fg2, bg = transparent_bg(colors.bg0) })
hl("SnacksDashboardIcon", { fg = colors.blue, bg = transparent_bg(colors.bg0) })
hl("SnacksDashboardFooter", { fg = colors.fg3, bg = transparent_bg(colors.bg0) })

-- Win (floating windows)
hl("SnacksWinNormal", { fg = colors.fg2, bg = colors.bg1 })
hl("SnacksWinBorder", { fg = colors.border, bg = colors.bg1 })
hl("SnacksWinTitle", { fg = colors.cyan, bg = colors.bg1, bold = true })

-- Debug
hl("SnacksDebugNormal", { fg = colors.fg2, bg = transparent_bg(colors.bg0) })
hl("SnacksDebugBorder", { fg = colors.border, bg = transparent_bg(colors.bg0) })
hl("SnacksDebugTitle", { fg = colors.purple, bg = transparent_bg(colors.bg0), bold = true })

-- Toggle
hl("SnacksToggleNormal", { fg = colors.fg2, bg = transparent_bg(colors.bg0) })
hl("SnacksToggleActive", { fg = colors.cyan, bg = transparent_bg(colors.bg0), bold = true })
hl("SnacksToggleInactive", { fg = colors.fg3, bg = transparent_bg(colors.bg0) })

-- Dim
hl("SnacksDimNormal", { fg = colors.fg3, bg = transparent_bg(colors.bg0) })
hl("SnacksDimBuffer", { fg = colors.fg3, bg = transparent_bg(colors.bg0) })

-- Words (word navigation)
hl("SnacksWordsMatch", { fg = colors.cyan, underline = true })
hl("SnacksWordsCurrent", { fg = colors.orange, underline = true })

-- Common snack components
hl("SnacksNormal", { fg = colors.fg2, bg = transparent_bg(colors.bg0) })
hl("SnacksBorder", { fg = colors.border, bg = transparent_bg(colors.bg0) })
hl("SnacksFloatBorder", { fg = colors.border, bg = colors.bg1 })
hl("SnacksTitle", { fg = colors.cyan, bg = transparent_bg(colors.bg0), bold = true })
hl("SnacksIcon", { fg = colors.cyan, bg = transparent_bg(colors.bg0) })
hl("SnacksKey", { fg = colors.cyan, bg = transparent_bg(colors.bg0) })
hl("SnacksDesc", { fg = colors.fg2, bg = transparent_bg(colors.bg0) })
hl("SnacksSeparator", { fg = colors.border, bg = transparent_bg(colors.bg0) })
hl("SnacksSelected", { fg = colors.cyan, bg = colors.bg4 })
hl("SnacksMatching", { fg = colors.orange })
hl("SnacksCounter", { fg = colors.fg3, bg = transparent_bg(colors.bg0) })
hl("SnacksPrompt", { fg = colors.fg2, bg = transparent_bg(colors.bg0) })
hl("SnacksPromptPrefix", { fg = colors.cyan, bg = transparent_bg(colors.bg0) })
