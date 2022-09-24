-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-source-controller").ProjectileSourceController;
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "mage", "mage-kit-util");
local v4 = setmetatable({}, {
	__tostring = function()
		return "MageSpellbookController";
	end, 
	__index = v2
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
function v4.constructor(p1, ...)
	v2.constructor(p1, ...);
	p1.Name = "MageSpellbookController";
	p1.Client = {};
	p1.lastSpellMap = {};
end;
function v4.KnitStart(p2)
	v2.KnitStart(p2);
end;
local l__ItemType__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__Players__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__BedwarsKit__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
function v4.isRelevantItem(p3, p4)
	local v6 = false;
	if p4.itemType == l__ItemType__1.MAGE_SPELLBOOK then
		v6 = l__KnitClient__2.Controllers.KitController:isUsingKit(l__Players__3.LocalPlayer, l__BedwarsKit__4.MAGE);
	end;
	return v6;
end;
local l__GameAnimationUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v4.onEnable(p5, p6, p7)
	v2.onEnable(p5, p6, p7);
	p5:setupYield(function()
		local u7 = l__GameAnimationUtil__5.playAnimation(l__Players__3.LocalPlayer, l__AnimationType__6.WIZARD_BALL_CAST, {});
		return function()
			if u7 ~= nil then
				u7:Stop();
			end;
		end;
	end);
end;
function v4.onDisable(p8)
	v2.onDisable(p8);
end;
function v4.getProjectileSource(p9, p10)
	return p9:getNextElementProjectile();
end;
local l__MAGE_ELEMENT_CYCLE_INDEX__8 = v3.MAGE_ELEMENT_CYCLE_INDEX;
local l__BalanceFile__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local l__MageKitUtil__10 = v3.MageKitUtil;
local l__GameSound__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v4.getNextElementProjectile(p11)
	local v7 = l__BalanceFile__9.MAGE_ELEMENT_CYCLE[l__Players__3.LocalPlayer:GetAttribute(l__MAGE_ELEMENT_CYCLE_INDEX__8) + 1];
	if table.find(l__MageKitUtil__10.getUnlockedMageElements(l__Players__3.LocalPlayer), v7) ~= nil then
		return p11:getProjectileSourceFromElement(v7);
	end;
	return {
		projectileType = function()
			return "mage_spell_base";
		end, 
		fireDelaySec = 0.4, 
		maxStrengthChargeSec = 0.25, 
		minStrengthScalar = 0.7692307692307692, 
		launchSound = { l__GameSound__11.MAGE_CAST_BASE_1, l__GameSound__11.MAGE_CAST_BASE_2, l__GameSound__11.MAGE_CAST_BASE_3 }, 
		firstPerson = {
			fireAnimation = l__AnimationType__6.FP_USE_ITEM
		}
	};
end;
local l__MageElement__12 = v3.MageElement;
function v4.getProjectileSourceFromElement(p12, p13)
	if p13 == l__MageElement__12.FIRE then
		return {
			projectileType = function()
				return "mage_spell_fire";
			end, 
			fireDelaySec = 0.4, 
			maxStrengthChargeSec = 0.25, 
			minStrengthScalar = 0.7692307692307692, 
			launchSound = { l__GameSound__11.MAGE_CAST_FIRE_1, l__GameSound__11.MAGE_CAST_FIRE_2, l__GameSound__11.MAGE_CAST_FIRE_3 }, 
			firstPerson = {
				fireAnimation = l__AnimationType__6.FP_USE_ITEM
			}
		};
	end;
	if p13 == l__MageElement__12.ICE then
		return {
			projectileType = function()
				return "mage_spell_ice";
			end, 
			fireDelaySec = 0.4, 
			maxStrengthChargeSec = 0.25, 
			minStrengthScalar = 0.7692307692307692, 
			launchSound = { l__GameSound__11.MAGE_CAST_ICE_1, l__GameSound__11.MAGE_CAST_ICE_2, l__GameSound__11.MAGE_CAST_ICE_3 }, 
			firstPerson = {
				fireAnimation = l__AnimationType__6.FP_USE_ITEM
			}
		};
	end;
	if p13 ~= l__MageElement__12.NATURE then
		return;
	end;
	return {
		projectileType = function()
			return "mage_spell_nature";
		end, 
		fireDelaySec = 0.4, 
		maxStrengthChargeSec = 0.25, 
		minStrengthScalar = 0.7692307692307692, 
		launchSound = { l__GameSound__11.MAGE_CAST_NATURE_1, l__GameSound__11.MAGE_CAST_NATURE_2, l__GameSound__11.MAGE_CAST_NATURE_3 }, 
		firstPerson = {
			fireAnimation = l__AnimationType__6.FP_USE_ITEM
		}
	};
end;
function v4.onStartCharging(p14)

end;
function v4.onStopCharging(p15)

end;
function v4.onLaunch(p16, p17)

end;
function v4.onStartReload(p18, p19)

end;
local v8 = l__KnitClient__2.CreateController(v4.new());
return nil;
