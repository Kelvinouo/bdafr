-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "BedwarsShopController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
local u1 = v3;
function u1.new(...)
	local v4 = setmetatable({}, u1);
	return v4:constructor(...) and v4;
end;
function u1.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "BedwarsShopController";
	p1.alreadyPurchasedMap = {};
end;
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__DeviceUtil__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).DeviceUtil;
local l__Flamework__4 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__default__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__BlockEngine__8 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).BlockEngine;
local l__TeamUpgradeId__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").TeamUpgradeId;
local l__BedwarsShop__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
function u1.KnitStart(p2)
	l__KnitClient__2.Controllers.InteractionRegistryController:RegisterInteraction({
		interactionLabel = "Item Shop", 
		interactionObjectText = "Open", 
		interactionTag = "BedwarsItemShop", 
		instantActivation = true, 
		clickablePrompt = l__DeviceUtil__3.isMobileControls(), 
		onInteracted = function()
			l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__5.BEDWARS_ITEM_SHOP, {});
		end
	});
	l__default__6.Client:Get("RemoteName"):Connect(function(p3)
		local v5 = nil;
		local l__purchasedTeamUpgrades__6 = p3.purchasedTeamUpgrades;
		v5 = {};
		for v7 = 1, #l__purchasedTeamUpgrades__6 do
			local v8 = l__purchasedTeamUpgrades__6[v7];
			v5[v8.upgradeId] = v8.tier;
			v5 = v5;
		end;
		l__ClientStore__7:dispatch({
			type = "BedwarsSetAllTeamUpgrades", 
			teamUpgrades = local v9
		});
	end);
	l__default__6.Client:Get("RemoteName"):Connect(function(p4)
		l__ClientStore__7:dispatch({
			type = "BedwarsSetTeamUpgradeTier", 
			upgradeId = p4.upgradeId, 
			tier = p4.tier
		});
	end);
	l__BlockEngine__8:getBlockDamageHook():connect(function(p5)
		local v10 = l__ClientStore__7:getState().Bedwars.teamUpgrades[l__TeamUpgradeId__9.BREAK];
		if v10 ~= nil and v10 > -1 then
			local v11 = l__BedwarsShop__10.getUpgrade(l__BedwarsShop__10.TeamUpgrades, l__TeamUpgradeId__9.BREAK);
			if v11 ~= nil then
				v11 = v11.tiers[v10 + 1];
			end;
			if v11 then
				p5.damage = p5.damage * (1 + v11.values[1] / 100);
			end;
		end;
	end);
end;
u1 = l__KnitClient__2.CreateController;
u1 = u1(u1.new());
return {
	BedwarsShopController = u1
};
