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
function v2.getAllActive(p4, p5)
	local v4 = {};
	local v5 = 0;
	local v6, v7, v8 = ipairs((u1.values(l__StatusEffectType__2)));
	while true do
		v6(v7, v8);
		if not v6 then
			break;
		end;
		v8 = v6;
		local v9 = p4:getActive(p5, v7);
		if v9 ~= nil then
			v5 = v5 + 1;
			v4[v5] = v9;
		end;	
	end;
	return v4;
end;
function v2.getActive(p6, p7, p8)
	local v10 = p6:getAttributeName(p8);
	local v11 = p7:GetAttribute(v10);
	if v11 == nil then
		return nil;
	end;
	local v12 = {
		statusEffect = p8
	};
	if v11 ~= -1 then
		local v13 = v11;
	else
		v13 = nil;
	end;
	v12.expireTime = v13;
	v12.stacks = p7:GetAttribute(v10 .. "_stacks");
	return v12;
end;
function v2.isActive(p9, p10, p11)
	return p10:GetAttribute(p9:getAttributeName(p11)) ~= nil;
end;
function v2.hasAnyActive(p12, p13, p14)
	local v14, v15, v16 = ipairs(p14);
	while true do
		v14(v15, v16);
		if not v14 then
			break;
		end;
		v16 = v14;
		if p12:isActive(p13, v15) then
			return true;
		end;	
	end;
	return false;
end;
function v2.getStacks(p15, p16, p17)
	local v17 = p15:getActive(p16, p17);
	if v17 ~= nil then
		v17 = v17.stacks;
	end;
	local v18 = v17;
	if v18 == nil then
		v18 = 0;
	end;
	return v18;
end;
function v2.getStrengthLevel(p18, p19, p20)
	local v19 = 0;
	local v20 = false;
	while true do
		if v20 then
			v19 = v19 + 1;
		else
			v20 = true;
		end;
		if not (v19 < #p20) then
			break;
		end;
		if p18:isActive(p19, p20[v19 + 1]) then
			return v19 + 1;
		end;	
	end;
	return 0;
end;
local l__EntityUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
function v2.getEntityInstances(p21, p22)
	local v21 = {};
	local v22 = 0;
	local v23, v24, v25 = ipairs((l__EntityUtil__3:getAliveEntityInstances()));
	while true do
		v23(v24, v25);
		if not v23 then
			break;
		end;
		v25 = v23;
		if p21:isActive(v24, p22) == true then
			v22 = v22 + 1;
			v21[v22] = v24;
		end;	
	end;
	return v21;
end;
return {
	StatusEffectUtil = v2
};
