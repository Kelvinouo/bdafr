-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-meta");
local l__EnchantMeta__1 = v3.EnchantMeta;
local l__EnchantElementMeta__2 = v3.EnchantElementMeta;
local l__TweenService__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local l__DeviceUtil__4 = v2.DeviceUtil;
local l__KnitClient__5 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__SlideIn__7 = v2.SlideIn;
local l__Empty__8 = v2.Empty;
local l__EnchantRuneWheel__9 = v1.import(script, script.Parent, "enchant-table-right", "enchant-rune-wheel").EnchantRuneWheel;
local l__ColorUtil__10 = v2.ColorUtil;
return {
	EnchantPopUp = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u6)(function(p1, p2)
		local v4 = l__EnchantMeta__1[p1.Enchant];
		local u11 = nil;
		p2.useEffect(function()
			local v5 = u11:getValue();
			if v5 then
				local u12 = true;
				local u13 = nil;
				v1.Promise.delay(4):andThen(function()
					if not u12 then
						return nil;
					end;
					local v6 = l__TweenService__3:Create(v5, TweenInfo.new(0.35), {
						Position = UDim2.fromScale(0.5, -0.2)
					});
					v6:Play();
					u13 = v6.Completed:Connect(function()
						if not l__DeviceUtil__4.isHoarceKat() then
							l__KnitClient__5.Controllers.EnchantTableController:unmountEnchantPopup();
						end;
					end);
				end);
			end;
			local u14 = true;
			local u15 = nil;
			return function()
				u14 = false;
				if u15 then
					u15:Disconnect();
				end;
			end;
		end, {});
		u11 = u6.createRef();
		return u6.createElement("ScreenGui", {
			ResetOnSpawn = false
		}, { u6.createElement(l__SlideIn__7, {}, { u6.createElement(l__Empty__8, {
					Position = UDim2.fromScale(0.5, 0.2), 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					Size = UDim2.fromScale(0.25, 0.25), 
					[u6.Ref] = u11
				}, { u6.createElement("UIAspectRatioConstraint", {
						AspectRatio = 1
					}), u6.createElement(l__EnchantRuneWheel__9, {
						Size = UDim2.fromScale(1, 1), 
						AnchorPoint = Vector2.new(0.5, 0.5), 
						Position = UDim2.fromScale(0.5, 0.5), 
						RuneTransparency = 0
					}), u6.createElement("ImageLabel", {
						Size = UDim2.fromScale(0.8, 0.8), 
						AnchorPoint = Vector2.new(0.5, 0.5), 
						Position = UDim2.fromScale(0.5, 0.5), 
						Image = l__EnchantElementMeta__2[v4.element].image, 
						ScaleType = "Fit", 
						BackgroundTransparency = 1
					}), u6.createElement("Frame", {
						Size = UDim2.fromScale(0.75, 0.18), 
						AutomaticSize = "X", 
						AnchorPoint = Vector2.new(0.5, 0.5), 
						Position = UDim2.fromScale(0.5, 0.85), 
						BackgroundColor3 = l__ColorUtil__10.BLACK, 
						BackgroundTransparency = 0.3
					}, { u6.createElement("UICorner", {
							CornerRadius = UDim.new(0, 6)
						}), u6.createElement("TextLabel", {
							Size = UDim2.fromScale(1, 0.65), 
							AnchorPoint = Vector2.new(0.5, 0.5), 
							Position = UDim2.fromScale(0.5, 0.5), 
							Text = "<b>" .. v4.name .. "</b>", 
							TextScaled = true, 
							TextColor3 = l__ColorUtil__10.WHITE, 
							RichText = true, 
							TextXAlignment = "Center", 
							TextYAlignment = "Center", 
							BackgroundTransparency = 1
						}, { u6.createElement("UITextSizeConstraint", {
								MaxTextSize = 18
							}) }) }) }) }) });
	end)
};
