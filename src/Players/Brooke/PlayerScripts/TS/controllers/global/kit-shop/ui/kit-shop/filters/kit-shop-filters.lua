-- Script Hash: 7927ad19e391ca52aba98e3a6e7e3d29eff065cfedd39dbbab1351b479d56311c344d85d6d406cad59d3ac1397da6fe1
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Empty__2 = v2.Empty;
local l__Toggle__3 = v2.Toggle;
local l__Theme__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
return {
	KitShopFilters = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		return u1.createElement(l__Empty__2, {
			Size = p1.Size, 
			LayoutOrder = p1.LayoutOrder
		}, { u1.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				HorizontalAlignment = "Left", 
				Padding = UDim.new(0.03, 0)
			}), u1.createElement(l__Toggle__3, {
				Text = "<b>Kit Owned</b>", 
				Value = p1.KitOwnedToggle, 
				SetValue = p1.SetKitOwnedToggle, 
				AspectRatio = 4.866666666666666, 
				Size = UDim2.fromScale(0.25, 1), 
				BoxColor = l__Theme__4.backgroundSecondary
			}), u1.createElement(l__Toggle__3, {
				Text = "<b>Battlepass</b>", 
				Value = p1.BattlePassKitsToggle, 
				SetValue = p1.SetBattlePassKitsToggle, 
				AspectRatio = 4.866666666666666, 
				Size = UDim2.fromScale(0.25, 1), 
				BoxColor = l__Theme__4.backgroundSecondary
			}) });
	end)
};
