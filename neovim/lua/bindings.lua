vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.keymap.set({'n', 'i', 'v'}, '<F7>', '<ESC>')
vim.keymap.set('n','<C-q>', vim.lsp.buf.hover)
vim.keymap.set('n', '<C-cr>', vim.lsp.buf.completion)
vim.keymap.set('n', '<C-cr>', vim.lsp.buf.completion)
