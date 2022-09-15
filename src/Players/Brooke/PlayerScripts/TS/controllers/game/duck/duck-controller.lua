-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "DuckController";
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
	p1.Name = "DuckController";
end;
local l__CollectionTagAdded__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).CollectionTagAdded;
local l__MonsterType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "monster", "monster-type").MonsterType;
local l__KnitClient__3 = v2.KnitClient;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__CollectionTagAdded__1("Monster", function(p3)
		if p3:GetAttribute("MonsterType") == l__MonsterType__2.DUCK then
			task.spawn(function()
				l__KnitClient__3.Controllers.FootstepsController:hookCharacter(nil, p3, {
					walk = { l__GameSound__4.DUCK_FOOTSTEP_1, l__GameSound__4.DUCK_FOOTSTEP_2, l__GameSound__4.DUCK_FOOTSTEP_3 }, 
					run = { l__GameSound__4.DUCK_FOOTSTEP_1, l__GameSound__4.DUCK_FOOTSTEP_2, l__GameSound__4.DUCK_FOOTSTEP_3 }
				});
			end);
		end;
	end);
end;
local v6 = v2.KnitClient.CreateController(v4.new());
return nil;
