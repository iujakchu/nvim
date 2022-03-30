vim.cmd([[
function! g:__markdown_preview_self(url)
	silent exec "silent !google-chrome-stable --new-window " .a:url . " &"

endfunction
]])
vim.g.mkdp_browserfunc = "g:__markdown_preview_self"
