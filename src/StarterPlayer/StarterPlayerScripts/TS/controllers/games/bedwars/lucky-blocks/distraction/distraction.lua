-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.Component:extend("Distraction");
function v4.init(p1, p2)
	local v5, v6 = v3.createBinding(0.9);
	p1.transparency = v5;
	p1.setTransparency = v6;
end;
local l__UIUtil__1 = v2.UIUtil;
local l__Theme__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__PlayerViewport__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "kit-shop", "ui", "misc", "player-viewport").PlayerViewport;
local l__Empty__4 = v2.Empty;
local l__EngineerFilmEffect__5 = v1.import(script, script.Parent.Parent.Parent, "kit", "kits", "watcher", "ui", "engineer-film-effect").EngineerFilmEffect;
function v4.render(p3)
	if math.random(1, 100) <= 2 then
		local v7 = "http://www.roblox.com/asset/?id=5917459365";
	else
		v7 = "http://www.roblox.com/asset/?id=4841405708";
	end;
	local v8 = {};
	local v9 = #v8;
	local v10 = {
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.new(0.5, 0, 0.5, 0), 
		Size = UDim2.new(1, 0, 1, 0)
	};
	local v11 = {};
	local v12 = #v11;
	v11[v12 + 1] = v3.createElement("TextLabel", {
		BackgroundTransparency = 1, 
		ZIndex = 3, 
		AnchorPoint = Vector2.new(0.5, 1), 
		Position = l__UIUtil__1:getActionBarPosition() - UDim2.new(0, 0, 0.1, 0), 
		Size = UDim2.new(0.8, 0, 0.1, 0), 
		Text = "Hacked by Vulcan!!!!", 
		Font = "Ubuntu", 
		TextColor3 = Color3.fromRGB(255, 255, 255), 
		TextScaled = true
	}, { v3.createElement("UIStroke", {
			Thickness = 5, 
			Color = l__Theme__2.backgroundSecondary
		}) });
	v11[v12 + 2] = v3.createElement(l__PlayerViewport__3, {
		Animation = v7, 
		Size = UDim2.new(1, 0, 1, 0)
	});
	v8[v9 + 1] = v3.createElement(l__Empty__4, v10, v11);
	v8[v9 + 2] = v3.createElement(l__EngineerFilmEffect__5, {
		transparency = p3.transparency
	});
	return v3.createFragment(v8);
end;
return {
	DistractionWrapper = function()
		return v3.createElement("ScreenGui", {}, { v3.createElement(v4) });
	end, 
	Distraction = v4
};
