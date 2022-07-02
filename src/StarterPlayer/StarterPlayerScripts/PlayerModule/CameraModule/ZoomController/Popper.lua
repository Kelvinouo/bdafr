-- Decompiled with the Synapse X Luau decompiler.

local l__Players__1 = game:GetService("Players");
local l__CurrentCamera__1 = game.Workspace.CurrentCamera;
local l__math_rad__2 = math.rad;
local u3 = nil;
local l__math_tan__4 = math.tan;
local u5 = nil;
local function v2()
	local l__ViewportSize__3 = l__CurrentCamera__1.ViewportSize;
	u3 = 2 * l__math_tan__4(l__math_rad__2(l__CurrentCamera__1.FieldOfView) / 2);
	u5 = l__ViewportSize__3.X / l__ViewportSize__3.Y * u3;
end;
l__CurrentCamera__1:GetPropertyChangedSignal("FieldOfView"):Connect(v2);
l__CurrentCamera__1:GetPropertyChangedSignal("ViewportSize"):Connect(v2);
local l__ViewportSize__4 = l__CurrentCamera__1.ViewportSize;
u3 = 2 * l__math_tan__4(l__math_rad__2(l__CurrentCamera__1.FieldOfView) / 2);
u5 = l__ViewportSize__4.X / l__ViewportSize__4.Y * u3;
local u6 = l__CurrentCamera__1.NearPlaneZ;
l__CurrentCamera__1:GetPropertyChangedSignal("NearPlaneZ"):Connect(function()
	u6 = l__CurrentCamera__1.NearPlaneZ;
end);
local u7 = {};
local u8 = {};
local function v5(p1)
	p1.CharacterAdded:Connect(function(p2)
		u8[p1] = p2;
		local v6 = 1;
		u7 = {};
		for v7, v8 in pairs(u8) do
			u7[v6] = v8;
			v6 = v6 + 1;
		end;
	end);
	p1.CharacterRemoving:Connect(function()
		u8[p1] = nil;
		local v9 = 1;
		u7 = {};
		for v10, v11 in pairs(u8) do
			u7[v9] = v11;
			v9 = v9 + 1;
		end;
	end);
	if p1.Character then
		u8[p1] = p1.Character;
		local v12 = 1;
		u7 = {};
		for v13, v14 in pairs(u8) do
			u7[v12] = v14;
			v12 = v12 + 1;
		end;
	end;
end;
l__Players__1.PlayerAdded:Connect(v5);
l__Players__1.PlayerRemoving:Connect(function(p3)
	u8[p3] = nil;
	local v15 = 1;
	u7 = {};
	for v16, v17 in pairs(u8) do
		u7[v15] = v17;
		v15 = v15 + 1;
	end;
end);
for v18, v19 in ipairs(l__Players__1:GetPlayers()) do
	v5(v19);
end;
local v20 = 1;
u7 = {};
for v21, v22 in pairs(u8) do
	u7[v20] = v22;
	v20 = v20 + 1;
