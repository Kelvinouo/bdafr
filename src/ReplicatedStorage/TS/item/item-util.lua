
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ItemType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local v3 = {};
local u1 = nil;
local l__ReplicatedStorage__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).ReplicatedStorage;
function v3.createItemInstance(p1, p2, p3)
	if p2 == nil then
		p2 = 1;
	end;
	if p3 == nil then
		p3 = "";
	end;
	u1();
	local v4 = l__ReplicatedStorage__2:WaitForChild("Items"):WaitForChild(p1);
	if p3 ~= "" then
		local v5 = l__ReplicatedStorage__2:WaitForChild("Items"):FindFirstChild(p1 .. "_" .. p3);
		if v5 then
			v4 = v5;
		end;
	end;
	local v6 = v4:Clone();
	v6.Name = p1;
	v6:SetAttribute("Amount", p2);
	v6:SetAttribute("ItemSkin", p3);
	return v6;
end;
u1 = function()
	l__ReplicatedStorage__2:WaitForChild("ItemsReady");
end;
v3.waitForItemsReady = u1;
local l__getItemMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function v3.getDisplayName(p4)
	local v7 = l__getItemMeta__3(p4).displayName;
	if v7 == nil then
		v7 = tostring(p4);
	end;
	return v7;
end;
local l__RandomUtil__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).RandomUtil;
local u5 = { l__ItemType__2.WOOL_BLUE, l__ItemType__2.WOOL_CYAN, l__ItemType__2.WOOL_GREEN, l__ItemType__2.WOOL_ORANGE, l__ItemType__2.WOOL_PINK, l__ItemType__2.WOOL_PURPLE, l__ItemType__2.WOOL_RED, l__ItemType__2.WOOL_WHITE, l__ItemType__2.WOOL_YELLOW };
function v3.getRandomWoolColor()
	return l__RandomUtil__4.fromList(unpack(u5));
end;
return {
	ItemUtil = v3
};

