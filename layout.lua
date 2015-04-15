mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({        }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({        }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({        }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({        }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

topwibox = {} -- wibox container on top 
botwibox = {} -- wibox container at bottom
mypromptbox = {}
mylayoutbox = {}

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()

    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                        -- R/L clicks
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                        -- scroll buttons
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- top bar
    topwibox[s] = awful.wibox({ position = "top", screen = s, height = beautiful.statusbar_height}) -- ontop = true for always on top

    -- Widgets that are aligned to the left
    local left_top_layout = wibox.layout.fixed.horizontal()
        if menulauncher then
            left_top_layout:add(menulauncher)
        end
	  
        left_top_layout:add(mytaglist[s])
        left_top_layout:add(spacer)

    -- Widgets that are aligned to the right
    local right_top_layout = wibox.layout.fixed.horizontal()
         -- if s == 1 then right_top_layout:add(wibox.widget.systray()) end
         right_top_layout:add(wibox.widget.systray())
        if batterywidget then
    		right_top_layout:add(batteryicon)
    		right_top_layout:add(batterywidget)
    		right_top_layout:add(separator)
    	end
    	if wlwidget then
        	right_top_layout:add(wlicon)
        	right_top_layout:add(wlwidget)
        	right_top_layout:add(separator)
	    end
    	if volumewidget then
    	    right_top_layout:add(volicon)
    	    right_top_layout:add(volumewidget.widget)
        	right_top_layout:add(spacer)
    	end
        right_top_layout:add(textclock)
        right_top_layout:add(mylayoutbox[s])
	    if powlauncher then
    	    right_top_layout:add(powlauncher)
    	end

    -- bottom bar
    -- botwibox[s] =  awful.wibox({ position = "bottom", screen = s})

    -- Widgets that are aligned to the left
    -- local left_bot_layout = wibox.layout.fixed.horizontal()
        --left_bot_layout:add(spacer)
        --left_bot_layout:add(mylaunchbar)
        -- left_bot_layout:add(separator)
        -- left_bot_layout:add(mypromptbox[s])
        --left_bot_layout:add(spacer)
        --left_bot_layout:add(cpuwidget)
        --left_bot_layout:add(spacer)
        --left_bot_layout:add(memwidget)
        --left_bot_layout:add(spacer)

    -- Widgets that are aligned to the rieght
    --local right_bot_layout = wibox.layout.fixed.horizontal()
        --right_bot_layout:add(separator)
    	--right_bot_layout:add(mytaglist[s])
        --right_bot_layout:add(separator)
        --right_bot_layout:add(mylayoutbox[s])

    -- Now bring it all together (with the tasklist in the middle)
    local top_layout = wibox.layout.align.horizontal()
        top_layout:set_left(left_top_layout)
        top_layout:set_middle(mytasklist[s])
        top_layout:set_right(right_top_layout)

    -- local bot_layout = wibox.layout.align.horizontal()
        -- bot_layout:set_left(left_bot_layout)
        -- bot_layout:set_middle(mylaunchbar)
        -- bot_layout:set_right(right_bot_layout)

    topwibox[s]:set_widget(top_layout)
    -- botwibox[s]:set_widget(bot_layout)
end
-- }}}
