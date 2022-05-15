
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local l__HandKnitController__3 = v1.import(script, script.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "BlockPlacementController";
	end, 
	__index = l__HandKnitController__3
});
v4.__index = v4;
local u1 = v4;
function u1.new(...)
	local v5 = setmetatable({}, u1);
	return v5:constructor(...) and v5;
end;
local u2 = l__HandKnitController__3;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "BlockPlacementController";
end;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
end;
function u1.isRelevantItem(p3, p4)
	return p3:getPlacedItemType(p4.itemType) ~= nil;
end;
local l__BlockPlacer__3 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out.client.placement["block-placer"]).BlockPlacer;
local l__ClientBlockEngine__4 = v1.import(script, script.Parent.Parent.Parent, "lib", "block-engine", "client-block-engine").ClientBlockEngine;
local l__AnimationType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function u1.onEnable(p5, p6)
	if p5.blockPlacer then
		p5.blockPlacer:disable();
	end;
	p5.blockPlacer = l__BlockPlacer__3.new(l__ClientBlockEngine__4, p5:getPlacedItemType(p6.itemType));
	p5.blockPlacer:enable();
	p5.blockPlacer.onPlace:Connect(function()
		l__KnitClient__2.Controllers.ViewmodelController:playAnimation(l__AnimationType__5.FP_USE_ITEM);
	end);
end;
function u1.onDisable(p7)
	if p7.blockPlacer then
		p7.blockPlacer:disable();
		p7.blockPlacer = nil;
	end;
end;
local l__getItemMeta__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function u1.getPlacedItemType(p8, p9)
	local v6 = l__getItemMeta__6(p9);
	if v6 then
		if v6.block then
			return p9;
		end;
		if not v6.placesBlock then
			return nil;
		end;
	else
		return nil;
	end;
	return v6.placesBlock.blockType;
end;
u2 = l__KnitClient__2.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	BlockPlacementController = u2
};
return u1;

