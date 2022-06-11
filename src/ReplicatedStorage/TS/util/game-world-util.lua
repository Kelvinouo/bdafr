-- Script Hash: d7338f47e5a8c72648c4d9a45a1c9e6583bac8148b43df3bfb71e83f67613aa9a3298ecd69890d558aa888f8a2b04c6f
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v3 = {};
local l__Players__1 = v2.Players;
function v3.getNearbyPlayers(p1, p2, p3, p4)
	if p4 == nil then
		p4 = true;
	end;
	local v4 = {};
	local v5 = l__Players__1:GetPlayers();
	local function v6(p5)
		local v7 = table.find(p3 or {}, p5) ~= nil;
		if p4 and v7 then
			return nil;
		end;
		if not p4 and not v7 then
			return nil;
		end;
		local v8 = p5.Character;
		if v8 ~= nil then
			v8 = v8.PrimaryPart;
		end;
		if v8 and (p5.Character.PrimaryPart.Position - p1).Magnitude <= p2 then
			table.insert(v4, p5);
		end;
	end;
	for v9, v10 in ipairs(v5) do
		v6(v10, v9 - 1, v5);
	end;
	return v4;
end;
local l__EntityUtil__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__Workspace__3 = v2.Workspace;
function v3.getEntitiesWithinRadius(p6, p7)
	local v11 = l__EntityUtil__2:getAliveEntityInstances();
	local function v12(p8)
		return p8.PrimaryPart;
	end;
	local v13 = {};
	local v14 = 0;
	for v15, v16 in ipairs(v11) do
		local v17 = v12(v16, v15 - 1, v11);
		if v17 ~= nil then
			v14 = v14 + 1;
			v13[v14] = v17;
		end;
	end;
	local v18 = OverlapParams.new();
	v18.FilterType = Enum.RaycastFilterType.Whitelist;
	v18.FilterDescendantsInstances = v13;
	local v19 = l__Workspace__3:GetPartBoundsInBox(CFrame.new(p6), Vector3.new(p7 * 2, p7 * 2, p7 * 2), v18);
	local function v20(p9)
		local v21 = l__EntityUtil__2:getEntity(p9);
		if v21 then
			local l__PrimaryPart__22 = v21:getInstance().PrimaryPart;
			if l__PrimaryPart__22 and (l__PrimaryPart__22.Position - p6).Magnitude <= p7 then
				return v21;
			end;
		end;
	end;
	local v23 = {};
	local v24 = 0;
	for v25, v26 in ipairs(v19) do
		local v27 = v20(v26, v25 - 1, v19);
		if v27 ~= nil then
			v24 = v24 + 1;
			v23[v24] = v27;
		end;
	end;
	return v23;
end;
local u4 = Random.new();
function v3.randomUnitVector(p10, p11)
	return (CFrame.lookAt(Vector3.new(), p10) * CFrame.Angles(0, 0, u4:NextNumber(0, 2 * math.pi)) * CFrame.Angles(math.acos(u4:NextNumber(math.cos(p11), 1)), 0, 0)).LookVector;
end;
return {
	GameWorldUtil = v3
};
