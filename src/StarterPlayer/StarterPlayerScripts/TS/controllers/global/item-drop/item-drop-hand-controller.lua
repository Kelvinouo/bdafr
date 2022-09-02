-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__HandKnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local l__ItemType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local v5 = setmetatable({}, {
	__tostring = function()
		return "ItemDropHandController";
	end, 
	__index = l__HandKnitController__3
});
v5.__index = v5;
local u1 = v5;
function u1.new(...)
	local v6 = setmetatable({}, u1);
	return v6:constructor(...) and v6;
end;
function u1.constructor(p1)
	l__HandKnitController__3.constructor(p1);
	p1.Name = "ItemDropHandController";
end;
function u1.KnitStart(p2)
	l__HandKnitController__3.KnitStart(p2);
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "string-utils"));
function u1.isRelevantItem(p3, p4)
	if u2.includes(p4.itemType, "wool") then
		return true;
	end;
	return table.find(u1.ITEMS, p4.itemType) ~= nil;
end;
local l__DeviceUtil__3 = v2.DeviceUtil;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__MobileButton__5 = v2.MobileButton;
local l__BedwarsImageId__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__BedwarsUI__7 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local l__ItemDropController__8 = v1.import(script, script.Parent, "item-drop-controller").ItemDropController;
local l__Players__9 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
function u1.onEnable(p5, p6)
	if l__DeviceUtil__3.isMobileControls() then
		p5:setupYield(function()
			local u10 = u4.mount(u4.createElement("ScreenGui", {
				ResetOnSpawn = false
			}, { u4.createElement(l__MobileButton__5, {
					Image = l__BedwarsImageId__6.UP_MOBILE, 
					Position = l__BedwarsUI__7:getActionMobileButtonPosition(), 
					OnClick = function()
						l__ItemDropController__8:dropItemInHand();
					end
				}) }), l__Players__9.LocalPlayer:WaitForChild("PlayerGui"));
			return function()
				u4.unmount(u10);
			end;
		end);
	end;
end;
function u1.onDisable(p7)

end;
u1.ITEMS = { l__ItemType__4.IRON, l__ItemType__4.DIAMOND, l__ItemType__4.EMERALD, l__ItemType__4.ARROW, l__ItemType__4.TELEPEARL, l__ItemType__4.TNT, l__ItemType__4.STONE_BRICK, l__ItemType__4.BLASTPROOF_CERAMIC, l__ItemType__4.WOOD_PLANK_OAK, l__ItemType__4.OBSIDIAN, l__ItemType__4.SLIME_BLOCK };
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return {
	ItemDropHandController = u1
};
