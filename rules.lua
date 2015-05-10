-- ---------------------------------------------
-- RULES
-- ---------------------------------------------
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
        properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     keys = clientkeys,
                     buttons = clientbuttons }
    },
-- mpv
    { rule_any = { class = {"mpv", "pinentry", "gimp"} },
        properties = { floating = true }
    },

-- vbox
    -- { rule = { class = "VirtualBox" },
    --     except = { name = "Oracle VM VirtualBox Manager" },
    --    properties = { floating = true }
    -- },

-- xterm
    { rule = { class = "XTerm" },
        properties = { opacity = 0.85 }
    }, -- no use without compositor

-- skype
    -- { rule = { class = "Skype" , role = "Conversations"},
    --    properties = { floating = true, size_hints_honor = true }
    -- },

--firefox download/preference window
    { rule_any = { class = { "Firefox" } },
        except = { instance = "Navigator" },
        properties = { floating = true,
            size_hints_honor = true }
    },
	{ rule = { class = "Plugin-container" }, 
        properties = { focus = yes,
                       floating = true, 
                       fullscreen = true, 
                       border_width = 0,
                       border_color = beautiful.border_normal } 
	}

    -- Set Firefox to always map on tags number 2 of screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { tag = tags[1][2] } },
}
