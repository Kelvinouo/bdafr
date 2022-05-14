-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__GiftUtils__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-utils").GiftUtils;
local l__BedwarsKit__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Button__4 = v2.Button;
local l__Flamework__5 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__GiftMeta__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-meta").GiftMeta;
local l__KitViewport__8 = v1.import(script, script.Parent.Parent.Parent.Parent, "misc", "kit-viewport").KitViewport;
local l__ColorUtil__9 = v2.ColorUtil;
local l__DeviceUtil__10 = v2.DeviceUtil;
local l__ImageId__11 = v2.ImageId;
local l__TooltipContainer__12 = v2.TooltipContainer;
local l__AutoSizedText__13 = v2.AutoSizedText;
return {
	KitShopGiftButton = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u3)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = l__GiftUtils__1.isKitGift(p1.GiftType);
		local v5 = p1.GiftType == l__BedwarsKit__2.NONE;
		if v4 and v5 then
			return u3.createFragment();
		end;
		local v6 = {};
		local v7 = {
			Size = p1.Size, 
			BackgroundTransparency = 1, 
			Selectable = false
		};
		function v7.OnClick()
			local v8 = {
				GiftType = p1.GiftType
			};
			local v9 = {};
			for v10, v11 in pairs(l__GiftMeta__7[p1.GiftType]) do
				v9[v10] = v11;
			end;
			if v4 and not v5 then
				local v12 = u3.createElement(l__KitViewport__8, {
					Kit = p1.GiftType, 
					Size = UDim2.fromScale(1, 1), 
					SizeConstraint = "RelativeYY"
				});
			else
				v12 = nil;
			end;
			v9.customImage = v12;
			local l__GiftDisplayProps__13 = p1.GiftDisplayProps;
			if type(l__GiftDisplayProps__13) == "table" then
				for v14, v15 in pairs(l__GiftDisplayProps__13) do
					v9[v14] = v15;
				end;
			end;
			v8.Gift = v9;
			l__Flamework__5.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__6.GIFTING, v8);
		end;
		v7.LayoutOrder = p1.LayoutOrder;
		local v16 = {};
		local v17 = {
			Color = l__ColorUtil__9.hexColor(13934614)
		};
		if l__DeviceUtil__10.isSmallScreen() then
			local v18 = 1;
		else
			v18 = 2;
		end;
		v17.Thickness = v18;
		v16[1] = u3.createElement("UIStroke", v17);
		v16[2] = u3.createElement("UICorner", {
			CornerRadius = UDim.new(1000, 0)
		});
		v16[3] = u3.createElement("ImageLabel", {
			Image = l__ImageId__11.GIFTS_SOLID, 
			ImageColor3 = Color3.fromRGB(255, 255, 255), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			Size = UDim2.fromScale(0.65, 0.65), 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			ScaleType = "Fit", 
			SizeConstraint = "RelativeYY"
		});
		v16[4] = u3.createElement(l__TooltipContainer__12, {}, { u3.createElement(l__AutoSizedText__13, {
				Text = "Gift Item", 
				Font = Enum.Font.SourceSansBold, 
				TextSize = 16, 
				Limits = Vector2.new(300, 60)
			}), u3.createElement(l__AutoSizedText__13, {
				Text = l__GiftMeta__7[p1.GiftType].name, 
				Font = Enum.Font.SourceSansSemibold, 
				TextSize = 14, 
				Limits = Vector2.new(300, 500)
			}) });
		v6.GiftKitButton = u3.createElement(l__Button__4, v7, v16);
		return u3.createFragment(v6);
	end)
};
