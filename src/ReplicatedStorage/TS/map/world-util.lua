-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v3 = setmetatable({}, {
	__tostring = function()
		return "WorldUtil";
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
function v3.getWorldFromPosition(p2, p3)
	local v5, v6, v7 = ipairs(l__Workspace__1:WaitForChild("Map"):WaitForChild("Worlds"):GetChildren());
	while true do
		v5(v6, v7);
		if not v5 then
			break;
		end;
		local l__Origin__8 = v6:FindFirstChild("Origin");
		local v9 = l__Origin__8;
		if v9 ~= nil then
			v9 = v9:IsA("Vector3Value");
		end;
		if v9 then
			local v10 = l__Origin__8.Value - p3;
			if math.abs(v10.X) < v3.WORLD_SEPERATION_STUDS / 2 and math.abs(v10.Z) < v3.WORLD_SEPERATION_STUDS / 2 then
				return v6;
			end;
		end;	
	end;
end;
local l__Players__2 = v2.Players;
function v3.getPlayersInWorld(p4, p5)
	local v11 = {};
	local v12 = 0;
	local v13, v14, v15 = ipairs((l__Players__2:GetPlayers()));
	while true do
		v13(v14, v15);
		if not v13 then
			break;
		end;
		local v16 = v14.Character;
		if v16 ~= nil then
			v16 = v16.PrimaryPart;
		end;
		if not v16 then
			local v17 = false;
		else
			local v18 = p4:getWorldFromPosition(v14.Character.PrimaryPart.Position);
			if v18 ~= nil then
				v18 = v18.Name;
			end;
			v17 = v18 == p5;
		end;
		if v17 == true then
			v12 = v12 + 1;
			v11[v12] = v14;
		end;	
	end;
	return v11;
end;
local l__EntityUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
function v3.getEntitiesInWorld(p6, p7)
	local v19 = {};
	local v20 = 0;
	local v21, v22, v23 = ipairs((l__EntityUtil__3:getAllEntityInstances()));
	while true do
		v21(v22, v23);
		if not v21 then
			break;
		end;
		if not v22.PrimaryPart then
			local v24 = false;
		else
			local v25 = p6:getWorldFromPosition(v22.PrimaryPart.Position);
			if v25 ~= nil then
				v25 = v25.Name;
			end;
			v24 = v25 == p7;
		end;
		if v24 == true then
			v20 = v20 + 1;
			v19[v20] = v22;
		end;	
	end;
	return v19;
end;
v3.WORLD_SEPERATION_STUDS = 8000;
return {
	WorldUtil = v3
};
