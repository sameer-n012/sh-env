vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- line numbering options
opt.relativenumber = true -- show relative line numbers
opt.number = true -- show absolute line number on current line
-- opt.cursorline = true -- add underline under current line

-- tabbing & indentation options
opt.tabstop = 4 -- 4 spaces for tabs
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expands tab into spaces
opt.autoindent = true -- copies indent from current line into new one
opt.wrap = false -- do not wrap lines

-- search options
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if using mixed case, do not ignore case

-- colorscheme options
opt.termguicolors = true -- needed for truecolor terminal
opt.background = "dark" -- themes with light/dark will choose dark
opt.signcolumn = "yes" -- shows sign column

-- backspace options
opt.backspace = "eol,indent,start" -- allow backspace on EOL, indents, start position

-- clipboard options
opt.clipboard:append("unnamedplus") -- use system clipboard as default reg

-- splitting windows options
opt.splitright = false -- splitting window vertically goes to left
opt.splitbelow = false -- splitting window horizontally goes to bottom
