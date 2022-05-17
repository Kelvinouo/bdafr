
--[[VARIABLE DEFINITION ANOMALY DETECTED, DECOMPILATION OUTPUT POTENTIALLY INCORRECT]]--
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v5 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v6 = v4.Component:extend("KitShopRight");
local l__Maid__1 = v3.Maid;
function v6.init(p1, p2)
	p1.maid = l__Maid__1.new();
	p1:setState({
		purchased = false
	});
	if p2.SelectedKit and p2.store.Bedwars.equippedKitSkins then
		p1:setState({
			selectedSkin = p2.store.Bedwars.equippedKitSkins[p2.SelectedKit]
		});
	end;
end;
function v6.didUpdate(p3, p4, p5)
	if p4.SelectedKit ~= p3.props.SelectedKit then
		p3:setState({
			purchased = false
		});
		if p3.props.SelectedKit and p3.props.store.Bedwars.equippedKitSkins then
			p3:setState({
				selectedSkin = p3.props.store.Bedwars.equippedKitSkins[p3.props.SelectedKit]
			});
		end;
	end;
end;
local l__UserInputService__2 = v5.UserInputService;
local l__BedwarsKitShop__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-shop").BedwarsKitShop;
local l__DeviceUtil__4 = v2.DeviceUtil;
local l__KnitClient__5 = v3.KnitClient;
local l__ContextActionService__6 = v5.ContextActionService;
local l__default__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function v6.didMount(p6)
	if l__UserInputService__2.GamepadEnabled and not l__UserInputService__2.MouseEnabled then
		p6.maid:GiveTask(l__UserInputService__2.InputBegan:Connect(function(p7, p8)
			if p7.KeyCode == Enum.KeyCode.ButtonA then
				local v7 = false;
				if p6.props.SelectedKit then
					if table.find(p6.props.store.Bedwars.ownedKits, p6.props.SelectedKit) ~= nil then
						v7 = true;
					elseif table.find(l__BedwarsKitShop__3.FreeKits, p6.props.SelectedKit) ~= nil then
						v7 = true;
					end;
					if not l__DeviceUtil__4.isHoarceKat() and l__KnitClient__5.Controllers.UnlockController.allItemsUnlocked then
						v7 = true;
					end;
				end;
				if v7 then
					p6:equip();
					return;
				end;
				p6:purchase();
			end;
		end));
	end;
	l__ContextActionService__6:BindActionAtPriority("toggle-skin-gamepad", function(p9, p10, p11)
		if p10 ~= Enum.UserInputState.Begin then
			return nil;
		end;
		local v8 = not p6.props.store.Bedwars.useKitSkin;
		l__default__7.Client:Get("RemoteName"):CallServerAsync({
			useKitSkin = v8
		}):andThen(function()

		end):catch(function(p12)
			warn(p12);
		end);
		l__ClientStore__8:dispatch({
			type = "SetUseKitSkin", 
			useKitSkin = v8
		});
	end, false, Enum.ContextActionPriority.High.Value + 10, Enum.KeyCode.ButtonX);
	p6.maid:GiveTask(function()
		l__ContextActionService__6:UnbindAction("toggle-skin-gamepad");
	end);
end;
function v6.willUnmount(p13)
	p13.maid:DoCleaning();
end;
local l__SoundManager__9 = v2.SoundManager;
local l__GameSound__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v6.equip(p14)
	local v9 = p14.props.SelectedKit and nil;
	l__default__7.Client:Get("RemoteName"):CallServerAsync({
		kit = v9
	}):andThen(function(p15)
		if p15 then
			l__SoundManager__9:playSound(l__GameSound__10.ARMOR_UNEQUIP);
			l__ClientStore__8:dispatch({
				type = "SetBedwarsKit", 
				kit = v9
			});
		end;
	end);
end;
local l__BedwarsKit__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__getBedwarsKitMeta__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local l__MarketplaceService__13 = v5.MarketplaceService;
local l__Players__14 = v5.Players;
function v6.purchase(p16)
	local v10 = nil;
	if p16.props.SelectedKit ~= l__BedwarsKit__11.NONE then
		v10 = l__getBedwarsKitMeta__12(p16.props.SelectedKit);
		if v10.gamepassId ~= nil then
			l__MarketplaceService__13:PromptGamePassPurchase(l__Players__14.LocalPlayer, v10.gamepassId);
			return;
		end;
		if v10.devProductId == nil then
			return;
		end;
	else
		if p16.props.SelectedBundle then
			l__KnitClient__5.Controllers.LobbyBundleController:purchaseBundle(p16.props.SelectedBundle);
		end;
		return;
	end;
	l__MarketplaceService__13:PromptProductPurchase(l__Players__14.LocalPlayer, v10.devProductId);
