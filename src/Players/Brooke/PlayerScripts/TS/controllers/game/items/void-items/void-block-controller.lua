-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "VoidBlockController";
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
	p1.Name = "VoidBlockController";
	p1.timer = 0;
end;
local l__WatchCollectionTag__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCollectionTag;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__default__3 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__Linear__4 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).Linear;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	l__WatchCollectionTag__1("void_block", function(p3)
		local v5 = u2.new();
		local l__Part__6 = p3:WaitForChild("Part", 3);
		if l__Part__6 == nil then
			return nil;
		end;
		local u5 = l__default__3(1.5, l__Linear__4, function(p4)
			l__Part__6.Transparency = p4;
		end, l__Part__6.Transparency, 1);
		local u6 = l__default__3(1.5, l__Linear__4, function(p5)
			p3.Transparency = p5;
		end, p3.Transparency, 1);
		v5:GiveTask(function()
			u5:Cancel();
			u6:Cancel();
		end);
		l__Part__6.AncestryChanged:Connect(function(p6, p7)
			if p7 == nil then
				v5:DoCleaning();
			end;
		end);
	end);
end;
local v7 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
