local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

math.randomseed(os.time())

local function pick_color()
	local colors = { "String", "Identifier", "Keyword", "Number" }
	return colors[math.random(#colors)]
end

local function footer()
	local datetime = os.date(" %Y-%m-%d   %H:%M:%S")
	local version = vim.version()
	local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

	return datetime .. "  " .. nvim_version_info
end

local logo = {
	"██████████████████████████████████",
	"████████████████████  ████████████",
	"████████  ████████████████████████",
	"████████    ██████████████  ██████",
	"██              ██████████  ██████",
	"██████      ██████████████████████",
	"██████        ████████████████████",
	"████  ██████  ████████████  ██████",
	"██████████████████████████████████",
	"████████████████████  ████████████",
	"██████████████████████████████████",
}

dashboard.section.header.val = logo
dashboard.section.header.opts.hl = "Red"

dashboard.section.buttons.val = {
	dashboard.button("<Leader>e", "  NNN"),
	dashboard.button("<Leader>f", "  Find File"),
	dashboard.button("<Leader>g", "  Live Grep"),
	dashboard.button("Q", "  Quit"),
}

dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "Constant"

alpha.setup(dashboard.opts)

vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])