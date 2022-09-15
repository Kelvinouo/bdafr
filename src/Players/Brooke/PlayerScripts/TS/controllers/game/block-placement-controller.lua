-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__HandKnitController__2 = v1.import(script, script.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "BlockPlacementController";
	end, 
	__index = l__HandKnitController__2
});
v3.__index = v3;
local u1 = v3;
function u1.new(...)
	local v4 = setmetatable({}, u1);
	return v4:constructor(...) and v4;
end;
function u1.constructor(p1)
	l__HandKnitController__2.constructor(p1);
	p1.Name = "BlockPlacementController";
end;
function u1.KnitStart(p2)
	l__HandKnitController__2.KnitStart(p2);
end;
function u1.isRelevantItem(p3, p4)
	return p3:getPlacedItemType(p4.itemType) ~= nil;
end;
local l__BlockPlacer__2 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out.client.placement["block-placer"]).BlockPlacer;
local l__ClientBlockEngine__3 = v1.import(script, script.Parent.Parent.Parent, "lib", "block-engine", "client-block-engine").ClientBlockEngine;
local l__KnitClient__4 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__AnimationType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function u1.onEnable(p5, p6)
	if p5.blockPlacer then
		p5.blockPlacer:disable();
	end;
	p5.blockPlacer = l__BlockPlacer__2.new(l__ClientBlockEngine__3, p5:getPlacedItemType(p6.itemType));
	p5.blockPlacer:enable();
	p5.blockPlacer.onPlace:Connect(function()
		l__KnitClient__4.Controllers.ViewmodelController:playAnimation(l__AnimationType__5.FP_USE_ITEM);
	end);
end;
function u1.onDisable(p7)
	if p7.blockPlacer then
		p7.blockPlacer:disable();
		p7.blockPlacer = nil;
	end;
end;
function u1.getBlockPlacer(p8)
	return p8.blockPlacer;
end;
local l__getItemMeta__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function u1.getPlacedItemType(p9, p10)
	local v5 = l__getItemMeta__6(p10);
	if v5 then
		if v5.block then
			return p10;
		end;
		if not v5.placesBlock then
			return nil;
		end;
	else
		return nil;
	end;
	return v5.placesBlock.blockType;
end;
u1 = l__KnitClient__4.CreateController;
u1 = u1(u1.new());
return {
	BlockPlacementController = u1
};
