-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v3 = setmetatable({}, {
	__tostring = function()
		return "EntityUtil";
	end
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
function v3.constructor(p1)

end;
local l__Workspace__1 = v2.Workspace;
local l__Players__2 = v2.Players;
local l__PlayerEntity__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local l__CollectionService__4 = v2.CollectionService;
local l__Entity__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity").Entity;
function v3.getEntity(p2, p3)
	if p3.Parent == l__Workspace__1 and p3:IsA("Model") then
		local v5 = l__Players__2:GetPlayers();
		local function v6(p4)
			return p4.Name == p3.Name;
		end;
		local v7 = nil;
		for v8, v9 in ipairs(v5) do
			if v6(v9, v8 - 1, v5) == true then
				v7 = v9;
				break;
			end;
		end;
		if v7 then
			return l__PlayerEntity__3.new(v7, p3);
		end;
	end;
	if p3:IsA("Player") and p3.Character then
		if p3.Character then
			return l__PlayerEntity__3.new(p3, p3.Character);
		else
			return nil;
		end;
	end;
	if l__CollectionService__4:HasTag(p3, "entity") then
		return l__Entity__5.new(p3);
	end;
	if not p3.Parent then
		return nil;
	end;
	return p2:getEntity(p3.Parent);
end;
function v3.getLocalPlayerEntity(p5)
	local v10 = l__Players__2.LocalPlayer;
	if v10 ~= nil then
		v10 = v10.Character;
	end;
	if not v10 then
		return nil;
	end;
	return l__PlayerEntity__3.new(l__Players__2.LocalPlayer, l__Players__2.LocalPlayer.Character);
end;
function v3.getAllEntityInstances(p6)
	return l__CollectionService__4:GetTagged("entity");
end;
function v3.getAliveEntityInstances(p7)
	local v11 = p7:getAllEntityInstances();
	local function v12(p8)
		local v13 = v3:getEntity(p8);
		if v13 ~= nil then
			v13 = v13:isAlive();
		end;
		return v13;
	end;
	local v14 = {};
	local v15 = 0;
	for v16, v17 in ipairs(v11) do
		if v12(v17, v16 - 1, v11) == true then
			v15 = v15 + 1;
			v14[v15] = v17;
		end;
	end;
	return v14;
end;
function v3.getEntityFromDescendant(p9, p10)
	if not p10 then
		return nil;
	end;
	if table.find(l__CollectionService__4:GetTags(p10), "entity") ~= nil then
		return p9:getEntity(p10);
	end;
	return p9:getEntityFromDescendant(p10.Parent);
end;
function v3.getEntitiesNearPosition(p11, p12, p13)
	local v18 = p11:getAliveEntityInstances();
	local function v19(p14)
		if not p14.PrimaryPart then
			return false;
		end;
		return (p14.PrimaryPart.Position - p12).Magnitude <= p13;
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
	EntityUtil = v3
};
