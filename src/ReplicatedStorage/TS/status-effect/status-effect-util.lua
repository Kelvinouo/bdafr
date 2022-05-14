-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = setmetatable({}, {
	__tostring = function()
		return "StatusEffectUtil";
	end
});
v2.__index = v2;
function v2.new(...)
	local v3 = setmetatable({}, v2);
	return v3:constructor(...) and v3;
end;
function v2.constructor(p1)

end;
function v2.getAttributeName(p2, p3)
	return "StatusEffect_" .. p3;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__StatusEffectType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
function v2.getActiveStatusEffects(p4, p5)
	local v4 = u1.values(l__StatusEffectType__2);
	local function v5(p6)
		local v6 = p5:GetAttribute(p4:getAttributeName(p6));
		if v6 == nil then
			return nil;
		end;
		local v7 = {
			statusEffect = p6
		};
		if v6 ~= -1 then
			local v8 = v6;
		else
			v8 = nil;
		end;
		v7.expireTime = v8;
		return v7;
	end;
	local v9 = {};
	local v10 = 0;
	for v11, v12 in ipairs(v4) do
		local v13 = v5(v12, v11 - 1, v4);
		if v13 ~= nil then
			v10 = v10 + 1;
			v9[v10] = v13;
		end;
	end;
	return v9;
end;
function v2.isActive(p7, p8, p9)
	return p8:GetAttribute(p7:getAttributeName(p9)) ~= nil;
end;
function v2.hasAnyActive(p10, p11, p12)
	for v14, v15 in ipairs(p12) do
		if p10:isActive(p11, v15) then
			return true;
		end;
	end;
	return false;
end;
function v2.getStrengthLevel(p13, p14, p15)
	local v16 = 0;
	local v17 = false;
	while true do
		if v17 then
			v16 = v16 + 1;
		else
			v17 = true;
		end;
		if not (v16 < #p15) then
			break;
		end;
		if p13:isActive(p14, p15[v16 + 1]) then
			return v16 + 1;
		end;	
	end;
	return 0;
end;
local l__EntityUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
function v2.getEntityInstances(p16, p17)
	local v18 = l__EntityUtil__3:getAliveEntityInstances();
	local function v19(p18)
		return p16:isActive(p18, p17);
	end;
	local v20 = {};
	local v21 = 0;
	for v22, v23 in ipairs(v18) do
		if v19(v23, v22 - 1, v18) == true then
			v21 = v21 + 1;
			v20[v21] = v23;
		end;
	end;
	return v20;
end;
return {
	StatusEffectUtil = v2
};
