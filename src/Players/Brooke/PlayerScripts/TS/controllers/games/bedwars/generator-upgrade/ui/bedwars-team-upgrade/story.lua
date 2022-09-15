-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ClientStore__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__TeamUpgradeId__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").TeamUpgradeId;
local l__CreateRoduxApp__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__BedwarsTeamUpgradeApp__4 = v1.import(script, script.Parent, "bedwars-team-upgrade-app").BedwarsTeamUpgradeApp;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return function(p1)
	l__ClientStore__1:dispatch({
		type = "BedwarsSetTeamUpgradeTier", 
		upgradeId = l__TeamUpgradeId__2.ARMORY, 
		tier = 0
	});
	local u6 = l__CreateRoduxApp__3("BedwarsGeneratorUpgrade", l__BedwarsTeamUpgradeApp__4, {}, {}, {
		Parent = p1
	});
	return function()
		u5.unmount(u6);
	end;
end;
