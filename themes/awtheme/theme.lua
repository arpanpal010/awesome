local awful = require("awful")
awful.util = require("awful.util")

theme = {}

-- theme name - name of the theme dir
    themename       = "awtheme"
-- colorscheme + transparency
    theme_colors    = "dark" -- dark | light colors
    theme.transparency= 'CF'

home          = os.getenv("HOME")
config        = awful.util.getdir("config")
shared        = "/usr/share/awesome"
if not awful.util.file_readable(shared .. "/icons/awesome16.png") then
    shared    = "/usr/share/local/awesome"
end

sharedicons   = shared .. "/icons"
sharedthemes  = shared .. "/themes"
themes        = config .. "/themes/"
-- themename     = "awtheme"
if not awful.util.file_readable(themes .. themename .. "/theme.lua") then
       themes = sharedthemes
end
themedir      = themes .. themename

-- wallpaper
    theme.wallpaper = themedir .. "/wallpaper"

-- font
    theme.font      = "Liberation Mono 8"

-- menu
    theme.menu_height = "20" -- px
    theme.menu_width  = "160" -- px

-- bar heights5
    theme.statusbar_height = "15" -- px
    theme.titlebar_height = "15" -- px

-- borders
    theme.border_width  = 2
    theme.menu_border_width= 2

-- uselessgap if lain
if awful.util.file_readable(config .. "/lain/init.lua") then
    theme.useless_gap_width  = "20"
end

-- --------------------------------------------------------------
-- Colorscheme light
-- --------------------------------------------------------------
if theme_colors == "light" then
    theme.fg_normal   = '#757575' -- theme font color
    theme.bg_normal   = '#EEEEEE' .. theme.transparency -- theme background color

    theme.fg_focus    = '#212121'  -- focused window text
    theme.bg_focus    = '#FAFAFA' .. theme.transparency -- focused window bg at top bar

    theme.fg_urgent   = '#FFFFFF' .. theme.transparency -- urgent font white
    theme.bg_urgent   = '#F44336' .. theme.transparency -- urgent bg red

    theme.fg_minimize = theme.fg_normal -- font when minimized
    theme.bg_minimize = theme.bg_normal -- bg when minimized

    theme.border_focus  = theme.fg_focus --border
    theme.border_normal = theme.fg_normal
    theme.border_marked = theme.fg_focus

    theme.bg_systray  = theme.bg_normal  -- systray color same as bg_normal

    theme.titlebar_bg_focus  = theme.bg_focus -- focused window titlebar bg
    theme.titlebar_bg_normal = theme.bg_normal -- normal window titlebar bg

    theme.menu_fg_normal = '#616161' .. theme.transparency -- default theme font color
    theme.menu_bg_normal = theme.bg_normal -- default theme bg

    theme.menu_fg_focus = '#212121' .. theme.transparency -- highlighted menu item font color
    theme.menu_bg_focus = '#E0E0E0' .. theme.transparency -- highlighted menu item bg

    theme.menu_border_color= "#212121" .. theme.transparency -- menu border color
    theme.light_color = "#000000" .. theme.transparency -- mix of border_focus and background


    -- [taglist|tasklist]_[bg|fg]_[focus|urgent]
    theme.taglist_fg_focus = '#212121' .. theme.transparency -- taglist
    theme.taglist_bg_focus = '#9E9E9E' .. theme.transparency
    theme.taglist_fg_urgent = '#FFFFFF' .. theme.transparency
    theme.taglist_bg_urgent = '#F44336' .. theme.transparency

    -- theme.tasklist_fg_focus = '' -- tasklist
    -- theme.tasklist_bg_focus = ''
    -- theme.tasklist_fg_urgent = ''
    -- theme.tasklist_bg_urgent = ''

    theme.mouse_finder_color = "#CC9393"

    -- other variable that override above settings
    -- titlebar_[normal|focus]
    -- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
    -- mouse_finder_[timeout|animate_timeout|radius|factor]

--widgets
    -- assault battery colors
    theme.bat_normal = '#424242'
    theme.bat_critical = '#f44336'
    theme.bat_charging = '#4caf50'

    -- volume widget colors
    theme.volume = '#212121'
    theme.volume_muted = '#f44336'

-- icons
    iconpath = "/dark_icons/"

