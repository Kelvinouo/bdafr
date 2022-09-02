-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "PigsyKitController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "PigsyKitController";
	p1.maid = u1.new();
end;
local l__KnitClient__2 = v2.KnitClient;
local l__BedwarsKit__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__KnitClient__2.Controllers.KitController:watchLocalKit(function(p3)
		p2.maid:DoCleaning();
		if p3 == l__BedwarsKit__3.PINATA then
			return;
		end;
		return nil;
	end);
end;
local v6 = v2.KnitClient.CreateController(v4.new());
return nil;
