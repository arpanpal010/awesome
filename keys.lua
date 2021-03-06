-- ---------------------------------------------
-- MOUSE
-- ---------------------------------------------
root.buttons(awful.util.table.join(
  awful.button({ }, 3, function () menu_side:toggle() end)
  --awful.button({ }, 4, awful.tag.viewprev),
  --awful.button({ }, 5, awful.tag.viewnext)
))

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))


-- ---------------------------------------------
-- KEYBOARD global
-- ---------------------------------------------
globalkeys = awful.util.table.join(
    -- shortcuts bind alt+shift+(1--9) to various apps
    awful.key({ altkey, "Shift"   }, "1",       function () awful.util.spawn(browser) end), -- firefox
    awful.key({ altkey, "Shift"   }, "2",       function () awful.util.spawn(filebrowser) end), -- pcmanfm
    awful.key({ altkey, "Shift"   }, "3",       function () awful.util.spawn(terminal .." -e tmux") end), -- tmux
    awful.key({ altkey, "Shift"   }, "4",       function () awful.util.spawn(editor_cmd) end), -- vim
    awful.key({ altkey, "Shift"   }, "5",       function () awful.util.spawn(ide) end), -- sublime
    -- awful.key({ altkey,  "Shift"   }, "6",       function () awful.util.spawn(filebrowser) end),
    -- awful.key({ altkey,  "Shift"   }, "7",       function () awful.util.spawn(filebrowser) end),
    -- awful.key({ altkey,  "Shift"   }, "8",       function () awful.util.spawn(filebrowser) end),
    -- awful.key({ altkey,  "Shift"   }, "9",       function () awful.util.spawn(filebrowser) end),
    -- awful.key({ altkey,  "Shift"   }, "0",       function () awful.util.spawn(filebrowser) end),
    -- awful.key({ altkey,  "Shift"   }, "-",       function () awful.util.spawn(filebrowser) end),
    -- awful.key({ altkey,  "Shift"   }, "=",       function () awful.util.spawn(filebrowser) end),
    -- xkill
    awful.key({ altkey, "Shift"   }, "BackSpace",function () awful.util.spawn("xkill") end),

    --lain useless gap resize
    awful.key({ altkey, "Control" }, "-", function () lain.util.useless_gaps_resize(5) end),
    awful.key({ altkey, "Control" }, "=", function () lain.util.useless_gaps_resize(-10) end),

    -- Navigation
    -- awful.key({ modkey,           }, "e", revelation),
    --awful.key({ modkey,           }, "e",       function () minitray.toggle()           end),

    awful.key({ modkey,           }, "h",       function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",       function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Control" }, "h",       function () awful.tag.incncol( 1)         end),

    awful.key({ modkey,           }, "j",       function () awful.client.focus.byidx( 1)
                                                    if client.focus then client.focus:raise() end end),
    awful.key({ modkey, "Shift"   }, "j",       function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Control" }, "j",       function () awful.screen.focus_relative( 1) end),

    awful.key({ modkey,           }, "k",       function () awful.client.focus.byidx(-1)
                                                    if client.focus then client.focus:raise() end end),
    awful.key({ modkey, "Shift"   }, "k",       function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "k",       function () awful.screen.focus_relative(-1) end),

    awful.key({ modkey,           }, "l",       function () awful.tag.incmwfact( 0.05)    end),
    -- awful.key({ modkey,           }, "l",       function () awful.util.spawn("xscreensaver-command -activate") end),
    awful.key({ modkey, "Shift"   }, "l",       function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "l",       function () awful.tag.incncol(-1)         end),

    awful.key({ modkey, "Control" }, "n",       awful.client.restore                         ),

    -- Menubar
    -- awful.key({ modkey,           }, "p",       function() menubar.show() end),
    
    awful.key({ modkey, "Control" }, "q",       awesome.quit),

    -- run prompt
    -- awful.key({ altkey,           }, "`",        function () prp.run_prompt() end),
    --awful.key({ modkey            }, "r",       function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey, "Control" }, "r",       awesome.restart),

    awful.key({ modkey,           }, "u",       awful.client.urgent.jumpto),

    awful.key({ modkey,           }, "w",       function () menu_side:toggle() end),

    -- awful.key({ modkey            }, "x",       function ()
    --                                            awful.prompt.run({ prompt = "Run Lua code: " },
    --                                                                mypromptbox[mouse.screen].widget,
    --                                                                awful.util.eval, nil,
    --                                                                awful.util.getdir("cache") .. "/history_eval")
    --                                            end),
    awful.key({ modkey,           }, "x",       function () awful.util.spawn('sync') awful.util.spawn("xautolock -locknow") end),
    awful.key({ modkey,           }, "z",       function () topwibox[mouse.screen].visible = not topwibox[mouse.screen].visible end),

    awful.key({ modkey,           }, "Escape",  awful.tag.history.restore),
    awful.key({ modkey,           }, "Left",    awful.tag.viewprev ),
    awful.key({ modkey,           }, "Right",   awful.tag.viewnext ),

    awful.key({ modkey,           }, "Return",  function () awful.util.spawn(terminal) end),
    awful.key({ modkey,           }, "space",   function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space",   function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey,           }, "Tab",     function ()
                                                  awful.client.focus.history.previous()
                                                  if client.focus then
                                                    client.focus:raise()
                                                  end
                                                end),
    -- scrot                                                    
    awful.key({ modkey,           }, "Print",   function ()
                                                    -- m for multihead
                                                    awful.util.spawn(printscrcmd .. " -m")
                                                    naughty.notify({
                                                        title="Scrot",
                                                        text="Screen captured to ~/screen-<date>_<resolution>.png",
                                                        timeout= 1
                                                    })
                                                end),

    awful.key({ altkey,           }, "Print",   function ()
                                                    --b=border u=only focused window
                                                    awful.util.spawn(printscrcmd .. " -bu")
                                                    naughty.notify({
                                                        title="Scrot",
                                                        text="Screen captured to ~/client-<date>_<resolution>.png",
                                                        timeout= 1
                                                    })
                                                end),

    -- volume buttons
    -- awful.key({                   }, "XF86AudioPrev",   function ()                        end),
    -- awful.key({                   }, "XF86AudioPlay",   function ()                        end),
    -- awful.key({                   }, "XF86AudioNext",   function ()                        end),
    awful.key({                   }, "XF86AudioMute",   function () volumecfg.toggle()     end),
    awful.key({                   }, "XF86AudioRaiseVolume",   function () volumecfg.up()  end),
    awful.key({                   }, "XF86AudioLowerVolume",   function () volumecfg.down() end)
)

