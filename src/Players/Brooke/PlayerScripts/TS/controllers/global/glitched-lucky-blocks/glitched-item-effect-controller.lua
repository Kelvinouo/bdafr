-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "GlitchedItemEffectController";
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
	p1.Name = "GlitchedItemEffectController";
end;
local l__ClientSyncEvents__1 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__getItemMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__ClientSyncEvents__1.EntityChangeHeldItem:connect(function(p3)
		if not p3.entity then
			return nil;
		end;
		local v6 = p3.item;
		if v6 ~= nil then
			v6 = v6.Name;
		end;
		if not v6 then
			return nil;
		end;
		if l__getItemMeta__2(v6).glitched then
			p2:playGlitchParticlesOnHand(p3.entity:getInstance());
		end;
	end);
end;
local l__ReplicatedStorage__3 = v2.ReplicatedStorage;
local l__Workspace__4 = v2.Workspace;
local l__EffectUtil__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function v4.playGlitchParticlesOnHand(p4, p5, p6, p7)
	task.spawn(function()
		local v7 = l__ReplicatedStorage__3.Assets.Effects.GlitchedItemEffect:Clone();
		v7.Name = "GlitchEffectHand";
		v7.Parent = l__Workspace__4;
		v7.Transparency = 1;
		wait(0.3);
		v7.CFrame = CFrame.new(p5.RightHand.Position);
		l__EffectUtil__5:playEffects({ v7 }, nil, {
			destroyAfterSec = 1.5
		});
	end);
end;
local v8 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
