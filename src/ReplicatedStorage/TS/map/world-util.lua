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
	local v13 = l__Players__2:GetPlayers();
	local function v14(p6)
		local v15 = p6.Character;
		if v15 ~= nil then
			v15 = v15.PrimaryPart;
		end;
		if not v15 then
			return false;
		end;
		local v16 = p4:getWorldFromPosition(p6.Character.PrimaryPart.Position);
		if v16 ~= nil then
			v16 = v16.Name;
		end;
		if v16 ~= p5 then
			return false;
		end;
		return true;
	end;
	local v17 = {};
	local v18 = 0;
	for v19, v20 in ipairs(v13) do
		if v14(v20, v19 - 1, v13) == true then
			v18 = v18 + 1;
			v17[v18] = v20;
		end;
	end;
	return v17;
end;
local l__EntityUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
function v3.getEntitiesInWorld(p7, p8)
	local v21 = l__EntityUtil__3:getAllEntityInstances();
	local function v22(p9)
		if not p9.PrimaryPart then
			return false;
		end;
		local v23 = p7:getWorldFromPosition(p9.PrimaryPart.Position);
		if v23 ~= nil then
			v23 = v23.Name;
		end;
		if v23 ~= p8 then
			return false;
		end;
		return true;
	end;
	local v24 = {};
	local v25 = 0;
	for v26, v27 in ipairs(v21) do
		if v22(v27, v26 - 1, v21) == true then
			v25 = v25 + 1;
			v24[v25] = v27;
		end;
	end;
	return v24;
end;
v3.WORLD_SEPERATION_STUDS = 8000;
return {
	WorldUtil = v3
};
