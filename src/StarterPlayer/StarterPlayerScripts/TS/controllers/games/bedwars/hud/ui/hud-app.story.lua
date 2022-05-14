-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ClientStore__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__GamePlayerUtil__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local l__CreateRoduxApp__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__HudApp__4 = v1.import(script, script.Parent, "hud-app").HudApp;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return function(p1)
	for v2, v3 in ipairs(l__ClientStore__1:getState().Game.teams) do
		l__ClientStore__1:dispatch({
			type = "BedwarsSetBedAlive", 
			teamId = v3.id, 
			alive = true
		});
	end;
	l__ClientStore__1:dispatch({
		type = "BedwarsSetKills", 
		userId = l__GamePlayerUtil__2.UserId.SnickTrix, 
		kills = 420
	});
	local u6 = l__CreateRoduxApp__3("hud", l__HudApp__4, {
		localPlayerId = l__GamePlayerUtil__2.UserId.SnickTrix
	}, {}, {
		Parent = p1
	});
	return function()
		u5.unmount(u6);
	end;
end;
