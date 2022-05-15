
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ClientStore__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__Players__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__BedwarsKit__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__CreateRoduxApp__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__BountyHunterPoster__5 = v1.import(script, script.Parent, "bountyhunter-poster").BountyHunterPoster;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return function(p1)
	l__ClientStore__1:dispatch({
		type = "KitBountyHunterSetTarget", 
		bountyHunterTarget = l__Players__2.LocalPlayer and {
			UserId = 1, 
			Name = "Vulcan"
		}
	});
	l__ClientStore__1:dispatch({
		type = "BedwarsSetOtherUsingKitSkin", 
		userId = 1, 
		usingKitSkin = true
	});
	l__ClientStore__1:dispatch({
		type = "BedwarsSetKits", 
		userId = 1, 
		kit = l__BedwarsKit__3.VULCAN
	});
	local u7 = l__CreateRoduxApp__4("BountyHunterPoster", l__BountyHunterPoster__5, {}, {}, {
		Parent = p1
	});
	return function()
		return u6.unmount(u7);
	end;
end;

