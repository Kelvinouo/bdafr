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
		local v7 = table.create(#v6);
		for v8, v9 in ipairs(v6) do
			v7[v8] = u3.createElement(l__EnchantProbabilityCard__4, {
				ResearchType = v9
			});
		end;
		local v10 = { u3.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				HorizontalAlignment = Enum.HorizontalAlignment.Center, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0.05, 0)
			}) };
		local v11 = #v10;
		for v12, v13 in ipairs(v7) do
			v10[v11 + v12] = v13;
		end;
		return u3.createFragment({
			ProbabilityCards = u3.createElement(l__Empty__5, v3, v10)
		});
	end)
};
