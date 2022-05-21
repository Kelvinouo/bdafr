-- Script Hash: a1120eb5f9437cea1eee27cbbb3b39f92c2802f2b97adf238f6caed2c393ef1976e6ef51a595201ee49e589d06f41b62
-- Decompiled with the Synapse X Luau decompiler.

local l__Players__1 = game:GetService("Players");
local function u1(p1, p2, p3, p4, p5, p6, p7, p8, p9)
	return p1 * (p5 * p9 - p6 * p8) - p2 * (p4 * p9 - p6 * p7) + p3 * (p4 * p8 - p5 * p7);
end;
local u2 = Vector3.new(0, 0, 0);
local v2 = require(script.Parent:WaitForChild("BaseOcclusion"));
local v3 = setmetatable({}, v2);
v3.__index = v3;
local u3 = {
	LIMBS = 2, 
	MOVEMENT = 3, 
	CORNERS = 4, 
	CIRCLE1 = 5, 
	CIRCLE2 = 6, 
	LIMBMOVE = 7, 
	SMART_CIRCLE = 8, 
	CHAR_OUTLINE = 9
};
function v3.new()
	local v4 = setmetatable(v2.new(), v3);
	v4.char = nil;
	v4.humanoidRootPart = nil;
	v4.torsoPart = nil;
	v4.headPart = nil;
	v4.childAddedConn = nil;
	v4.childRemovedConn = nil;
	v4.behaviors = {};
	v4.behaviors[u3.LIMBS] = v4.LimbBehavior;
	v4.behaviors[u3.MOVEMENT] = v4.MoveBehavior;
	v4.behaviors[u3.CORNERS] = v4.CornerBehavior;
	v4.behaviors[u3.CIRCLE1] = v4.CircleBehavior;
	v4.behaviors[u3.CIRCLE2] = v4.CircleBehavior;
	v4.behaviors[u3.LIMBMOVE] = v4.LimbMoveBehavior;
	v4.behaviors[u3.SMART_CIRCLE] = v4.SmartCircleBehavior;
	v4.behaviors[u3.CHAR_OUTLINE] = v4.CharacterOutlineBehavior;
	v4.mode = u3.SMART_CIRCLE;
	v4.behaviorFunction = v4.SmartCircleBehavior;
	v4.savedHits = {};
	v4.trackedLimbs = {};
	v4.camera = game.Workspace.CurrentCamera;
	v4.enabled = false;
	return v4;
end;
function v3.Enable(p10, p11)
	p10.enabled = p11;
	if not p11 then
		p10:Cleanup();
	end;
end;
function v3.GetOcclusionMode(p12)
	return Enum.DevCameraOcclusionMode.Invisicam;
