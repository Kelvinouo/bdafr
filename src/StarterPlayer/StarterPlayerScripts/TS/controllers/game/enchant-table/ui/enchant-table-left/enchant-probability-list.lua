-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__EnchantResearchType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-type").EnchantResearchType;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__EnchantProbabilityCard__4 = v1.import(script, script.Parent, "enchant-probability-card").EnchantProbabilityCard;
local l__Empty__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).Empty;
return {
	EnchantProbabilityList = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u3)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local v3 = {};
		for v4, v5 in pairs(p1) do
			v3[v4] = v5;
		end;
		local v6 = u1.values(l__EnchantResearchType__2);
		local function v7(p3)
			return u3.createElement(l__EnchantProbabilityCard__4, {
				ResearchType = p3
			});
		end;
		local v8 = table.create(#v6);
		for v9, v10 in ipairs(v6) do
			v8[v9] = v7(v10, v9 - 1, v6);
		end;
		local v11 = { u3.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				HorizontalAlignment = Enum.HorizontalAlignment.Center, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0.05, 0)
			}) };
		local v12 = #v11;
		for v13, v14 in ipairs(v8) do
			v11[v12 + v13] = v14;
		end;
		return u3.createFragment({
			ProbabilityCards = u3.createElement(l__Empty__5, v3, v11)
		});
	end)
};
