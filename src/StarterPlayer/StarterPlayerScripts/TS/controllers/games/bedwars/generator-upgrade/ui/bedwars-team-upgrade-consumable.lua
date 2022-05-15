
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__Theme__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__SoundManager__3 = v2.SoundManager;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__EmptyButton__6 = v2.EmptyButton;
local l__TweenService__7 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local l__ColorUtil__8 = v2.ColorUtil;
local l__Empty__9 = v2.Empty;
local l__ItemUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local l__getItemMeta__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
return {
	BedWarsTeamUpgradeConsumable = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u5)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local l__items__4 = p1.store.Inventory.observedInventory.inventory.items;
		local u12 = p1.Upgrade.tiers[1];
		local function v5(p3)
			return p3.itemType == u12.currency;
		end;
		local v6 = nil;
		for v7, v8 in ipairs(l__items__4) do
			if v5(v8, v7 - 1, l__items__4) == true then
				v6 = v8;
				break;
			end;
		end;
		local v9 = v6;
		if v9 ~= nil then
			v9 = v9.amount;
		end;
		local v10 = v9;
		if v10 == nil then
			v10 = 0;
		end;
		local v11 = u12.price <= v10;
		local v12 = p1.store.Bedwars.teamUpgrades[p1.Upgrade.id];
		if v12 == nil then
			v12 = -1;
		end;
		local v13 = v12 > -1;
		local v14 = l__Theme__1.backgroundError;
		if v13 then
			v14 = l__Theme__1.backgroundSecondary;
		elseif v11 then
			v14 = l__Theme__1.backgroundSuccess;
		end;
		local v15 = {
			Size = p1.Size or UDim2.fromScale(1, 1)
		};
		local function u13()
			if not v11 then
				return nil;
			end;
			l__default__2.Client:Get("BedwarsPurchaseTeamUpgrade"):CallServerAsync({
				upgradeId = p1.Upgrade.id, 
				tier = 0
			}):andThen(function()
				l__SoundManager__3:playSound(l__GameSound__4.BEDWARS_UPGRADE_SUCCESS);
			end);
		end;
		v15[u5.Event.MouseButton1Click] = function()
			if v11 and not v13 then
				u13();
			end;
		end;
		v15[u5.Event.MouseButton2Click] = function()
			if v11 and not v13 then
				u13();
			end;
		end;
		v15[u5.Event.MouseEnter] = function(p4)
			l__TweenService__7:Create(p4, TweenInfo.new(0.12), {
				BackgroundColor3 = l__ColorUtil__8.darken(l__Theme__1.backgroundPrimary, 0.9)
			}):Play();
		end;
		v15[u5.Event.MouseLeave] = function(p5)
			l__TweenService__7:Create(p5, TweenInfo.new(0.12), {
				BackgroundColor3 = l__Theme__1.backgroundPrimary
			}):Play();
		end;
		v15.BackgroundColor3 = l__Theme__1.backgroundPrimary;
		v15.BackgroundTransparency = 0;
		local v16 = {};
		local v17 = {};
		if v13 then
			local v18 = u5.createElement("TextLabel", {
				Text = "[Purchased]", 
				Size = UDim2.fromScale(0.8, 0.35), 
				AnchorPoint = Vector2.new(0, 0), 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				Font = "Roboto", 
				TextScaled = true, 
				RichText = true, 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				TextTransparency = 0.4, 
				TextXAlignment = "Left"
			});
		else
			v18 = u5.createElement("TextLabel", {
				Text = "<b>" .. tostring(u12.price) .. " " .. l__ItemUtil__10.getDisplayName(u12.currency) .. "</b>", 
				Size = UDim2.fromScale(0.8, 0.35), 
				AnchorPoint = Vector2.new(0, 0), 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				Font = "Roboto", 
				TextScaled = true, 
				RichText = true, 
				TextColor3 = l__getItemMeta__11(u12.currency).displayNameColor or Color3.fromRGB(255, 255, 255), 
				TextXAlignment = "Left"
			});
		end;
		v17[1] = u5.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			VerticalAlignment = "Center"
		});
		v17[2] = u5.createElement("UIPadding", {
			PaddingLeft = UDim.new(0.05, 0)
		});
		v17[3] = u5.createElement("TextLabel", {
			Text = "<b>" .. u12.name .. "</b>", 
			Size = UDim2.fromScale(0.8, 0.35), 
			AnchorPoint = Vector2.new(0, 0), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			Font = "Roboto", 
			TextScaled = true, 
			RichText = true, 
			TextColor3 = Color3.fromRGB(255, 255, 255), 
			TextXAlignment = "Left"
		});
		v17[4] = u5.createElement(l__Empty__9, {
			Size = UDim2.fromScale(0, 0.07)
		});
		v17[5] = v18;
		v16[1] = u5.createElement("UIAspectRatioConstraint", {
			AspectRatio = 3.975, 
			DominantAxis = "Height"
		});
		v16[2] = u5.createElement("UICorner", {
			CornerRadius = UDim.new(0, 4)
		});
		v16[3] = u5.createElement("UIListLayout", {
			FillDirection = "Horizontal"
		});
		v16[4] = u5.createElement("Frame", {
			Size = UDim2.fromScale(1, 1), 
			SizeConstraint = "RelativeYY", 
			BackgroundColor3 = v14
		}, { u5.createElement("UICorner", {
				CornerRadius = UDim.new(0, 4)
			}), u5.createElement("ImageLabel", {
				Image = p1.Upgrade.image, 
				Position = UDim2.fromScale(0.5, 0.5), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Size = UDim2.fromScale(0.6, 0.6), 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0
			}) });
		v16[5] = u5.createElement(l__Empty__9, {
			Size = UDim2.fromScale(2.975, 1), 
			SizeConstraint = "RelativeYY"
		}, v17);
		return u5.createElement(l__EmptyButton__6, v15, v16);
	end)
};

