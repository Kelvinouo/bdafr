-- Script Hash: 1d050b00c3bfa2a99b8949357345ed83be37305c6f82b835478d30507b2fc3433a04726906a52151354bbd5dad59f9ac
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v2.Component:extend("ItemViewport");
function v3.init(p1)
	p1.imageRef = v2.createRef();
end;
function v3.didMount(p2)
	if not p2.props.IgnoreInitialPop then
		p2:popImage();
	end;
end;
function v3.willUpdate(p3, p4)
	local v4 = p4.Amount;
	if v4 == nil then
		v4 = 0;
	end;
	local v5 = p3.props.Amount;
	if v5 == nil then
		v5 = 0;
	end;
	local v6 = v5 < v4 or p4.ItemType ~= p3.props.ItemType;
	if v6 then
		p3:popImage();
	end;
end;
local l__TweenService__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
function v3.popImage(p5)
	local v7 = p5.imageRef:getValue();
	if v7 then
		local v8 = l__TweenService__1:Create(p5.imageRef:getValue(), TweenInfo.new(0.04), {
			Size = UDim2.fromScale(p5.props.ImageSize.X.Scale - 0.1, p5.props.ImageSize.Y.Scale + 0.3)
		});
		v8:Play();
		v1.Promise.fromEvent(v8.Completed):andThen(function()
			local v9 = v7;
			if v9 ~= nil then
				v9 = v9.Parent;
			end;
			if v9 then
				l__TweenService__1:Create(p5.imageRef:getValue(), TweenInfo.new(0.07), {
					Size = p5.props.ImageSize
				}):Play();
			end;
		end);
	end;
end;
local l__getItemMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__ItemUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local l__CooldownBar__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).CooldownBar;
function v3.render(p6)
	local v10 = {};
	for v11, v12 in pairs(p6.props) do
		v10[v11] = v12;
	end;
	v10[v2.Children] = nil;
	v10.ItemType = nil;
	v10.Amount = nil;
	v10.IgnoreInitialPop = nil;
	v10.DisplayOneAmount = nil;
	v10.ShowCooldownBar = nil;
	v10.ImageSize = nil;
	v10.ImageTransparency = nil;
	local v13 = l__getItemMeta__2(p6.props.ItemType);
	local l__image__14 = v13.image;
	local v15 = l__ItemUtil__3.getDisplayName(p6.props.ItemType);
	local l__cooldownId__16 = v13.cooldownId;
	local v17 = {
		Size = UDim2.fromScale(1, 1), 
		BackgroundTransparency = 1, 
		BorderSizePixel = 0
	};
	for v18, v19 in pairs(v10) do
		v17[v18] = v19;
	end;
	local v20 = {};
	local v21 = #v20;
	local v22 = p6.props[v2.Children];
	if v22 then
		local v23, v24, v25 = pairs(v22);
		while true do
			local v26 = nil;
			local v27 = nil;
			v27, v26 = v23(v24, v25);
			if not v27 then
				break;
			end;
			v25 = v27;
			if type(v27) == "number" then
				v20[v21 + v27] = v26;
			else
				v20[v27] = v26;
			end;		
		end;
	end;
	if l__image__14 ~= nil then
		local v28 = v2.createElement("ImageLabel", {
			[v2.Ref] = p6.imageRef, 
			Size = p6.props.ImageSize, 
			Position = UDim2.fromScale(0.5, 0.5), 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			BorderSizePixel = 0, 
			BackgroundTransparency = 1, 
			Image = l__image__14, 
			ImageTransparency = p6.props.ImageTransparency
		});
	else
		v28 = v2.createElement("TextLabel", {
			Text = v15, 
			Font = "RobotoMono", 
			RichText = true, 
			TextScaled = true, 
			TextColor3 = Color3.fromRGB(255, 255, 255), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			Size = UDim2.fromScale(0.8, 0.6), 
			Position = UDim2.fromScale(0.5, 0.5), 
			AnchorPoint = Vector2.new(0.5, 0.5)
		});
	end;
	v20[#v20 + 1] = v28;
	local v29 = false;
	if p6.props.ShowCooldownBar == true then
		v29 = false;
		if l__cooldownId__16 ~= nil then
			v29 = v2.createElement(l__CooldownBar__4, {
				cooldownId = l__cooldownId__16, 
				Position = UDim2.fromScale(0.5, 0.96), 
				AnchorPoint = Vector2.new(0.5, 0.96), 
				Size = UDim2.fromScale(1, 0.08)
			});
		end;
	end;
	if v29 then
		v20[#v20 + 1] = v29;
	end;
	local v30 = false;
	if p6.props.Amount ~= nil then
		if not (p6.props.Amount > 1) then
			v30 = p6.props.DisplayOneAmount and v2.createElement("TextLabel", {
				Text = "<b>" .. tostring(p6.props.Amount) .. "</b>", 
				Font = "RobotoMono", 
				RichText = true, 
				TextScaled = true, 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				Size = UDim2.fromScale(0.5, 0.3), 
				ZIndex = 10, 
				AnchorPoint = Vector2.new(1, 1), 
				Position = UDim2.fromScale(0.98, 1), 
				TextXAlignment = "Right"
			});
		else
			v30 = v2.createElement("TextLabel", {
				Text = "<b>" .. tostring(p6.props.Amount) .. "</b>", 
				Font = "RobotoMono", 
				RichText = true, 
				TextScaled = true, 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				Size = UDim2.fromScale(0.5, 0.3), 
				ZIndex = 10, 
				AnchorPoint = Vector2.new(1, 1), 
				Position = UDim2.fromScale(0.98, 1), 
				TextXAlignment = "Right"
			});
		end;
	end;
	if v30 then
		v20[#v20 + 1] = v30;
	end;
	return v2.createElement("Frame", v17, v20);
end;
v3.defaultProps = {
	ImageSize = UDim2.fromScale(1, 1), 
	ImageTransparency = 0
};
return {
	ItemViewport = v3
};