end;
u8 = nil;
local u9 = nil;
l__CurrentCamera__1:GetPropertyChangedSignal("CameraSubject"):Connect(function()
	local l__CameraSubject__23 = l__CurrentCamera__1.CameraSubject;
	if l__CameraSubject__23:IsA("Humanoid") then
		u9 = l__CameraSubject__23.RootPart;
		return;
	end;
	if l__CameraSubject__23:IsA("BasePart") then
		u9 = l__CameraSubject__23;
		return;
	end;
	u9 = nil;
end);
local l__Ray_new__10 = Ray.new;
local l__math_huge__11 = math.huge;
local function u12(p4, p5, p6, p7)
	debug.profilebegin("queryPoint");
	p6 = p6 + u6;
	local v24 = p4 + p5 * p6;
	local v25 = l__math_huge__11;
	local v26 = l__math_huge__11;
	local v27 = p4;
	local v28 = 0;
	while true do
		local v29, v30 = workspace:FindPartOnRayWithIgnoreList(l__Ray_new__10(v27, v24 - v27), u7, false, true);
		v28 = v28 + 1;
		if v29 then
			local v31 = v28 >= 64;
			local v32 = false;
			if 1 - (1 - v29.Transparency) * (1 - v29.LocalTransparencyModifier) < 0.25 then
				v32 = v29.CanCollide;
				if v32 then
					v32 = false;
					if u8 ~= (v29:GetRootPart() and v29) then
						v32 = not v29:IsA("TrussPart");
					end;
				end;
			end;
			if v32 or v31 then
				local v33 = { v29 };
				local l__Magnitude__34 = (v30 - p4).Magnitude;
				if workspace:FindPartOnRayWithWhitelist(l__Ray_new__10(v24, v30 - v24), v33, true) and not v31 then
					local v35 = false;
					if p7 then
						v35 = workspace:FindPartOnRayWithWhitelist(l__Ray_new__10(p7, v24 - p7), v33, true) or workspace:FindPartOnRayWithWhitelist(l__Ray_new__10(v24, p7 - v24), v33, true);
					end;
					if v35 then
						v26 = l__Magnitude__34;
					elseif p6 < v25 then
						v25 = l__Magnitude__34;
					end;
				else
					v26 = l__Magnitude__34;
				end;
			end;
			u7[#u7 + 1] = v29;
			v27 = v30 - p5 * 0.001;
		end;
		if v26 < l__math_huge__11 then
			break;
		end;
		if not v29 then
			break;
		end;	
	end;
	for v36 = #u7, #u7 + 1, -1 do
		u7[v36] = nil;
	end;
	debug.profileend();
	return v25 - u6, v26 - u6;
end;
local function u13(p8, p9)
	local v37 = #u7;
	while true do
		local v38, v39 = workspace:FindPartOnRayWithIgnoreList(l__Ray_new__10(p8, p9), u7, false, true);
		if v38 then
			if v38.CanCollide then
				for v40 = #u7, v37 + 1, -1 do
					u7[v40] = nil;
				end;
				return v39, true;
			end;
			u7[#u7 + 1] = v38;
		end;
		if not v38 then
			break;
		end;	
	end;
	for v41 = #u7, v37 + 1, -1 do
		u7[v41] = nil;
	end;
	return p8 + p9, false;
end;
local l__math_min__14 = math.min;
local u15 = { Vector2.new(0.4, 0), Vector2.new(-0.4, 0), Vector2.new(0, -0.4), Vector2.new(0, 0.4), Vector2.new(0, 0.2) };
local function u16(p10, p11)
	debug.profilebegin("queryViewport");
	local l__p__42 = p10.p;
	local l__rightVector__43 = p10.rightVector;
	local l__upVector__44 = p10.upVector;
	local v45 = -p10.lookVector;
	local l__ViewportSize__46 = l__CurrentCamera__1.ViewportSize;
	local v47 = l__math_huge__11;
	local v48 = l__math_huge__11;
	for v49 = 0, 1 do
		local v50 = l__rightVector__43 * ((v49 - 0.5) * u5);
		for v51 = 0, 1 do
			local v52, v53 = u12(l__p__42 + u6 * (v50 + l__upVector__44 * ((v51 - 0.5) * u3)), v45, p11, l__CurrentCamera__1:ViewportPointToRay(l__ViewportSize__46.x * v49, l__ViewportSize__46.y * v51).Origin);
			if v53 < v47 then
				v47 = v53;
			end;
			if v52 < v48 then
				v48 = v52;
			end;
		end;
	end;
	debug.profileend();
	return v48, v47;
end;
local function u17(p12, p13, p14)
	debug.profilebegin("testPromotion");
	local l__p__54 = p12.p;
	local l__rightVector__55 = p12.rightVector;
	local l__upVector__56 = p12.upVector;
	local v57 = -p12.lookVector;
	debug.profilebegin("extrapolate");
	for v58 = 0, l__math_min__14(1.25, p14.rotVelocity.magnitude + (u13(l__p__54, p14.posVelocity * 1.25) - l__p__54).Magnitude / p14.posVelocity.magnitude), 0.0625 do
		local v59 = p14.extrapolate(v58);
		if p13 <= u12(v59.p, -v59.lookVector, p13) then
			return false;
		end;
	end;
	debug.profileend();
	debug.profilebegin("testOffsets");
	for v60, v61 in ipairs(u15) do
		local v62 = u13(l__p__54, l__rightVector__55 * v61.x + l__upVector__56 * v61.y);
		if u12(v62, (l__p__54 + v57 * p13 - v62).Unit, p13) == l__math_huge__11 then
			return false;
		end;
	end;
	debug.profileend();
	debug.profileend();
	return true;
end;
return function(p15, p16, p17)
	debug.profilebegin("popper");
	u8 = u9 and u9:GetRootPart() or u9;
	local v63 = p16;
	local v64, v65 = u16(p15, p16);
	if v65 < v63 then
		v63 = v65;
	end;
	if v64 < v63 and u17(p15, p16, p17) then
		v63 = v64;
	end;
	u8 = nil;
	debug.profileend();
	return v63;
end;
