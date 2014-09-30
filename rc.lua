-- Standard awesome library
gears = require("gears")

awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")

-- Widget and layout library
wibox = require("wibox")

-- Theme handling library
beautiful = require("beautiful")

-- Notification library
naughty = require("naughty")
--menubar = require("menubar")

-- git clone git clone http://git.sysphere.org/vicious $HOME/.config/awesome/
vicious = require("vicious")

-- freedesktop
-- git clone https://github.com/terceiro/awesome-freedesktop.git $HOME/.config/awesome/
require('awesome-freedesktop.freedesktop.utils')
require('awesome-freedesktop.freedesktop.menu')
require('awesome-freedesktop.freedesktop.desktop')

--revelation - both gits are buggy
-- git clone https://bioe007@github.com/bioe007/awesome-revelation.git $HOME/.config/awesome/revelation
-- git clone https://github.com/guotsuan/awesome-revelatio $HOME/.config/awesome/revelation
--local revelation = require("revelation")

--lain
-- git clone https://github.com/copycat-killer/lain.git $HOME/.config/awesome/lain
lain = require("lain")

configdir=awful.util.getdir("config")

-- ---------------------------------------------
-- ERROR HANDLING
-- ---------------------------------------------
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end

-- ---------------------------------------------
-- Variable definitions
-- ---------------------------------------------
-- Themes define colours, icons, and wallpapers
beautiful.init(configdir .. "/themes/awtheme/theme.lua")

-- This is used later as the default terminal and editor to run.
-- terminal    =   "xterm"
terminal			=	"urxvt"
browser				=	"firefox" -- bound to alt+shift+1
filebrowser			=	"pcmanfm" -- bound to alt+shift+2
browser_fallback	=   "chromium"
editor				=	os.getenv("EDITOR") or "vim"
editor_cmd			=	terminal .. " -e " .. editor
-- guieditor			=   "gvim"
guieditor			=	"beaver"
ide					=	"subl" --sublime text 2

printscrcmd			=	terminal .. "-e scrot" -- defined in ~/.bashrc
-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"
-- ---------------------------------------------
-- Wallpaper
-- ---------------------------------------------
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end

dofile( configdir .. "/tags.lua" )
dofile( configdir .. "/menu.lua" )
dofile( configdir .. "/widgets.lua" )
dofile( configdir .. "/layout.lua" )
dofile( configdir .. "/keys.lua" )
dofile( configdir .. "/rules.lua" )
dofile( configdir .. "/signals.lua" )
