-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, script.Parent, "projectile-source-controller").ProjectileSourceController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "DefaultProjectileSourceController";
	end, 
	__index = v2
});
v3.__index = v3;
local u1 = v3;
function u1.new(...)
	local v4 = setmetatable({}, u1);
	return v4:constructor(...) and v4;
end;
function u1.constructor(p1, ...)
	v2.constructor(p1, ...);
	p1.Name = "DefaultProjectileSourceController";
end;
local l__ItemType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__Players__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__BedwarsKit__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__getItemMeta__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function u1.isRelevantItem(p2, p3)
	if p3.itemType == l__ItemType__2.LASSO then
		return false;
	end;
	if p3.itemType == l__ItemType__2.BLUNDERBUSS then
		return false;
	end;
	if p3.itemType == l__ItemType__2.WIZARD_STAFF then
		return false;
	end;
	if p3.itemType == l__ItemType__2.FISHING_ROD then
		return false;
	end;
	if p3.itemType == l__ItemType__2.VACUUM then
		return false;
	end;
	if p3.itemType == l__ItemType__2.FEATHER_BOW then
		return false;
	end;
	local v5 = true;
	if p3.itemType ~= l__ItemType__2.WOOD_BOW then
		v5 = p3.itemType == l__ItemType__2.WOOD_CROSSBOW;
	end;
	if v5 then
		local v6 = l__KnitClient__3.Controllers.KitController;
		if v6 ~= nil then
			v6 = v6:isUsingKit(l__Players__4.LocalPlayer, l__BedwarsKit__5.TRIPLE_SHOT);
		end;
		v5 = v6;
	end;
	if v5 then
		return false;
	end;
	local v7 = l__getItemMeta__6(p3.itemType);
	if v7.projectileSource == nil then
		return false;
	end;
	if v7.projectileSource.multiShot then
		return false;
	end;
	return true;
end;
function u1.onStartCharging(p4)

end;
function u1.onStopCharging(p5)

end;
function u1.onMaxCharge(p6)

end;
function u1.onLaunch(p7)

end;
function u1.onStartReload(p8)

end;
u1 = l__KnitClient__3.CreateController;
u1 = u1(u1.new());
return {
	DefaultProjectileSourceController = u1
};
