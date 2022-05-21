-- Script Hash: 58a37c83b82c9d15c36f786c4fe867f8128169e59e9906a93d45b6dfd22f2a18ec3864c0e2194333d11a7ec72fb399ca
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__EmoteDisplayType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteDisplayType;
local v3 = {};
local l__TweenService__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
v3[l__EmoteDisplayType__2.IMAGE_DEFAULT] = function(p1)
	l__TweenService__1:Create(p1, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
		Position = UDim2.fromScale(0.5, 0.5), 
		Size = UDim2.fromScale(1, 1), 
		ImageTransparency = 0
	}):Play();
	return l__TweenService__1:Create(p1, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
		Position = UDim2.fromScale(0.5, 1), 
		Size = UDim2.fromScale(0, 0), 
		ImageTransparency = 1
	});
end;
local l__EmoteMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__EmoteUtils__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-utils").EmoteUtils;
local l__KnitServer__5 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitServer;
local l__DeviceUtil__6 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).DeviceUtil;
return {
	EmoteImage = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u3)(function(p2, p3)
		local u7 = u3.createRef();
		local u8 = l__EmoteMeta__2[p2.Emote];
		p3.useEffect(function()
			local v4 = u7:getValue();
			if not v4 then
				return nil;
			end;
			if u8.emoteDisplayType ~= nil then
				local v5 = v3[u8.emoteDisplayType](v4);
			else
				v5 = v3[l__EmoteDisplayType__2.IMAGE_DEFAULT](v4);
			end;
			v1.Promise.delay(l__EmoteUtils__4.emoteDuration - v5.TweenInfo.Time):andThen(function()
				if p2.Player then
					l__KnitServer__5.Services.EmoteService:playEndEmoteSounds(p2.Emote, p2.Player);
					v5.Completed:Connect(function()
						if p2.Player then
							l__KnitServer__5.Services.EmoteService:cleanUpEmote(p2.Player);
						end;
					end);
					v5:Play();
				end;
			end);
			return function()
				if p2.Player then
					l__KnitServer__5.Services.EmoteService:cleanUpEmote(p2.Player);
				end;
			end;
		end, {});
		local v6 = {};
		local v7 = {};
		if l__DeviceUtil__6.isHoarceKat() then
			local v8 = UDim2.fromScale(60, 10);
		else
			v8 = UDim2.fromScale(6, 2.5);
		end;
		v7.Size = v8;
		v7.StudsOffsetWorldSpace = Vector3.new(0, 2.6, 0);
		v7.AlwaysOnTop = true;
		v7.MaxDistance = 150;
		v7.ResetOnSpawn = true;
		v7.AutoLocalize = false;
		v6.EmoteImage = u3.createElement("BillboardGui", v7, { u3.createElement("ImageLabel", {
				[u3.Ref] = u7, 
				AnchorPoint = Vector2.new(0.5, 1), 
				Position = UDim2.fromScale(0.5, 1), 
				Size = UDim2.fromScale(0, 0), 
				Image = u8.image, 
				BackgroundTransparency = 1, 
				ImageTransparency = 1, 
				ScaleType = "Fit"
			}) });
		return u3.createFragment(v6);
	end)
};
