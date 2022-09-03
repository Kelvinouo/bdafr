-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "BedwarsShopController";
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
	p1.Name = "BedwarsShopController";
	p1.alreadyPurchasedMap = {};
end;
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__DeviceUtil__3 = v2.DeviceUtil;
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
		local v6 = nil;
		local l__purchasedTeamUpgrades__7 = p3.purchasedTeamUpgrades;
		v6 = {};
		for v8 = 1, #l__purchasedTeamUpgrades__7 do
			local v9 = l__purchasedTeamUpgrades__7[v8];
			v6[v9.upgradeId] = v9.tier;
			v6 = v6;
		end;
		l__ClientStore__7:dispatch({
			type = "BedwarsSetAllTeamUpgrades", 
			teamUpgrades = local v10
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
		local v11 = l__ClientStore__7:getState().Bedwars.teamUpgrades[l__TeamUpgradeId__9.BREAK];
		if v11 ~= nil and v11 > -1 then
			local v12 = l__BedwarsShop__10.getUpgrade(l__BedwarsShop__10.TeamUpgrades, l__TeamUpgradeId__9.BREAK);
			if v12 ~= nil then
				v12 = v12.tiers[v11 + 1];
			end;
			if v12 then
				p5.damage = p5.damage * (1 + v12.values[1] / 100);
			end;
		end;
	end);
	l__default__6.Client:Get("RemoteName"):Connect(function(p6)
		l__ClientStore__7:dispatch({
			type = "GameSetUnlockedShopCategories", 
			unlockedShopCategories = p6.unlockedShopCategories
		});
	end);
end;
local l__SoundManager__11 = v2.SoundManager;
local l__GameSound__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function u1.purchaseShopCategory(p7, p8)
	l__default__6.Client:Get("RemoteName"):CallServerAsync({
		category = p8
	}):andThen(function(p9)
		if p9 then
			l__SoundManager__11:playSound(l__GameSound__12.BEDWARS_UPGRADE_SUCCESS);
		end;
	end);
end;
u1 = l__KnitClient__2.CreateController;
u1 = u1(u1.new());
return {
	BedwarsShopController = u1
};
