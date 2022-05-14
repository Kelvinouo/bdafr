-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__BedwarsImageId__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__ColorUtil__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local l__HudCard__4 = v1.import(script, script.Parent, "hud-card").HudCard;
return {
	HudKills = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local v2 = { u1.createElement("ImageLabel", {
				Image = l__BedwarsImageId__2.HUD_KILLS_ICON, 
				Size = UDim2.new(0, 16, 0, 16), 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0
			}) };
		local v3 = {};
		local v4 = p1.store.Bedwars.kills[p1.LocalPlayerId];
		if v4 == nil then
			v4 = 0;
		end;
		v3.Text = "<b>" .. tostring(v4) .. "</b>";
		v3.BackgroundTransparency = 1;
		v3.BorderSizePixel = 0;
		v3.AutomaticSize = Enum.AutomaticSize.X;
		v3.Font = Enum.Font.Roboto;
		v3.TextSize = 16;
		v3.RichText = true;
		v3.TextXAlignment = Enum.TextXAlignment.Left;
		v3.TextColor3 = l__ColorUtil__3.WHITE;
		v2[#v2 + 1] = u1.createElement("TextLabel", v3);
		return u1.createElement(l__HudCard__4, {
			LayoutOrder = p1.LayoutOrder
		}, v2);
	end)
};
