-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "PiggyBankUtil";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1)

end;
local l__ItemType__1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v1.getRewardsFromCoins(p2, p3)
	local v3 = {};
	local v4 = math.floor(p3 / 4);
	local v5 = 0;
	local v6 = 0;
	local v7 = p2:getStageFromCoins(p3);
	if v7 >= 1 then
		v4 = v4 + math.floor(p3 / 4);
		v5 = v5 + 1;
	end;
	if v7 >= 2 then
		v5 = v5 + math.floor(p3 / 50);
		v6 = v6 + math.floor(p3 / 55);
	end;
	if v7 >= 3 then
		v6 = v6 + math.floor(p3 / 70);
	end;
	table.insert(v3, {
		itemType = l__ItemType__1.IRON, 
		amount = v4
	});
	if v6 > 0 then
		table.insert(v3, {
			itemType = l__ItemType__1.EMERALD, 
			amount = v6
		});
	end;
	if v5 > 0 then
		table.insert(v3, {
			itemType = l__ItemType__1.DIAMOND, 
			amount = v5
		});
	end;
	local v8, v9, v10 = ipairs(v3);
	while true do
		v8(v9, v10);
		if not v8 then
			break;
		end;
		v10 = v8;
		v9.amount = math.ceil(v9.amount * 1.15);
		local l__amount__11 = v9.amount;	
	end;
	return v3;
end;
function v1.getStageFromCoins(p4, p5)
	if p5 < 50 then
		return 0;
	end;
	if p5 < 200 then
		return 1;
	end;
	if p5 < 400 then
		return 2;
	end;
	return 3;
end;
return {
	PiggyBankUtil = v1
};
