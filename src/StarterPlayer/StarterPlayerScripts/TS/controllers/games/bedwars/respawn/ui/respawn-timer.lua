
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.Component:extend("RespawnTimer");
function v4.init(p1, p2)
	p1.alive = true;
	local l__RespawnDuration__5 = p1.props.RespawnDuration;
	p1:setState({
		countdownText = p1:getCountdown(l__RespawnDuration__5)
	});
	local u1 = l__RespawnDuration__5;
	v1.Promise.defer(function()
		while { wait(0.1) } and p1.alive do
			u1 = u1 - 0.1;
			p1:setState({
				countdownText = p1:getCountdown(u1)
			});		
		end;
	end);
end;
function v4.getCountdown(p3, p4)
	return string.format("%.1f", (math.max(0, p4)));
end;
local l__DamageType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType;
local l__Empty__3 = v2.Empty;
local l__ColorUtil__4 = v2.ColorUtil;
function v4.render(p5)
	if p5.props.KilledByPlayer then
		local v6 = p5.props.KilledByPlayer.DisplayName;
		if p5.props.DamageType == l__DamageType__2.FLAMETHROWER then
			v6 = v6 .. "'s Flamethrower";
		end;
	elseif p5.props.DamageType == l__DamageType__2.TNT then
		v6 = "TNT";
	elseif p5.props.DamageType == l__DamageType__2.INVISIBLE_LANDMINE then
		v6 = "Invisible Landmine";
	elseif p5.props.DamageType == l__DamageType__2.MAGMA_BLOCK then
		v6 = "Magma Block";
	else
		v6 = "Void";
	end;
	return v3.createElement(l__Empty__3, {
		Size = UDim2.fromScale(0.5, 0.3), 
		Position = UDim2.fromScale(0.5, 0.2), 
		AnchorPoint = Vector2.new(0.5, 0)
	}, { v3.createElement("UIAspectRatioConstraint", {
			AspectRatio = 5.478947368421053, 
			DominantAxis = "Height"
		}), v3.createElement("TextLabel", {
			Text = "Killed by " .. v6, 
			Size = UDim2.fromScale(1, 0.5), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			RichText = true, 
			TextScaled = true, 
			Font = "LuckiestGuy", 
			TextColor3 = l__ColorUtil__4.hexColor(16733525), 
			AutoLocalize = p5.props.KilledByPlayer == nil
		}), v3.createElement("TextLabel", {
			Text = "<b>Respawning in <font color=\"#55FFFF\">" .. p5.state.countdownText .. "</font>s</b>", 
			Size = UDim2.fromScale(1, 0.3), 
			Position = UDim2.fromScale(0, 0.7), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			RichText = true, 
			TextScaled = true, 
			Font = "RobotoMono", 
			TextColor3 = l__ColorUtil__4.hexColor(5635925)
		}) });
end;
function v4.willUnmount(p6)
	p6.alive = false;
end;
return {
	RespawnTimerWrapper = function(p7)
		local v7 = {};
		local v8 = {};
		for v9, v10 in pairs(p7) do
			v8[v9] = v10;
		end;
		v7[#v7 + 1] = v3.createElement(v4, v8);
		return v3.createElement("ScreenGui", {}, v7);
	end, 
	RespawnTimer = v4
};

