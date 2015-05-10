-- Standard awesome library
gears = require("gears")
awful = require("awful")
awful.rules = require("awful.rules")
wibox = require("wibox") -- Widget and layout library
beautiful = require("beautiful") -- Theme handling library
naughty = require("naughty") -- Notification library
require("awful.autofocus")


-- vicious -- git clone git clone http://git.sysphere.org/vicious $HOME/.config/awesome/
    vicious = require("vicious")

-- obvious -- git clone https://github.com/hoelzro/obvious
    --obvious =  require("obvious")
    -- prp = require("obvious.popup_run_prompt")

-- revelation - both gits are buggy
    -- git clone https://bioe007@github.com/bioe007/awesome-revelation.git $HOME/.config/awesome/revelation
    -- git clone https://github.com/guotsuan/awesome-revelatio $HOME/.config/awesome/revelation
    --local revelation = require("revelation")

-- minitray from https://gist.github.com/alexander-yakushev/7840559
    -- minitray =  require("minitray")

-- lain
    -- git clone https://github.com/copycat-killer/lain.git $HOME/.config/awesome/lain
    lain = require("lain")
    markup = lain.util.markup -- text markup

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
beautiful.init(configdir .. "/themes/awtheme/theme.lua")
-- apps and cmds
    -- terminal           =   "xterm"
    terminal            = "urxvt"
    browser             = "firefox" -- bound to alt+shift+1
    filebrowser         = "pcmanfm" -- bound to alt+shift+2
    browser_fallback    = "chromium" -- may not be installed
    editor              = os.getenv("EDITOR") or "vim"
    editor_cmd          = terminal .. " -e " .. editor
    guieditor           = "beaver"
    ide                 = "subl" --sublime text 2

    updatecmd           = terminal .. " -e sudo pacman -Syu"
    printscrcmd         = "scrot -zm -q 89 'scrot-%Y-%m-%d_$wx$h.png' -e 'mv $f ~/' 2>/dev/null" -- defined in ~/.bashrc

    volcmd              = "pavucontrol" -- "alsamixer"

    etdev               = "enp6s0" -- ethernet 
    wldev               = "wlp3s0" -- wlan net device
    wlcmd               = terminal .. " -e wicd-curses"

-- toggle menu items
    show_mainmenu   = false  -- show freedesktop menu on top bar?
    show_menubar    = false  -- show menubar
    show_powermenu  = false  -- show power menu on top bar ?


-- Default modkey.
    -- Usually, Mod4 is the key with a logo between Control and Alt.
    -- If you do not like this or do not have such a key,
    -- I suggest you to remap Mod4 to another key using xmodmap or other tools.
    -- However, you can use another modifier like Mod1, but it may interact with others.
    modkey = "Mod4" -- start button
    altkey = "Mod1" -- alt button

-- ---------------------------------------------
-- Wallpaper
-- ---------------------------------------------
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end

-- JAVA GUI Fix
awful.util.spawn_with_shell("wmname LG3D") -- try Sawfish if problem occurs
-- awful.util.spawn_with_shell(configdir .. "/scripts/locker.sh") -- lockscreen with xautolock and i3lock
awful.util.spawn_with_shell("exec xautolock -detectsleep -time 5 -locker \"i3lock -d -e -t -i " .. beautiful.wallpaper .. "\" -notify 10 -notifier \"notify-send -u critical -t 5000 -- 'Locking screen in 5 seconds'\"") -- lockscreen with xautolock and i3lock
-- wallpaper must be PNG to be displayed as lockscreen

-- load all configs 
dofile( configdir .. "/tags.lua" )
dofile( configdir .. "/menu.lua" )
dofile( configdir .. "/widgets.lua" )
dofile( configdir .. "/layout.lua" )
dofile( configdir .. "/keys.lua" )
dofile( configdir .. "/rules.lua" )
dofile( configdir .. "/signals.lua" )
