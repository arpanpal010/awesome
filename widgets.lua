-- WIDGETS
-- ---------------------------------------------
-- spacer
    spacer = wibox.widget.textbox()
    spacer:set_text(" ")

-- separator
    separator = wibox.widget.textbox()
    separator:set_markup(markup.small(" &#183; "))

-- textclock
    require("obvious.clock")
    obvious.clock.set_shortformat(" %H:%M ")
    obvious.clock.set_shorttimer(5)
    obvious.clock.set_longformat(function() return " %a,%b %d %H:%M:%S " end)
    obvious.clock.set_longtimer(1)
    obvious.clock.set_editor(terminal .. " -e vim")
    textclock = obvious.clock()

-- battery widget
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
--    wlicon = wibox.widget.imagebox()
--    wlicon:set_image(beautiful.wlicon)
--    wlicon:buttons(awful.util.table.join(
--        awful.button({}, 1, function() awful.util.spawn(wlcmd) end)
--    ))
--    require("obvious.wlan")
--    wlwidget = obvious.wlan(wldev).widget
--    wlwidget:buttons(awful.util.table.join(
--        awful.button({}, 2, function() awful.util.spawn(wlcmd) end)
--    ))
--
    local net_widgets=require("net_widgets")
    net_wireless=net_widgets.wireless({
        interface=wldev,
        popup_signal=true,
        -- onclick=awful.util.spawn("wicd-gtk")
        onclick=terminal .. " -e wicd-curses"
    });

    net_wired = net_widgets.indicator({
        interfaces={"enp6s0"},
    })

-- launchbar
    -- local launchbar = require("launchbar")
    -- mylaunchbar = launchbar(configdir .. "/launchbar/")
