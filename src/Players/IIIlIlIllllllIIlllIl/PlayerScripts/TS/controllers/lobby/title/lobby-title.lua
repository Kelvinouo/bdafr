-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-meta");
local l__TitleMeta__1 = v2.TitleMeta;
local l__LobbyTitleDefaults__2 = v2.LobbyTitleDefaults;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return {
	LobbyTitle = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u3)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = l__TitleMeta__1[p1.TitleType];
		local v5 = {};
		local v6 = {
			Text = v4.text, 
			RichText = true, 
			Size = UDim2.fromScale(1, 1), 
			BackgroundColor3 = v4.backgroundColor or l__LobbyTitleDefaults__2.backgroundColor
		};
		local v7 = v4.backgroundTransparency;
		if v7 == nil then
			v7 = l__LobbyTitleDefaults__2.backgroundTransparency;
		end;
		v6.BackgroundTransparency = v7;
		v6.TextColor3 = v4.color or l__LobbyTitleDefaults__2.color;
		v6.TextScaled = true;
		v6.Font = v4.font or l__LobbyTitleDefaults__2.font;
		v6.BorderSizePixel = 0;
		v6.AutoLocalize = true;
		v5[#v5 + 1] = u3.createElement("TextLabel", v6);
		return u3.createElement("BillboardGui", {
			MaxDistance = 50, 
			Size = UDim2.fromScale(4, 0.65), 
			Adornee = p1.Head, 
			ResetOnSpawn = false, 
			StudsOffsetWorldSpace = Vector3.new(0, 2.5, 0), 
			AlwaysOnTop = true, 
			Brightness = 2
		}, v5);
	end)
};
