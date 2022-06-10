-- Script Hash: 80944b7076ec45084c8dd2c215542bd11c5b97746e4b4c1936a57be132f4b4a4196d453ac7f120c92a18d4b64fee9c2e
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = {};
local v5 = setmetatable({}, {
	__index = v4
});
v5.PARTY = 0;
v4[0] = "PARTY";
v5.SPECTATOR = 1;
v4[1] = "SPECTATOR";
v5.HEALTHBAR = 2;
v4[2] = "HEALTHBAR";
v5.CUSTOM_MATCH_PREGAME = 3;
v4[3] = "CUSTOM_MATCH_PREGAME";
v5.POST_GAME = 4;
v4[4] = "POST_GAME";
local v6 = v3.Component:extend("HotbarApp");
function v6.init(p1, p2)

end;
local l__MatchState__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local l__DeviceUtil__2 = v2.DeviceUtil;
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__HotbarPartySection__4 = v1.import(script, script.Parent, "party", "hotbar-party-section").HotbarPartySection;
local l__HotbarSpectatorSection__5 = v1.import(script, script.Parent, "spectate", "hotbar-spectator-section").HotbarSpectatorSection;
local l__HotbarHealthbar__6 = v1.import(script, script.Parent, "healthbar", "hotbar-healthbar").HotbarHealthbar;
local l__HotbarCustomMatchSection__7 = v1.import(script, script.Parent, "custom-match", "hotbar-custom-match-section").HotbarCustomMatchSection;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__ArmorSlot__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").ArmorSlot;
local l__ItemViewport__10 = v1.import(script, script.Parent.Parent.Parent, "inventory", "ui", "item-viewport").ItemViewport;
local l__Empty__11 = v2.Empty;
local l__HotbarTile__12 = v1.import(script, script.Parent, "hotbar-tile").HotbarTile;
local l__Flamework__13 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__AppConfiguration__14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "apps").AppConfiguration;
local l__getItemMeta__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__ClientStore__16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__SoundManager__17 = v2.SoundManager;
local l__RandomUtil__18 = v2.RandomUtil;
local l__GameSound__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__HotbarOpenInventory__20 = v1.import(script, script.Parent, "hotbar-open-inventory").HotbarOpenInventory;
function v6.render(p3)
	local v7 = v5.HEALTHBAR;
	if p3.props.store.App.showHotbarPartyControls then
		v7 = v5.PARTY;
	elseif p3.props.store.Game.customMatch and p3.props.store.Game.matchState == l__MatchState__1.PRE then
		v7 = v5.CUSTOM_MATCH_PREGAME;
	elseif p3.props.store.Game.spectating then
		v7 = v5.SPECTATOR;
	end;
	if p3.props.store.Game.matchState == l__MatchState__1.POST then
		v7 = v5.POST_GAME;
	end;
	if not l__DeviceUtil__2.isHoarceKat() then
		local v8 = l__KnitClient__3.Controllers.InventoryController:getEquippedArmor(p3.props.store.Inventory.observedInventory.inventory.armor);
	else
		v8 = nil;
	end;
	local v9 = {};
	if l__DeviceUtil__2.isSmallScreen() then
		local v10 = 0.13;
	else
		v10 = 0.08;
	end;
	v9.Size = UDim2.fromScale(0.6, v10);
	v9.BackgroundTransparency = 1;
	v9.BorderSizePixel = 0;
	v9.AnchorPoint = Vector2.new(0.5, 1);
	if l__DeviceUtil__2.isSmallScreen() then
		local v11 = 0.95;
	else
		v11 = 0.99;
	end;
	v9.Position = UDim2.fromScale(0.5, v11);
	local v12 = { v3.createElement("UIAspectRatioConstraint", {
			AspectRatio = 9
		}) };
	local v13 = false;
	if v7 == v5.PARTY then
		v13 = v3.createElement(l__HotbarPartySection__4, {
			store = p3.props.store
		});
	end;
	if v13 then
		v12[#v12 + 1] = v13;
	end;
	local v14 = false;
	if v7 == v5.SPECTATOR then
		v14 = v3.createElement(l__HotbarSpectatorSection__5, {
			store = p3.props.store
		});
	end;
	if v14 then
		v12[#v12 + 1] = v14;
	end;
	local v15 = false;
	if v7 == v5.HEALTHBAR then
		v15 = v3.createElement(l__HotbarHealthbar__6);
	end;
	if v15 then
		v12[#v12 + 1] = v15;
	end;
	local v16 = false;
	if v7 == v5.CUSTOM_MATCH_PREGAME then
		v16 = v3.createElement(l__HotbarCustomMatchSection__7, {
			store = p3.props.store
		});
	end;
	if v16 then
		v12[#v12 + 1] = v16;
	end;
	local v17 = false;
	if v7 == v5.POST_GAME then
		v17 = v3.createElement(l__HotbarSpectatorSection__5, {
			store = p3.props.store, 
			HideSpectating = true
		});
	end;
	if v17 then
		v12[#v12 + 1] = v17;
	end;
	local v18 = #v12;
	local v19 = v8;
	if v19 then
		local v20 = u8.entries(l__ArmorSlot__9);
		local function v21(p4)
			local v22 = p4[1];
			local v23 = p4[2];
			local v24 = v8[v23];
			if not v24 then
				return v3.createElement(l__Empty__11, {
					Size = UDim2.fromScale(1, 1 / #u8.keys(l__ArmorSlot__9)), 
					SizeConstraint = "RelativeXY", 
					LayoutOrder = v23
				});
			end;
			return v3.createElement(l__ItemViewport__10, {
				ItemType = v24, 
				SizeConstraint = "RelativeXY", 
				Size = UDim2.fromScale(1, 1 / #u8.keys(l__ArmorSlot__9)), 
				LayoutOrder = v23
			}, { v3.createElement("UIAspectRatioConstraint", {
					AspectRatio = 1
				}) });
		end;
		local v25 = table.create(#v20);
		for v26, v27 in ipairs(v20) do
			v25[v26] = v21(v27, v26 - 1, v20);
		end;
		v19 = v25;
	end;
	local v28 = {
		Size = UDim2.fromScale(0.07, 1.5), 
		Position = UDim2.fromScale(-0.08, 1), 
		AnchorPoint = Vector2.new(1, 1)
	};
	local v29 = { v3.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			SortOrder = "LayoutOrder", 
			HorizontalAlignment = "Center", 
			VerticalAlignment = "Center"
		}) };
	local v30 = #v29;
	if v19 then
		for v31, v32 in ipairs(v19) do
			v29[v30 + v31] = v32;
		end;
	end;
	v12[v18 + 1] = v3.createElement(l__Empty__11, v28, v29);
	local l__hotbar__33 = p3.props.store.Inventory.observedInventory.hotbar;
	local function v34(p5, p6)
		local v35 = {
			HotbarSlot = p5, 
			SlotNumber = p6, 
			LayoutOrder = p6, 
			Selected = p6 == p3.props.store.Inventory.observedInventory.hotbarSlot, 
			store = p3.props.store
		};
		function v35.OnClick()
			local v36 = l__Flamework__13.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
			if v36:isAppOpen(l__AppConfiguration__14.INVENTORY) or v36:isAppOpen(l__AppConfiguration__14.CHEST_INVENTORY) then
				if p5.item then
					local v37 = l__getItemMeta__15(p5.item.itemType);
					if v37.armor and l__ClientStore__16:getState().Inventory.observedInventory.inventory.armor[v37.armor.slot + 1] == "empty" then
						l__ClientStore__16:dispatch({
							type = "InventorySetArmorItem", 
							item = p5.item, 
							armorSlot = v37.armor.slot
						});
						l__SoundManager__17:playSound(l__RandomUtil__18.fromList(l__GameSound__19.ARMOR_EQUIP));
						return nil;
					else
						l__ClientStore__16:dispatch({
							type = "InventoryRemoveFromHotbar", 
							slot = p6
						});
						if p5.item then
							return;
						end;
					end;
				else
					l__ClientStore__16:dispatch({
						type = "InventoryRemoveFromHotbar", 
						slot = p6
					});
					if p5.item then
						return;
					end;
				end;
			else
				l__ClientStore__16:dispatch({
					type = "InventorySelectHotbarSlot", 
					slot = p6
				});
			end;
		end;
		return v3.createElement(l__HotbarTile__12, v35);
	end;
	local v38 = table.create(#l__hotbar__33);
	for v39, v40 in ipairs(l__hotbar__33) do
		v38[v39] = v34(v40, v39 - 1, l__hotbar__33);
	end;
	local v41 = {
		Size = UDim2.fromScale(1, 1), 
		Position = UDim2.fromScale(0.5, 1), 
		AnchorPoint = Vector2.new(0.5, 1), 
		BorderSizePixel = 0, 
		BackgroundTransparency = 1
	};
	local v42 = { v3.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			SortOrder = "LayoutOrder", 
			HorizontalAlignment = "Center"
		}) };
	local v43 = #v42;
	for v44, v45 in ipairs(v38) do
		v42[v43 + v44] = v45;
	end;
	v42[#v42 + 1] = v3.createElement(l__HotbarOpenInventory__20, {
		LayoutOrder = 20, 
		store = p3.props.store
	});
	v12[v18 + 2] = v3.createElement("Frame", v41, v42);
	return v3.createElement("Frame", v9, v12);
end;
return {
	HotbarAppWrapper = function(p7)
		return v3.createElement("ScreenGui", {
			DisplayOrder = 10
		}, { v3.createElement(v6, {
				store = p7.store
			}) });
	end, 
	HotbarApp = v6
};
