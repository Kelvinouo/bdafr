-- Script Hash: 4823f62cfcd40ab600e4cc4d54a11ab2ca68740101924432448d7db66db25723131383b1697e95530dc7a821cea9d9b5
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "UnlockController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
local u1 = v4;
function u1.new(...)
	local v5 = setmetatable({}, u1);
	return v5:constructor(...) and v5;
end;
local u2 = l__KnitController__3;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "UnlockController";
	p1.allItemsUnlocked = false;
	p1.allKitsUnlocked = false;
end;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__PlaceUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__Players__6 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__KnitClient__7 = v2.KnitClient;
function u1.KnitStart(p2)
	l__default__3.Client:WaitFor("KitUpdate"):andThen(function(p3)
		p3:Connect(function(p4)
			if p4.ownedKits then
				l__ClientStore__4:dispatch({
					type = "AddOwnedKits", 
					kits = p4.ownedKits
				});
			end;
			if p4.ownedKitSkins then
				l__ClientStore__4:dispatch({
					type = "SetOwnedKitSkins", 
					ownedKitSkins = p4.ownedKitSkins
				});
			end;
			if p4.useKitSkin ~= nil then
				l__ClientStore__4:dispatch({
					type = "SetUseKitSkin", 
					useKitSkin = p4.useKitSkin
				});
			end;
			if p4.active then
				l__ClientStore__4:dispatch({
					type = "SetBedwarsKit", 
					kit = p4.active.kit
				});
			end;
			if p4.activeKitSkins then
				l__ClientStore__4:dispatch({
					type = "SetEquippedKitSkins", 
					equippedKitSkins = p4.activeKitSkins
				});
			end;
		end);
		l__default__3.Client:WaitFor("RequestKitUpdate"):andThen(function(p5)
			p5:SendToServer();
		end);
	end);
	if l__PlaceUtil__5.isProduction() or l__PlaceUtil__5.isStaging() then
		task.spawn(function()
			if l__Players__6.LocalPlayer:GetRankInGroup(5774246) >= 100 then
				p2.allItemsUnlocked = true;
				p2.allKitsUnlocked = true;
				return;
			end;
			if l__KnitClient__7.Controllers.PermissionController:hasAllKitsUnlocked(l__Players__6.LocalPlayer) then
				p2.allKitsUnlocked = true;
			end;
		end);
	end;
end;
function u1.isKitOwned(p6, p7)
	return table.find(l__ClientStore__4:getState().Bedwars.ownedKits, p7) ~= nil;
end;
u2 = v2.KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	UnlockController = u2
};
return u1;
