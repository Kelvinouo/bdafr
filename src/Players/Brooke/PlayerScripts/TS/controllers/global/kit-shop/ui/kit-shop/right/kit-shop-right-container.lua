--[[VARIABLE DEFINITION ANOMALY DETECTED, DECOMPILATION OUTPUT POTENTIALLY INCORRECT]]--
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v5 = v3.Component:extend("KitShopRight");
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v5.init(p1, p2)
	p1.maid = u1.new();
	p1:setState({
		purchased = false
	});
	if p2.SelectedKit and p2.store.Bedwars.equippedKitSkins then
		p1:setState({
			selectedSkin = p2.store.Bedwars.equippedKitSkins[p2.SelectedKit]
		});
	end;
end;
function v5.didUpdate(p3, p4, p5)
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
local l__UserInputService__2 = v4.UserInputService;
local l__BedwarsKitShop__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-shop").BedwarsKitShop;
local l__DeviceUtil__4 = v2.DeviceUtil;
local l__KnitClient__5 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__ContextActionService__6 = v4.ContextActionService;
local l__default__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function v5.didMount(p6)
	if l__UserInputService__2.GamepadEnabled and not l__UserInputService__2.MouseEnabled then
		p6.maid:GiveTask(l__UserInputService__2.InputBegan:Connect(function(p7, p8)
			if p7.KeyCode == Enum.KeyCode.ButtonA then
				local v6 = false;
				if p6.props.SelectedKit then
					if table.find(p6.props.store.Bedwars.ownedKits, p6.props.SelectedKit) ~= nil then
						v6 = true;
					elseif table.find(l__BedwarsKitShop__3.FreeKits, p6.props.SelectedKit) ~= nil then
						v6 = true;
					end;
					if not l__DeviceUtil__4.isHoarceKat() and l__KnitClient__5.Controllers.UnlockController.allKitsUnlocked then
						v6 = true;
					end;
				end;
				if v6 then
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
		local v7 = not p6.props.store.Bedwars.useKitSkin;
		l__default__7.Client:Get("RemoteName"):CallServerAsync({
			useKitSkin = v7
		}):andThen(function()

		end):catch(function(p12)
			warn(p12);
		end);
		l__ClientStore__8:dispatch({
			type = "SetUseKitSkin", 
			useKitSkin = v7
		});
	end, false, Enum.ContextActionPriority.High.Value + 10, Enum.KeyCode.ButtonX);
	p6.maid:GiveTask(function()
		l__ContextActionService__6:UnbindAction("toggle-skin-gamepad");
	end);
end;
function v5.willUnmount(p13)
	p13.maid:DoCleaning();
end;
local l__SoundManager__9 = v2.SoundManager;
local l__GameSound__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v5.equip(p14)
	local v8 = p14.props.SelectedKit and nil;
	l__default__7.Client:Get("RemoteName"):CallServerAsync({
		kit = v8
	}):andThen(function(p15)
		if p15 then
			l__SoundManager__9:playSound(l__GameSound__10.ARMOR_UNEQUIP);
			l__ClientStore__8:dispatch({
				type = "SetBedwarsKit", 
				kit = v8
			});
		end;
	end);
end;
local l__BedwarsKit__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__getBedwarsKitMeta__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local l__MarketplaceService__13 = v4.MarketplaceService;
local l__Players__14 = v4.Players;
function v5.purchase(p16)
	local v9 = nil;
	if p16.props.SelectedKit ~= l__BedwarsKit__11.NONE then
		v9 = l__getBedwarsKitMeta__12(p16.props.SelectedKit);
		if v9.gamepassId ~= nil then
			l__MarketplaceService__13:PromptGamePassPurchase(l__Players__14.LocalPlayer, v9.gamepassId);
			return;
		end;
		if v9.devProductId == nil then
			return;
		end;
	else
		if p16.props.SelectedBundle then
			l__KnitClient__5.Controllers.LobbyBundleController:purchaseBundle(p16.props.SelectedBundle);
		end;
		return;
	end;
	l__MarketplaceService__13:PromptProductPurchase(l__Players__14.LocalPlayer, v9.devProductId);
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
function v5.render(p17)
	local v10 = false;
	local v11 = true;
	local v12 = p17.props.store.Bedwars.kit == p17.props.SelectedKit;
	local v13 = p17.props.SelectedKit ~= l__BedwarsKit__11.NONE;
	local v14 = p17.props.SelectedKit ~= l__BedwarsKit__11.NONE;
	local v15 = false;
	if p17.props.SelectedKit == l__BedwarsKit__11.NONE then
		v10 = true;
	elseif p17.props.SelectedKit and table.find(p17.props.store.Bedwars.ownedKits, p17.props.SelectedKit) ~= nil then
		v10 = true;
	end;
	local l__myClan__16 = p17.props.store.Clans.myClan;
	if p17.props.SelectedKit and l__myClan__16 and l__myClan__16.kitShop.unlocks[p17.props.SelectedKit] ~= nil then
		v10 = true;
	end;
	if not l__DeviceUtil__4.isHoarceKat() and l__KnitClient__5.Controllers.UnlockController.allKitsUnlocked then
		v10 = true;
	end;
	if not p17.props.store.Bedwars.kit and not p17.props.SelectedKit then
		v12 = true;
	end;
	if p17.props.SelectedKit then
		v11 = table.find(l__BedwarsKitShop__3.FreeKits, p17.props.SelectedKit) ~= nil;
	end;
	local v17 = l__Players__14.LocalPlayer;
	if v17 ~= nil then
		v17 = v17.DisplayName;
	end;
	local v18 = v17;
	if v18 == nil then
		v18 = "SnickTrix";
	end;
	local v19 = v18;
	local v20 = "Opt out of using a kit and play as yourself!";
	local v21 = 0;
	if p17.props.SelectedKit and p17.props.SelectedKit ~= l__BedwarsKit__11.NONE then
		local v22 = l__getBedwarsKitMeta__12(p17.props.SelectedKit);
		local l__name__23 = v22.name;
		local l__description__24 = v22.description;
		local v25 = v22.priceRobux;
		if v25 == nil then
			v25 = 0;
		end;
		local v26 = v22.unlockedInBattlePass;
		if v26 == nil then
			v26 = false;
		end;
		local v27 = not v26;
		if v27 then
			local v28 = not v22.notGiftable;
			if v28 == nil then
				v28 = false;
			end;
			v27 = v28;
			if v27 then
				local v29 = true;
				if v22.devProductId == nil then
					v29 = v22.gamepassId ~= nil;
				end;
				v27 = v29;
			end;
		end;
		v13 = v27;
		v15 = true;
		if (nil).forceSkin then
			v15 = false;
		end;
		if v21 == 0 or not (not false) or v10 then
			v14 = false;
		end;
	end;
	if p17.state.selectedSkin and p17.state.selectedSkin ~= l__BedwarsKitSkin__15.DEFAULT then
		v19 = l__BedwarsKitSkinMeta__16[p17.state.selectedSkin].name;
	end;
	if p17.props.SelectedBundle then
		local v30 = l__BundleMeta__17[p17.props.SelectedBundle];
		if v30.kitShopBundle then
			v19 = v30.kitShopBundle.name;
			v20 = v30.kitShopBundle.description;
			v21 = v30.price;
			v13 = true;
			v14 = true;
			v10 = false;
			v11 = false;
			v12 = false;
		end;
		local v31 = v30.rewards.kits;
		if v31 ~= nil then
			local v32 = true;
			local v33, v34, v35 = ipairs(v31);
			while true do
				v33(v34, v35);
				if not v33 then
					break;
				end;
				v35 = v33;
				if table.find(p17.props.store.Bedwars.ownedKits, v34) == nil then
					v32 = false;
					break;
				end;			
			end;
			v31 = v32;
		end;
		if v31 then
			v14 = false;
		end;
	end;
	local v36 = { v3.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			SortOrder = "LayoutOrder"
		}) };
	local v37 = {
		Size = UDim2.fromScale(1, 0.34), 
		SelectedKit = p17.props.SelectedKit and nil, 
		SelectedSkin = p17.state.selectedSkin
	};
	if p17.props.SelectedBundle then
		local v38 = l__BundleMeta__17[p17.props.SelectedBundle].kitShopBundle;
		if v38 ~= nil then
			v38 = v38.image;
		end;
		local v39 = v38;
	else
		v39 = nil;
	end;
	v37.ItemImage = v39;
	v37.store = p17.props.store;
	v36[#v36 + 1] = v3.createElement(l__KitShopShowcase__19, v37);
	local v40 = {
		Size = UDim2.fromScale(1, 0.66), 
		LayoutOrder = 2
	};
	local v41 = { v3.createElement("UIPadding", {
			PaddingTop = UDim.new(0.02, 0), 
			PaddingBottom = UDim.new(0.03, 0), 
			PaddingLeft = UDim.new(0.05, 0), 
			PaddingRight = UDim.new(0.05, 0)
		}), (v3.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			HorizontalAlignment = "Left", 
			VerticalAlignment = "Top", 
			Padding = UDim.new(0.03, 0), 
			SortOrder = "LayoutOrder"
		})) };
	local v42 = {};
	local v43 = {};
	local v44 = {};
	if l__DeviceUtil__4.isSmallScreen() then
		local v45 = 20;
	else
		v45 = 28;
	end;
	v44.MaxTextSize = v45;
	v43[1] = v3.createElement("UITextSizeConstraint", v44);
	local v46 = {};
	local v47 = {};
	if l__DeviceUtil__4.isSmallScreen() then
		local v48 = 14;
	else
		v48 = 22;
	end;
	v47.MaxTextSize = v48;
	v46[1] = v3.createElement("UITextSizeConstraint", v47);
	v42[1] = v3.createElement("UIListLayout", {
		FillDirection = "Vertical", 
		HorizontalAlignment = "Left", 
		VerticalAlignment = "Top", 
		Padding = UDim.new(0.03, 0)
	});
	v42[2] = v3.createElement("TextLabel", {
		Text = "<b>" .. v19 .. "</b>", 
		Size = UDim2.fromScale(1, 0.15), 
		SizeConstraint = "RelativeXX", 
		BackgroundTransparency = 1, 
		Font = "Roboto", 
		TextScaled = true, 
		RichText = true, 
		TextColor3 = Color3.fromRGB(255, 255, 255), 
		TextXAlignment = "Left", 
		AutoLocalize = p17.props.SelectedKit ~= l__BedwarsKit__11.NONE
	}, v43);
	v42[3] = v3.createElement("TextLabel", {
		Text = v20, 
		Size = UDim2.fromScale(1, 0.77), 
		BackgroundTransparency = 1, 
		Font = "Roboto", 
		TextScaled = true, 
		RichText = true, 
		TextColor3 = Color3.fromRGB(255, 255, 255), 
		TextTransparency = 0.3, 
		TextXAlignment = "Left", 
		TextYAlignment = "Top"
	}, v46);
	v41.KitInfo = v3.createElement(l__Empty__20, {
		Size = UDim2.fromScale(1, 0.4), 
		LayoutOrder = 1
	}, v42);
	local v49 = nil;
	if v49 ~= nil then
		v49 = v49.skins;
	end;
	local v50 = v49;
	if v50 then
		local v51 = p17.props.SelectedKit;
		if v51 then
			local v52 = {
				Size = UDim2.fromScale(1, 0.47), 
				Kit = p17.props.SelectedKit, 
				Skins = (nil).skins, 
				SelectedSkin = p17.state.selectedSkin
			};
			function v52.SetSelectedSkin(p18)
				p17:setState({
					selectedSkin = p18
				});
			end;
			v52.store = p17.props.store;
			v51 = v3.createElement(l__KitSkinList__21, v52);
		end;
		v50 = v51;
	end;
	local v53 = {
		Size = UDim2.fromScale(1, 0.57), 
		LayoutOrder = 2
	};
	local v54 = { v3.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			HorizontalAlignment = "Center", 
			VerticalAlignment = "Bottom", 
			Padding = UDim.new(0.03, 0), 
			SortOrder = "LayoutOrder"
		}) };
	if v50 then
		v54[#v54 + 1] = v50;
	end;
	local v55 = false;
	if p17.props.SelectedKit ~= l__BedwarsKit__11.NONE then
		v55 = v15 and v3.createElement(l__KitShopKitSkinToggle__22, {
			Size = UDim2.fromScale(1, 0.1), 
			LayoutOrder = 2, 
			UseKitSkin = p17.props.store.Bedwars.useKitSkin
		});
	end;
	if v55 then
		v54[#v54 + 1] = v55;
	end;
	local v56 = #v54;
	local v57 = {};
	if v10 or v11 then
		if v12 then
			local v58 = v3.createElement(l__Button__23, {
				Text = "<b>EQUIPPED</b>", 
				Size = UDim2.fromScale(1, 1), 
				BackgroundColor3 = l__Theme__18.backgroundSuccess, 
				Selectable = false, 
				OnClick = function()

				end, 
				LayoutOrder = 3
			});
		else
			local v59 = {};
			if l__UserInputService__2.GamepadEnabled then
				local v60 = " (A)";
			else
				v60 = "";
			end;
			v59.Text = "<b>EQUIP" .. v60 .. "</b>";
			v59.Size = UDim2.fromScale(1, 1);
			v59.BackgroundColor3 = l__Theme__18.backgroundSuccess;
			v59.Selectable = false;
			function v59.OnClick()
				p17:equip();
			end;
			v59.LayoutOrder = 3;
			v58 = v3.createElement(l__Button__23, v59);
		end;
	else
		v58 = false and v3.createElement(l__KitShopBattlePassButton__24, {
			Size = UDim2.fromScale(1, 1), 
			LayoutOrder = 3
		});
	end;
	if v58 then
		v57[#v57 + 1] = v58;
	end;
	v54[v56 + 1] = v3.createElement(l__Empty__20, {
		Size = UDim2.fromScale(1, 0.17), 
		LayoutOrder = 3
	}, v57);
	local v61 = { v3.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			HorizontalAlignment = "Right", 
			VerticalAlignment = "Center", 
			Padding = UDim.new(0.04, 0), 
			SortOrder = "LayoutOrder"
		}) };
	local v62 = v14 and v3.createElement(l__KitShopPurchaseButton__25, {
		Size = UDim2.fromScale(0.8, 1), 
		LayoutOrder = 1, 
		Purchase = function()
			p17:purchase();
		end, 
		PriceRobux = v21
	});
	if v62 then
		v61[#v61 + 1] = v62;
	end;
	local v63 = v13;
	if v63 then
		local v64 = {
			Size = UDim2.fromScale(0.15, 0.9), 
			LayoutOrder = 2
		};
		if p17.props.SelectedKit ~= l__BedwarsKit__11.NONE then
			local v65 = p17.props.SelectedKit;
		else
			v65 = p17.props.SelectedBundle or l__BedwarsKit__11.NONE;
		end;
		v64.GiftType = v65;
		v63 = v3.createElement(l__KitShopGiftButton__26, v64);
	end;
	if v63 then
		v61[#v61 + 1] = v63;
	end;
	v54[v56 + 2] = v3.createElement(l__Empty__20, {
		Size = UDim2.fromScale(1, 0.17), 
		LayoutOrder = 4
	}, v61);
	v41.KitActions = v3.createElement(l__Empty__20, v53, v54);
	v36.BottomSection = v3.createElement(l__Empty__20, v40, v41);
	return v3.createFragment({
		KitShopRight = v3.createElement("Frame", {
			Size = p17.props.Size, 
			Position = p17.props.Position, 
			BackgroundColor3 = l__Theme__18.backgroundSecondary, 
			BorderSizePixel = 0
		}, v36)
	});
end;
return {
	KitShopRight = v5
};
