-- Script Hash: 87870c33a19897734c7682ecda852efbc6f6bad81227732826055233537af03490b47dc1ae3d3672539a3fc1ad88662d
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "VoidSwordController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__KnitController__2;
function v3.constructor(p1)
	u1.constructor(p1);
	p1.Name = "VoidSwordController";
end;
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__ItemType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	l__KnitClient__2.Controllers.PreloadController:preloadForItemType(l__ItemType__3.VOID_SWORD, {
		sounds = { l__GameSound__4.VOID_HEALTH_DECAY }
	});
end;
u1 = l__KnitClient__2.CreateController;
u1 = u1(v3.new());
return nil;
