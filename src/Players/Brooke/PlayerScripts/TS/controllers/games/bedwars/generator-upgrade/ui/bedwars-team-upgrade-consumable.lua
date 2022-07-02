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
		local u12 = p1.Upgrade.tiers[1];
		local v4 = nil;
		for v5, v6 in ipairs(p1.store.Inventory.observedInventory.inventory.items) do
			if v6.itemType == u12.currency == true then
				v4 = v6;
				break;
			end;
		end;
		local v7 = v4;
		if v7 ~= nil then
			v7 = v7.amount;
		end;
		local v8 = v7;
		if v8 == nil then
			v8 = 0;
		end;
		local v9 = u12.price <= v8;
		local v10 = p1.store.Bedwars.teamUpgrades[p1.Upgrade.id];
		if v10 == nil then
			v10 = -1;
		end;
		local v11 = v10 > -1;
		local v12 = l__Theme__1.backgroundError;
		if v11 then
			v12 = l__Theme__1.backgroundSecondary;
		elseif v9 then
			v12 = l__Theme__1.backgroundSuccess;
		end;
		local v13 = {
			Size = p1.Size or UDim2.fromScale(1, 1)
		};
		local function u13()
			if not v9 then
				return nil;
			end;
			l__default__2.Client:Get("RemoteName"):CallServerAsync({
				upgradeId = p1.Upgrade.id, 
				tier = 0
			}):andThen(function()
				l__SoundManager__3:playSound(l__GameSound__4.BEDWARS_UPGRADE_SUCCESS);
			end);
		end;
		v13[u5.Event.MouseButton1Click] = function()
			if v9 and not v11 then
				u13();
			end;
		end;
		v13[u5.Event.MouseButton2Click] = function()
			if v9 and not v11 then
				u13();
			end;
		end;
		v13[u5.Event.MouseEnter] = function(p3)
			l__TweenService__7:Create(p3, TweenInfo.new(0.12), {
				BackgroundColor3 = l__ColorUtil__8.darken(l__Theme__1.backgroundPrimary, 0.9)
			}):Play();
		end;
		v13[u5.Event.MouseLeave] = function(p4)
			l__TweenService__7:Create(p4, TweenInfo.new(0.12), {
				BackgroundColor3 = l__Theme__1.backgroundPrimary
			}):Play();
		end;
		v13.BackgroundColor3 = l__Theme__1.backgroundPrimary;
		v13.BackgroundTransparency = 0;
		local v14 = {};
		local v15 = {};
		if v11 then
			local v16 = u5.createElement("TextLabel", {
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
			v16 = u5.createElement("TextLabel", {
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
		v15[1] = u5.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			VerticalAlignment = "Center"
		});
		v15[2] = u5.createElement("UIPadding", {
			PaddingLeft = UDim.new(0.05, 0)
		});
		v15[3] = u5.createElement("TextLabel", {
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
		v15[4] = u5.createElement(l__Empty__9, {
			Size = UDim2.fromScale(0, 0.07)
		});
		v15[5] = v16;
		v14[1] = u5.createElement("UIAspectRatioConstraint", {
			AspectRatio = 3.975, 
			DominantAxis = "Height"
		});
		v14[2] = u5.createElement("UICorner", {
			CornerRadius = UDim.new(0, 4)
		});
		v14[3] = u5.createElement("UIListLayout", {
			FillDirection = "Horizontal"
		});
		v14[4] = u5.createElement("Frame", {
			Size = UDim2.fromScale(1, 1), 
			SizeConstraint = "RelativeYY", 
			BackgroundColor3 = v12
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
		v14[5] = u5.createElement(l__Empty__9, {
			Size = UDim2.fromScale(2.975, 1), 
			SizeConstraint = "RelativeYY"
		}, v15);
		return u5.createElement(l__EmptyButton__6, v13, v14);
	end)
};
