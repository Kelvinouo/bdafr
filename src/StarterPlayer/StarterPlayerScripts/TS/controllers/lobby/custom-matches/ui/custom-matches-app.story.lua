-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__CreateRoduxApp__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__CustomMatchesApp__2 = v1.import(script, script.Parent, "custom-matches-app").CustomMatchesApp;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return function(p1)
	local u4 = l__CreateRoduxApp__1("CustomMatchesApp", l__CustomMatchesApp__2, {
		OnJoinMatch = print, 
		OnCreateMatch = function(p2, p3)
			print(p2, p3);
			wait(2);
		end, 
		OnClose = function()
			return print("Close");
		end
	}, {}, {
		Parent = p1
	});
	return function()
		u3.unmount(u4);
	end;
end;
