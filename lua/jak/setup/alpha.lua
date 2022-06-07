local alpha = require "alpha"
local dashboard = require "alpha.themes.dashboard"

math.randomseed(os.time())

local function pick_color()
   local colors = { "String", "Identifier", "Keyword", "Number" }
   return colors[math.random(#colors)]
end

local function footer()
   local datetime = os.date " %Y-%m-%d   %H:%M:%S"
   local version = vim.version()
   local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

   return datetime .. "  " .. nvim_version_info
end

local logo = {
   {
      "                                 ",
      "                                 ",
      "                                 ",
      "                                 ",
      "       ██              ██        ",
      "         ██          ██          ",
      "           ██      ██            ",
      "         ████      ████          ",
      "         ████      ████          ",
      "                                 ",
      "             ██████              ",
      "           ██      ██            ",
      "                                 ",
      "                                 ",
      "                                 ",
      "                                 ",
      "                                 ",
   },
   {
      "      ██  ██                ",
      "    ██  ██  ██              ",
      "    ██  ██  ██              ",
      "    ██  ██  ██              ",
      "  ██        ██              ",
      "██            ██████        ",
      "██    ██            ██      ",
      "██    ██              ██████",
      "██                    ██  ██",
      "  ████                  ████",
      "      ██        ████      ██",
      "    ██    ██████          ██",
      "    ██████      ████████████",
      "████████████████████████████",
   },
   {
      "                          ████████      ",
      "                      ████░░░░██████    ",
      "                    ██░░  ░░░░░░████    ",
      "                  ██  ░░  ░░░░░░▒▒██    ",
      "                ██    ░░  ░░░░░░░░██    ",
      "              ██      ░░        ██      ",
      "            ██        ░░░░░░░░░░██      ",
      "          ██        ░░        ██        ",
      "          ██      ░░        ██          ",
      "        ██      ░░        ██            ",
      "        ██    ░░        ██              ",
      "        ██  ░░        ██                ",
      "        ██░░      ████                  ",
      "      ██░░████████                      ",
      "    ██░░██                              ",
      "    ████                                ",
      "  ██                                    ",
      "                                        ",
   },
}
dashboard.section.header.val = logo[math.random(#logo)]
dashboard.section.header.opts.hl = pick_color()

dashboard.section.buttons.val = {
   dashboard.button("<Leader>ff", "  Find File"),
   dashboard.button("<Leader>fs", "  Live Grep"),
   dashboard.button("<Leader>e", "  Exp"),
   dashboard.button("Q", "  Quit"),
}

dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "Constant"

alpha.setup(dashboard.opts)

vim.api.nvim_create_autocmd("FileType", {
   pattern = "alpha",
   command = "setlocal nofoldenable",
})
