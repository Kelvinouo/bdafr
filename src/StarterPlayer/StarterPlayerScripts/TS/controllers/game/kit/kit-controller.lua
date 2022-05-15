
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "KitController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "KitController";
end;
local l__WatchPlayer__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchPlayer;
local l__Players__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__ClientSyncEvents__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__ClientStore__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__WatchPlayer__2(function(p3)
		if p3 ~= l__Players__3.LocalPlayer then
			return nil;
		end;
		local v6 = p2:getKit(p3);
		if v6 then
			l__ClientSyncEvents__4.KitEquip:fire(p3, v6);
			l__ClientStore__5:dispatch({
				type = "SetBedwarsKit", 
				kit = v6
			});
		end;
		local u6 = v6;
		p3:GetAttributeChangedSignal("PlayingAsKit"):Connect(function()
			local v7 = p2:getKit(p3);
			if u6 then
				l__ClientSyncEvents__4.KitUnequip:fire(p3, u6);
			end;
			if v7 then
				l__ClientSyncEvents__4.KitEquip:fire(p3, v7);
			end;
			u6 = v7;
			l__ClientStore__5:dispatch({
				type = "SetBedwarsKit", 
				kit = u6
			});
		end);
	end);
end;
function v4.getKit(p4, p5)
	return p5:GetAttribute("PlayingAsKit");
end;
function v4.isUsingKit(p6, p7, p8)
	return p6:getKit(p7) == p8;
end;
local l__BedwarsKitSkin__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
function v4.getKitSkin(p9, p10)
	return p10:GetAttribute("KitSkin") or l__BedwarsKitSkin__7.DEFAULT;
end;
local l__Maid__8 = v2.Maid;
function v4.watchLocalKit(p11, p12)
	local v8 = l__Maid__8.new();
	v8:GiveTask(l__ClientSyncEvents__4.KitEquip:connect(function(p13)
		task.spawn(function()
			p12(p13.kit);
		end);
	end));
	p12(p11:getKit(l__Players__3.LocalPlayer));
	return v8;
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v4.new());
return nil;

