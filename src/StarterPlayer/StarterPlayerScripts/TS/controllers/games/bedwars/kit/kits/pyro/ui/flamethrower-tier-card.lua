-- Script Hash: ff6846be9a50366fcf1167f1f36f53faaf6ca2b50ba51c2748d797f569fd8a0d944a1801fe0cdb8797e2aa46e8bf0a92
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__BedwarsShop__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
local l__InventoryUtil__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__Players__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__5 = v2.ColorUtil;
local l__LineFrame__6 = v2.LineFrame;
local l__LineButton__7 = v2.LineButton;
local l__default__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__KnitClient__9 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
return {
	FlamethrowerTierCard = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u4)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = p1.UpgradeMap[p1.Upgrade];
		if v4 == nil then
			v4 = -1;
		end;
		local v5 = v4 + 1;
		local v6 = l__BedwarsShop__1.getUpgrade(l__BedwarsShop__1.FlamethrowerUpgrades, p1.Upgrade);
		if v5 < #v6.tiers then
			local v7 = v6.tiers[v5 + 1];
		else
			v7 = nil;
		end;
		local v8 = false;
		local v9 = v7;
		if v9 then
			local v10 = v7;
			if v10 ~= nil then
				v10 = v10.currency;
			end;
			local v11 = v7;
			if v11 ~= nil then
				v11 = v11.price;
			end;
			v9 = l__InventoryUtil__2.hasEnough(l__Players__3.LocalPlayer, v10, v11);
		end;
		if v9 then
			v8 = true;
		end;
		local v12 = false;
		if p1.Locked and v5 + 1 == 4 then
			v12 = true;
		end;
		local v13 = {};
		local v14 = {};
		local v15 = {};
		local v16 = {};
		local v17 = {
			Font = "RobotoCondensed"
		};
		if v7 then
			local v18 = v7.name;
		else
			v18 = "";
		end;
		v17.Text = v18;
		v17.TextXAlignment = "Center";
		v17.TextYAlignment = "Center";
		v17.TextScaled = true;
		v17.Size = UDim2.fromScale(0.95, 0.45);
		v17.Position = UDim2.fromScale(0.5, 0.5);
		v17.AnchorPoint = Vector2.new(0.5, 0.5);
		v17.BackgroundTransparency = 1;
		v17.TextColor3 = l__ColorUtil__5.WHITE;
		v16[1] = u4.createElement("TextLabel", v17);
		local v19 = {};
		local v20 = {
			Size = UDim2.fromScale(0.95, 0.8), 
			Position = UDim2.fromScale(0.5, 0.5), 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Color3 = l__ColorUtil__5.hexColor(16727624)
		};
		if v7 then
			if not v12 then
				if v7.price ~= 1 then
					local v21 = "S";
				else
					v21 = "";
				end;
				local v22 = tostring(v7.price) .. " " .. string.upper(v7.currency) .. v21;
			else
				v22 = "LOCKED";
			end;
		else
			v22 = "MAXED";
		end;
		v20.Text = v22;
		function v20.OnClick()
			l__default__8.Client:Get("RemoteName"):CallServerAsync(p1.Upgrade):andThen(function(p3)
				if p3 then
					l__KnitClient__9.Controllers.FlamethrowerController:upgrade();
					p1.SetUpgrades(p3);
				end;
			end);
		end;
		local v23 = v8;
		if v23 then
			v23 = false;
			if v7 ~= nil then
				v23 = not v12;
			end;
		end;
		v20.Enabled = v23;
		v19[1] = u4.createElement(l__LineButton__7, v20);
		v15[1] = u4.createElement("UIListLayout", {
			SortOrder = "LayoutOrder", 
			FillDirection = "Vertical", 
			HorizontalAlignment = "Center"
		});
		v15[2] = u4.createElement("Frame", {
			BackgroundTransparency = 1, 
			Size = UDim2.fromScale(1, 0.5), 
			LayoutOrder = 0
		}, v16);
		v15[3] = u4.createElement("Frame", {
			BackgroundTransparency = 1, 
			Size = UDim2.fromScale(1, 0.5), 
			LayoutOrder = 1
		}, v19);
		v14[1] = u4.createElement(l__LineFrame__6, {
			BorderColor3 = l__ColorUtil__5.WHITE, 
			BorderWidthPixels = 2, 
			Size = UDim2.fromScale(1, 1), 
			Position = UDim2.fromScale(0.5, 0.5), 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			BorderTransparency = 1
		}, v15);
		v13[1] = u4.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			HorizontalAlignment = "Center", 
			SortOrder = "LayoutOrder"
		});
		v13[2] = u4.createElement("Frame", {
			Size = UDim2.fromScale(1, 0.18867924528301888), 
			BackgroundTransparency = 1, 
			LayoutOrder = 0
		}, { u4.createElement("TextLabel", {
				Size = UDim2.fromScale(0.6, 0.9), 
				Position = UDim2.fromScale(0, 0), 
				Font = "RobotoCondensed", 
				Text = "<b>" .. v6.name .. ":</b>  Tier " .. tostring(v5), 
				RichText = true, 
				TextColor3 = l__ColorUtil__5.WHITE, 
				TextScaled = true, 
				TextXAlignment = "Left", 
				TextYAlignment = "Bottom", 
				BackgroundTransparency = 1
			}) });
		v13[3] = u4.createElement("Frame", {
			Size = UDim2.fromScale(1, 0.9270440251572327), 
			BackgroundTransparency = 0.5, 
			BackgroundColor3 = l__ColorUtil__5.hexColor(0), 
			BorderSizePixel = 0, 
			LayoutOrder = 1
		}, v14);
		return u4.createElement("Frame", {
			Size = p1.Size, 
			Position = p1.Position, 
			AnchorPoint = p1.AnchorPoint, 
			BackgroundTransparency = 1
		}, v13);
	end)
};
