-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__HudCard__2 = v1.import(script, script.Parent, "hud-card").HudCard;
local l__BedwarsImageId__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__ColorUtil__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
return {
	HudScore = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local v2 = nil;
		for v3, v4 in ipairs(p1.store.Game.teams) do
			if v4.id == p1.teamId == true then
				v2 = v4;
				break;
			end;
		end;
		local v5 = v2;
		if v5 ~= nil then
			v5 = v5.name;
		end;
		local v6 = v5;
		if v6 == nil then
			v6 = p1.teamId;
		end;
		return u1.createElement(l__HudCard__2, {
			LayoutOrder = p1.LayoutOrder
		}, { u1.createElement("ImageLabel", {
				Image = l__BedwarsImageId__3.HUD_KILLS_ICON, 
				Size = UDim2.new(0, 16, 0, 16), 
				ScaleType = "Fit", 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0
			}), u1.createElement("Frame", {
				Size = UDim2.new(0, 0, 1, 0), 
				AutomaticSize = Enum.AutomaticSize.X, 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0
			}, { u1.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal, 
					VerticalAlignment = Enum.VerticalAlignment.Center, 
					HorizontalAlignment = Enum.HorizontalAlignment.Center, 
					SortOrder = Enum.SortOrder.LayoutOrder, 
					Padding = UDim.new(0, 8)
				}), u1.createElement("TextLabel", {
					Text = "<b>" .. v6 .. ": " .. tostring(p1.score) .. "</b>", 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					AutomaticSize = Enum.AutomaticSize.X, 
					Font = Enum.Font.Roboto, 
					TextSize = 16, 
					RichText = true, 
					TextXAlignment = Enum.TextXAlignment.Left, 
					TextColor3 = l__ColorUtil__4.WHITE
				}) }) });
	end)
};
