-- Widget and layout library
local wibox = require("wibox")
local awful = require("awful")

volumecfg = {}
volumecfg.cardid  = 0
volumecfg.channel = "Master"
volumecfg.widget = wibox.widget.textbox(volumecfg.widget, {align = "right"})
volumecfg.controller = 'pavucontrol' -- 'alsamixer'
-- command must start with a space!
volumecfg.mixercommand = function (command)
--  local fd = io.popen("amixer -c " .. volumecfg.cardid .. command)
  local fd = io.popen("amixer -D default " .. command)
  local status = fd:read("*all")
  fd:close()
  local volume = string.match(status, "(%d?%d?%d)%%")
  volume = string.format("% 3d", volume)
  status = string.match(status, "%[(o[^%]]*)%]")
  if string.find(status, "on", 1, true) then
    volume = volume .. "%"
    color = "#FFFFFF"
  else   
    volume = volume .. "M"
    color = "#FF0000"
  end
  volumecfg.widget:set_markup("<span color=\"" .. color .. "\">" .. volume .. "</span>")
  -- display the bar"</span>"
  --status = ""
  --for i = 1, math.floor(volume / 10) do
  --  status = status .. "|"
  --end
  --for i = math.floor(volume / 10) + 1, 10 do
  --  status = status .. "-"
  --end
  --status = "-[" ..status .. "]+"
  --volumecfg.widget:set_markup("<span color=\"" .. color .. "\">" .. status .. "</span>")
end
volumecfg.update = function ()
      volumecfg.mixercommand(" sget " .. volumecfg.channel)
end
volumecfg.up = function ()
      volumecfg.mixercommand(" sset " .. volumecfg.channel .. " 2%+")
      volumecfg.update()
end
volumecfg.down = function ()
      volumecfg.mixercommand(" sset " .. volumecfg.channel .. " 2%-")
      volumecfg.update()
end
volumecfg.toggle = function ()
      volumecfg.mixercommand(" sset " .. volumecfg.channel .. " toggle")
      volumecfg.update()
end
volumecfg.widget:buttons(awful.util.table.join(
      awful.button({ }, 4, function () volumecfg.up() end),
      awful.button({ }, 5, function () volumecfg.down() end),
      awful.button({ }, 1, function () volumecfg.toggle() end),
      awful.button({ }, 3, function () awful.util.spawn(volumecfg.controller) end)
))
volumecfg.update()
return volumecfg
