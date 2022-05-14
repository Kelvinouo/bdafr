-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local v3 = v1.import(script, script.Parent, "projectile-source-controller").ProjectileSourceController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "DefaultProjectileSourceController";
	end, 
	__index = v3
});
v4.__index = v4;
local u1 = v4;
function u1.new(...)
	local v5 = setmetatable({}, u1);
	return v5:constructor(...) and v5;
end;
local u2 = v3;
function u1.constructor(p1, ...)
	u2.constructor(p1, ...);
	p1.Name = "DefaultProjectileSourceController";
end;
local l__ItemType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__Players__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__BedwarsKit__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__getItemMeta__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function u1.isRelevantItem(p2, p3)
	if p3.itemType == l__ItemType__3.LASSO then
		return false;
	end;
	if p3.itemType == l__ItemType__3.WIZARD_STAFF then
		return false;
	end;
	if p3.itemType == l__ItemType__3.FISHING_ROD then
		return false;
	end;
	if p3.itemType == l__ItemType__3.VACUUM then
		return false;
	end;
	if p3.itemType == l__ItemType__3.FEATHER_BOW then
		return false;
	end;
	if (p3.itemType == l__ItemType__3.WOOD_BOW or p3.itemType == l__ItemType__3.WOOD_CROSSBOW) and l__KnitClient__2.Controllers.KitController:isUsingKit(l__Players__4.LocalPlayer, l__BedwarsKit__5.TRIPLE_SHOT) then
		return false;
	end;
	local v6 = l__getItemMeta__6(p3.itemType);
	if v6.projectileSource == nil then
		return false;
	end;
	if v6.projectileSource.multiShot then
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
u2 = l__KnitClient__2.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	DefaultProjectileSourceController = u2
};
return u1;