end;
local l__BedwarsKitSkin__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local l__BedwarsKitSkinMeta__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local l__BundleMeta__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-meta").BundleMeta;
local l__Theme__18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__KitShopShowcase__19 = v1.import(script, script.Parent, "kit-shop-showcase", "kit-shop-showcase").KitShopShowcase;
local l__Empty__20 = v2.Empty;
local l__KitSkinList__21 = v1.import(script, script.Parent, "kit-skin-carousel", "kit-skin-list").KitSkinList;
local l__KitShopKitSkinToggle__22 = v1.import(script, script.Parent, "kit-shop-buttons", "kit-shop-kit-skin-toggle").KitShopKitSkinToggle;
local l__Button__23 = v2.Button;
local l__KitShopBattlePassButton__24 = v1.import(script, script.Parent, "kit-shop-buttons", "kit-shop-battlepass-button").KitShopBattlePassButton;
local l__KitShopPurchaseButton__25 = v1.import(script, script.Parent, "kit-shop-buttons", "kit-shop-purchase-button").KitShopPurchaseButton;
local l__KitShopGiftButton__26 = v1.import(script, script.Parent, "kit-shop-buttons", "kit-shop-gift-button").KitShopGiftButton;
function v6.render(p17)
	local v11 = false;
	local v12 = true;
	local v13 = p17.props.store.Bedwars.kit == p17.props.SelectedKit;
	local v14 = p17.props.SelectedKit ~= l__BedwarsKit__11.NONE;
	local v15 = p17.props.SelectedKit ~= l__BedwarsKit__11.NONE;
	local v16 = false;
	if p17.props.SelectedKit == l__BedwarsKit__11.NONE then
		v11 = true;
	else
		local v17 = p17.props.SelectedKit and table.find(p17.props.store.Bedwars.ownedKits, p17.props.SelectedKit) ~= nil;
		if v17 then
			v11 = true;
		end;
	end;
	local l__myClan__18 = p17.props.store.Clans.myClan;
	if p17.props.SelectedKit and l__myClan__18 and l__myClan__18.kitShop.unlocks[p17.props.SelectedKit] ~= nil then
		v11 = true;
	end;
	if not l__DeviceUtil__4.isHoarceKat() and l__KnitClient__5.Controllers.UnlockController.allItemsUnlocked then
		v11 = true;
	end;
	if not p17.props.store.Bedwars.kit and not p17.props.SelectedKit then
		v13 = true;
	end;
	if p17.props.SelectedKit then
		v12 = table.find(l__BedwarsKitShop__3.FreeKits, p17.props.SelectedKit) ~= nil;
	end;
	local v19 = l__Players__14.LocalPlayer;
	if v19 ~= nil then
		v19 = v19.DisplayName;
	end;
	local v20 = v19;
	if v20 == nil then
		v20 = "SnickTrix";
	end;
	local v21 = v20;
	local v22 = "Opt out of using a kit and play as yourself!";
	local v23 = 0;
	if p17.props.SelectedKit and p17.props.SelectedKit ~= l__BedwarsKit__11.NONE then
		local v24 = l__getBedwarsKitMeta__12(p17.props.SelectedKit);
		local l__name__25 = v24.name;
		local l__description__26 = v24.description;
		local v27 = v24.priceRobux;
		if v27 == nil then
			v27 = 0;
		end;
		local v28 = v24.unlockedInBattlePass;
		if v28 == nil then
			v28 = false;
		end;
		local v29 = not v28;
		if v29 then
			local v30 = not v24.notGiftable;
			if v30 == nil then
				v30 = false;
			end;
			v29 = v30;
			if v29 then
				local v31 = true;
				if v24.devProductId == nil then
					v31 = v24.gamepassId ~= nil;
				end;
				v29 = v31;
			end;
		end;
		v14 = v29;
		v16 = true;
		if (nil).forceSkin then
			v16 = false;
		end;
		if v23 == 0 or not (not false) or v11 then
			v15 = false;
		end;
	end;
	if p17.state.selectedSkin and p17.state.selectedSkin ~= l__BedwarsKitSkin__15.DEFAULT then
		v21 = l__BedwarsKitSkinMeta__16[p17.state.selectedSkin].name;
	end;
	if p17.props.SelectedBundle then
		local v32 = l__BundleMeta__17[p17.props.SelectedBundle];
		if v32.kitShopBundle then
			v21 = v32.kitShopBundle.name;
			v22 = v32.kitShopBundle.description;
			v23 = v32.price;
			v14 = true;
			v15 = true;
			v11 = false;
			v12 = false;
			v13 = false;
		end;
	end;
	local v33 = { v4.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			SortOrder = "LayoutOrder"
		}) };
	local v34 = {
		Size = UDim2.fromScale(1, 0.34), 
		SelectedKit = p17.props.SelectedKit and nil, 
		SelectedSkin = p17.state.selectedSkin
	};
	if p17.props.SelectedBundle then
		local v35 = l__BundleMeta__17[p17.props.SelectedBundle].kitShopBundle;
		if v35 ~= nil then
			v35 = v35.image;
		end;
		local v36 = v35;
	else
		v36 = nil;
	end;
	v34.ItemImage = v36;
	v34.store = p17.props.store;
	v33[#v33 + 1] = v4.createElement(l__KitShopShowcase__19, v34);
	local v37 = {
		Size = UDim2.fromScale(1, 0.66), 
		LayoutOrder = 2
	};
	local v38 = { v4.createElement("UIPadding", {
			PaddingTop = UDim.new(0.02, 0), 
			PaddingBottom = UDim.new(0.03, 0), 
			PaddingLeft = UDim.new(0.05, 0), 
			PaddingRight = UDim.new(0.05, 0)
		}), (v4.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			HorizontalAlignment = "Left", 
			VerticalAlignment = "Top", 
			Padding = UDim.new(0.03, 0), 
			SortOrder = "LayoutOrder"
		})) };
	local v39 = {};
	local v40 = {
		Text = "<b>" .. v21 .. "</b>", 
		Size = UDim2.fromScale(1, 0.15), 
		SizeConstraint = "RelativeXX", 
		BackgroundTransparency = 1, 
		Font = "Roboto", 
		TextScaled = true, 
		RichText = true, 
		TextColor3 = Color3.fromRGB(255, 255, 255), 
		TextXAlignment = "Left"
	};
	if p17.props.SelectedKit then
		local v41 = true;
	else
		v41 = false;
	end;
	v40.AutoLocalize = v41;
	local v42 = {};
	local v43 = {};
	if l__DeviceUtil__4.isSmallScreen() then
		local v44 = 20;
	else
		v44 = 28;
	end;
	v43.MaxTextSize = v44;
	v42[1] = v4.createElement("UITextSizeConstraint", v43);
	local v45 = {};
	local v46 = {};
	if l__DeviceUtil__4.isSmallScreen() then
		local v47 = 14;
	else
		v47 = 22;
	end;
	v46.MaxTextSize = v47;
	v45[1] = v4.createElement("UITextSizeConstraint", v46);
	v39[1] = v4.createElement("UIListLayout", {
		FillDirection = "Vertical", 
		HorizontalAlignment = "Left", 
		VerticalAlignment = "Top", 
		Padding = UDim.new(0.03, 0)
	});
	v39[2] = v4.createElement("TextLabel", v40, v42);
	v39[3] = v4.createElement("TextLabel", {
		Text = v22, 
		Size = UDim2.fromScale(1, 0.77), 
		BackgroundTransparency = 1, 
		Font = "Roboto", 
		TextScaled = true, 
		RichText = true, 
		TextColor3 = Color3.fromRGB(255, 255, 255), 
		TextTransparency = 0.3, 
		TextXAlignment = "Left", 
		TextYAlignment = "Top"
	}, v45);
	v38.KitInfo = v4.createElement(l__Empty__20, {
		Size = UDim2.fromScale(1, 0.4), 
		LayoutOrder = 1
	}, v39);
	local v48 = nil;
	if v48 ~= nil then
		v48 = v48.skins;
	end;
	local v49 = v48;
	if v49 then
		local v50 = p17.props.SelectedKit;
		if v50 then
			local v51 = {
				Size = UDim2.fromScale(1, 0.47), 
				Kit = p17.props.SelectedKit, 
				Skins = (nil).skins, 
				SelectedSkin = p17.state.selectedSkin
			};
			function v51.SetSelectedSkin(p18)
				p17:setState({
					selectedSkin = p18
				});
			end;
			v51.store = p17.props.store;
			v50 = v4.createElement(l__KitSkinList__21, v51);
		end;
		v49 = v50;
	end;
	local v52 = {
		Size = UDim2.fromScale(1, 0.57), 
		LayoutOrder = 2
	};
	local v53 = { v4.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			HorizontalAlignment = "Center", 
			VerticalAlignment = "Bottom", 
			Padding = UDim.new(0.03, 0), 
			SortOrder = "LayoutOrder"
		}) };
	if v49 then
		v53[#v53 + 1] = v49;
	end;
	local v54 = false;
	if p17.props.SelectedKit ~= l__BedwarsKit__11.NONE then
		v54 = v16 and v4.createElement(l__KitShopKitSkinToggle__22, {
			Size = UDim2.fromScale(1, 0.1), 
			LayoutOrder = 2, 
			UseKitSkin = p17.props.store.Bedwars.useKitSkin
		});
	end;
	if v54 then
		v53[#v53 + 1] = v54;
	end;
	local v55 = #v53;
	local v56 = {};
	if v11 or v12 then
		if v13 then
			local v57 = v4.createElement(l__Button__23, {
				Text = "<b>EQUIPPED</b>", 
				Size = UDim2.fromScale(1, 1), 
				BackgroundColor3 = l__Theme__18.backgroundSuccess, 
				Selectable = false, 
				OnClick = function()

				end, 
				LayoutOrder = 3
			});
		else
			local v58 = {};
			if l__UserInputService__2.GamepadEnabled then
				local v59 = " (A)";
			else
				v59 = "";
			end;
			v58.Text = "<b>EQUIP" .. v59 .. "</b>";
			v58.Size = UDim2.fromScale(1, 1);
			v58.BackgroundColor3 = l__Theme__18.backgroundSuccess;
			v58.Selectable = false;
			function v58.OnClick()
				p17:equip();
			end;
			v58.LayoutOrder = 3;
			v57 = v4.createElement(l__Button__23, v58);
		end;
	else
		v57 = false and v4.createElement(l__KitShopBattlePassButton__24, {
			Size = UDim2.fromScale(1, 1), 
			LayoutOrder = 3
		});
	end;
	if v57 then
		v56[#v56 + 1] = v57;
	end;
	v53[v55 + 1] = v4.createElement(l__Empty__20, {
		Size = UDim2.fromScale(1, 0.17), 
		LayoutOrder = 3
	}, v56);
	local v60 = { v4.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			HorizontalAlignment = "Right", 
			VerticalAlignment = "Center", 
			Padding = UDim.new(0.04, 0), 
			SortOrder = "LayoutOrder"
		}) };
	local v61 = v15 and v4.createElement(l__KitShopPurchaseButton__25, {
		Size = UDim2.fromScale(0.8, 1), 
		LayoutOrder = 1, 
		Purchase = function()
			p17:purchase();
		end, 
		PriceRobux = v23
	});
	if v61 then
		v60[#v60 + 1] = v61;
	end;
	local v62 = v14;
	if v62 then
		local v63 = {
			Size = UDim2.fromScale(0.15, 0.9), 
			LayoutOrder = 2
		};
		if p17.props.SelectedKit ~= l__BedwarsKit__11.NONE then
			local v64 = p17.props.SelectedKit;
		else
			v64 = p17.props.SelectedBundle or l__BedwarsKit__11.NONE;
		end;
		v63.GiftType = v64;
		v62 = v4.createElement(l__KitShopGiftButton__26, v63);
	end;
	if v62 then
		v60[#v60 + 1] = v62;
	end;
	v53[v55 + 2] = v4.createElement(l__Empty__20, {
		Size = UDim2.fromScale(1, 0.17), 
		LayoutOrder = 4
	}, v60);
	v38.KitActions = v4.createElement(l__Empty__20, v52, v53);
	v33.BottomSection = v4.createElement(l__Empty__20, v37, v38);
	return v4.createFragment({
		KitShopRight = v4.createElement("Frame", {
			Size = p17.props.Size, 
			Position = p17.props.Position, 
			BackgroundColor3 = l__Theme__18.backgroundSecondary, 
			BorderSizePixel = 0
		}, v33)
	});
end;
return {
	KitShopRight = v6
};

