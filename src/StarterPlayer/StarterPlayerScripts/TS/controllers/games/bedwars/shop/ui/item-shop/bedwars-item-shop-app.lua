-- Script Hash: 6eeb27f6b2bb14fc799d3c3a720f0d486fe41d7f3983a5d1fa6ae2486d6326868ff172f014a9cbbd92cfd5673b5c5741
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.Component:extend("BedwarsItemShopAppBase");
local l__BedwarsShop__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
local l__Players__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
function v4.init(p1, p2)
	p1.alive = true;
	p1:setState({
		selectedItem = l__BedwarsShop__1.getShop(l__Players__2.LocalPlayer)[1]
	});
end;
local l__SoundManager__3 = v2.SoundManager;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Flamework__5 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
function v4.didMount(p3)
	l__SoundManager__3:playSound(l__GameSound__4.UI_OPEN);
	local v5 = l__Players__2.LocalPlayer;
	if v5 ~= nil then
		v5 = v5.Character;
	end;
	if v5 then
		local l__Position__6 = l__Players__2.LocalPlayer.Character:GetPrimaryPartCFrame().Position;
		v1.Promise.defer(function()
			while { wait(0.2) } and p3.alive do
				local v6 = l__Players__2.LocalPlayer.Character;
				if v6 ~= nil then
					v6 = v6:GetPrimaryPartCFrame().Position;
				end;
				local v7 = v6;
				if v7 == nil then
					v7 = Vector3.new();
				end;
				if (v7 - l__Position__6).Magnitude > 6 then
					l__Flamework__5.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(p3.props.AppId);
				end;			
			end;
		end);
	end;
end;
function v4.willUnmount(p4)
	p4.alive = false;
end;
local l__DarkBackground__7 = v2.DarkBackground;
local l__SlideIn__8 = v2.SlideIn;
local l__EmptyButton__9 = v2.EmptyButton;
local l__DeviceUtil__10 = v2.DeviceUtil;
local l__BedwarsItemShopLeft__11 = v1.import(script, script.Parent, "shop-left", "shop-left").BedwarsItemShopLeft;
local l__Empty__12 = v2.Empty;
local l__ShopToolbar__13 = v1.import(script, script.Parent, "toolbar", "shop-toolbar").ShopToolbar;
local l__ShopItemList__14 = v1.import(script, script.Parent, "shop-items", "shop-item-list").ShopItemList;
function v4.render(p5)
	local v8 = {};
	local v9 = {};
	local v10 = {};
	if l__DeviceUtil__10.isSmallScreen() then
		local v11 = UDim2.fromScale(0.7, 0.7);
	else
		v11 = UDim2.fromScale(0.65, 0.65);
	end;
	v10.Size = v11;
	if l__DeviceUtil__10.isSmallScreen() then
		local v12 = 0.03;
	else
		v12 = 0.05;
	end;
	v10.Position = UDim2.fromScale(0.5, v12);
	v10.AnchorPoint = Vector2.new(0.5, 0);
	v10.Modal = true;
	local v13 = {};
	local v14 = {
		SelectedItem = p5.state.selectedItem, 
		Size = UDim2.fromScale(0.27, 1), 
		Position = UDim2.fromScale(0.73, 0)
	};
	function v14.SetSelectedShopItem(p6)
		p5:setState({
			selectedItem = p6
		});
	end;
	v14.store = p5.props.store;
	v13[1] = v3.createElement("UIAspectRatioConstraint", {
		AspectRatio = 1.6486956521739131
	});
	v13[2] = v3.createElement("UIListLayout", {
		FillDirection = "Horizontal", 
		SortOrder = "LayoutOrder"
	});
	v13[3] = v3.createElement(l__BedwarsItemShopLeft__11, v14);
	v13[4] = v3.createElement(l__Empty__12, {
		Size = UDim2.fromScale(0.73, 1)
	}, { v3.createElement("UIListLayout", {
			FillDirection = "Vertical"
		}), v3.createElement(l__ShopToolbar__13, {
			Size = UDim2.fromScale(1, 0.09), 
			store = p5.props.store
		}), v3.createElement(l__ShopItemList__14, {
			Size = UDim2.fromScale(1, 0.91), 
			Position = UDim2.fromScale(0, 0.09), 
			store = p5.props.store, 
			SelectedItem = p5.state.selectedItem, 
			SetSelectedShopItem = function(p7)
				p5:setState({
					selectedItem = p7
				});
			end
		}) });
	v9[1] = v3.createElement(l__EmptyButton__9, v10, v13);
	v8[1] = v3.createElement(l__DarkBackground__7, {
		AppId = p5.props.AppId
	});
	v8[2] = v3.createElement(l__SlideIn__8, {}, v9);
	return v3.createElement("ScreenGui", {}, v8);
end;
return {
	BedwarsItemShopAppBase = v4, 
	BedwarsItemShopApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p8, p9)
		local v15 = {
			store = p8
		};
		for v16, v17 in pairs(p9) do
			v15[v16] = v17;
		end;
		return v15;
	end)(v4)
};
