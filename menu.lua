-- netmenu
netmenu= {
	{ browser, browser },
	{ browser .. "->window", browser .. " -browser" },
	{ browser .. "->instance", browser .. " -new-instance" },
	{ browser .. "->private", browser .. " -private" },
	{ "im", "pidgin" },
	{ "transmission", "transmission-gtk" },
	{ browser_fallback, browser_fallback }
}

--filesmenu
filesmenu = {
	{ "/home", filebrowser },
	{ "/media", filebrowser .. " /media" },
	{ "/trash", filebrowser .. " .local/share/Trash/files/" },
	{ "/root", filebrowser .. " /" },
	{ "files> window", filebrowser .. " --new-win" },
	{ "files> search", filebrowser .. " --find-files" }
}

-- system menu
sysmenu= {
	{ "htop", terminal ..  " -e htop" },
	{ "disks", "gnome-disks" },
	{ "update", terminal ..  " -e 'update'" },
	{ "network", "wicd-gtk" },
	{ "volume", "pavucontrol" },
	{ "themes", "lxappearance" }
}

-- Awesome Menu
awmenu = {
	{ "manual", terminal .. " -e man awesome" },
	{ "edit config", editor_cmd .. " " .. awesome.conffile },
	{ "restart", awesome.restart },
	{ "quit", awesome.quit }
}
-- power menu
powmenu= awful.menu({ items = {
	{ "poweroff", "gksudo poweroff --m \"Please enter password to shutdown computer:\"" },
	{ "reboot", "gksudo reboot --m \"Please enter password to restart computer:\"" },
	{ "halt", "gksudo halt --m \"Please enter password to halt computer:\"" },
	{ "switch-to-user", "dm-tool switch-to-greeter" }, -- requires lightdm
	{ "logout", "dm-tool lock" } -- requires lightdm
}})

-- Main Menu
menu_side = awful.menu({ items = {
	{ "terminal", terminal },
	{ "internet", netmenu },
	{ "files", filesmenu },
	{ guieditor, guieditor },
	{ ide, ide },
	{ "music", terminal .. " -e ncmpcpp" },
	{ "system", sysmenu },
	{ "awesome", awmenu }
}})

--  main freedesktop menu
freedesktop.utils.terminal = terminal  -- default: "xterm"
--freedesktop.utils.icon_theme = { 'Numix', 'gnome' } -- look inside /usr/share/icons/, default: nil (don't use icon theme)
menu_main=awful.menu.new({ items = freedesktop.menu.new(), width = 150 })
menulauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = menu_main })

-- Launcher
mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = menu_side })

-- power menu
powlauncher = awful.widget.launcher({ image = beautiful.power_icon, menu = powmenu })

-- Menubar configuration
-- menubar.app_folders = { "/usr/share/applications/" }
-- menubar.show_categories = true
-- menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}