end;
function v3.LimbBehavior(p13, p14)
	for v5, v6 in pairs(p13.trackedLimbs) do
		p14[#p14 + 1] = v5.Position;
	end;
end;
function v3.MoveBehavior(p15, p16)
	for v7 = 1, 3 do
		local l__Velocity__8 = p15.humanoidRootPart.Velocity;
		p16[#p16 + 1] = p15.humanoidRootPart.Position + (v7 - 1) * p15.humanoidRootPart.CFrame.lookVector * (Vector3.new(l__Velocity__8.X, 0, l__Velocity__8.Z).Magnitude / 2);
	end;
end;
local u4 = { Vector3.new(1, 1, -1), Vector3.new(1, -1, -1), Vector3.new(-1, -1, -1), Vector3.new(-1, 1, -1) };
function v3.CornerBehavior(p17, p18)
	local l__CFrame__9 = p17.humanoidRootPart.CFrame;
	local l__Position__10 = l__CFrame__9.Position;
	local v11 = l__CFrame__9 - l__Position__10;
	local v12 = p17.char:GetExtentsSize() / 2;
	p18[#p18 + 1] = l__Position__10;
	for v13 = 1, #u4 do
		p18[#p18 + 1] = l__Position__10 + v11 * (v12 * u4[v13]);
	end;
end;
function v3.CircleBehavior(p19, p20)
	if p19.mode == u3.CIRCLE1 then
		local v14 = p19.humanoidRootPart.CFrame;
	else
		local l__CoordinateFrame__15 = p19.camera.CoordinateFrame;
		v14 = l__CoordinateFrame__15 - l__CoordinateFrame__15.Position + p19.humanoidRootPart.Position;
	end;
	p20[#p20 + 1] = v14.Position;
	for v16 = 0, 9 do
		local v17 = 2 * math.pi / 10 * v16;
		p20[#p20 + 1] = v14 * (3 * Vector3.new(math.cos(v17), math.sin(v17), 0));
	end;
end;
function v3.LimbMoveBehavior(p21, p22)
	p21:LimbBehavior(p22);
	p21:MoveBehavior(p22);
end;
function v3.CharacterOutlineBehavior(p23, p24)
	local l__unit__18 = p23.torsoPart.CFrame.upVector.unit;
	local l__unit__19 = p23.torsoPart.CFrame.rightVector.unit;
	p24[#p24 + 1] = p23.torsoPart.CFrame.p;
	p24[#p24 + 1] = p23.torsoPart.CFrame.p + l__unit__18;
	p24[#p24 + 1] = p23.torsoPart.CFrame.p - l__unit__18;
	p24[#p24 + 1] = p23.torsoPart.CFrame.p + l__unit__19;
	p24[#p24 + 1] = p23.torsoPart.CFrame.p - l__unit__19;
	if p23.headPart then
		p24[#p24 + 1] = p23.headPart.CFrame.p;
	end;
	local v20 = CFrame.new(u2, Vector3.new(p23.camera.CoordinateFrame.lookVector.X, 0, p23.camera.CoordinateFrame.lookVector.Z));
	local v21 = p23.torsoPart and p23.torsoPart.Position or p23.humanoidRootPart.Position;
	local v22 = { p23.torsoPart };
	if p23.headPart then
		v22[#v22 + 1] = p23.headPart;
	end;
	for v23 = 1, 24 do
		local v24 = 2 * math.pi * v23 / 24;
		local v25 = v20 * (3 * Vector3.new(math.cos(v24), math.sin(v24), 0));
		local v26 = Vector3.new(v25.X, math.max(v25.Y, -2.25), v25.Z);
		local v27, v28 = game.Workspace:FindPartOnRayWithWhitelist(Ray.new(v21 + v26, -3 * v26), v22, false, false);
		if v27 then
			p24[#p24 + 1] = v28 + 0.2 * (v21 - v28).unit;
		end;
	end;
end;
local u5 = 2 * math.pi / 24;
local function u6(p25, p26, p27, p28)
	local v29 = p26:Cross(p28);
	local v30 = p27.x - p25.x;
	local v31 = p27.y - p25.y;
	local v32 = p27.z - p25.z;
	local v33 = u1(p26.x, -p28.x, v29.x, p26.y, -p28.y, v29.y, p26.z, -p28.z, v29.z);
	if v33 == 0 then
		return u2;
	end;
	local v34 = u1(v30, -p28.x, v29.x, v31, -p28.y, v29.y, v32, -p28.z, v29.z) / v33;
	local v35 = u1(p26.x, v30, v29.x, p26.y, v31, v29.y, p26.z, v32, v29.z) / v33;
	local v36 = p25 + v34 * p26;
	local v37 = p27 + v35 * p28;
	if (v37 - v36).Magnitude < 0.25 then
		return v36 + 0.5 * (v37 - v36);
	end;
	return u2;
end;
function v3.SmartCircleBehavior(p29, p30)
	local l__unit__38 = p29.torsoPart.CFrame.upVector.unit;
	local l__unit__39 = p29.torsoPart.CFrame.rightVector.unit;
	p30[#p30 + 1] = p29.torsoPart.CFrame.p;
	p30[#p30 + 1] = p29.torsoPart.CFrame.p + l__unit__38;
	p30[#p30 + 1] = p29.torsoPart.CFrame.p - l__unit__38;
	p30[#p30 + 1] = p29.torsoPart.CFrame.p + l__unit__39;
	p30[#p30 + 1] = p29.torsoPart.CFrame.p - l__unit__39;
	if p29.headPart then
		p30[#p30 + 1] = p29.headPart.CFrame.p;
	end;
	local v40 = p29.camera.CFrame - p29.camera.CFrame.p;
	local v41 = Vector3.new(0, 0.5, 0) + (p29.torsoPart and p29.torsoPart.Position or p29.humanoidRootPart.Position);
	for v42 = 1, 24 do
		local v43 = u5 * v42 - 0.5 * math.pi;
		local v44 = v41 + v40 * (2.5 * Vector3.new(math.cos(v43), math.sin(v43), 0));
		local v45 = v44 - p29.camera.CFrame.p;
		local v46, v47, v48 = game.Workspace:FindPartOnRayWithIgnoreList(Ray.new(v41, v44 - v41), { p29.char }, false, false);
		local v49 = v44;
		if v46 then
			local v50 = v47 + 0.1 * v48.unit;
			local v51 = v50 - v41;
			local l__unit__52 = v51:Cross(v45).unit:Cross(v48).unit;
			if v51.unit:Dot(-l__unit__52) < v51.unit:Dot((v50 - p29.camera.CFrame.p).unit) then
				v49 = u6(v50, l__unit__52, v44, v45);
				if v49.Magnitude > 0 then
					local v53, v54, v55 = game.Workspace:FindPartOnRayWithIgnoreList(Ray.new(v50, v49 - v50), { p29.char }, false, false);
					if v53 then
						v49 = v54 + 0.1 * v55.unit;
					end;
				else
					v49 = v50;
				end;
			else
				v49 = v50;
			end;
			local v56, v57, v58 = game.Workspace:FindPartOnRayWithIgnoreList(Ray.new(v41, v49 - v41), { p29.char }, false, false);
			if v56 then
				v49 = v57 - 0.1 * (v49 - v41).unit;
			end;
		end;
		p30[#p30 + 1] = v49;
	end;
end;
function v3.CheckTorsoReference(p31)
	if p31.char then
		p31.torsoPart = p31.char:FindFirstChild("Torso");
		if not p31.torsoPart then
			p31.torsoPart = p31.char:FindFirstChild("UpperTorso");
			if not p31.torsoPart then
				p31.torsoPart = p31.char:FindFirstChild("HumanoidRootPart");
			end;
		end;
		p31.headPart = p31.char:FindFirstChild("Head");
	end;
end;
local u7 = {
	Head = true, 
	["Left Arm"] = true, 
	["Right Arm"] = true, 
	["Left Leg"] = true, 
	["Right Leg"] = true, 
	LeftLowerArm = true, 
	RightLowerArm = true, 
	LeftUpperLeg = true, 
	RightUpperLeg = true
};
function v3.CharacterAdded(p32, p33, p34)
	if p34 ~= l__Players__1.LocalPlayer then
		return;
	end;
	if p32.childAddedConn then
		p32.childAddedConn:Disconnect();
		p32.childAddedConn = nil;
	end;
	if p32.childRemovedConn then
		p32.childRemovedConn:Disconnect();
		p32.childRemovedConn = nil;
	end;
	p32.char = p33;
	p32.trackedLimbs = {};
	local function v59(p35)
		if p35:IsA("BasePart") then
			if u7[p35.Name] then
				p32.trackedLimbs[p35] = true;
			end;
			if p35.Name == "Torso" or p35.Name == "UpperTorso" then
				p32.torsoPart = p35;
			end;
			if p35.Name == "Head" then
				p32.headPart = p35;
			end;
		end;
	end;
	p32.childAddedConn = p33.ChildAdded:Connect(v59);
	p32.childRemovedConn = p33.ChildRemoved:Connect(function(p36)
		p32.trackedLimbs[p36] = nil;
		p32:CheckTorsoReference();
	end);
	for v60, v61 in pairs(p32.char:GetChildren()) do
		v59(v61);
	end;
end;
local function u8(p37, ...)
	local v62 = {};
	local v63 = "";
	for v64, v65 in pairs({ ... }) do
		v62[v65] = true;
		if v63 == "" then
			local v66 = "";
		else
			v66 = " or ";
		end;
		v63 = v63 .. v66 .. v65;
	end;
	local v67 = type(p37);
	assert(v62[v67], v63 .. " type expected, got: " .. v67);
end;
function v3.SetMode(p38, p39)
	u8(p39, "number");
	for v68, v69 in pairs(u3) do
		if v69 == p39 then
			p38.mode = p39;
			p38.behaviorFunction = p38.behaviors[p38.mode];
			return;
		end;
	end;
	error("Invalid mode number");
end;
function v3.GetObscuredParts(p40)
	return p40.savedHits;
end;
function v3.Cleanup(p41)
	for v70, v71 in pairs(p41.savedHits) do
		v70.LocalTransparencyModifier = v71;
	end;
end;
function v3.Update(p42, p43, p44, p45)
	local v72 = nil;
	if not p42.enabled or not p42.char then
		return p44, p45;
	end;
	p42.camera = game.Workspace.CurrentCamera;
	if not p42.humanoidRootPart then
		local v73 = p42.char:FindFirstChildOfClass("Humanoid");
		if v73 and v73.RootPart then
			p42.humanoidRootPart = v73.RootPart;
		else
			p42.humanoidRootPart = p42.char:FindFirstChild("HumanoidRootPart");
			if not p42.humanoidRootPart then
				return p44, p45;
			end;
		end;
		local u9 = nil;
		u9 = p42.humanoidRootPart.AncestryChanged:Connect(function(p46, p47)
			if p46 == p42.humanoidRootPart and not p47 then
				p42.humanoidRootPart = nil;
				if u9 and u9.Connected then
					u9:Disconnect();
					u9 = nil;
				end;
			end;
		end);
	end;
	if not p42.torsoPart then
		p42:CheckTorsoReference();
		if not p42.torsoPart then
			return p44, p45;
		end;
	end;
	local v74 = {};
	p42:behaviorFunction(v74);
	local v75 = { p42.char };
	local u10 = {};
	local function v76(p48)
		u10[p48] = true;
		if not p42.savedHits[p48] then
			p42.savedHits[p48] = p48.LocalTransparencyModifier;
		end;
	end;
	local v77 = 0;
	local v78 = {};
	local v79 = 0.75;
	local v80 = 0.75;
	local v81 = p42.camera:GetPartsObscuringTarget({ p42.headPart and p42.headPart.CFrame.p or v74[1], p42.torsoPart and p42.torsoPart.CFrame.p or v74[2] }, v75);
	for v82 = 1, #v81 do
		local v83 = v81[v82];
		v72 = v77 + 1;
		v78[v83] = true;
		for v84, v85 in pairs(v83:GetChildren()) do
			if v85:IsA("Decal") then
				v72 = v72 + 1;
				break;
			end;
			if v85:IsA("Texture") then
				v72 = v72 + 1;
				break;
			end;
		end;
	end;
	if v72 > 0 then
		v79 = math.pow(0.375 + 0.375 / v72, 1 / v72);
		v80 = math.pow(0.25 + 0.25 / v72, 1 / v72);
	end;
	local v86 = p42.camera:GetPartsObscuringTarget(v74, v75);
	local v87 = {};
	for v88 = 1, #v86 do
		local v89 = v86[v88];
		v87[v89] = v78[v89] and v79 or v80;
		if v89.Transparency < v87[v89] then
			v76(v89);
		end;
		for v90, v91 in pairs(v89:GetChildren()) do
			if (v91:IsA("Decal") or v91:IsA("Texture")) and v91.Transparency < v87[v89] then
				v87[v91] = v87[v89];
				v76(v91);
			end;
		end;
	end;
	for v92, v93 in pairs(p42.savedHits) do
		if u10[v92] then
			v92.LocalTransparencyModifier = v92.Transparency < 1 and (v87[v92] - v92.Transparency) / (1 - v92.Transparency) or 0;
		else
			v92.LocalTransparencyModifier = v93;
			p42.savedHits[v92] = nil;
		end;
	end;
	return p44, p45;
end;
return v3;
