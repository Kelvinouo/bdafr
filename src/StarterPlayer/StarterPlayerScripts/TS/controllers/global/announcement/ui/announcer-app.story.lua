
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__BedwarsImageId__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__AnnouncementType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "announcer", "announcement-type").AnnouncementType;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__TextAnnouncement__4 = v1.import(script, script.Parent, "text-announcement").TextAnnouncement;
return function(p1)
	local u5 = u3.mount(u3.createElement(l__TextAnnouncement__4, {
		Announcement = {
			message = "Test Announcement", 
			backgroundImage = l__BedwarsImageId__1.SURVIVAL_ANNOUNCEMENT_BACKGROUND, 
			duration = 5, 
			type = l__AnnouncementType__2.Text
		}
	}), p1);
	return function()
		return u3.unmount(u5);
	end;
end;

