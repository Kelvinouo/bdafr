-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__HandKnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "BombControllerController";
	end, 
	__index = l__HandKnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v3.constructor(p1)
	l__HandKnitController__2.constructor(p1);
	p1.abilityMaid = u1.new();
	p1.Name = "BombControllerController";
end;
local l__ItemType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v3.isRelevantItem(p2, p3)
	return p3.itemType == l__ItemType__2.BOMB_CONTROLLER;
end;
local l__Flamework__3 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__AbilityId__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
function v3.onEnable(p4, p5, p6)
	local u5 = l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(l__AbilityId__4.DETONATE_BOMB, {
		text = "Detonate", 
		interactionKey = Enum.KeyCode.F, 
		gamepadInteractionKey = Enum.KeyCode.F
	});
	p4.abilityMaid:GiveTask(function()
		u5.Destroy();
	end);
end;
function v3.onDisable(p7)
	p7.abilityMaid:DoCleaning();
end;
local l__ClientSyncEvents__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__Players__7 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__InventoryUtil__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__default__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v3.KnitStart(p8)
	l__HandKnitController__2.KnitStart(p8);
	l__ClientSyncEvents__6.AbilityUsed:connect(function(p9)
		local v5 = false;
		if p9.ability == l__AbilityId__4.DETONATE_BOMB then
			v5 = p9.userCharacter == l__Players__7.LocalPlayer.Character;
		end;
		if v5 then
			local v6 = l__InventoryUtil__8.getInventory(l__Players__7.LocalPlayer).hand;
			if v6 ~= nil then
				v6 = v6.itemType;
			end;
			v5 = v6 == l__ItemType__2.BOMB_CONTROLLER;
		end;
		if v5 then
			print("CONTROLLER: " .. tostring(l__Players__7.LocalPlayer.UserId));
			l__default__9.Client:Get("RemoteName"):CallServer();
		end;
	end);
end;
local v7 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
