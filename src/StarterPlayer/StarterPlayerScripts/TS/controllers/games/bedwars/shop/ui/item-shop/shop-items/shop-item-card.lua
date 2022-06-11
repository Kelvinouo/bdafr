-- Script Hash: 6cda64eff520e5cfb5a8489b542b57937964591a48f3d028b7f00db542103ce03256c96fb27d7dee811496b0a448ec8b
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "merchant", "merchant-types");
local v5 = v3.Component:extend("BedwarsShopItemCard");
function v5.init(p1)
	p1.ref = v3.createRef();
end;
local l__UserInputService__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).UserInputService;
local l__SoundManager__2 = v2.SoundManager;
local l__GameSound__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__UIUtil__4 = v2.UIUtil;
function v5.didMount(p2)
	if l__UserInputService__1.GamepadEnabled and not l__UserInputService__1.MouseEnabled then
		local v6 = p2.ref:getValue();
		if v6 then
			v6.SelectionGained:Connect(function()
				l__SoundManager__2:playSound(l__GameSound__3.UI_CLICK);
				p2.props.OnClick();
			end);
			if p2.props.Selected then
				l__UIUtil__4:selectGui(v6);
			end;
		end;
	end;
end;
local l__KnitClient__5 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__discountImage__6 = v4.discountImage;
local l__ColorUtil__7 = v2.ColorUtil;
local l__discountColor__8 = v4.discountColor;
local l__Theme__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ItemViewport__10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "global", "inventory", "ui", "item-viewport").ItemViewport;
function v5.render(p3)
	local l__discountedItems__7 = l__KnitClient__5.Controllers.MerchantKitController.discountedItems;
	local function v8(p4)
		return p4.item.itemType == p3.props.ShopItem.itemType;
	end;
	local v9 = nil;
	for v10, v11 in ipairs(l__discountedItems__7) do
		if v8(v11, v10 - 1, l__discountedItems__7) == true then
			v9 = v11;
			break;
		end;
	end;
	local v12 = v9;
	if v12 ~= nil then
		v12 = v12.tier;
	end;
	if v12 ~= nil then
		local v13 = l__discountImage__6[v12];
	else
		v13 = nil;
	end;
	local v14 = {
		[v3.Ref] = p3.ref, 
		Size = UDim2.fromScale(1, 1), 
		BackgroundColor3 = l__ColorUtil__7.BLACK, 
		BackgroundTransparency = 0.6, 
		LayoutOrder = p3.props.LayoutOrder, 
		[v3.Event.Activated] = function()
			if p3.props.Selected then
				p3.props.OnRightClick();
				return nil;
			end;
			l__SoundManager__2:playSound(l__GameSound__3.UI_CLICK);
			p3.props.OnClick();
		end, 
		[v3.Event.MouseButton2Click] = function()
			if p3.props.Locked then
				return nil;
			end;
			p3.props.OnRightClick();
		end, 
		[v3.Event.MouseEnter] = function()

		end, 
		[v3.Event.MouseLeave] = function()

		end
	};
	local v15 = {};
	local v16 = #v15;
	local v17 = {};
	local v18 = v9 and v9.tier;
	if v18 ~= 0 and v18 == v18 and v18 then
		local v19 = l__discountColor__8[v9.tier];
	else
		v19 = l__Theme__9.textPrimary;
	end;
	v17.Color = v19;
	if v9 then
		local v20 = 3;
	else
		v20 = 1;
	end;
	v17.Thickness = v20;
	if p3.props.Locked then
		local v21 = 0.6;
	else
		v21 = 0;
	end;
	v17.Transparency = v21;
	v15[v16 + 1] = v3.createElement("UIStroke", v17);
	local v22 = false;
	if p3.props.ShopItem ~= nil then
		local v23 = {
			ItemType = p3.props.ShopItem.itemType
		};
		if p3.props.Locked then
			local v24 = 0.6;
		else
			v24 = 0;
		end;
		v23.ImageTransparency = v24;
		v23.Amount = 1;
		v23.Size = UDim2.fromScale(0.8, 0.8);
		v23.Position = UDim2.fromScale(0.5, 0.5);
		v23.AnchorPoint = Vector2.new(0.5, 0.5);
		v23.IgnoreInitialPop = true;
		v23.ShowCooldownBar = false;
		v22 = v3.createElement(l__ItemViewport__10, v23);
	end;
	if v22 then
		v15[v16 + 2] = v22;
	end;
	local v25 = false;
	if p3.props.ShopItem ~= nil then
		v25 = false;
		if p3.props.ShopItem.requiresKit ~= nil then
			v25 = v3.createElement("ImageLabel", {
				Size = UDim2.fromScale(0.35, 0.35), 
				Position = UDim2.fromScale(-0.08, 1.08), 
				AnchorPoint = Vector2.new(0, 1), 
				BackgroundTransparency = 1, 
				Image = "rbxassetid://6915556907", 
				BorderSizePixel = 0
			}, { v3.createElement("UIAspectRatioConstraint", {
					AspectRatio = 0.6707317073170732
				}) });
		end;
	end;
	if v25 then
		v15[#v15 + 1] = v25;
	end;
	local v26 = false;
	if p3.props.ShopItem ~= nil then
		v26 = p3.props.ShopItem.limitedTimeItem and v3.createElement("ImageLabel", {
			Size = UDim2.fromScale(0.35, 0.35), 
			Position = UDim2.fromScale(-0.08, 1.08), 
			AnchorPoint = Vector2.new(0, 1), 
			BackgroundTransparency = 1, 
			Image = "rbxassetid://7121706441", 
			BorderSizePixel = 0
		}, { v3.createElement("UIAspectRatioConstraint", {
				AspectRatio = 0.7517241379310344
			}) });
	end;
	if v26 then
		v15[#v15 + 1] = v26;
	end;
	local v27 = v9;
	if v27 then
		v27 = false;
		if v13 ~= nil then
			v27 = v3.createElement("ImageLabel", {
				Size = UDim2.fromScale(0.35, 0.35), 
				Position = UDim2.fromScale(-0.08, 0.25), 
				AnchorPoint = Vector2.new(0, 1), 
				BackgroundTransparency = 1, 
				Image = v13, 
				BorderSizePixel = 0
			});
		end;
	end;
	if v27 then
		v15[#v15 + 1] = v27;
	end;
	return v3.createElement("ImageButton", v14, v15);
end;
return {
	BedwarsShopItemCard = v5
};
