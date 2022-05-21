-- Script Hash: b8bdf184c33c66f37c3d12f0919fbddbdede9b405f13d4c25663bd9bdb9bdbe6b1eb50cd5291e62383929564c490cba5
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "TeamNametagIconController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
local u1 = v3;
function u1.new(...)
	local v4 = setmetatable({}, u1);
	return v4:constructor(...) and v4;
end;
local u2 = l__KnitController__2;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "TeamNametagIconController";
end;
local l__WatchCharacter__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCharacter;
local l__Players__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__GamePlayerUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local l__ClientStore__6 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
function u1.KnitStart(p2)
	l__WatchCharacter__3(function(p3, p4)
		if p3 == l__Players__4.LocalPlayer then
			return nil;
		end;
		return nil;
	end);
end;
u2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	TeamNametagIconController = u2
};
return u1;
