-- Script Hash: 0b38e7d004a0b23183b6c2c7a3a5d6127948d356c1b114e9db3c8c1b3a732ef35cf91bf15bdb2d36cd94caac404ffd8d
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v2.Component:extend("ShieldMobileUI");
function v3.init(p1, p2)
	p1:setState({
		raised = false
	});
end;
local l__MobileButton__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).MobileButton;
local l__BedwarsImageId__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__BedwarsUI__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
function v3.render(p3)
	local v4 = {};
	if p3.state.raised then
		local v5 = l__BedwarsImageId__2.SHIELD_ON_MOBILE;
	else
		v5 = l__BedwarsImageId__2.SHIELD_OFF_MOBILE;
	end;
	v4.Image = v5;
	v4.Position = l__BedwarsUI__3:getActionMobileButtonPosition();
	function v4.OnClick()
		print("press!");
		local v6 = not p3.state.raised;
		p3:setState({
			raised = v6
		});
		p3.props.OnChange(v6);
	end;
	return v2.createElement(l__MobileButton__1, v4);
end;
return {
	ShieldMobileUI = v3
};
