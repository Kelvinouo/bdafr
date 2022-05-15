
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "AnnouncementController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__KnitController__2;
function v3.constructor(p1)
	u1.constructor(p1);
	p1.Name = "AnnouncerController";
	p1.announcements = {};
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientSyncEvents__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:WaitFor("AnnouncementEvent"):andThen(function(p3)
		p3:Connect(function(p4)
			p2:sendNewAnnouncement(p4.announcement);
		end);
	end);
	l__ClientSyncEvents__3.AnnouncementEnd:connect(function(p5)
		p2:handleAnnouncementEnd();
	end);
end;
function v3.sendNewAnnouncement(p6, p7)
	if not p6.currentAnnouncement then
		p6:announce(p7);
		return;
	end;
	p6:enqueueAnnouncement(p7);
end;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
function v3.endAnnouncement(p8)
	if not p8.currentAnnouncement then
		return nil;
	end;
	u4.unmount(p8.currentAnnouncement);
	l__ClientSyncEvents__3.AnnouncementEnd:fire();
	p8.currentAnnouncement = nil;
end;
function v3.handleAnnouncementEnd(p9)
	local v5 = p9:dequeueAnnouncement();
	if v5 then
		p9:announce(v5);
	end;
end;
local l__Players__5 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__AnnouncementType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "announcer", "announcement-type").AnnouncementType;
local l__TextAnnouncement__7 = v1.import(script, script.Parent, "ui", "text-announcement").TextAnnouncement;
function v3.announce(p10, p11)
	local v6 = p11;
	if v6 ~= nil then
		v6 = v6.type;
	end;
	if v6 ~= l__AnnouncementType__6.Text then
		return;
	end;
	p10.currentAnnouncement = u4.mount(u4.createElement(l__TextAnnouncement__7, {
		Announcement = p11
	}), (l__Players__5.LocalPlayer:WaitForChild("PlayerGui")));
end;
function v3.dequeueAnnouncement(p12)
	if #p12.announcements == 0 then
		return nil;
	end;
	return table.remove(p12.announcements, 1);
end;
function v3.enqueueAnnouncement(p13, p14)
	table.insert(p13.announcements, p14);
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;

