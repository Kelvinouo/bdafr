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
local v18, v19, v20 = ipairs(l__Players__1:GetPlayers());
while true do
	v18(v19, v20);
	if not v18 then
		break;
	end;
	v20 = v18;
	v5(v19);
end;
local v21 = 1;
u7 = {};
for v22, v23 in pairs(u8) do
	u7[v21] = v23;
	v21 = v21 + 1;
end;
u8 = nil;
local u9 = nil;
l__CurrentCamera__1:GetPropertyChangedSignal("CameraSubject"):Connect(function()
	local l__CameraSubject__24 = l__CurrentCamera__1.CameraSubject;
	if l__CameraSubject__24:IsA("Humanoid") then
		u9 = l__CameraSubject__24.RootPart;
		return;
	end;
	if l__CameraSubject__24:IsA("BasePart") then
		u9 = l__CameraSubject__24;
		return;
	end;
	u9 = nil;
end);
local l__Ray_new__10 = Ray.new;
local l__math_huge__11 = math.huge;
local function u12(p4, p5, p6, p7)
	debug.profilebegin("queryPoint");
	p6 = p6 + u6;
	local v25 = p4 + p5 * p6;
	local v26 = l__math_huge__11;
	local v27 = l__math_huge__11;
	local v28 = p4;
	local v29 = 0;
	while true do
		local v30, v31 = workspace:FindPartOnRayWithIgnoreList(l__Ray_new__10(v28, v25 - v28), u7, false, true);
		v29 = v29 + 1;
		if v30 then
			local v32 = v29 >= 64;
			local v33 = false;
			if 1 - (1 - v30.Transparency) * (1 - v30.LocalTransparencyModifier) < 0.25 then
				v33 = v30.CanCollide;
				if v33 then
					v33 = false;
					if u8 ~= (v30:GetRootPart() and v30) then
						v33 = not v30:IsA("TrussPart");
					end;
				end;
			end;
			if v33 or v32 then
				local v34 = { v30 };
				local l__Magnitude__35 = (v31 - p4).Magnitude;
				if workspace:FindPartOnRayWithWhitelist(l__Ray_new__10(v25, v31 - v25), v34, true) and not v32 then
					local v36 = false;
					if p7 then
						v36 = workspace:FindPartOnRayWithWhitelist(l__Ray_new__10(p7, v25 - p7), v34, true) or workspace:FindPartOnRayWithWhitelist(l__Ray_new__10(v25, p7 - v25), v34, true);
					end;
					if v36 then
						v27 = l__Magnitude__35;
					elseif p6 < v26 then
						v26 = l__Magnitude__35;
					end;
				else
					v27 = l__Magnitude__35;
				end;
			end;
			u7[#u7 + 1] = v30;
			v28 = v31 - p5 * 0.001;
		end;
		if v27 < l__math_huge__11 then
			break;
		end;
		if not v30 then
			break;
		end;	
	end;
	for v37 = #u7, #u7 + 1, -1 do
		u7[v37] = nil;
	end;
	debug.profileend();
	return v26 - u6, v27 - u6;
end;
local function u13(p8, p9)
	local v38 = #u7;
	while true do
		local v39, v40 = workspace:FindPartOnRayWithIgnoreList(l__Ray_new__10(p8, p9), u7, false, true);
		if v39 then
			if v39.CanCollide then
				for v41 = #u7, v38 + 1, -1 do
					u7[v41] = nil;
				end;
				return v40, true;
			end;
			u7[#u7 + 1] = v39;
		end;
		if not v39 then
			break;
		end;	
	end;
	for v42 = #u7, v38 + 1, -1 do
		u7[v42] = nil;
	end;
	return p8 + p9, false;
end;
local l__math_min__14 = math.min;
local u15 = { Vector2.new(0.4, 0), Vector2.new(-0.4, 0), Vector2.new(0, -0.4), Vector2.new(0, 0.4), Vector2.new(0, 0.2) };
local function u16(p10, p11)
	debug.profilebegin("queryViewport");
	local l__p__43 = p10.p;
	local l__rightVector__44 = p10.rightVector;
	local l__upVector__45 = p10.upVector;
	local v46 = -p10.lookVector;
	local l__ViewportSize__47 = l__CurrentCamera__1.ViewportSize;
	local v48 = l__math_huge__11;
	local v49 = l__math_huge__11;
	for v50 = 0, 1 do
		local v51 = l__rightVector__44 * ((v50 - 0.5) * u5);
		for v52 = 0, 1 do
			local v53, v54 = u12(l__p__43 + u6 * (v51 + l__upVector__45 * ((v52 - 0.5) * u3)), v46, p11, l__CurrentCamera__1:ViewportPointToRay(l__ViewportSize__47.x * v50, l__ViewportSize__47.y * v52).Origin);
			if v54 < v48 then
				v48 = v54;
			end;
			if v53 < v49 then
				v49 = v53;
			end;
		end;
	end;
	debug.profileend();
	return v49, v48;
end;
local function u17(p12, p13, p14)
	debug.profilebegin("testPromotion");
	local l__p__55 = p12.p;
	local l__rightVector__56 = p12.rightVector;
	local l__upVector__57 = p12.upVector;
	local v58 = -p12.lookVector;
	debug.profilebegin("extrapolate");
	for v59 = 0, l__math_min__14(1.25, p14.rotVelocity.magnitude + (u13(l__p__55, p14.posVelocity * 1.25) - l__p__55).Magnitude / p14.posVelocity.magnitude), 0.0625 do
		local v60 = p14.extrapolate(v59);
		if p13 <= u12(v60.p, -v60.lookVector, p13) then
			return false;
		end;
	end;
	debug.profileend();
	debug.profilebegin("testOffsets");
	local v61, v62, v63 = ipairs(u15);
	while true do
		v61(v62, v63);
		if not v61 then
			break;
		end;
		v63 = v61;
		local v64 = u13(l__p__55, l__rightVector__56 * v62.x + l__upVector__57 * v62.y);
		if u12(v64, (l__p__55 + v58 * p13 - v64).Unit, p13) == l__math_huge__11 then
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
	local v65 = p16;
	local v66, v67 = u16(p15, p16);
	if v67 < v65 then
		v65 = v67;
	end;
	if v66 < v65 and u17(p15, p16, p17) then
		v65 = v66;
	end;
	u8 = nil;
	debug.profileend();
	return v65;
end;
