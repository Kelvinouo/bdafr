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
local l__DeviceUtil__5 = v2.DeviceUtil;
local l__KnitClient__6 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
function v5.getDiscountedItems(p3)
	if l__DeviceUtil__5.isHoarceKat() then
		return {};
	end;
	return l__KnitClient__6.Controllers.MerchantKitController.discountedItems;
end;
local l__discountImage__7 = v4.discountImage;
local l__ColorUtil__8 = v2.ColorUtil;
local l__discountColor__9 = v4.discountColor;
local l__Theme__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ItemViewport__11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "global", "inventory", "ui", "item-viewport").ItemViewport;
function v5.render(p4)
	local v7 = nil;
	local v8, v9, v10 = ipairs((p4:getDiscountedItems()));
	while true do
		v8(v9, v10);
		if not v8 then
			break;
		end;
		v10 = v8;
		if v9.item.itemType == p4.props.ShopItem.itemType == true then
			v7 = v9;
			break;
		end;	
	end;
	local v11 = v7;
	if v11 ~= nil then
		v11 = v11.tier;
	end;
	if v11 ~= nil then
		local v12 = l__discountImage__7[v11];
	else
		v12 = nil;
	end;
	local v13 = {
		[v3.Ref] = p4.ref, 
		Size = UDim2.fromScale(1, 1), 
		BackgroundColor3 = l__ColorUtil__8.BLACK, 
		BackgroundTransparency = 0.6, 
		LayoutOrder = p4.props.LayoutOrder, 
		[v3.Event.Activated] = function()
			if p4.props.Selected then
				p4.props.OnRightClick();
				return nil;
			end;
			l__SoundManager__2:playSound(l__GameSound__3.UI_CLICK);
			p4.props.OnClick();
		end, 
		[v3.Event.MouseButton2Click] = function()
			if p4.props.Locked then
				return nil;
			end;
			p4.props.OnRightClick();
		end, 
		[v3.Event.MouseEnter] = function()

		end, 
		[v3.Event.MouseLeave] = function()

		end
	};
	local v14 = {};
	local v15 = #v14;
	local v16 = {};
	local v17 = v7 and v7.tier;
	if v17 ~= 0 and v17 == v17 and v17 then
		local v18 = l__discountColor__9[v7.tier];
	else
		v18 = l__Theme__10.textPrimary;
	end;
	v16.Color = v18;
	if v7 then
		local v19 = 3;
	else
		v19 = 1;
	end;
	v16.Thickness = v19;
	if p4.props.Locked then
		local v20 = 0.6;
	else
		v20 = 0;
	end;
	v16.Transparency = v20;
	v14[v15 + 1] = v3.createElement("UIStroke", v16);
	local v21 = false;
	if p4.props.ShopItem ~= nil then
		local v22 = {
			ItemType = p4.props.ShopItem.itemType
		};
		if p4.props.Locked then
			local v23 = 0.6;
		else
			v23 = 0;
		end;
		v22.ImageTransparency = v23;
		v22.Amount = 1;
		v22.Size = UDim2.fromScale(0.8, 0.8);
		v22.Position = UDim2.fromScale(0.5, 0.5);
		v22.AnchorPoint = Vector2.new(0.5, 0.5);
		v22.IgnoreInitialPop = true;
		v22.ShowCooldownBar = false;
		v21 = v3.createElement(l__ItemViewport__11, v22);
	end;
	if v21 then
		v14[v15 + 2] = v21;
	end;
	local v24 = false;
	if p4.props.ShopItem ~= nil then
		v24 = false;
		if p4.props.ShopItem.requiresKit ~= nil then
			v24 = v3.createElement("ImageLabel", {
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
	if v24 then
		v14[#v14 + 1] = v24;
	end;
	local v25 = false;
	if p4.props.ShopItem ~= nil then
		v25 = p4.props.ShopItem.limitedTimeItem and v3.createElement("ImageLabel", {
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
	if v25 then
		v14[#v14 + 1] = v25;
	end;
	local v26 = v7;
	if v26 then
		v26 = false;
		if v12 ~= nil then
			v26 = v3.createElement("ImageLabel", {
				Size = UDim2.fromScale(0.35, 0.35), 
				Position = UDim2.fromScale(-0.08, 0.25), 
				AnchorPoint = Vector2.new(0, 1), 
				BackgroundTransparency = 1, 
				Image = v12, 
				BorderSizePixel = 0
			});
		end;
	end;
	if v26 then
		v14[#v14 + 1] = v26;
	end;
	return v3.createElement("ImageButton", v13, v14);
end;
return {
	BedwarsShopItemCard = v5
};