-- ---------------------------------------------
-- KEYBOARD client windows
-- ---------------------------------------------
clientkeys = awful.util.table.join(
    awful.key({ modkey, "Shift"   }, "c",       function (c) c:kill()                         end),
    awful.key({ modkey,           }, "f",       function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey,           }, "m",       function (c)
                                                  c.maximized_horizontal = not c.maximized_horizontal
                                                  c.maximized_vertical   = not c.maximized_vertical
                                                end),
    -- lain magnify
    awful.key({ modkey, "Control" }, "m",       lain.util.magnify_client                     ),
    awful.key({ modkey,           }, "n",       function (c)
                                                  -- The client currently has the input focus, so it cannot be
                                                  -- minimized, since minimized clients can't have the focus.
                                                  c.minimized = true
                                                end),
    awful.key({ modkey,           }, "o",       awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, "t",       function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey, "Control" }, "t",       function (c) awful.titlebar.toggle(c)         end),
    awful.key({ modkey, "Control" }, "Return",  function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey, "Control" }, "space",   awful.client.floating.toggle                     )
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
            function ()
                local screen = mouse.screen
                local tag = awful.tag.gettags(screen)[i]
                if tag then awful.tag.viewonly(tag) end
            end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
            function ()
                local screen = mouse.screen
                local tag = awful.tag.gettags(screen)[i]
                if tag then awful.tag.viewtoggle(tag) end
            end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
            function ()
                if client.focus then
                    local tag = awful.tag.gettags(client.focus.screen)[i]
                    if tag then awful.client.movetotag(tag) end
                end
            end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
            function ()
                if client.focus then
                    local tag = awful.tag.gettags(client.focus.screen)[i]
                    if tag then awful.client.toggletag(tag) end
                end
            end))
end

-- Set keys
root.keys(globalkeys)
-- }}}
