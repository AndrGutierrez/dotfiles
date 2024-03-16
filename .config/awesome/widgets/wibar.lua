local wibox = require("wibox")
local awful = require("awful")
-- local mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

-- different size for different monitors because I have two monitors
-- with different resolutions
local height = 27
local i = 0
local function set_wibar(s)
	if i > 0 then
		height = 35
	end
	i = i + 1
	s.mywibox = awful.wibar({
		position = "top",
		screen = s,
		border_width = 10,
		height = height,
		-- transparent
		-- bg = "#fffffff",
	})
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
