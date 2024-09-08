local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
-- local mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

-- different size for different monitors because I have two monitors
-- with different resolutions
local height = 40
-- local i = 0

local function set_wibar(s)
	-- if i == 0 then
	-- 	height = 55
	-- end
	-- i = 1
	s.mywibox = awful.wibar({
		position = "top",
		screen = s,
		border_width = 10,
		height = height,
    bg="#222831"
	})

  beautiful.bg_systray = "#222831"
	s.mywibox:setup({
		border_width = 10,
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			mylauncher,
			s.mytaglist,
			-- s.mypromptbox,
		},
		s.mytasklist, -- Middle widget
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			mykeyboardlayout,
			wibox.widget.systray(),

			mytextclock,
			s.mylayoutbox,
		},
	})
end
return set_wibar
