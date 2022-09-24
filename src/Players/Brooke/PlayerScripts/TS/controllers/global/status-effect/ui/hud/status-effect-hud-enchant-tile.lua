-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__StatusEffectMeta__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-meta").StatusEffectMeta;
local l__getItemMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__DeviceUtil__3 = v2.DeviceUtil;
local l__KnitClient__4 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__Players__5 = v3.Players;
local l__BedwarsImageId__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__ColorUtil__7 = v2.ColorUtil;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__TweenService__9 = v3.TweenService;
local l__Theme__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__UIGlitchEffect__11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "glitch-effect", "ui-glitch-effect").UIGlitchEffect;
local l__AutoSizedText__12 = v2.AutoSizedText;
local l__TooltipContainer__13 = v2.TooltipContainer;
return {
	StatusEffectHudEnchantTile = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u8)(function(p1, p2)
		local l__useState__4 = p2.useState;
		local v5, v6 = l__useState__4(false);
		local v7, v8 = l__useState__4(false);
		local v9 = l__StatusEffectMeta__1[p1.ActiveStatusEffect.statusEffect];
		local v10 = v9.image;
		if v9.item then
			local v11 = l__getItemMeta__2(v9.item);
			if v9.image == nil then
				v10 = v11.image;
			end;
		end;
		p2.useEffect(function()
			if l__DeviceUtil__3.isHoarceKat() then
				v8(true);
				return nil;
			end;
			local v12 = l__KnitClient__4.Controllers.GlitchedEnchantingRelicController:onRelicTeam(l__Players__5.LocalPlayer);
			if v12 then
				v8(v12);
			end;
		end, {});
		local v13 = {
			Size = UDim2.new(1.2, 0, 1.2, 0), 
			SizeConstraint = "RelativeYY", 
			Image = l__BedwarsImageId__6.STATUS_EFFECT_FRAME_2, 
			ImageColor3 = l__ColorUtil__7.BLACK, 
			BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0
		};
		v13[u8.Event.MouseEnter] = function(p3)
			v6(true);
			l__TweenService__9:Create(p3, TweenInfo.new(0.3), {
				ImageColor3 = l__Theme__10.textPrimary
			}):Play();
		end;
		v13[u8.Event.MouseLeave] = function(p4)
			v6(false);
			l__TweenService__9:Create(p4, TweenInfo.new(0.3), {
				ImageColor3 = l__ColorUtil__7.BLACK
			}):Play();
		end;
		local v14 = { u8.createElement(l__UIGlitchEffect__11, {
				Disabled = not v7
			}, { u8.createElement("ImageLabel", {
					Size = UDim2.new(1, 0, 1, 0), 
					BackgroundTransparency = 1, 
					BorderSizePixel = 1, 
					Image = v10, 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					Position = UDim2.new(0.5, 0, 0.5, 0)
				}) }) };
		local v15 = p1.ActiveStatusEffect.stacks > 1 and u8.createElement("TextLabel", {
			Position = UDim2.fromScale(0.5, -0.25), 
			Size = UDim2.fromScale(0.75, 0.5), 
			AnchorPoint = Vector2.new(0.5, 0), 
			Text = "<b>" .. tostring(p1.ActiveStatusEffect.stacks) .. "</b>", 
			TextColor3 = l__ColorUtil__7.WHITE, 
			BackgroundTransparency = 1, 
			Font = "RobotoMono", 
			TextXAlignment = "Center", 
			TextYAlignment = "Top", 
			TextScaled = true, 
			RichText = true, 
			TextStrokeTransparency = 0
		});
		if v15 then
			v14[#v14 + 1] = v15;
		end;
		local v16 = { u8.createElement(l__AutoSizedText__12, {
				Text = v9.displayName, 
				Font = Enum.Font.SourceSansBold, 
				TextSize = 16, 
				Limits = Vector2.new(300, 60)
			}) };
		local v17 = v7 and u8.createElement(l__AutoSizedText__12, {
			Text = "Glitched", 
			Font = Enum.Font.SourceSans, 
			TextColor3 = Color3.fromRGB(56, 255, 247), 
			TextSize = 14, 
			Limits = Vector2.new(300, 60)
		});
		if v17 then
			v16[#v16 + 1] = v17;
		end;
		local v18 = false;
		if v9.description ~= nil then
			v18 = u8.createElement(l__AutoSizedText__12, {
				Text = v9.description, 
				Font = Enum.Font.SourceSans, 
				TextSize = 14, 
				Limits = Vector2.new(300, 60)
			});
		end;
		if v18 then
			v16[#v16 + 1] = v18;
		end;
		v14[#v14 + 1] = u8.createElement(l__TooltipContainer__13, {}, v16);
		return u8.createElement("ImageLabel", v13, v14);
	end)
};
