-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-meta");
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__EnchantMeta__2 = v3.EnchantMeta;
local l__EnchantElementMeta__3 = v3.EnchantElementMeta;
local l__EnchantTableUIUtil__4 = v1.import(script, script.Parent.Parent, "enchant-table-ui-util").EnchantTableUIUtil;
local l__ItemType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__TweenService__6 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local l__DeviceUtil__7 = v2.DeviceUtil;
local l__KnitClient__8 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__UIGlitchEffect__9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "glitch-effect", "ui-glitch-effect").UIGlitchEffect;
local l__SlideIn__10 = v2.SlideIn;
local l__Empty__11 = v2.Empty;
local l__EnchantRuneWheel__12 = v1.import(script, script.Parent.Parent, "enchant-table-right", "enchant-rune-wheel").EnchantRuneWheel;
local l__ColorUtil__13 = v2.ColorUtil;
return {
	EnchantPopUp = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local v4 = l__EnchantMeta__2[p1.Enchant];
		local v5 = p1.ThemeColor or l__EnchantTableUIUtil__4.getThemeColor(p1.EnchantTableType);
		local u14 = u1.createRef();
		p2.useEffect(function()
			local v6 = u14:getValue();
			if v6 then
				local u15 = true;
				local u16 = nil;
				v1.Promise.delay(4):andThen(function()
					if not u15 then
						return nil;
					end;
					local v7 = l__TweenService__6:Create(v6, TweenInfo.new(0.35), {
						Position = UDim2.fromScale(0.5, -0.2)
					});
					v7:Play();
					u16 = v7.Completed:Connect(function()
						if not l__DeviceUtil__7.isHoarceKat() then
							l__KnitClient__8.Controllers.EnchantTableController:unmountEnchantPopup();
						end;
					end);
				end);
			end;
			local u17 = true;
			local u18 = nil;
			return function()
				u17 = false;
				if u18 then
					u18:Disconnect();
				end;
			end;
		end, {});
		local u19 = p1.EnchantTableType == l__ItemType__5.ENCHANT_TABLE_GLITCHED;
		local u20 = l__EnchantElementMeta__3[v4.element];
		local v8 = {};
		local v9 = {};
		local v10 = {};
		local v11 = {};
		local v12 = {
			Size = UDim2.fromScale(1, 0.65), 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5)
		};
		if u19 then
			local v13 = "Glitched " .. v4.name;
		else
			v13 = v4.name;
		end;
		v12.Text = "<b>" .. v13 .. "</b>";
		v12.TextScaled = true;
		v12.TextColor3 = l__ColorUtil__13.WHITE;
		v12.RichText = true;
		v12.TextXAlignment = "Center";
		v12.TextYAlignment = "Center";
		v12.BackgroundTransparency = 1;
		v12.ZIndex = 4;
		v11[1] = u1.createElement("UIPadding", {
			PaddingLeft = UDim.new(0.005, 0), 
			PaddingRight = UDim.new(0.005, 0)
		});
		v11[2] = u1.createElement("UICorner", {
			CornerRadius = UDim.new(0, 6)
		});
		v11[3] = u1.createElement("TextLabel", v12, { u1.createElement("UITextSizeConstraint", {
				MaxTextSize = 16
			}) });
		v10[1] = u1.createElement("UIAspectRatioConstraint", {
			AspectRatio = 1
		});
		v10[2] = u1.createElement(l__EnchantRuneWheel__12, {
			Color = v5, 
			Size = UDim2.fromScale(1, 1), 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			RuneTransparency = 0
		});
		v10[3] = (function()
			if not u19 then
				return u1.createElement("ImageLabel", {
					Size = UDim2.fromScale(0.8, 0.8), 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					Position = UDim2.fromScale(0.5, 0.5), 
					Image = u20.image, 
					ScaleType = "Fit", 
					BackgroundTransparency = 1, 
					ZIndex = 2
				});
			end;
			return u1.createElement(l__UIGlitchEffect__9, {}, { u1.createElement("ImageLabel", {
					Size = UDim2.fromScale(0.8, 0.8), 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					Position = UDim2.fromScale(0.5, 0.5), 
					Image = u20.image, 
					ScaleType = "Fit", 
					BackgroundTransparency = 1
				}) });
		end)();
		v10[4] = u1.createElement("Frame", {
			Size = UDim2.fromScale(0.75, 0.18), 
			AutomaticSize = "X", 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.85), 
			BackgroundColor3 = l__ColorUtil__13.BLACK, 
			BackgroundTransparency = 0.3, 
			ZIndex = 3
		}, v11);
		v9[1] = u1.createElement(l__Empty__11, {
			Position = UDim2.fromScale(0.5, 0.2), 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Size = UDim2.fromScale(0.25, 0.25), 
			[u1.Ref] = u14
		}, v10);
		v8[1] = u1.createElement(l__SlideIn__10, {}, v9);
		return u1.createElement("ScreenGui", {
			ResetOnSpawn = false
		}, v8);
	end)
};
