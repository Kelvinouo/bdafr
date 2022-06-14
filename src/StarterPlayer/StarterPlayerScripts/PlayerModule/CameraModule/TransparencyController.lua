-- Script Hash: 2a8fce67a9b0e4a8781d5eccc795b2f8bb633d36379244ffe178a3aaf922cec63730e47a4d6b218912560a68f166742c
-- Decompiled with the Synapse X Luau decompiler.

local v1, v2 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserTransparencyControllerDeltaTime");
end);
local v3 = {};
v3.__index = v3;
function v3.new()
	local v4 = setmetatable({}, v3);
	v4.lastUpdate = tick();
	v4.transparencyDirty = false;
	v4.enabled = false;
	v4.lastTransparency = nil;
	v4.descendantAddedConn = nil;
	v4.descendantRemovingConn = nil;
	v4.toolDescendantAddedConns = {};
	v4.toolDescendantRemovingConns = {};
	v4.cachedParts = {};
	return v4;
end;
function v3.HasToolAncestor(p1, p2)
	if p2.Parent == nil then
		return false;
	end;
	return p2.Parent:IsA("Tool") or p1:HasToolAncestor(p2.Parent);
end;
function v3.IsValidPartToModify(p3, p4)
	if not p4:IsA("BasePart") and not p4:IsA("Decal") then
		return false;
	end;
	return not p3:HasToolAncestor(p4);
end;
function v3.CachePartsRecursive(p5, p6)
	if p6 then
		if p5:IsValidPartToModify(p6) then
			p5.cachedParts[p6] = true;
			p5.transparencyDirty = true;
		end;
		for v5, v6 in pairs(p6:GetChildren()) do
			p5:CachePartsRecursive(v6);
		end;
	end;
end;
function v3.TeardownTransparency(p7)
	for v7, v8 in pairs(p7.cachedParts) do
		v7.LocalTransparencyModifier = 0;
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
	for v9, v10 in pairs(p7.toolDescendantAddedConns) do
		v10:Disconnect();
		p7.toolDescendantAddedConns[v9] = nil;
	end;
	for v11, v12 in pairs(p7.toolDescendantRemovingConns) do
		v12:Disconnect();
		p7.toolDescendantRemovingConns[v11] = nil;
	end;
end;
function v3.SetupTransparency(p8, p9)
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
local u1 = v1 or v2;
function v3.Enable(p14, p15)
	if p14.enabled ~= p15 then
		p14.enabled = p15;
		if not u1 then
			p14:Update();
		end;
	end;
end;
function v3.SetSubject(p16, p17)
	local v13 = nil;
	if p17 and p17:IsA("Humanoid") then
		v13 = p17.Parent;
	end;
	if p17 and p17:IsA("VehicleSeat") and p17.Occupant then
		v13 = p17.Occupant.Parent;
	end;
	if not v13 then
		p16:TeardownTransparency();
		return;
	end;
	p16:SetupTransparency(v13);
end;
local u2 = require(script.Parent:WaitForChild("CameraUtils"));
function v3.Update(p18, p19)
	if u1 then
		local l__CurrentCamera__14 = workspace.CurrentCamera;
		if l__CurrentCamera__14 and p18.enabled then
			local l__magnitude__15 = (l__CurrentCamera__14.Focus.p - l__CurrentCamera__14.CoordinateFrame.p).magnitude;
			local v16 = l__magnitude__15 < 2 and 1 - (l__magnitude__15 - 0.5) / 1.5 or 0;
			if v16 < 0.5 then
				v16 = 0;
			end;
			if p18.lastTransparency and v16 < 1 and p18.lastTransparency < 0.95 then
				local v17 = 2.8 * p19;
				v16 = p18.lastTransparency + math.clamp(v16 - p18.lastTransparency, -v17, v17);
			else
				p18.transparencyDirty = true;
			end;
			local v18 = math.clamp(u2.Round(v16, 2), 0, 1);
			if p18.transparencyDirty or p18.lastTransparency ~= v18 then
				for v19, v20 in pairs(p18.cachedParts) do
					v19.LocalTransparencyModifier = v18;
				end;
				p18.transparencyDirty = false;
				p18.lastTransparency = v18;
				return;
			end;
		end;
	else
		local v21 = tick();
		local l__CurrentCamera__22 = workspace.CurrentCamera;
		if l__CurrentCamera__22 then
			local v23 = 0;
			if p18.enabled then
				local l__magnitude__24 = (l__CurrentCamera__22.Focus.p - l__CurrentCamera__22.CoordinateFrame.p).magnitude;
				local v25 = l__magnitude__24 < 2 and 1 - (l__magnitude__24 - 0.5) / 1.5 or 0;
				if v25 < 0.5 then
					v25 = 0;
				end;
				if p18.lastTransparency then
					local v26 = v25 - p18.lastTransparency;
					if not false and v25 < 1 and p18.lastTransparency < 0.95 then
						if u1 then
							local v27 = 2.8 * p19;
						else
							v27 = 2.8 * (v21 - p18.lastUpdate);
						end;
						v26 = math.clamp(v26, -v27, v27);
					end;
					v25 = p18.lastTransparency + v26;
				else
					p18.transparencyDirty = true;
				end;
				v23 = math.clamp(u2.Round(v25, 2), 0, 1);
			end;
			if p18.transparencyDirty or p18.lastTransparency ~= v23 then
				for v28, v29 in pairs(p18.cachedParts) do
					v28.LocalTransparencyModifier = v23;
				end;
				p18.transparencyDirty = false;
				p18.lastTransparency = v23;
			end;
		end;
		p18.lastUpdate = v21;
	end;
end;
return v3;
