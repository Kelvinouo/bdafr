-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__TabListRank__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-ranks.dto").TabListRank;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__BedwarsImageId__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
return {
	PlayerRankIcon = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local u4 = nil;
		local u5 = nil;
		u5 = function()
			return u2.createElement("ImageLabel", {
				Image = l__BedwarsImageId__3.TabListRankIcons[l__TabListRank__1.DEVELOPER], 
				Size = UDim2.fromOffset(16, 16), 
				ScaleType = "Fit", 
				BorderSizePixel = 0, 
				ImageTransparency = p1.ContentTransparency, 
				BackgroundTransparency = 1
			});
		end;
		u4 = function()
			return u2.createElement("ImageLabel", {
				Image = l__BedwarsImageId__3.TabListRankIcons[l__TabListRank__1.STAR_CREATOR], 
				Size = UDim2.fromOffset(16, 16), 
				ScaleType = "Fit", 
				BorderSizePixel = 0, 
				ImageTransparency = p1.ContentTransparency, 
				BackgroundTransparency = 1
			});
		end;
		local v2 = { u2.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 0)
			}) };
		local v3 = (function()
			local l__Rank__4 = p1.Rank;
			if l__Rank__4 == l__TabListRank__1.STAR_CREATOR then
				return u2.createElement(u4);
			end;
			if l__Rank__4 ~= l__TabListRank__1.DEVELOPER then
				return;
			end;
			return u2.createElement(u5);
		end)();
		if v3 then
			v2[#v2 + 1] = v3;
		end;
		return u2.createElement("Frame", {
			Size = UDim2.fromOffset(16, 16), 
			BorderSizePixel = 0, 
			BackgroundTransparency = 1
		}, v2);
	end)
};
