
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__HandKnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "HeldItemAnimationController";
	end, 
	__index = l__HandKnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__HandKnitController__3;
local l__Maid__2 = v2.Maid;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "HeldItemAnimationController";
	p1.maid = l__Maid__2.new();
end;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
end;
local l__getItemMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function v4.isRelevantItem(p3, p4)
	local v6 = l__getItemMeta__3(p4.itemType).thirdPerson;
	if v6 ~= nil then
		v6 = v6.holdAnimation;
	end;
	return v6 ~= nil;
end;
local l__GameAnimationUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__Players__5 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
function v4.onEnable(p5, p6, p7)
	local l__holdAnimation__6 = l__getItemMeta__3(p6.itemType).thirdPerson.holdAnimation;
	p5:setupYield(function()
		local u7 = l__GameAnimationUtil__4.playAnimation(l__Players__5.LocalPlayer, l__holdAnimation__6);
		p5.maid:GiveTask(function()
			if u7 ~= nil then
				u7:Stop();
			end;
		end);
		return function()
			if u7 ~= nil then
				u7:Stop();
			end;
		end;
	end);
end;
function v4.onDisable(p8)
	p8.maid:DoCleaning();
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v4.new());
return nil;

