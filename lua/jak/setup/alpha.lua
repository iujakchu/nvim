local alpha = require "alpha"
local dashboard = require "alpha.themes.dashboard"

math.randomseed(os.time())

local function pick_color()
   local colors = { "String", "Identifier", "Keyword", "Number", "Function", "Special" }
   return colors[math.random(#colors)]
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
local color = pick_color()
dashboard.section.header.val = logo[math.random(#logo)]
dashboard.section.header.opts.hl = color

dashboard.section.buttons.val = {
   dashboard.button("<Leader>ff", "  "),
   dashboard.button("<Leader>fs", "  "),
   dashboard.button("<Leader>e", "  "),
   dashboard.button("Q", "  "),
}

dashboard.section.footer.val = {
   " ┏┓┏━┓╻┏    ╻┏━┓",
   "  ┃┣━┫┣┻┓    ┗━┓",
   "┗━┛╹ ╹╹ ╹    ┗━┛",
}

dashboard.section.footer.opts.hl = color

alpha.setup(dashboard.opts)

vim.api.nvim_create_autocmd("FileType", {
   pattern = "alpha",
   command = "setlocal nofoldenable",
})
