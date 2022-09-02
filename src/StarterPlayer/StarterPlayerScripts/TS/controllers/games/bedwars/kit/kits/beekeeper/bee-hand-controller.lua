-- Script Hash: 339a0a25f3ea5d826c43b3f7eafa19259104975d60dff6afd90d90f8ad4b03af67574ff1a75a107e8d953433963b093d
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "BeeHandController";
	end, 
	__index = l__HandKnitController__4
});
v5.__index = v5;
local u1 = v5;
function u1.new(...)
	local v6 = setmetatable({}, u1);
	return v6:constructor(...) and v6;
end;
local u2 = l__HandKnitController__4;
local l__Maid__3 = v2.Maid;
function u1.constructor(p1, ...)
	u2.constructor(p1, ...);
	p1.Name = "BeeHandController";
	p1.maid = l__Maid__3.new();
end;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
end;
local l__CollectionService__4 = v3.CollectionService;
local l__Players__5 = v3.Players;
local l__GameAnimationUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function u1.toggleAllBeehivePrompts(p3, p4)
	for v7, v8 in ipairs(l__CollectionService__4:GetTagged("beehive")) do
		if v8:GetAttribute("PlacedByUserId") == l__Players__5.LocalPlayer.UserId then
			local v9 = v8:FindFirstChildOfClass("ProximityPrompt");
			if v9 then
				v9.Enabled = p4;
				p3.maid:GiveTask(v9.TriggerEnded:Connect(function(p5)
					if p5 == l__Players__5.LocalPlayer then
						l__GameAnimationUtil__6.playAnimation(p5, l__AnimationType__7.PUNCH);
					end;
				end));
			end;
		end;
	end;
end;
function u1.onEnable(p6, p7)
	p6:toggleAllBeehivePrompts(true);
end;
function u1.onDisable(p8)
	p8.maid:DoCleaning();
	p8:toggleAllBeehivePrompts(false);
end;
local l__ItemType__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function u1.isRelevantItem(p9, p10)
	return p10.itemType == l__ItemType__8.BEE;
end;
u2 = v2.KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
