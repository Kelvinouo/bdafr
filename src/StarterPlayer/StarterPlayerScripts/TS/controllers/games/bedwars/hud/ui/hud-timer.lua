
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ClientStore__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__MatchState__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__HudCard__4 = v1.import(script, script.Parent, "hud-card").HudCard;
local l__BedwarsImageId__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__ColorUtil__6 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
return {
	HudTimer = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u3)(function(p1, p2)
		local v2, v3 = p2.useState("00:00");
		local u7 = nil;
		p2.useEffect(function()
			local u8 = true;
			l__ClientStore__1.changed:connect(function(p3, p4)
				if p3.Game.matchState ~= p4.Game.matchState and p3.Game.matchState == l__MatchState__2.RUNNING and u8 then
					u7();
				end;
			end);
			if l__ClientStore__1:getState().Game.matchState == l__MatchState__2.RUNNING and u8 then
				u7();
			end;
			return function()
				u8 = false;
				return u8;
			end;
		end, {});
		u7 = function()
			local u9 = 0;
			v1.Promise.defer(function()
				local u10 = true;
				l__ClientStore__1.changed:connect(function(p5, p6)
					if p5.Game.matchState ~= p6.Game.matchState and p5.Game.matchState == l__MatchState__2.POST then
						u10 = false;
					end;
				end);
				while { wait(1) } and u10 do
					u9 = u9 + 1;
					local v4 = math.floor(u9 / 60);
					v3(string.format("%02i", v4) .. ":" .. string.format("%02i", u9 - v4 * 60));				
				end;
			end);
		end;
		return u3.createElement(l__HudCard__4, {
			LayoutOrder = p1.LayoutOrder
		}, { u3.createElement("ImageLabel", {
				Image = l__BedwarsImageId__5.HUD_TIMER_ICON, 
				Size = UDim2.new(0, 16, 0, 16), 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0
			}), u3.createElement("TextLabel", {
				Text = "<b>" .. v2 .. "</b>", 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				AutomaticSize = Enum.AutomaticSize.X, 
				Font = Enum.Font.Roboto, 
				TextSize = 16, 
				RichText = true, 
				TextXAlignment = Enum.TextXAlignment.Left, 
				TextColor3 = l__ColorUtil__6.WHITE
			}) });
	end)
};

