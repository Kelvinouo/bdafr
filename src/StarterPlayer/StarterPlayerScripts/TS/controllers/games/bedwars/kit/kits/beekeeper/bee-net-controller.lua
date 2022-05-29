-- Script Hash: 8a964243cd0953785114a15755e95fbfd47446f8c3d5c8e62f32c44a06df824f969039f228c66b66dcff6cfd3030eab8
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "BeeNetController";
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
function u1.constructor(p1, ...)
	u2.constructor(p1, ...);
	p1.Name = "BeeNetController";
end;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
end;
local l__ItemType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function u1.isRelevantItem(p3, p4)
	return p4.itemType == l__ItemType__3.BEE_NET;
end;
local l__Players__4 = v2.Players;
local l__GameAnimationUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__SoundManager__7 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__default__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function u1.trigger(p5, p6, p7)
	if p6 == l__Players__4.LocalPlayer then
		l__GameAnimationUtil__5.playAnimation(l__Players__4.LocalPlayer, l__AnimationType__6.NET_CATCH);
		l__SoundManager__7:playSound(l__GameSound__8.BEE_NET_SWING);
		l__default__9.Client:Get("RemoteName"):SendToServer({
			beeId = p7:GetAttribute("BeeId")
		});
	end;
end;
local l__CollectionService__10 = v2.CollectionService;
function u1.onEnable(p8)
	for v6, v7 in ipairs(l__CollectionService__10:GetTagged("bee")) do
		local v8 = v7.Root:FindFirstChildOfClass("ProximityPrompt");
		if v8 then
			v8.Enabled = true;
		end;
	end;
end;
function u1.onDisable(p9)
	for v9, v10 in ipairs(l__CollectionService__10:GetTagged("bee")) do
		local v11 = v10.Root:FindFirstChildOfClass("ProximityPrompt");
		if v11 then
			v11.Enabled = false;
		end;
	end;
end;
u2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
