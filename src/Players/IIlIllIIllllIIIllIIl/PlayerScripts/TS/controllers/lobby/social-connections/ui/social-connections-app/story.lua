-- Script Hash: 3fcf77e56086fb22dc0857789a720bcf9d1c386264605c6e807b634ed806a7c08434ea8fa542a1ea446045579a6fc44c
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ClientStore__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__CreateRoduxApp__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__SocialConnectionsCore__3 = v1.import(script, script.Parent, "social-connections-core").SocialConnectionsCore;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return function(p1)
	l__ClientStore__1:dispatch({
		type = "SocialConnectionsSetAll", 
		supportTasks = {
			joinedGroup = false
		}, 
		connections = {
			discord = {
				verificationCode = "A3K4LL1", 
				validated = false, 
				legacyDiscordVerification = false
			}
		}
	});
	local u5 = l__CreateRoduxApp__2("SocialConnectionsApp", l__SocialConnectionsCore__3, {}, {}, {
		Parent = p1
	});
	return function()
		return u4.unmount(u5);
	end;
end;
