-- Script Hash: 9b681a799b0d424e8f63f750930893538df0780e24fdffe8be387ded3df70f25f45b3eb0f079f796327e611f78f80c36
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
v2();
local u6 = l__CurrentCamera__1.NearPlaneZ;
l__CurrentCamera__1:GetPropertyChangedSignal("NearPlaneZ"):Connect(function()
	u6 = l__CurrentCamera__1.NearPlaneZ;
end);
local u7 = {};
local u8 = {};
local u9 = function()
	local v4 = 1;
	u7 = {};
	for v5, v6 in pairs(u8) do
		u7[v4] = v6;
		v4 = v4 + 1;
	end;
end;
local function v7(p1)
	local function v8(p2)
		u8[p1] = p2;
		u9();
	end;
	p1.CharacterAdded:Connect(v8);
	p1.CharacterRemoving:Connect(function()
		u8[p1] = nil;
		u9();
	end);
	if p1.Character then
		v8(p1.Character);
	end;
end;
l__Players__1.PlayerAdded:Connect(v7);
l__Players__1.PlayerRemoving:Connect(function(p3)
	u8[p3] = nil;
	u9();
end);
for v9, v10 in ipairs(l__Players__1:GetPlayers()) do
	v7(v10);
end;
u9();
u8 = nil;
u9 = nil;
l__CurrentCamera__1:GetPropertyChangedSignal("CameraSubject"):Connect(function()
	local l__CameraSubject__11 = l__CurrentCamera__1.CameraSubject;
	if l__CameraSubject__11:IsA("Humanoid") then
		u9 = l__CameraSubject__11.RootPart;
		return;
	end;
	if l__CameraSubject__11:IsA("BasePart") then
		u9 = l__CameraSubject__11;
		return;
	end;
	u9 = nil;
end);
local function u10(p4)
	return 1 - (1 - p4.Transparency) * (1 - p4.LocalTransparencyModifier);
end;
local l__Ray_new__11 = Ray.new;
local function u12(p5, p6)
	for v12 = #p5, p6 + 1, -1 do
		p5[v12] = nil;
	end;
end;
local l__math_huge__13 = math.huge;
local function u14(p7)
	local v13 = false;
	if u10(p7) < 0.25 then
		v13 = p7.CanCollide;
		if v13 then
			v13 = false;
			if u8 ~= (p7:GetRootPart() and p7) then
				v13 = not p7:IsA("TrussPart");
			end;
		end;
	end;
	return v13;
end;
local function u15(p8, p9, p10, p11)
	debug.profilebegin("queryPoint");
	p10 = p10 + u6;
	local v14 = p8 + p9 * p10;
	local v15 = l__math_huge__13;
	local v16 = l__math_huge__13;
	local v17 = p8;
	local v18 = 0;
	while true do
		local v19, v20 = workspace:FindPartOnRayWithIgnoreList(l__Ray_new__11(v17, v14 - v17), u7, false, true);
		v18 = v18 + 1;
		if v19 then
			local v21 = v18 >= 64;
			if u14(v19) or v21 then
				local v22 = { v19 };
				local l__Magnitude__23 = (v20 - p8).Magnitude;
				if workspace:FindPartOnRayWithWhitelist(l__Ray_new__11(v14, v20 - v14), v22, true) and not v21 then
					local v24 = false;
					if p11 then
						v24 = workspace:FindPartOnRayWithWhitelist(l__Ray_new__11(p11, v14 - p11), v22, true) or workspace:FindPartOnRayWithWhitelist(l__Ray_new__11(v14, p11 - v14), v22, true);
					end;
					if v24 then
						v16 = l__Magnitude__23;
					elseif p10 < v15 then
						v15 = l__Magnitude__23;
					end;
				else
					v16 = l__Magnitude__23;
				end;
			end;
			u7[#u7 + 1] = v19;
			v17 = v20 - p9 * 0.001;
		end;
		if v16 < l__math_huge__13 then
			break;
		end;
		if not v19 then
			break;
		end;	
	end;
	u12(u7, #u7);
	debug.profileend();
	return v15 - u6, v16 - u6;
end;
local function u16(p12, p13)
	local v25 = #u7;
	while true do
		local v26, v27 = workspace:FindPartOnRayWithIgnoreList(l__Ray_new__11(p12, p13), u7, false, true);
		if v26 then
			if v26.CanCollide then
				u12(u7, v25);
				return v27, true;
			end;
			u7[#u7 + 1] = v26;
		end;
		if not v26 then
			break;
		end;	
	end;
	u12(u7, v25);
	return p12 + p13, false;
end;
local l__math_min__17 = math.min;
local u18 = { Vector2.new(0.4, 0), Vector2.new(-0.4, 0), Vector2.new(0, -0.4), Vector2.new(0, 0.4), Vector2.new(0, 0.2) };
local function u19(p14, p15)
	debug.profilebegin("queryViewport");
	local l__p__28 = p14.p;
	local l__rightVector__29 = p14.rightVector;
	local l__upVector__30 = p14.upVector;
	local v31 = -p14.lookVector;
	local l__ViewportSize__32 = l__CurrentCamera__1.ViewportSize;
	local v33 = l__math_huge__13;
	local v34 = l__math_huge__13;
	for v35 = 0, 1 do
		local v36 = l__rightVector__29 * ((v35 - 0.5) * u5);
		for v37 = 0, 1 do
			local v38, v39 = u15(l__p__28 + u6 * (v36 + l__upVector__30 * ((v37 - 0.5) * u3)), v31, p15, l__CurrentCamera__1:ViewportPointToRay(l__ViewportSize__32.x * v35, l__ViewportSize__32.y * v37).Origin);
			if v39 < v33 then
				v33 = v39;
			end;
			if v38 < v34 then
				v34 = v38;
			end;
		end;
	end;
	debug.profileend();
	return v34, v33;
end;
local function u20(p16, p17, p18)
	debug.profilebegin("testPromotion");
	local l__p__40 = p16.p;
	local l__rightVector__41 = p16.rightVector;
	local l__upVector__42 = p16.upVector;
	local v43 = -p16.lookVector;
	debug.profilebegin("extrapolate");
	for v44 = 0, l__math_min__17(1.25, p18.rotVelocity.magnitude + (u16(l__p__40, p18.posVelocity * 1.25) - l__p__40).Magnitude / p18.posVelocity.magnitude), 0.0625 do
		local v45 = p18.extrapolate(v44);
		if p17 <= u15(v45.p, -v45.lookVector, p17) then
			return false;
		end;
	end;
	debug.profileend();
	debug.profilebegin("testOffsets");
	for v46, v47 in ipairs(u18) do
		local v48 = u16(l__p__40, l__rightVector__41 * v47.x + l__upVector__42 * v47.y);
		if u15(v48, (l__p__40 + v43 * p17 - v48).Unit, p17) == l__math_huge__13 then
			return false;
		end;
	end;
	debug.profileend();
	debug.profileend();
	return true;
end;
return function(p19, p20, p21)
	debug.profilebegin("popper");
	u8 = u9 and u9:GetRootPart() or u9;
	local v49 = p20;
	local v50, v51 = u19(p19, p20);
	if v51 < v49 then
		v49 = v51;
	end;
	if v50 < v49 and u20(p19, p20, p21) then
		v49 = v50;
	end;
	u8 = nil;
	debug.profileend();
	return v49;
end;
