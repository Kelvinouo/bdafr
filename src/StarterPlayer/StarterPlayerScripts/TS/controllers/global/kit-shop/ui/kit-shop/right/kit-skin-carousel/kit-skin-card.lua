-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__BedwarsKitSkin__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local l__DeviceUtil__3 = v2.DeviceUtil;
local l__KnitClient__4 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local l__ClientStore__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__TweenService__6 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local l__ColorUtil__7 = v2.ColorUtil;
local l__Theme__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__BedwarsImageId__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__KitViewport__10 = v1.import(script, script.Parent.Parent.Parent.Parent, "misc", "kit-viewport").KitViewport;
local l__Empty__11 = v2.Empty;
return {
	KitSkinCard = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = p1.Skin == l__BedwarsKitSkin__2.DEFAULT;
		local v5 = v4 or table.find(p1.store.Bedwars.ownedKitSkins, p1.Skin) ~= nil;
		if not l__DeviceUtil__3.isHoarceKat() and l__KnitClient__4.Controllers.UnlockController.allItemsUnlocked then
			v5 = true;
		end;
		local v6 = false;
		if p1.store.Bedwars.equippedKitSkins then
			v6 = p1.Skin == p1.store.Bedwars.equippedKitSkins[p1.Kit];
		end;
		local v7 = {
			Size = UDim2.fromScale(0.25, 0.88), 
			BackgroundTransparency = 1
		};
		v7[u1.Event.Activated] = function()
			p1.SetSelectedSkin(p1.Skin);
			if v5 and not v6 then
				if not l__DeviceUtil__3.isHoarceKat() then
					l__KnitClient__4.Controllers.KitSkinController:equipKitSkin(p1.Kit, p1.Skin);
					return;
				end;
			else
				return;
			end;
			l__ClientStore__5:dispatch({
				type = "EquipKitSkin", 
				kit = p1.Kit, 
				kitSkin = p1.Skin
			});
		end;
		local u12 = u1.createRef();
		v7[u1.Event.MouseEnter] = function()
			l__TweenService__6:Create(u12:getValue(), TweenInfo.new(0.15), {
				BackgroundTransparency = 1
			}):Play();
		end;
		local u13 = p1.SelectedSkin == p1.Skin;
		v7[u1.Event.MouseLeave] = function()
			if u13 then
				return nil;
			end;
			l__TweenService__6:Create(u12:getValue(), TweenInfo.new(0.15), {
				BackgroundTransparency = 0.8
			}):Play();
		end;
		local v8 = {};
		local v9 = {};
		if u13 then
			local v10 = l__ColorUtil__7.WHITE;
		else
			v10 = l__Theme__8.textPrimary;
		end;
		v9.Color = v10;
		if v6 then
			local v11 = 0;
		elseif u13 then
			v11 = 0;
		else
			v11 = 0.7;
		end;
		v9.Transparency = v11;
		v9.Thickness = 1.5;
		v8[1] = u1.createElement("UICorner", {
			CornerRadius = UDim.new(0.03, 0)
		});
		v8[2] = u1.createElement("UIStroke", v9);
		local v12 = {
			Size = UDim2.fromScale(1, 1), 
			BackgroundColor3 = l__ColorUtil__7.BLACK
		};
		if u13 then
			local v13 = 1;
		else
			v13 = 0.8;
		end;
		v12.BackgroundTransparency = v13;
		v12.BorderSizePixel = 0;
		v12[u1.Ref] = u12;
		v12.ZIndex = 3;
		v8.Dark_Overlay = u1.createElement("Frame", v12, { u1.createElement("UICorner", {
				CornerRadius = UDim.new(0.03, 0)
			}) });
		local v14 = {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromScale(0.93, 0.93)
		};
		local v15 = {};
		local v16 = not v5 and u1.createFragment({
			Icon_Locked = u1.createElement("ImageLabel", {
				AnchorPoint = Vector2.new(1, 0), 
				Position = UDim2.fromScale(0.95, 0.05), 
				Size = UDim2.fromScale(0.15, 0.15), 
				Image = l__BedwarsImageId__9.LOCK_SOLID, 
				ScaleType = "Fit", 
				BackgroundTransparency = 1, 
				ZIndex = 4
			})
		});
		if v16 then
			v15[#v15 + 1] = v16;
		end;
		if v4 then
			local v17 = u1.createElement(l__KitViewport__10, {
				Kit = p1.Kit
			});
		else
			v17 = u1.createElement(l__KitViewport__10, {
				Kit = p1.Kit, 
				Skin = p1.Skin
			});
		end;
		v15[#v15 + 1] = v17;
		v8[#v8 + 1] = u1.createElement(l__Empty__11, v14, v15);
		return u1.createElement("ImageButton", v7, v8);
	end)
};
