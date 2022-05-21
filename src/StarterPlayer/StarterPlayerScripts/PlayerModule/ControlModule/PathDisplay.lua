-- Script Hash: ba75a96af6d2d8db2bfd2c9ebe0cbab6f4d2500032546b4e2f1d2ffe1c992fac4ad8024f0aaaffbd4454061be47fd089
-- Decompiled with the Synapse X Luau decompiler.

local v1 = {
	spacing = 8, 
	image = "rbxasset://textures/Cursors/Gamepad/Pointer.png", 
	imageSize = Vector2.new(2, 2)
};
local v2 = Instance.new("Model");
v2.Name = "PathDisplayPoints";
local v3 = Instance.new("Part");
v3.Anchored = true;
v3.CanCollide = false;
v3.Transparency = 1;
v3.Name = "PathDisplayAdornee";
v3.CFrame = CFrame.new(0, 0, 0);
v3.Parent = v2;
local v4 = {};
for v5 = 1, 30 do
	local v6 = Instance.new("ImageHandleAdornment");
	v6.Archivable = false;
	v6.Adornee = v3;
	v6.Image = v1.image;
	v6.Size = v1.imageSize;
	v4[v5] = v6;
end;
local u1 = 30;
local function u2()
	local v7 = v4[1];
	if not v7 then
		return;
	end;
	v4[1] = v4[u1];
	v4[u1] = nil;
	u1 = u1 - 1;
	return v7;
end;
local u3 = {};
function v1.setCurrentPoints(p1)
	if typeof(p1) == "table" then
		u3 = p1;
		return;
	end;
	u3 = {};
end;
local u4 = {};
local function u5(p2)
	u1 = u1 + 1;
	v4[u1] = p2;
end;
function v1.clearRenderedPath()
	for v8, v9 in ipairs(u4) do
		v9.Parent = nil;
		u5(v9);
	end;
	u4 = {};
	v2.Parent = nil;
end;
local function u6(p3, p4)
	if u1 == 0 then
		return;
	end;
	local v10, v11, v12 = workspace:FindPartOnRayWithIgnoreList(Ray.new(p3 + Vector3.new(0, 2, 0), Vector3.new(0, -8, 0)), { game.Players.LocalPlayer.Character, workspace.CurrentCamera });
	if not v10 then
		return;
	end;
	local v13 = u2();
	v13.CFrame = CFrame.new(v11, v11 + v12);
	v13.Parent = v2;
	return v13;
end;
function v1.renderPath()
	v1.clearRenderedPath();
	if not u3 or #u3 == 0 then
		return;
	end;
	local v14 = #u3;
	local v15 = 0;
	u4[1] = u6(u3[v14], true);
	if not u4[1] then
		return;
	end;
	while true do
		local v16 = u3[v14];
		if v14 < 2 then
			break;
		end;
		local v17 = u3[v14 - 1] - v16;
		local l__magnitude__18 = v17.magnitude;
		if l__magnitude__18 < v15 then
			v15 = v15 - l__magnitude__18;
			v14 = v14 - 1;
		else
			local v19 = u6(v16 + v17.unit * v15, false);
			if v19 then
				u4[#u4 + 1] = v19;
			end;
			v15 = v15 + v1.spacing;
		end;	
	end;
	v2.Parent = workspace.CurrentCamera;
end;
return v1;
