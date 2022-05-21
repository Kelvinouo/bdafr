-- Script Hash: 4943a24ba0710cda62d9da3e5ccfe81d850c65c526bbb2b3bb50541720859782cba4cb16fa4307ba4592b32b4f6df68f
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.Component:extend("BedwarsShopItemCard");
function v4.init(p1)
	p1.ref = v3.createRef();
end;
local l__UserInputService__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).UserInputService;
local l__SoundManager__2 = v2.SoundManager;
local l__GameSound__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__UIUtil__4 = v2.UIUtil;
function v4.didMount(p2)
	if l__UserInputService__1.GamepadEnabled and not l__UserInputService__1.MouseEnabled then
		local v5 = p2.ref:getValue();
		if v5 then
			v5.SelectionGained:Connect(function()
				l__SoundManager__2:playSound(l__GameSound__3.UI_CLICK);
				p2.props.OnClick();
			end);
			if p2.props.Selected then
				l__UIUtil__4:selectGui(v5);
			end;
		end;
	end;
end;
local l__ColorUtil__5 = v2.ColorUtil;
local l__Theme__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ItemViewport__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "global", "inventory", "ui", "item-viewport").ItemViewport;
function v4.render(p3)
	local v6 = {
		[v3.Ref] = p3.ref, 
		Size = UDim2.fromScale(1, 1), 
		BackgroundColor3 = l__ColorUtil__5.BLACK, 
		BackgroundTransparency = 0.6, 
		LayoutOrder = p3.props.LayoutOrder
	};
	v6[v3.Event.Activated] = function()
		if p3.props.Selected then
			p3.props.OnRightClick();
			return nil;
		end;
		l__SoundManager__2:playSound(l__GameSound__3.UI_CLICK);
		p3.props.OnClick();
	end;
	v6[v3.Event.MouseButton2Click] = function()
		if p3.props.Locked then
			return nil;
		end;
		p3.props.OnRightClick();
	end;
	v6[v3.Event.MouseEnter] = function()

	end;
	v6[v3.Event.MouseLeave] = function()

	end;
	local v7 = {};
	local v8 = {
		Color = l__Theme__6.textPrimary, 
		Thickness = 1
	};
	if p3.props.Locked then
		local v9 = 0.6;
	else
		v9 = 0;
	end;
	v8.Transparency = v9;
	v7[1] = v3.createElement("UIStroke", v8);
	local v10 = false;
	if p3.props.ShopItem ~= nil then
		local v11 = {
			ItemType = p3.props.ShopItem.itemType
		};
		if p3.props.Locked then
			local v12 = 0.6;
		else
			v12 = 0;
		end;
		v11.ImageTransparency = v12;
		v11.Amount = 1;
		v11.Size = UDim2.fromScale(0.8, 0.8);
		v11.Position = UDim2.fromScale(0.5, 0.5);
		v11.AnchorPoint = Vector2.new(0.5, 0.5);
		v11.IgnoreInitialPop = true;
		v11.ShowCooldownBar = false;
		v10 = v3.createElement(l__ItemViewport__7, v11);
	end;
	if v10 then
		v7[#v7 + 1] = v10;
	end;
	local v13 = false;
	if p3.props.ShopItem ~= nil then
		v13 = false;
		if p3.props.ShopItem.requiresKit ~= nil then
			v13 = v3.createElement("ImageLabel", {
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
	if v13 then
		v7[#v7 + 1] = v13;
	end;
	local v14 = false;
	if p3.props.ShopItem ~= nil then
		v14 = p3.props.ShopItem.limitedTimeItem and v3.createElement("ImageLabel", {
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
	if v14 then
		v7[#v7 + 1] = v14;
	end;
	return v3.createElement("ImageButton", v6, v7);
end;
return {
	BedwarsShopItemCard = v4
};
