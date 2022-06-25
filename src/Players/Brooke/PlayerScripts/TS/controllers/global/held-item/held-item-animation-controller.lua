-- Script Hash: d19fcc235a37f624266a727368ad2ddaa3267f1538958026104bb9c08497b5f4a56ff1e7b5628e7b68f69a99f3b04175
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__HandKnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "HeldItemAnimationController";
	end, 
	__index = l__HandKnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__HandKnitController__2;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v3.constructor(p1)
	u1.constructor(p1);
	p1.Name = "HeldItemAnimationController";
	p1.maid = u2.new();
end;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
end;
local l__getItemMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function v3.isRelevantItem(p3, p4)
	local v5 = l__getItemMeta__3(p4.itemType).thirdPerson;
	if v5 ~= nil then
		v5 = v5.holdAnimation;
	end;
	return v5 ~= nil;
end;
local l__GameAnimationUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__Players__5 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
function v3.onEnable(p5, p6, p7)
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
function v3.onDisable(p8)
	p8.maid:DoCleaning();
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
