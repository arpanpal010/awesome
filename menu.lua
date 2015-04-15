-- --------------------------------------------------------------
-- Menu
-- --------------------------------------------------------------
-- Awesome Menu
awsomenu= {
    { "manual"                            , terminal .. " -e man awesome" }                                         ,
    { "edit config"                       , editor_cmd .. " " .. awesome.conffile }                                 ,
    { "restart"                           , awesome.restart }                                                       ,
    { "quit"                              , awesome.quit }
}

-- netmenu
netmenu= {
    { browser                             , browser }                                                               ,
    { browser .. "->window"               , browser .. " -browser" }                                                ,
    { browser .. "->instance"             , browser .. " -new-instance" }                                           ,
    { browser .. "->private"              , browser .. " -private" }                                                ,
    { "im"                                , "pidgin" }                                                              ,
    { "transmission"                      , "transmission-gtk" }                                                    ,
    { browser_fallback                    , browser_fallback }
}

--filesmenu
filesmenu = {
    { "/home"                             , filebrowser }                                                           ,
    { "/media"                            , filebrowser .. " /media" }                                              ,
    { "/trash"                            , filebrowser .. " .local/share/Trash/files/" }                           ,
    { "/root"                             , filebrowser .. " /" }                                                   ,
    { "files> window"                     , filebrowser .. " --new-win" }                                           ,
    { "files> search"                     , filebrowser .. " --find-files" }
}

-- system menu
sysmenu= {
    { "htop"                              , terminal ..  " -e htop" }                                               ,
    { "disks"                             , "gnome-disks" }                                                         ,
    { "update"                            , updatecmd }                                                             ,
    { "network"                           , "wicd-gtk" }                                                            ,
    { "volume"                            , volcmd }                                                         ,
    { "themes"                            , "lxappearance" }
}

-- power menu
powmenu= {
    { "Poweroff"                          , "gksudo poweroff --m \"Please enter password to shutdown computer:\"" } ,
    { "Reboot"                            , "gksudo reboot --m \"Please enter password to restart computer:\"" }    ,
    { "Halt"                              , "gksudo halt --m \"Please enter password to halt computer:\"" }         ,
	{ "Restart WM"                        , awesome.restart }                                                       ,
    { "Quit WM"                           , awesome.quit }                                                          ,
    -- { "switch-to-user"                 , "dm-tool switch-to-greeter" }                                           , -- requires lightdm
    -- { "logout"                         , "dm-tool lock" } -- requires lightdm
}

-- Main Menu combines all oabove into one
menu_side = awful.menu.new({
    items = {
        { "Terminal"                      , terminal }                                                              ,
        { "Internet"                      , netmenu }                                                               ,
        { "Files"                         , filesmenu }                                                             ,
        { "Beaver"                        , guieditor }                                                             ,
        { "Sublime Text 2"                , ide }                                                                   ,
        { "Skype"                         , "skype" }                                                               ,
    	{ "VirtualBox"                    , "virtualbox" }                                                          ,
    	{ "ScreenGrab"                    , "simplescreenrecorder" }                                                ,
        { "Ncmpcpp"                       , terminal .. " -e ncmpcpp" }                                             ,
        { "System"                        , sysmenu }                                                               ,
        { "Awesome"                       , awsomenu }                                                              ,
        { "Power"                         , powmenu }                                                               ,
    }
})

    if show_mainmenu == true then 
    -- freedesktop
        -- git clone https://github.com/terceiro/awesome-freedesktop.git $HOME/.config/awesome/
        require('awesome-freedesktop.freedesktop.utils')
        require('awesome-freedesktop.freedesktop.menu')
        require('awesome-freedesktop.freedesktop.desktop')
    	freedesktop.utils.terminal = terminal  -- default: "xterm"
    	--freedesktop.utils.icon_theme = { 'Numix', 'gnome' } -- look inside /usr/share/icons/, default: nil (don't use icon theme)
    	menu_main=awful.menu.new({ items = freedesktop.menu.new(), width = beautiful.menu_width })
        menulauncher  = awful.widget.launcher({ image = beautiful.awesome_icon, menu = menu_main }) -- mainmenu
    end

    -- powermenu at the right end of top bar
    if show_powermenu == true then
        power_menu = awful.menu.new({items = powmenu})
        powlauncher   = awful.widget.launcher({ image = beautiful.power_icon, menu = power_menu }) -- power menu
    end

mylauncher    = awful.widget.launcher({ image = beautiful.awesome_icon, menu = menu_side }) -- Launcher

-- Menubar configuration
    if show_menubar ==  true then
        menubar = require("menubar")
        menubar.app_folders = { "/usr/share/applications/" }
        menubar.show_categories = true
        menubar.utils.terminal = terminal -- Set the terminal for applications that require it
    end
