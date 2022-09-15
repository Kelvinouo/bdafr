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
function v3.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "VoidSwordController";
end;
local l__KnitClient__1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__ItemType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__GameSound__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	l__KnitClient__1.Controllers.PreloadController:preloadForItemType(l__ItemType__2.VOID_SWORD, {
		sounds = { l__GameSound__3.VOID_HEALTH_DECAY }
	});
end;
local v5 = l__KnitClient__1.CreateController(v3.new());
return nil;
