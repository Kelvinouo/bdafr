-- Script Hash: adfaf217285c9539ba1fba2bcdaa3a8cf0aa1b18967e49aae57de532c3ed5f5b728664be48e37488dfe9723d97d40cf5
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__CreateRoduxApp__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__BarbarianRageBar__2 = v1.import(script, script.Parent, "barbarian-rage-bar").BarbarianRageBar;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return function(p1)
	local u4 = l__CreateRoduxApp__1("BarbarianRageBar", l__BarbarianRageBar__2, {}, {}, {
		Parent = p1
	});
	return function()
		return u3.unmount(u4);
	end;
end;
