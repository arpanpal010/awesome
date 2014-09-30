--{{{ Main
local awful = require("awful")
awful.util = require("awful.util")

theme = {}

home          = os.getenv("HOME")
config        = awful.util.getdir("config")
shared        = "/usr/share/awesome"
if not awful.util.file_readable(shared .. "/icons/awesome16.png") then
    shared    = "/usr/share/local/awesome"
end

sharedicons   = shared .. "/icons"
sharedthemes  = shared .. "/themes"
themes        = config .. "/themes"
themename     = "/awtheme"
if not awful.util.file_readable(themes .. themename .. "/theme.lua") then
       themes = sharedthemes
end
themedir      = themes .. themename

theme.wallpaper = themedir .. "/wallpaper"
-- }}}

-- {{{ Styles
theme.font      = "Liberation Mono 10"

-- {{{ Colors
theme.fg_normal = "#ffffffaa"
theme.fg_focus  = "#ffffff00"
--theme.fg_urgent = "#CC9393"
--theme.fg_minimize = "#000000"

theme.bg_normal = "#00000044" -- <-change this to set overall transparency
theme.bg_focus  = "#ffffff44"
--theme.bg_urgent = "#34353400"
theme.bg_systray = theme.bg_normal
-- }}}
-- {{{ Titlebars
theme.titlebar_bg_focus  = "#3C3C3C99"
theme.titlebar_bg_normal = "#3C3C3C99"
-- }}}
-- {{{ Menu
-- Variables set for theming the menu:
theme.menu_height = "20"
theme.menu_width  = "160"
theme.menu_bg_normal = theme.bg_normal
--theme.menu_bg_focus = ""
theme.menu_fg_normal = "#ffffff"
theme.menu_fg_focus = "#ffffff"
theme.menu_border_width= 0
theme.menu_border_color= "#000000"
-- }}}
-- mix of border_focus and background
-- theme.light_color = "#FFB17D"

-- {{{ Borders
--theme.border_width  = 1
--theme.border_normal = theme.bg_normal
--theme.border_focus  = "#FFFFFF00"
--theme.border_marked = "#ff0000"
-- }}}

-- {{{tasklist
theme.tasklist_disable_icon         = true
theme.tasklist_floating             = "[float] "
theme.tasklist_maximized_horizontal = ""
theme.tasklist_maximized_vertical   = ""
-- }}}

-- There are other variable seqts
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#CC9393"
-- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = themedir .. "/icons/square_sel.png" -- "/taglist/squarefz.png"
theme.taglist_squares_unsel = themedir .. "/icons/square_unsel.png"-- "/taglist/squarez.png"
theme.taglist_squares_resize = "true"
-- }}}

-- {{{ Misc
theme.awesome_icon      = themedir .. "/icons/awesome-icon.png"
theme.power_icon        = themedir .. "/icons/powericon.png"
theme.volicon			= themedir .. "/icons/volicon.png"
theme.menu_submenu_icon = themedir .. "/icons/submenu.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = themedir .. "/layouts/tile.png"
theme.layout_tileleft   = themedir .. "/layouts/tileleft.png"
theme.layout_tilebottom = themedir .. "/layouts/tilebottom.png"
theme.layout_tiletop    = themedir .. "/layouts/tiletop.png"
theme.layout_fairv      = themedir .. "/layouts/fairv.png"
theme.layout_fairh      = themedir .. "/layouts/fairh.png"
theme.layout_spiral     = themedir .. "/layouts/spiral.png"
theme.layout_dwindle    = themedir .. "/layouts/dwindle.png"
theme.layout_max        = themedir .. "/layouts/max.png"
theme.layout_fullscreen = themedir .. "/layouts/fullscreen.png"
theme.layout_magnifier  = themedir .. "/layouts/magnifier.png"
theme.layout_floating   = themedir .. "/layouts/floating.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = themedir .. "/titlebar/close_focus.png"
theme.titlebar_close_button_normal = themedir .. "/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active  = themedir .. "/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = themedir .. "/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = themedir .. "/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = themedir .. "/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = themedir .. "/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = themedir .. "/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = themedir .. "/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = themedir .. "/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = themedir .. "/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = themedir .. "/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = themedir .. "/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = themedir .. "/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = themedir .. "/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = themedir .. "/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = themedir .. "/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = themedir .. "/titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}
-- {{{lain icons 
theme.lain_icons         = config .. "/lain/icons/layout/default/" --os.getenv("HOME") .. "/.config/awesome/lain/icons/layout/default/"
theme.layout_termfair    = theme.lain_icons .. "termfairw.png"
--theme.layout_centerfair    = theme.lain_icons .. "termfairw.png"
--theme.layout_cascade = theme.lain_icons .. "cascadetilew.png"
theme.layout_cascadetile = theme.lain_icons .. "cascadetilew.png"
theme.layout_centerwork  = theme.lain_icons .. "centerworkw.png"
--theme.layout_uselessfair = theme.lain_icons .. "cascadew.png"
--theme.layout_uselesspiral = theme.lain_icons .. "cascadew.png"
theme.layout_uselesstile = theme.lain_icons .. "cascadew.png"
-- }}}

--if lain
if awful.util.file_readable(config .. "/lain/init.lua") then
    theme.useless_gap_width  = "12"
end

return theme
