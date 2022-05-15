
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.PureComponent:extend("ConfirmationModalBase");
function v4.init(p1)

end;
local l__DarkBackground__1 = v2.DarkBackground;
local l__ConfirmationModal__2 = v1.import(script, script.Parent, "confirmation-modal").ConfirmationModal;
local l__SlideIn__3 = v2.SlideIn;
function v4.render(p2)
	local v5 = { v3.createElement(l__DarkBackground__1, {
			AppId = p2.props.AppId, 
			BackgroundTransparency = 0.2
		}) };
	local v6 = {};
	local v7 = {};
	for v8, v9 in pairs(p2.props) do
		v7[v8] = v9;
	end;
	v6[#v6 + 1] = v3.createElement(l__ConfirmationModal__2, v7);
	v5[#v5 + 1] = v3.createElement(l__SlideIn__3, {}, v6);
	return v3.createElement("ScreenGui", {
		DisplayOrder = 1000, 
		ResetOnSpawn = false
	}, v5);
end;
return {
	ConfirmationModalApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p3, p4)
		local v10 = {
			store = p3
		};
		for v11, v12 in pairs(p4) do
			v10[v11] = v12;
		end;
		return v10;
	end)(v4)
};

