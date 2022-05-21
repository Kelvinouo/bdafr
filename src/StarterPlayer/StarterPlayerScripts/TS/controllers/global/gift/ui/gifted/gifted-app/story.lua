-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__CreateRoduxApp__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__GiftedApp__2 = v1.import(script, script.Parent, "gifted-app").GiftedApp;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__KitViewport__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "kit-shop", "ui", "misc", "kit-viewport").KitViewport;
local l__BedwarsKit__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__OfflinePlayerUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil;
return function(p1)
	local u7 = l__CreateRoduxApp__1("GiftedApp", l__GiftedApp__2, {
		giftName = "Grim Reaper", 
		giftCustomImage = u3.createElement(l__KitViewport__4, {
			Kit = l__BedwarsKit__5.GRIM_REAPER, 
			Size = UDim2.fromScale(1, 1), 
			Position = UDim2.fromScale(0.5, 0.5), 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			BackgroundTransparency = 1, 
			SizeConstraint = "RelativeYY"
		}), 
		fromPlayer = l__OfflinePlayerUtil__6.Dummy.LongNameMan, 
		message = "Happy birthday buddy xd \240\159\142\130"
	}, {}, {
		Parent = p1
	});
	return function()
		return u3.unmount(u7);
	end;
end;
