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
	local v4 = {};
	local v5 = 0;
	local v6, v7, v8 = ipairs((u1.values(l__StatusEffectType__2)));
	while true do
		local v9, v10 = v6(v7, v8);
		if not v9 then
			break;
		end;
		local v11 = p5:GetAttribute(p4:getAttributeName(v10));
		if v11 ~= nil then
			local v12 = {
				statusEffect = v10
			};
			if v11 ~= -1 then
				local v13 = v11;
			else
				v13 = nil;
			end;
			v12.expireTime = v13;
			local v14 = v12;
		else
			v14 = nil;
		end;
		if v14 ~= nil then
			v5 = v5 + 1;
			v4[v5] = v14;
		end;	
	end;
	return v4;
end;
function v2.isActive(p6, p7, p8)
	return p7:GetAttribute(p6:getAttributeName(p8)) ~= nil;
end;
function v2.hasAnyActive(p9, p10, p11)
	for v15, v16 in ipairs(p11) do
		if p9:isActive(p10, v16) then
			return true;
		end;
	end;
	return false;
end;
function v2.getStrengthLevel(p12, p13, p14)
	local v17 = 0;
	local v18 = false;
	while true do
		if v18 then
			v17 = v17 + 1;
		else
			v18 = true;
		end;
		if not (v17 < #p14) then
			break;
		end;
		if p12:isActive(p13, p14[v17 + 1]) then
			return v17 + 1;
		end;	
	end;
	return 0;
end;
local l__EntityUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
function v2.getEntityInstances(p15, p16)
	local v19 = {};
	local v20 = 0;
	for v21, v22 in ipairs((l__EntityUtil__3:getAliveEntityInstances())) do
		if p15:isActive(v22, p16) == true then
			v20 = v20 + 1;
			v19[v20] = v22;
		end;
	end;
	return v19;
end;
return {
	StatusEffectUtil = v2
};
