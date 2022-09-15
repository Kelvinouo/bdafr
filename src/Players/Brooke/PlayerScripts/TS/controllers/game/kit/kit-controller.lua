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
function v3.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "KitController";
end;
local l__WatchPlayer__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchPlayer;
local l__ClientSyncEvents__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__Players__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	l__WatchPlayer__1(function(p3)
		local v5 = p2:getKit(p3);
		if v5 then
			l__ClientSyncEvents__2.KitEquip:fire(p3, v5);
			if p3 == l__Players__3.LocalPlayer then
				l__ClientStore__4:dispatch({
					type = "SetBedwarsKit", 
					kit = v5
				});
			end;
		end;
		local u5 = v5;
		p3:GetAttributeChangedSignal("PlayingAsKit"):Connect(function()
			local v6 = p2:getKit(p3);
			if u5 then
				l__ClientSyncEvents__2.KitUnequip:fire(p3, u5);
			end;
			if v6 then
				l__ClientSyncEvents__2.KitEquip:fire(p3, v6);
			end;
			u5 = v6;
			if p3 == l__Players__3.LocalPlayer then
				l__ClientStore__4:dispatch({
					type = "SetBedwarsKit", 
					kit = u5
				});
			end;
		end);
	end);
end;
local l__BedwarsKit__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
function v3.getKit(p4, p5)
	return p5:GetAttribute("PlayingAsKit") or l__BedwarsKit__6.NONE;
end;
function v3.isUsingKit(p6, p7, p8)
	return p6:getKit(p7) == p8;
end;
local l__BedwarsKitSkin__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
function v3.getKitSkin(p9, p10)
	return p10:GetAttribute("KitSkin") or l__BedwarsKitSkin__7.DEFAULT;
end;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v3.watchLocalKit(p11, p12)
	local v7 = u8.new();
	v7:GiveTask(l__ClientSyncEvents__2.KitEquip:connect(function(p13)
		if p13.player ~= l__Players__3.LocalPlayer then
			return nil;
		end;
		task.spawn(function()
			p12(p13.kit);
		end);
	end));
	p12(p11:getKit(l__Players__3.LocalPlayer));
	return v7;
end;
function v3.watchKit(p14, p15)
	local v8 = u8.new();
	v8:GiveTask(l__ClientSyncEvents__2.KitEquip:connect(function(p16)
		task.spawn(function()
			p15(p16.player, p16.kit);
		end);
	end));
	local v9, v10, v11 = ipairs(l__Players__3:GetPlayers());
	while true do
		v9(v10, v11);
		if not v9 then
			break;
		end;
		v11 = v9;
		local v12 = p14:getKit(v10);
		if v12 then
			task.spawn(function()
				p15(v10, v12);
			end);
		end;	
	end;
	return v8;
end;
local v13 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
