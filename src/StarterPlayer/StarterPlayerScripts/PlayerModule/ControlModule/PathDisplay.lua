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
local u2 = {};
function v1.setCurrentPoints(p1)
	if typeof(p1) == "table" then
		u2 = p1;
		return;
	end;
	u2 = {};
end;
local u3 = {};
function v1.clearRenderedPath()
	local v7, v8, v9 = ipairs(u3);
	while true do
		v7(v8, v9);
		if not v7 then
			break;
		end;
		v9 = v7;
		v8.Parent = nil;
		u1 = u1 + 1;
		v4[u1] = v8;	
	end;
	u3 = {};
	v2.Parent = nil;
end;
local function u4(p2, p3)
	if u1 == 0 then
		return nil;
	end;
	local v10, v11, v12 = workspace:FindPartOnRayWithIgnoreList(Ray.new(p2 + Vector3.new(0, 2, 0), Vector3.new(0, -8, 0)), { game.Players.LocalPlayer.Character, workspace.CurrentCamera });
	if not v10 then
		return nil;
	end;
	local v13 = v4[1];
	if not v13 then
		local v14 = nil;
	else
		v4[1] = v4[u1];
		v4[u1] = nil;
		u1 = u1 - 1;
		v14 = v13;
	end;
	v14.CFrame = CFrame.new(v11, v11 + v12);
	v14.Parent = v2;
	return v14;
end;
function v1.renderPath()
	v1.clearRenderedPath();
	if not u2 or #u2 == 0 then
		return;
	end;
	local v15 = #u2;
	local v16 = 0;
	u3[1] = u4(u2[v15], true);
	if not u3[1] then
		return;
	end;
	while true do
		local v17 = u2[v15];
		if v15 < 2 then
			break;
		end;
		local v18 = u2[v15 - 1] - v17;
		local l__magnitude__19 = v18.magnitude;
		if l__magnitude__19 < v16 then
			v16 = v16 - l__magnitude__19;
			v15 = v15 - 1;
		else
			local v20 = u4(v17 + v18.unit * v16, false);
			if v20 then
				u3[#u3 + 1] = v20;
			end;
			v16 = v16 + v1.spacing;
		end;	
	end;
	v2.Parent = workspace.CurrentCamera;
end;
return v1;
