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
	local v7 = nil;
	for v8, v9 in ipairs(l__KnitClient__5.Controllers.MerchantKitController.discountedItems) do
		if v9.item.itemType == p3.props.ShopItem.itemType == true then
			v7 = v9;
			break;
		end;
	end;
	local v10 = v7;
	if v10 ~= nil then
		v10 = v10.tier;
	end;
	if v10 ~= nil then
		local v11 = l__discountImage__6[v10];
	else
		v11 = nil;
	end;
	local v12 = {
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
	local v13 = {};
	local v14 = #v13;
	local v15 = {};
	local v16 = v7 and v7.tier;
	if v16 ~= 0 and v16 == v16 and v16 then
		local v17 = l__discountColor__8[v7.tier];
	else
		v17 = l__Theme__9.textPrimary;
	end;
	v15.Color = v17;
	if v7 then
		local v18 = 3;
	else
		v18 = 1;
	end;
	v15.Thickness = v18;
	if p3.props.Locked then
		local v19 = 0.6;
	else
		v19 = 0;
	end;
	v15.Transparency = v19;
	v13[v14 + 1] = v3.createElement("UIStroke", v15);
	local v20 = false;
	if p3.props.ShopItem ~= nil then
		local v21 = {
			ItemType = p3.props.ShopItem.itemType
		};
		if p3.props.Locked then
			local v22 = 0.6;
		else
			v22 = 0;
		end;
		v21.ImageTransparency = v22;
		v21.Amount = 1;
		v21.Size = UDim2.fromScale(0.8, 0.8);
		v21.Position = UDim2.fromScale(0.5, 0.5);
		v21.AnchorPoint = Vector2.new(0.5, 0.5);
		v21.IgnoreInitialPop = true;
		v21.ShowCooldownBar = false;
		v20 = v3.createElement(l__ItemViewport__10, v21);
	end;
	if v20 then
		v13[v14 + 2] = v20;
	end;
	local v23 = false;
	if p3.props.ShopItem ~= nil then
		v23 = false;
		if p3.props.ShopItem.requiresKit ~= nil then
			v23 = v3.createElement("ImageLabel", {
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
	if v23 then
		v13[#v13 + 1] = v23;
	end;
	local v24 = false;
	if p3.props.ShopItem ~= nil then
		v24 = p3.props.ShopItem.limitedTimeItem and v3.createElement("ImageLabel", {
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
	if v24 then
		v13[#v13 + 1] = v24;
	end;
	local v25 = v7;
	if v25 then
		v25 = false;
		if v11 ~= nil then
			v25 = v3.createElement("ImageLabel", {
				Size = UDim2.fromScale(0.35, 0.35), 
				Position = UDim2.fromScale(-0.08, 0.25), 
				AnchorPoint = Vector2.new(0, 1), 
				BackgroundTransparency = 1, 
				Image = v11, 
				BorderSizePixel = 0
			});
		end;
	end;
	if v25 then
		v13[#v13 + 1] = v25;
	end;
	return v3.createElement("ImageButton", v12, v13);
end;
return {
	BedwarsShopItemCard = v5
};
