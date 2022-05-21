-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__DeviceUtil__1 = v2.DeviceUtil;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__MobileButton__3 = v2.MobileButton;
local l__BedwarsImageId__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__BedwarsUI__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local u6 = nil;
local u7 = nil;
local l__UIUtil__8 = v2.UIUtil;
u7 = u2.Component:extend("WizardAbilityBar");
function u7.init(p1)

end;
function u7.render(p2)
	if l__DeviceUtil__1.isGamepadControls() then
		local v3 = "B";
	else
		v3 = "F";
	end;
	local v4 = {
		Size = UDim2.fromScale(1, 1), 
		Position = l__UIUtil__8:getActionBarPosition(), 
		AnchorPoint = Vector2.new(0.5, 1), 
		BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
		BackgroundTransparency = 0.6, 
		BorderSizePixel = 0, 
		LayoutOrder = 1
	};
	v4[u2.Event.MouseButton1Down] = function()
		p2.props.ChangeAbility();
	end;
	return u2.createElement("ImageButton", v4, { u2.createElement("UIAspectRatioConstraint", {
			AspectRatio = 4.675675675675675
		}), u2.createElement("TextLabel", {
			Size = UDim2.fromScale(0.8, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			Text = "<b>" .. p2.props.store.Kit.wizardAbility .. " [" .. v3 .. "]</b>", 
			Font = "Roboto", 
			RichText = true, 
			TextScaled = true, 
			TextColor3 = Color3.fromRGB(255, 255, 255)
		}) });
end;
u6 = u2.Component:extend("WizardAbilityBarMobile");
function u6.init(p3)

end;
function u6.render(p4)
	return u2.createElement("Frame", {
		Size = UDim2.fromScale(1, 1), 
		Position = l__UIUtil__8:getActionBarPosition(), 
		AnchorPoint = Vector2.new(0.5, 1), 
		BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
		BackgroundTransparency = 0.6, 
		BorderSizePixel = 0, 
		LayoutOrder = 1
	}, { u2.createElement("UIAspectRatioConstraint", {
			AspectRatio = 4.675675675675675
		}), u2.createElement("TextLabel", {
			Size = UDim2.fromScale(0.8, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			Text = "<b>" .. p4.props.store.Kit.wizardAbility .. "</b>", 
			Font = "Roboto", 
			RichText = true, 
			TextScaled = true, 
			TextColor3 = Color3.fromRGB(255, 255, 255)
		}) });
end;
return {
	WizardAbilityBarWrapper = function(p5)
		local v5 = {};
		local v6 = l__DeviceUtil__1.isMobileControls();
		if v6 then
			local v7 = {
				Image = l__BedwarsImageId__4.SWAP_MOBILE, 
				Position = l__BedwarsUI__5:getActionMobileButtonPosition()
			};
			function v7.OnClick()
				p5.ChangeAbility();
			end;
			v6 = u2.createElement(l__MobileButton__3, v7);
		end;
		if v6 then
			v5[#v5 + 1] = v6;
		end;
		if l__DeviceUtil__1.isMobileControls() then
			local v8 = {};
			for v9, v10 in pairs(p5) do
				v8[v9] = v10;
			end;
			local v11 = u2.createElement(u6, v8);
		else
			local v12 = {};
			for v13, v14 in pairs(p5) do
				v12[v13] = v14;
			end;
			v11 = u2.createElement(u7, v12);
		end;
		local v15 = { u2.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				HorizontalAlignment = Enum.HorizontalAlignment.Center, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0.05, 0)
			}) };
		v15[#v15 + 1] = v11;
		v5[#v5 + 1] = u2.createElement("Frame", {
			Position = l__UIUtil__8:getActionBarPosition(), 
			AnchorPoint = Vector2.new(0.5, 1), 
			Size = UDim2.fromScale(0.35, 0.05), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0
		}, v15);
		return u2.createElement("ScreenGui", {
			ResetOnSpawn = false
		}, v5);
	end
};
