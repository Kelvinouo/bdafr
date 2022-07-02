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
	local v11 = {};
	local v12 = 0;
	for v13, v14 in ipairs((l__EntityUtil__2:getAliveEntityInstances())) do
		local l__PrimaryPart__15 = v14.PrimaryPart;
		if l__PrimaryPart__15 ~= nil then
			v12 = v12 + 1;
			v11[v12] = l__PrimaryPart__15;
		end;
	end;
	local v16 = OverlapParams.new();
	v16.FilterType = Enum.RaycastFilterType.Whitelist;
	v16.FilterDescendantsInstances = v11;
	local v17 = {};
	local v18 = 0;
	local v19, v20, v21 = ipairs((l__Workspace__3:GetPartBoundsInBox(CFrame.new(p6), Vector3.new(p7 * 2, p7 * 2, p7 * 2), v16)));
	while true do
		local v22, v23 = v19(v20, v21);
		if not v22 then
			break;
		end;
		local v24 = l__EntityUtil__2:getEntity(v23);
		if v24 then
			local l__PrimaryPart__25 = v24:getInstance().PrimaryPart;
			if l__PrimaryPart__25 and (l__PrimaryPart__25.Position - p6).Magnitude <= p7 then
				local v26 = v24;
			else
				v26 = nil;
			end;
		else
			v26 = nil;
		end;
		if v26 ~= nil then
			v18 = v18 + 1;
			v17[v18] = v26;
		end;	
	end;
	return v17;
end;
local u4 = Random.new();
function v3.randomUnitVector(p8, p9)
	return (CFrame.lookAt(Vector3.new(), p8) * CFrame.Angles(0, 0, u4:NextNumber(0, 2 * math.pi)) * CFrame.Angles(math.acos(u4:NextNumber(math.cos(p9), 1)), 0, 0)).LookVector;
end;
return {
	GameWorldUtil = v3
};
