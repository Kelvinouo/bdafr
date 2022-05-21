-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__ItemType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__HandKnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "ItemDropHandController";
	end, 
	__index = l__HandKnitController__4
});
v5.__index = v5;
local u1 = v5;
function u1.new(...)
	local v6 = setmetatable({}, u1);
	return v6:constructor(...) and v6;
end;
local u2 = l__HandKnitController__4;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "ItemDropHandController";
end;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
end;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "string-utils"));
function u1.isRelevantItem(p3, p4)
	if u3.includes(p4.itemType, "wool") then
		return true;
	end;
	return table.find(u1.ITEMS, p4.itemType) ~= nil;
end;
local l__DeviceUtil__4 = v2.DeviceUtil;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__MobileButton__6 = v2.MobileButton;
local l__BedwarsImageId__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__BedwarsUI__8 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local l__ItemDropController__9 = v1.import(script, script.Parent, "item-drop-controller").ItemDropController;
local l__Players__10 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
function u1.onEnable(p5, p6)
	if l__DeviceUtil__4.isMobileControls() then
		p5:setupYield(function()
			local u11 = u5.mount(u5.createElement("ScreenGui", {
				ResetOnSpawn = false
			}, { u5.createElement(l__MobileButton__6, {
					Image = l__BedwarsImageId__7.UP_MOBILE, 
					Position = l__BedwarsUI__8:getActionMobileButtonPosition(), 
					OnClick = function()
						l__ItemDropController__9:dropItemInHand();
					end
				}) }), l__Players__10.LocalPlayer:WaitForChild("PlayerGui"));
			return function()
				u5.unmount(u11);
			end;
		end);
	end;
end;
function u1.onDisable(p7)

end;
u1.ITEMS = { l__ItemType__3.IRON, l__ItemType__3.DIAMOND, l__ItemType__3.EMERALD, l__ItemType__3.ARROW, l__ItemType__3.TELEPEARL, l__ItemType__3.TNT, l__ItemType__3.STONE_BRICK, l__ItemType__3.BLASTPROOF_CERAMIC, l__ItemType__3.WOOD_PLANK_OAK, l__ItemType__3.OBSIDIAN, l__ItemType__3.SLIME_BLOCK };
u2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	ItemDropHandController = u2
};
return u1;
