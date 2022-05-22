-- Script Hash: 63e46d2a8b736bf30b10daae582fcfcb1b8c58056359b85cd5a7235f78716eaaba9a2188fa6a048211e4445061a1adc4
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "LuckyBlockController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "LuckyBlockController";
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__LuckyBlockRarity__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "lucky-block", "lucky-block-enums").LuckyBlockRarity;
local l__ReplicatedStorage__4 = v2.ReplicatedStorage;
local l__default__5 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
local l__BlockEngine__6 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).BlockEngine;
local l__Workspace__7 = v2.Workspace;
local l__EffectUtil__8 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:OnEvent("RemoteName", function(p3)
		local v6 = nil;
		if p3.rarity <= l__LuckyBlockRarity__3.RARE and l__LuckyBlockRarity__3.EPIC < p3.rarity then
			v6 = l__ReplicatedStorage__4.Assets.Effects.LuckyBlock.OpenRare:Clone();
		elseif p3.rarity <= l__LuckyBlockRarity__3.EPIC and l__LuckyBlockRarity__3.LEGENDARY < p3.rarity then
			v6 = l__ReplicatedStorage__4.Assets.Effects.LuckyBlock.OpenEpic:Clone();
		elseif p3.rarity <= l__LuckyBlockRarity__3.LEGENDARY then
			v6 = l__ReplicatedStorage__4.Assets.Effects.LuckyBlock.OpenLegendary:Clone();
		end;
		if not v6 then
			return nil;
		end;
		l__default__5.Debug("Playing {effect}", v6.Name);
		v6.Transparency = 1;
		v6.CFrame = CFrame.new((l__BlockEngine__6:getWorldPosition(p3.blockPosition)));
		v6.Parent = l__Workspace__7;
		l__EffectUtil__8:playEffects({ v6 }, nil, {
			destroyAfterSec = 5
		});
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
