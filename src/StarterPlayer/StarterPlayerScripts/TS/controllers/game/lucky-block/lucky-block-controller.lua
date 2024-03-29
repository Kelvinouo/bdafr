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
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "LuckyBlockController";
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__LuckyBlockRarity__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "lucky-block", "lucky-block-enums").LuckyBlockRarity;
local l__ReplicatedStorage__3 = v2.ReplicatedStorage;
local l__default__4 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
local l__BlockEngine__5 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).BlockEngine;
local l__Workspace__6 = v2.Workspace;
local l__EffectUtil__7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__default__1.Client:OnEvent("RemoteName", function(p3)
		local v6 = nil;
		if p3.rarity <= l__LuckyBlockRarity__2.RARE and l__LuckyBlockRarity__2.EPIC < p3.rarity then
			v6 = l__ReplicatedStorage__3.Assets.Effects.LuckyBlock.OpenRare:Clone();
		elseif p3.rarity <= l__LuckyBlockRarity__2.EPIC and l__LuckyBlockRarity__2.LEGENDARY < p3.rarity then
			v6 = l__ReplicatedStorage__3.Assets.Effects.LuckyBlock.OpenEpic:Clone();
		elseif p3.rarity <= l__LuckyBlockRarity__2.LEGENDARY then
			v6 = l__ReplicatedStorage__3.Assets.Effects.LuckyBlock.OpenLegendary:Clone();
		end;
		if not v6 then
			return nil;
		end;
		l__default__4.Debug("Playing {effect}", v6.Name);
		v6.Transparency = 1;
		v6.CFrame = CFrame.new((l__BlockEngine__5:getWorldPosition(p3.blockPosition)));
		v6.Parent = l__Workspace__6;
		l__EffectUtil__7:playEffects({ v6 }, nil, {
			destroyAfterSec = 5
		});
	end);
end;
local v7 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
