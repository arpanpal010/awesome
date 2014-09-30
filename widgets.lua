-- WIDGETS
-- ---------------------------------------------
-- space and separator widget
spacer = wibox.widget.textbox()
spacer:set_text(" ")
separator = wibox.widget.textbox()
separator:set_text(" | ")

-- textclock
mytextclock = awful.widget.textclock("%a %Y-%m-%d %H:%M:%S ", 1, {align="right"})

-- assault battery widget
local assault=require("battery")
batterywidget = assault({critical_level = 0.15, critical_color = "#ff0000", charging_color = "#00ff00"})

-- volume control
volicon = wibox.widget.imagebox()
volicon:set_image(beautiful.volicon)
volumecfg = require("volume")
--volumecfg = lain.widgets.alsabar()

-- launchbar
local launchbar = require("launchbar")
mylaunchbar = launchbar(configdir .. "/launchbar/")
