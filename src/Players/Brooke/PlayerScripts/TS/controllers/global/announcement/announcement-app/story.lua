-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__AnnouncementVariant__1 = v2.AnnouncementVariant;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__TextAnnouncementBordered__3 = v2.TextAnnouncementBordered;
return function(p1)
	local u4 = u2.mount(u2.createElement(l__TextAnnouncementBordered__3, {
		Announcement = l__AnnouncementVariant__1.text({
			message = "Test Announcement", 
			duration = 5, 
			textlabel = {
				props = {
					Size = UDim2.fromScale(0.5, 0.5), 
					Position = UDim2.fromScale(0.5, 0.6)
				}, 
				tween = {
					disabled = true
				}
			}, 
			position = UDim2.fromScale(0.5, 0.2), 
			variant = "textWithBG"
		})
	}), p1);
	return function()
		return u2.unmount(u4);
	end;
end;
