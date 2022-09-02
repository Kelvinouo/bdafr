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
		local v8, v9 = v5(v6, v7);
		if not v8 then
			break;
		end;
		local l__Origin__10 = v9:FindFirstChild("Origin");
		local v11 = l__Origin__10;
		if v11 ~= nil then
			v11 = v11:IsA("Vector3Value");
		end;
		if v11 then
			local v12 = l__Origin__10.Value - p3;
			if math.abs(v12.X) < v3.WORLD_SEPERATION_STUDS / 2 and math.abs(v12.Z) < v3.WORLD_SEPERATION_STUDS / 2 then
				return v9;
			end;
		end;	
	end;
end;
local l__Players__2 = v2.Players;
function v3.getPlayersInWorld(p4, p5)
	local v13 = {};
	local v14 = 0;
	local v15, v16, v17 = ipairs((l__Players__2:GetPlayers()));
	while true do
		local v18, v19 = v15(v16, v17);
		if not v18 then
			break;
		end;
		local v20 = v19.Character;
		if v20 ~= nil then
			v20 = v20.PrimaryPart;
		end;
		if not v20 then
			local v21 = false;
		else
			local v22 = p4:getWorldFromPosition(v19.Character.PrimaryPart.Position);
			if v22 ~= nil then
				v22 = v22.Name;
			end;
			v21 = v22 == p5;
		end;
		if v21 == true then
			v14 = v14 + 1;
			v13[v14] = v19;
		end;	
	end;
	return v13;
end;
local l__EntityUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
function v3.getEntitiesInWorld(p6, p7)
	local v23 = {};
	local v24 = 0;
	local v25, v26, v27 = ipairs((l__EntityUtil__3:getAllEntityInstances()));
	while true do
		local v28, v29 = v25(v26, v27);
		if not v28 then
			break;
		end;
		if not v29.PrimaryPart then
			local v30 = false;
		else
			local v31 = p6:getWorldFromPosition(v29.PrimaryPart.Position);
			if v31 ~= nil then
				v31 = v31.Name;
			end;
			v30 = v31 == p7;
		end;
		if v30 == true then
			v24 = v24 + 1;
			v23[v24] = v29;
		end;	
	end;
	return v23;
end;
v3.WORLD_SEPERATION_STUDS = 8000;
return {
	WorldUtil = v3
};
