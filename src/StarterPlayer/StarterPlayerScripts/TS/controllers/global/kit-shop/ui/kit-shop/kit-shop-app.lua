-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.Component:extend("KitShopAppBase");
local l__BedwarsKit__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
function v4.init(p1, p2)
	p1.alive = true;
	p1:setState({
		selectedKit = p1.props.SelectedKit or l__BedwarsKit__1.NONE, 
		selectedBundle = v3.None
	});
end;
local l__DeviceUtil__2 = v2.DeviceUtil;
local l__DarkBackground__3 = v2.DarkBackground;
local l__SlideIn__4 = v2.SlideIn;
local l__EmptyButton__5 = v2.EmptyButton;
local l__Empty__6 = v2.Empty;
local l__KitShopToolbar__7 = v1.import(script, script.Parent, "toolbar", "kit-shop-toolbar").KitShopToolbar;
local l__KitShopItemList__8 = v1.import(script, script.Parent, "shop-items", "kit-shop-item-list").KitShopItemList;
local l__KitShopRight__9 = v1.import(script, script.Parent, "right", "kit-shop-right-container").KitShopRight;
function v4.render(p3)
	local v5 = {};
	local v6 = {};
	local v7 = {};
	if l__DeviceUtil__2.isSmallScreen() then
		local v8 = 0.85;
	else
		v8 = 0.75;
	end;
	if l__DeviceUtil__2.isSmallScreen() then
		local v9 = 0.85;
	else
		v9 = 0.75;
	end;
	v7.Size = UDim2.fromScale(v8, v9);
	if l__DeviceUtil__2.isSmallScreen() then
		local v10 = 0.02;
	else
		v10 = 0.1;
	end;
	v7.Position = UDim2.fromScale(0.5, v10);
	v7.AnchorPoint = Vector2.new(0.5, 0);
	v7.Modal = true;
	local v11 = {};
	local v12 = {};
	local v13 = {
		Size = UDim2.fromScale(1, 0.91), 
		store = p3.props.store, 
		SelectedKit = p3.state.selectedKit
	};
	function v13.SetSelectedKit(p4)
		p3:setState({
			selectedKit = p4 or l__BedwarsKit__1.NONE, 
			selectedBundle = v3.None
		});
	end;
	v13.SelectedBundle = p3.state.selectedBundle;
	function v13.SetSelectedBundle(p5)
		p3:setState({
			selectedBundle = p5, 
			selectedKit = l__BedwarsKit__1.NONE
		});
	end;
	v12[1] = v3.createElement("UIListLayout", {
		FillDirection = "Vertical"
	});
	v12[2] = v3.createElement(l__KitShopToolbar__7, {
		Size = UDim2.fromScale(1, 0.09), 
		store = p3.props.store
	});
	v12[3] = v3.createElement(l__KitShopItemList__8, v13);
	v11[1] = v3.createElement("UIAspectRatioConstraint", {
		AspectRatio = 1.6386036960985626
	});
	v11[2] = v3.createElement(l__Empty__6, {
		Size = UDim2.fromScale(0.73, 1)
	}, v12);
	v11[3] = v3.createElement(l__KitShopRight__9, {
		SelectedKit = p3.state.selectedKit, 
		SelectedBundle = p3.state.selectedBundle, 
		Size = UDim2.fromScale(0.27, 1), 
		Position = UDim2.fromScale(0.73, 0), 
		store = p3.props.store
	});
	v6[1] = v3.createElement(l__EmptyButton__5, v7, v11);
	v5[1] = v3.createElement(l__DarkBackground__3, {
		AppId = p3.props.AppId
	});
	v5[2] = v3.createElement(l__SlideIn__4, {}, v6);
	return v3.createElement("ScreenGui", {
		DisplayOrder = 20, 
		IgnoreGuiInset = l__DeviceUtil__2.isSmallScreen()
	}, v5);
end;
function v4.willUnmount(p6)
	p6.alive = false;
end;
return {
	KitShopApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p7, p8)
		local v14 = {
			store = p7
		};
		for v15, v16 in pairs(p8) do
			v14[v15] = v16;
		end;
		return v14;
	end)(v4)
};
