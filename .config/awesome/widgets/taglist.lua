local awful = require("awful")
local modkey = "Mod4"
local gears = require("gears")

local taglist_buttons = gears.table.join(
	awful.button({}, 1, function(t)
		t:view_only()
	end),
	awful.button({ modkey }, 1, function(t)
		if client.focus then
			client.focus:move_to_tag(t)
		end
	end),
	awful.button({}, 3, awful.tag.viewtoggle),
	awful.button({ modkey }, 3, function(t)
		if client.focus then
			client.focus:toggle_tag(t)
		end
	end),
	awful.button({}, 4, function(t)
		awful.tag.viewnext(t.screen)
	end),
	awful.button({}, 5, function(t)
		awful.tag.viewprev(t.screen)
	end)
)

local function set_taglist(s)
	awful.tag({ "  ", "  ", "  ", "  ", " 󰡨 " }, s, awful.layout.layouts[1])
	local original_taglist_label = awful.widget.taglist.taglist_label
	-- local tag_colors_b =
	-- 	{ "#3a3f50", "#3a3a50", "#3f3a50", "#453a50", "#4b3b51", "#4a3a50", "#503a50", "#503a4a", "#503a45" }
	-- local tag_colors_s =
	-- 	{ "#606a85", "#606085", "#6a6085", "#736085", "#7b6085", "#7c6085", "#856085", "#85607c", "#856073" }

	local tag_colors_b =
		{ "#222831", "#222831", "#222831", "#222831", "#222831", "#222831", "#222831", "#222831", "#222831" }
	local tag_colors_s =
		{ "#393E46", "#393E46", "#393E46", "#393E46", "#393E46", "#393E46", "#393E46", "#393E46", "#393E46" }
	function awful.widget.taglist.taglist_label(tag, args, tb)
		local idx = (tag.index - 1) % #tag_colors_b + 1
		local args = { bg_focus = tag_colors_s[idx] }
		local text, bg, bg_image, icon, other_args = original_taglist_label(tag, args, tb)
		if bg == nil then
			bg = tag_colors_b[idx]
		end
		return text, bg, bg_image, icon, other_args
	end
	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = taglist_buttons,
	})
end
return set_taglist
