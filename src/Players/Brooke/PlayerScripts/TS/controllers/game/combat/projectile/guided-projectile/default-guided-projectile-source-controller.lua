-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, script.Parent, "guided-projectile-source-controller").GuidedProjectileSourceController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "DefaultGuidedProjectileSourceController";
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
	p1.Name = "DefaultGuidedProjectileSourceController";
end;
local l__getItemMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function u1.isRelevantItem(p2, p3)
	return l__getItemMeta__2(p3.itemType).guidedProjectileSource ~= nil;
end;
function u1.onLaunch(p4)

end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return {
	DefaultGuidedProjectileSourceController = u1
};
