-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__CreateRoduxApp__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__HotbarApp__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "global", "hotbar", "ui", "hotbar-app").HotbarApp;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__StarCollectorDisplay__4 = v1.import(script, script.Parent, "star-collector-display").StarCollectorDisplay;
return function(p1)
	local u5 = l__CreateRoduxApp__1("hotbar", l__HotbarApp__2, {}, {}, {
		Parent = p1
	});
	local u6 = u3.mount(u3.createElement(l__StarCollectorDisplay__4, {
		greenStars = 5, 
		yellowStars = 5
	}), p1);
	return function()
		u3.unmount(u5);
		u3.unmount(u6);
	end;
end;
