-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
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
function u1.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "UnlockController";
	p1.allItemsUnlocked = false;
	p1.allKitsUnlocked = false;
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__PlaceUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__Players__5 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__KnitClient__6 = v2.KnitClient;
function u1.KnitStart(p2)
	l__default__2.Client:WaitFor("RemoteName"):andThen(function(p3)
		p3:Connect(function(p4)
			if p4.ownedKits then
				l__ClientStore__3:dispatch({
					type = "AddOwnedKits", 
					kits = p4.ownedKits
				});
			end;
			if p4.ownedKitSkins then
				l__ClientStore__3:dispatch({
					type = "SetOwnedKitSkins", 
					ownedKitSkins = p4.ownedKitSkins
				});
			end;
			if p4.useKitSkin ~= nil then
				l__ClientStore__3:dispatch({
					type = "SetUseKitSkin", 
					useKitSkin = p4.useKitSkin
				});
			end;
			if p4.active then
				l__ClientStore__3:dispatch({
					type = "SetBedwarsKit", 
					kit = p4.active.kit
				});
			end;
			if p4.activeKitSkins then
				l__ClientStore__3:dispatch({
					type = "SetEquippedKitSkins", 
					equippedKitSkins = p4.activeKitSkins
				});
			end;
		end);
		l__default__2.Client:WaitFor("RemoteName"):andThen(function(p5)
			p5:SendToServer();
		end);
	end);
	if l__PlaceUtil__4.isProduction() or l__PlaceUtil__4.isStaging() then
		task.spawn(function()
			if l__Players__5.LocalPlayer:GetRankInGroup(5774246) >= 100 then
				p2.allItemsUnlocked = true;
				p2.allKitsUnlocked = true;
				return;
			end;
			if l__KnitClient__6.Controllers.PermissionController:hasAllKitsUnlocked(l__Players__5.LocalPlayer) then
				p2.allKitsUnlocked = true;
			end;
		end);
	end;
end;
function u1.isKitOwned(p6, p7)
	return table.find(l__ClientStore__3:getState().Bedwars.ownedKits, p7) ~= nil;
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(u1.new());
return {
	UnlockController = u1
};
