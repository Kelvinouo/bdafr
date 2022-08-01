-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "KitController";
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
	p1.Name = "KitController";
end;
local l__WatchPlayer__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchPlayer;
local l__ClientSyncEvents__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__Players__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__ClientStore__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	l__WatchPlayer__2(function(p3)
		local v5 = p2:getKit(p3);
		if v5 then
			l__ClientSyncEvents__3.KitEquip:fire(p3, v5);
			if p3 == l__Players__4.LocalPlayer then
				l__ClientStore__5:dispatch({
					type = "SetBedwarsKit", 
					kit = v5
				});
			end;
		end;
		local u6 = v5;
		p3:GetAttributeChangedSignal("PlayingAsKit"):Connect(function()
			local v6 = p2:getKit(p3);
			if u6 then
				l__ClientSyncEvents__3.KitUnequip:fire(p3, u6);
			end;
			if v6 then
				l__ClientSyncEvents__3.KitEquip:fire(p3, v6);
			end;
			u6 = v6;
			if p3 == l__Players__4.LocalPlayer then
				l__ClientStore__5:dispatch({
					type = "SetBedwarsKit", 
					kit = u6
				});
			end;
		end);
	end);
end;
local l__BedwarsKit__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
function v3.getKit(p4, p5)
	return p5:GetAttribute("PlayingAsKit") or l__BedwarsKit__7.NONE;
end;
function v3.isUsingKit(p6, p7, p8)
	return p6:getKit(p7) == p8;
end;
local l__BedwarsKitSkin__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
function v3.getKitSkin(p9, p10)
	return p10:GetAttribute("KitSkin") or l__BedwarsKitSkin__8.DEFAULT;
end;
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v3.watchLocalKit(p11, p12)
	local v7 = u9.new();
	v7:GiveTask(l__ClientSyncEvents__3.KitEquip:connect(function(p13)
		if p13.player ~= l__Players__4.LocalPlayer then
			return nil;
		end;
		task.spawn(function()
			p12(p13.kit);
		end);
	end));
	p12(p11:getKit(l__Players__4.LocalPlayer));
	return v7;
end;
function v3.watchKit(p14, p15)
	local v8 = u9.new();
	v8:GiveTask(l__ClientSyncEvents__3.KitEquip:connect(function(p16)
		task.spawn(function()
			p15(p16.player, p16.kit);
		end);
	end));
	for v9, v10 in ipairs(l__Players__4:GetPlayers()) do
		local v11 = p14:getKit(v10);
		if v11 then
			task.spawn(function()
				p15(v10, v11);
			end);
		end;
	end;
	return v8;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
