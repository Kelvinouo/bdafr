-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.Component:extend("CauldronApp");
function v4.init(p1)

end;
local l__DarkBackground__1 = v2.DarkBackground;
local l__getItemMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__ItemType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__SoundManager__5 = v2.SoundManager;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__BedwarsTeamUpgradeCard__7 = v1.import(script, script.Parent.Parent.Parent.Parent, "generator-upgrade", "ui", "bedwars-team-upgrade-card").BedwarsTeamUpgradeCard;
local l__BrewablePotions__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "cauldron-types").BrewablePotions;
local l__Empty__9 = v2.Empty;
local l__SlideIn__10 = v2.SlideIn;
function v4.render(p2)
	local v5 = { v3.createElement(l__DarkBackground__1, {
			AppId = p2.props.AppId
		}) };
	local v6 = {};
	local function v7(p3, p4)
		local v8 = {};
		local v9 = {
			image = "", 
			menuPosition = "main", 
			id = ""
		};
		local v10 = l__getItemMeta__2(p3).displayName;
		if v10 == nil then
			v10 = "brokey";
		end;
		v9.name = v10;
		v9.tiers = { {
				name = "", 
				price = 3, 
				values = {}, 
				currency = l__ItemType__3.DIAMOND
			} };
		v8.Upgrade = v9;
		function v8.Purchased()
			l__default__4.Client:WaitFor("RemoteName"):andThen(function(p5)
				p5:CallServerAsync({
					cauldron = p2.props.cauldron, 
					potion = p3
				}):andThen(function(p6)
					if p6 == true then
						l__SoundManager__5:playSound(l__GameSound__6.BEDWARS_UPGRADE_SUCCESS);
						return;
					end;
					l__SoundManager__5:playSound(l__GameSound__6.ERROR_NOTIFICATION);
				end);
			end);
		end;
		v8.LayoutOrder = p4;
		v8.ButtonTextOverride = "<b>Buy Potion</b>";
		v8.store = p2.props.store;
		v8.AutoSelect = p4 == 0;
		return v3.createElement(l__BedwarsTeamUpgradeCard__7, v8);
	end;
	local v11 = table.create(#l__BrewablePotions__8);
	for v12, v13 in ipairs(l__BrewablePotions__8) do
		v11[v12] = v7(v13, v12 - 1, l__BrewablePotions__8);
	end;
	local v14 = {
		Size = UDim2.fromScale(0.98, 0.45), 
		Position = UDim2.fromScale(0.5, 0.1), 
		AnchorPoint = Vector2.new(0.5, 0)
	};
	local v15 = { v3.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			HorizontalAlignment = "Center", 
			VerticalAlignment = "Top", 
			Padding = UDim.new(0.008, 0)
		}) };
	local v16 = #v15;
	for v17, v18 in ipairs(v11) do
		v15[v16 + v17] = v18;
	end;
	v6[#v6 + 1] = v3.createElement(l__Empty__9, v14, v15);
	v5[#v5 + 1] = v3.createElement(l__SlideIn__10, {}, v6);
	return v3.createFragment(v5);
end;
return {
	CauldronWrapper = function(p7)
		return v3.createElement("ScreenGui", {}, { v3.createElement(v4, {
				AppId = "CauldronApp", 
				store = p7.store, 
				cauldron = p7.cauldron
			}) });
	end, 
	CauldronApp = v4
};
