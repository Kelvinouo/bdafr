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
function u1.constructor(p1, ...)
	l__HandKnitController__3.constructor(p1, ...);
	p1.Name = "BeeNetController";
end;
function u1.KnitStart(p2)
	l__HandKnitController__3.KnitStart(p2);
end;
local l__ItemType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function u1.isRelevantItem(p3, p4)
	return p4.itemType == l__ItemType__2.BEE_NET;
end;
local l__Players__3 = v2.Players;
local l__GameAnimationUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__SoundManager__6 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__default__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function u1.trigger(p5, p6, p7)
	if p6 == l__Players__3.LocalPlayer then
		l__GameAnimationUtil__4.playAnimation(l__Players__3.LocalPlayer, l__AnimationType__5.NET_CATCH);
		l__SoundManager__6:playSound(l__GameSound__7.BEE_NET_SWING);
		l__default__8.Client:Get("RemoteName"):SendToServer({
			beeId = p7:GetAttribute("BeeId")
		});
	end;
end;
local l__CollectionService__9 = v2.CollectionService;
function u1.onEnable(p8)
	local v6, v7, v8 = ipairs(l__CollectionService__9:GetTagged("bee"));
	while true do
		v6(v7, v8);
		if not v6 then
			break;
		end;
		v8 = v6;
		local v9 = v7.Root:FindFirstChildOfClass("ProximityPrompt");
		if v9 then
			v9.Enabled = true;
		end;	
	end;
end;
function u1.onDisable(p9)
	local v10, v11, v12 = ipairs(l__CollectionService__9:GetTagged("bee"));
	while true do
		v10(v11, v12);
		if not v10 then
			break;
		end;
		v12 = v10;
		local v13 = v11.Root:FindFirstChildOfClass("ProximityPrompt");
		if v13 then
			v13.Enabled = false;
		end;	
	end;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return nil;
