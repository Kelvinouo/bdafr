
-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
v1.__index = v1;
function v1.new()
	local v2 = setmetatable({}, v1);
	v2.lastUpdate = tick();
	v2.transparencyDirty = false;
	v2.enabled = false;
	v2.lastTransparency = nil;
	v2.descendantAddedConn = nil;
	v2.descendantRemovingConn = nil;
	v2.toolDescendantAddedConns = {};
	v2.toolDescendantRemovingConns = {};
	v2.cachedParts = {};
	return v2;
end;
function v1.HasToolAncestor(p1, p2)
	if p2.Parent == nil then
		return false;
	end;
	return p2.Parent:IsA("Tool") or p1:HasToolAncestor(p2.Parent);
end;
function v1.IsValidPartToModify(p3, p4)
	if not p4:IsA("BasePart") and not p4:IsA("Decal") then
		return false;
	end;
	return not p3:HasToolAncestor(p4);
end;
function v1.CachePartsRecursive(p5, p6)
	if p6 then
		if p5:IsValidPartToModify(p6) then
			p5.cachedParts[p6] = true;
			p5.transparencyDirty = true;
		end;
		for v3, v4 in pairs(p6:GetChildren()) do
			p5:CachePartsRecursive(v4);
		end;
	end;
end;
function v1.TeardownTransparency(p7)
	for v5, v6 in pairs(p7.cachedParts) do
		v5.LocalTransparencyModifier = 0;
	end;
	p7.cachedParts = {};
	p7.transparencyDirty = true;
	p7.lastTransparency = nil;
	if p7.descendantAddedConn then
		p7.descendantAddedConn:disconnect();
		p7.descendantAddedConn = nil;
	end;
	if p7.descendantRemovingConn then
		p7.descendantRemovingConn:disconnect();
		p7.descendantRemovingConn = nil;
	end;
	for v7, v8 in pairs(p7.toolDescendantAddedConns) do
		v8:Disconnect();
		p7.toolDescendantAddedConns[v7] = nil;
	end;
	for v9, v10 in pairs(p7.toolDescendantRemovingConns) do
		v10:Disconnect();
		p7.toolDescendantRemovingConns[v9] = nil;
	end;
end;
function v1.SetupTransparency(p8, p9)
	p8:TeardownTransparency();
	if p8.descendantAddedConn then
		p8.descendantAddedConn:disconnect();
	end;
	p8.descendantAddedConn = p9.DescendantAdded:Connect(function(p10)
		if p8:IsValidPartToModify(p10) then
			p8.cachedParts[p10] = true;
			p8.transparencyDirty = true;
			return;
		end;
		if p10:IsA("Tool") then
			if p8.toolDescendantAddedConns[p10] then
				p8.toolDescendantAddedConns[p10]:Disconnect();
			end;
			p8.toolDescendantAddedConns[p10] = p10.DescendantAdded:Connect(function(p11)
				p8.cachedParts[p11] = nil;
				if p11:IsA("BasePart") or p11:IsA("Decal") then
					p11.LocalTransparencyModifier = 0;
				end;
			end);
			if p8.toolDescendantRemovingConns[p10] then
				p8.toolDescendantRemovingConns[p10]:disconnect();
			end;
			p8.toolDescendantRemovingConns[p10] = p10.DescendantRemoving:Connect(function(p12)
				wait();
				if p9 and p12 and p12:IsDescendantOf(p9) and p8:IsValidPartToModify(p12) then
					p8.cachedParts[p12] = true;
					p8.transparencyDirty = true;
				end;
			end);
		end;
	end);
	if p8.descendantRemovingConn then
		p8.descendantRemovingConn:disconnect();
	end;
	p8.descendantRemovingConn = p9.DescendantRemoving:connect(function(p13)
		if p8.cachedParts[p13] then
			p8.cachedParts[p13] = nil;
			p13.LocalTransparencyModifier = 0;
		end;
	end);
	p8:CachePartsRecursive(p9);
end;
function v1.Enable(p14, p15)
	if p14.enabled ~= p15 then
		p14.enabled = p15;
		p14:Update();
	end;
end;
function v1.SetSubject(p16, p17)
	local v11 = nil;
	if p17 and p17:IsA("Humanoid") then
		v11 = p17.Parent;
	end;
	if p17 and p17:IsA("VehicleSeat") and p17.Occupant then
		v11 = p17.Occupant.Parent;
	end;
	if not v11 then
		p16:TeardownTransparency();
		return;
	end;
	p16:SetupTransparency(v11);
end;
local u1 = require(script.Parent:WaitForChild("CameraUtils"));
function v1.Update(p18)
	local v12 = tick();
	local l__CurrentCamera__13 = workspace.CurrentCamera;
	if l__CurrentCamera__13 then
		local v14 = 0;
		if p18.enabled then
			local l__magnitude__15 = (l__CurrentCamera__13.Focus.p - l__CurrentCamera__13.CoordinateFrame.p).magnitude;
			local v16 = l__magnitude__15 < 2 and 1 - (l__magnitude__15 - 0.5) / 1.5 or 0;
			if v16 < 0.5 then
				v16 = 0;
			end;
			if p18.lastTransparency then
				local v17 = v16 - p18.lastTransparency;
				if not false and v16 < 1 and p18.lastTransparency < 0.95 then
					local v18 = 2.8 * (v12 - p18.lastUpdate);
					v17 = math.clamp(v17, -v18, v18);
				end;
				v16 = p18.lastTransparency + v17;
			else
				p18.transparencyDirty = true;
			end;
			v14 = math.clamp(u1.Round(v16, 2), 0, 1);
		end;
		if p18.transparencyDirty or p18.lastTransparency ~= v14 then
			for v19, v20 in pairs(p18.cachedParts) do
				v19.LocalTransparencyModifier = v14;
			end;
			p18.transparencyDirty = false;
			p18.lastTransparency = v14;
		end;
	end;
	p18.lastUpdate = v12;
end;
return v1;

