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
		local v5 = nil;
		local v6, v7, v8 = ipairs((l__Players__2:GetPlayers()));
		while true do
			v6(v7, v8);
			if not v6 then
				break;
			end;
			v8 = v6;
			if v7.Name == p3.Name == true then
				v5 = v7;
				break;
			end;		
		end;
		if v5 then
			return l__PlayerEntity__3.new(v5, p3);
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
function v3.getLocalPlayerEntity(p4)
	local v9 = l__Players__2.LocalPlayer;
	if v9 ~= nil then
		v9 = v9.Character;
	end;
	if not v9 then
		return nil;
	end;
	return l__PlayerEntity__3.new(l__Players__2.LocalPlayer, l__Players__2.LocalPlayer.Character);
end;
function v3.getAllEntityInstances(p5)
	return l__CollectionService__4:GetTagged("entity");
end;
function v3.getAliveEntityInstances(p6)
	local v10 = {};
	local v11 = 0;
	local v12, v13, v14 = ipairs((p6:getAllEntityInstances()));
	while true do
		v12(v13, v14);
		if not v12 then
			break;
		end;
		local v15 = v3:getEntity(v13);
		if v15 ~= nil then
			v15 = v15:isAlive();
		end;
		if v15 == true then
			v11 = v11 + 1;
			v10[v11] = v13;
		end;	
	end;
	return v10;
end;
function v3.getEntityFromDescendant(p7, p8)
	if not p8 then
		return nil;
	end;
	if table.find(l__CollectionService__4:GetTags(p8), "entity") ~= nil then
		return p7:getEntity(p8);
	end;
	return p7:getEntityFromDescendant(p8.Parent);
end;
function v3.getEntitiesNearPosition(p9, p10, p11)
	local v16 = {};
	local v17 = 0;
	local v18, v19, v20 = ipairs((p9:getAliveEntityInstances()));
	while true do
		v18(v19, v20);
		if not v18 then
			break;
		end;
		if not v19.PrimaryPart then
			local v21 = false;
		else
			v21 = (v19.PrimaryPart.Position - p10).Magnitude <= p11;
		end;
		if v21 == true then
			v17 = v17 + 1;
			v16[v17] = v19;
		end;	
	end;
	return v16;
end;
return {
	EntityUtil = v3
};
