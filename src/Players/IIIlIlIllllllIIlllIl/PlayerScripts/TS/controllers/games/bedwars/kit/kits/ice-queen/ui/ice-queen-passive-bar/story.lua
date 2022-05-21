-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__Workspace__1 = v2.Workspace;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__CreateRoduxApp__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local u4 = v1.import(script, script.Parent, "ice-queen-passive-bar").IceQueenPassiveBarWrapper;
local l__StarterGui__5 = v2.StarterGui;
return function(p1)
	local v3 = Instance.new("Part");
	v3.Parent = l__Workspace__1;
	local u6 = l__CreateRoduxApp__3("ice-queen-passive-bar", u4, {
		bar = u2.createBinding(3), 
		adornee = v3
	}, {}, {
		Parent = l__StarterGui__5
	});
	return function()
		u2.unmount(u6);
		v3:Destroy();
	end;
end;
