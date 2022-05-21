-- Script Hash: cc59b3d93f92c32d58dd998d8af2475fab0c241e9912f49d401cffc9210abf83c22b7086714709230f5c8a8724c20f7d
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__CreateRoduxApp__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__SpectateSelector__2 = v1.import(script, script.Parent, "spectate-selector").SpectateSelector;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__OfflinePlayerUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return function(p1)
	local v2 = l__CreateRoduxApp__1("spectate-selector", l__SpectateSelector__2, {}, {}, {
		Parent = p1
	});
	l__ClientStore__3:dispatch({
		type = "GameSetSpectator", 
		spectating = true, 
		spectatingPlayer = l__OfflinePlayerUtil__4.Dummy.SnickTrix
	});
	return function()
		return u5.unmount(v2);
	end;
end;
