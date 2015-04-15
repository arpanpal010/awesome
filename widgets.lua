-- WIDGETS
-- ---------------------------------------------
-- spacer
    spacer = wibox.widget.textbox()
    spacer:set_text(" ")

-- separator
    separator = wibox.widget.textbox()
    separator:set_markup(markup.small(" &#183; "))

-- textclock
    -- textclock = awful.widget.textclock(" %a,%b %d %H:%M ", 5, {align="right"})
    require("obvious.clock")
    obvious.clock.set_shortformat(" %H:%M ")
    obvious.clock.set_shorttimer(5)
    obvious.clock.set_longformat(function() return " %a,%b %d %H:%M:%S " end)
    obvious.clock.set_longtimer(1)
    obvious.clock.set_editor(terminal .. " -e vim")
    textclock = obvious.clock()

-- assault battery widget
    -- local battcheck = "ls -A /sys/class/power_supply"
    -- local f = io.popen(battcheck)
    -- if f:lines() then
    --  local assault=require("battery")
    --  batterywidget = assault({
    --      battery = "BAT0",
    --      adapter = "ADP0",
    --      critical_level = 0.20,
    --      font = beautiful.font,
    --      normal_color = beautiful.bat_normal,
    --      critical_color = beautiful.bat_critical,
    --      charging_color = beautiful.bat_charging

	batteryicon = wibox.widget.imagebox()
	batteryicon:set_image(beautiful.batticon)
	batteryicon:set_resize("allowed")
    require("obvious.battery")
    batterywidget = obvious.battery()

-- volume control
    volicon = wibox.widget.imagebox()
    volicon:set_image(beautiful.volicon)
    volicon:set_resize("allowed")
    volicon:buttons(awful.util.table.join(
        awful.button({}, 1, function() awful.util.spawn(volcmd) end)
    ))
    volumewidget = require("volume")

--wifi icon
    wlicon = wibox.widget.imagebox()
    wlicon:set_image(beautiful.wlicon)
    wlicon:buttons(awful.util.table.join(
        awful.button({}, 1, function() awful.util.spawn(wlcmd) end)
    ))
    require("obvious.wlan")
    wlwidget = obvious.wlan(wldev).widget
    wlwidget:buttons(awful.util.table.join(
        awful.button({}, 2, function() awful.util.spawn(wlcmd) end)
    ))

-- launchbar
    -- local launchbar = require("launchbar")
    -- mylaunchbar = launchbar(configdir .. "/launchbar/")
