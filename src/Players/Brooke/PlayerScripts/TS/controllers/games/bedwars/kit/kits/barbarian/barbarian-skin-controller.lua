-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "BarbarianSkinController";
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
	p1.Name = "BarbarianSkinController";
end;
local l__WatchCharacter__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCharacter;
local l__BarbarianKit__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "barbarian", "barbarian-kit").BarbarianKit;
function v3.KnitStart(p2)
	l__WatchCharacter__1(function(p3, p4, p5)
		p5:GiveTask(p3:GetAttributeChangedSignal("BarbarianRageLevel"):Connect(function()
			l__BarbarianKit__2.updateAppearance(p4, p3:GetAttribute("BarbarianRageLevel"));
		end));
		local v5 = p3:GetAttribute("BarbarianRageLevel");
		if v5 ~= nil then
			l__BarbarianKit__2.updateAppearance(p4, v5);
		end;
	end);
end;
local v6 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
