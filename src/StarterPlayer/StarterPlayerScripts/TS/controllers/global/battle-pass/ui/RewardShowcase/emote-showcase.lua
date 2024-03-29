-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__EmoteMeta__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__DeviceUtil__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).DeviceUtil;
local l__KnitClient__4 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__PlayerViewport__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "kit-shop", "ui", "misc", "player-viewport").PlayerViewport;
local l__GameAnimationUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
return {
	EmoteShowcase = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local v2 = l__EmoteMeta__1[p1.Emote];
		if not v2 then
			return u2.createFragment();
		end;
		p2.useEffect(function()
			if l__DeviceUtil__3.isHoarceKat() or not v2 then
				return nil;
			end;
			if p1.PlaySound and v2.soundsOnBegin then
				l__KnitClient__4.Controllers.EmoteController:playEmoteShowcase(p1.Emote);
			end;
			return function()
				l__KnitClient__4.Controllers.EmoteController:stopEmoteShowcase();
			end;
		end, { p1.Emote });
		local l__image__3 = v2.image;
		local v4 = {};
		if l__image__3 ~= "" and l__image__3 then
			local v5 = u2.createFragment({
				RewardShowcase = u2.createElement("ImageLabel", {
					Image = v2.image, 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					Position = UDim2.fromScale(0.5, 0.5), 
					Size = p1.Size or UDim2.fromScale(1, 1), 
					ScaleType = "Fit", 
					BackgroundTransparency = 1, 
					LayoutOrder = p1.LayoutOrder, 
					ZIndex = p1.ZIndex
				}, { u2.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal, 
						HorizontalAlignment = Enum.HorizontalAlignment.Center, 
						VerticalAlignment = Enum.VerticalAlignment.Center
					}) })
			});
		elseif v2.animation then
			v5 = u2.createFragment({
				RewardShowcase = u2.createElement(l__PlayerViewport__5, {
					AnchorPoint = Vector2.new(0.5, 0.5), 
					Position = UDim2.fromScale(0.5, 0.5), 
					Animation = l__GameAnimationUtil__6.getAssetId(v2.animation.type), 
					Size = p1.Size, 
					LayoutOrder = p1.LayoutOrder, 
					ZIndex = p1.ZIndex, 
					ImageTransparency = 0
				})
			});
		else
			v5 = u2.createFragment();
		end;
		v4[#v4 + 1] = v5;
		return u2.createFragment(v4);
	end)
};