-- --------------------------------------------------------------
-- Colorscheme dark
-- --------------------------------------------------------------
elseif theme_colors == "dark" then
    theme.fg_normal   = '#EEEEEE' -- theme font color
    theme.bg_normal   = '#424242' .. theme.transparency -- theme background color

    theme.fg_focus    = '#F5F5F5' -- focused window text
    theme.bg_focus    = '#616161' .. theme.transparency -- focused window bg at top bar

    theme.fg_urgent   = '#FFFFFF' -- urgent font white
    theme.bg_urgent   = '#F44336' .. theme.transparency -- urgent bg red

    theme.fg_minimize = theme.fg_normal -- font when minimized
    theme.bg_minimize = theme.bg_normal -- bg when minimized

    theme.border_focus  = '#E0E0E0'-- theme.fg_focus --border
    theme.border_normal = '#9E9E9E'-- theme.fg_normal
    theme.border_marked = theme.fg_focus

    theme.bg_systray  = theme.bg_normal  -- systray color same as bg_normal

    theme.titlebar_bg_focus  = theme.bg_focus -- focused window titlebar bg
    theme.titlebar_bg_normal = theme.bg_normal -- normal window titlebar bg

    theme.menu_fg_normal   = '#EEEEEE' -- default theme font color
    theme.menu_bg_normal   = theme.bg_normal -- default theme bg
    theme.menu_fg_focus    = '#212121' -- highlighted menu item font color
    theme.menu_bg_focus    = '#757575' .. theme.transparency -- highlighted menu item bg
    theme.menu_border_color= '#9E9E9E' .. theme.transparency -- menu border color
    theme.light_color      = "#FFFFFF" .. theme.transparency -- mix of border_focus and background

    -- [taglist|tasklist]_[bg|fg]_[focus|urgent]
    theme.taglist_fg_focus  = '#212121' .. theme.transparency -- taglist
    theme.taglist_bg_focus  = ' #9E9E9E' .. theme.transparency
    theme.taglist_fg_urgent = '#FFFFFF' .. theme.transparency
    theme.taglist_bg_urgent = '#F44336' .. theme.transparency

    -- theme.tasklist_fg_focus = '' -- tasklist
    -- theme.tasklist_bg_focus = ''
    -- theme.tasklist_fg_urgent = ''
    -- theme.tasklist_bg_urgent = ''

    theme.mouse_finder_color = "#CC9393"

    -- other variable that override above settings
    -- titlebar_[normal|focus]
    -- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
    -- mouse_finder_[timeout|animate_timeout|radius|factor]

--widgets
    -- assault battery colors
    theme.bat_normal = '#F5F5F5'
    theme.bat_critical = '#f44336'
    theme.bat_charging = '#4caf50'

    -- volume widget colors
    theme.volume = '#f5f5f5'
    theme.volume_muted = '#f44336'

-- icons
    iconpath = "/light_icons/"

end

-- tasklist text additions
theme.tasklist_disable_icon         = true -- disables icons in taskbar
theme.tasklist_floating             = "[float] " -- added to title
theme.tasklist_maximized_horizontal = ""
theme.tasklist_maximized_vertical   = "" 

-- Taglist 
-- theme.taglist_squares_sel   = themedir .. "/icons/square_sel.png" -- "/taglist/squarefz.png"
-- theme.taglist_squares_unsel = themedir .. "/icons/square_unsel.png"-- "/taglist/squarez.png"
-- theme.taglist_squares_resize = "true"

-- {{{ Misc
theme.awesome_icon      = themedir .. iconpath .. "icon-awesome.png"
theme.power_icon        = themedir .. iconpath .. "icon-power.png"
theme.volicon           = themedir .. iconpath .. "icon-volume.png"
theme.wlicon            = themedir .. iconpath .. "icon-wireless.png"
theme.batticon          = themedir .. iconpath .. "icon-battery.png"
theme.menu_submenu_icon = themedir .. iconpath .. "submenu.png"
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

-- {{{ Layout
-- theme.layout_tile       = themedir .. iconpath .. "/layouts/tile.png"
theme.layout_tileleft   = themedir .. iconpath .. "/layouts/tileleft.png"
theme.layout_tilebottom = themedir .. iconpath .. "/layouts/tilebottom.png"
theme.layout_tiletop    = themedir .. iconpath .. "/layouts/tiletop.png"
theme.layout_fairv      = themedir .. iconpath .. "/layouts/fairv.png"
theme.layout_fairh      = themedir .. iconpath .. "/layouts/fairh.png"
theme.layout_spiral     = themedir .. iconpath .. "/layouts/spiral.png"
theme.layout_dwindle    = themedir .. iconpath .. "/layouts/dwindle.png"
theme.layout_max        = themedir .. iconpath .. "/layouts/max.png"
theme.layout_fullscreen = themedir .. iconpath .. "/layouts/fullscreen.png"
theme.layout_magnifier  = themedir .. iconpath .. "/layouts/magnifier.png"
theme.layout_floating   = themedir .. iconpath .. "/layouts/floating.png"

-- lain layouts
-- theme.lain_icons         = config .. "/lain/icons/layout/default/" -- icon name
theme.layout_uselesstile  = themedir .. iconpath .. "/layouts/tile.png"
theme.layout_uselessfair  = themedir .. iconpath .. "/layouts/fairv.png"
theme.layout_uselesspiral = themedir .. iconpath .. "/layouts/spiral.png"
theme.layout_termfair     = themedir .. iconpath .. "/layouts/lain_termfair.png"
theme.layout_cascadetile  = themedir .. iconpath .. "/layouts/lain_cascade.png"
theme.layout_centerwork   = themedir .. iconpath .. "/layouts/lain_centerwork.png"
theme.layout_centerfair   = themedir .. iconpath .. "/layouts/lain_centerfair.png"
theme.layout_cascade      = themedir .. iconpath .. "/layouts/lain_cascadebrowse.png"

-- }}}

return theme
