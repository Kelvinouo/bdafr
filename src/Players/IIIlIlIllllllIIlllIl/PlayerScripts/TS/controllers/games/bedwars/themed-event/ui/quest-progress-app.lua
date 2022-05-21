-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Empty__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).Empty;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
	local l__useState__2 = p2.useState;
	local v3 = {
		Size = UDim2.fromScale(0.6, 0.35), 
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.4)
	};
	local v4 = { u1.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			Padding = UDim.new(0.02, 0)
		}) };
	local v5 = #v4;
	local v6 = p1[u1.Children];
	if v6 then
		local v7, v8, v9 = pairs(v6);
		while true do
			local v10 = nil;
			local v11 = nil;
			v11, v10 = v7(v8, v9);
			if not v11 then
				break;
			end;
			v9 = v11;
			if type(v11) == "number" then
				v4[v5 + v11] = v10;
			else
				v4[v11] = v10;
			end;		
		end;
	end;
	return u1.createFragment({
		QuestProgressContainer = u1.createElement(l__Empty__2, v3, v4)
	});
end);
return {
	QuestProgressWrapper = function(p3)
		return u1.createFragment({
			QuestProgressGui = u1.createElement("ScreenGui", {
				ResetOnSpawn = false, 
				DisplayOrder = 20
			}, { u1.createElement(u3) })
		});
	end, 
	QuestProgressApp = u3
};
