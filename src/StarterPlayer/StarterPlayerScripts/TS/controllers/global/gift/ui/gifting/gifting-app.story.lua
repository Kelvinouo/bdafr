
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__CreateRoduxApp__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__GiftingCore__2 = v1.import(script, script.Parent, "gifting-core").GiftingCore;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__KitViewport__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "kit-shop", "ui", "misc", "kit-viewport").KitViewport;
local l__BedwarsKit__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
return function(p1)
	local u6 = l__CreateRoduxApp__1("GiftingApp", l__GiftingCore__2, {
		Gift = {
			name = "Grim Reaper", 
			customImage = u3.createElement(l__KitViewport__4, {
				Kit = l__BedwarsKit__5.GRIM_REAPER, 
				Size = UDim2.fromScale(1, 1), 
				Position = UDim2.fromScale(0.5, 0.5), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				BackgroundTransparency = 1, 
				SizeConstraint = "RelativeYY"
			}), 
			price = 399, 
			devProductId = 123
		}
	}, {}, {
		Parent = p1
	});
	return function()
		return u3.unmount(u6);
	end;
end;

