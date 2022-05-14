-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v2.Component:extend("PregameCountdown");
function v3.init(p1)

end;
local l__BasicCountdownCard__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).BasicCountdownCard;
local l__Theme__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
function v3.render(p2)
	return v2.createElement(l__BasicCountdownCard__1, {
		EndOSTime = p2.props.store.Game.startTime, 
		Text = "Match starting in {0}", 
		Size = l__Theme__2.centerTopAnnouncementCardSize, 
		Position = UDim2.new(0.5, 0, 0, 1), 
		AnchorPoint = Vector2.new(0.5, 0)
	});
end;
return {
	PregameCountdownWrapper = function(p3)
		return v2.createElement("ScreenGui", {
			ResetOnSpawn = false
		}, { v2.createElement(v3, {
				store = p3.store
			}) });
	end, 
	PregameCountdown = v3
};
