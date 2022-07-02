-- Decompiled with the Synapse X Luau decompiler.

local l__Players__1 = game:GetService("Players");
local u1 = Vector3.new(0, 0, 0);
local v2 = require(script.Parent:WaitForChild("BaseOcclusion"));
local v3 = setmetatable({}, v2);
v3.__index = v3;
local u2 = {
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
	v4.behaviors[u2.LIMBS] = v4.LimbBehavior;
	v4.behaviors[u2.MOVEMENT] = v4.MoveBehavior;
	v4.behaviors[u2.CORNERS] = v4.CornerBehavior;
	v4.behaviors[u2.CIRCLE1] = v4.CircleBehavior;
	v4.behaviors[u2.CIRCLE2] = v4.CircleBehavior;
	v4.behaviors[u2.LIMBMOVE] = v4.LimbMoveBehavior;
	v4.behaviors[u2.SMART_CIRCLE] = v4.SmartCircleBehavior;
	v4.behaviors[u2.CHAR_OUTLINE] = v4.CharacterOutlineBehavior;
	v4.mode = u2.SMART_CIRCLE;
	v4.behaviorFunction = v4.SmartCircleBehavior;
	v4.savedHits = {};
	v4.trackedLimbs = {};
	v4.camera = game.Workspace.CurrentCamera;
	v4.enabled = false;
	return v4;
end;
function v3.Enable(p1, p2)
	p1.enabled = p2;
	if not p2 then
		p1:Cleanup();
	end;
end;
function v3.GetOcclusionMode(p3)
	return Enum.DevCameraOcclusionMode.Invisicam;
end;
function v3.LimbBehavior(p4, p5)
	for v5, v6 in pairs(p4.trackedLimbs) do
		p5[#p5 + 1] = v5.Position;
	end;
end;
function v3.MoveBehavior(p6, p7)
	for v7 = 1, 3 do
		local l__Velocity__8 = p6.humanoidRootPart.Velocity;
		p7[#p7 + 1] = p6.humanoidRootPart.Position + (v7 - 1) * p6.humanoidRootPart.CFrame.lookVector * (Vector3.new(l__Velocity__8.X, 0, l__Velocity__8.Z).Magnitude / 2);
	end;
end;
local u3 = { Vector3.new(1, 1, -1), Vector3.new(1, -1, -1), Vector3.new(-1, -1, -1), Vector3.new(-1, 1, -1) };
function v3.CornerBehavior(p8, p9)
	local l__CFrame__9 = p8.humanoidRootPart.CFrame;
	local l__Position__10 = l__CFrame__9.Position;
	local v11 = l__CFrame__9 - l__Position__10;
	local v12 = p8.char:GetExtentsSize() / 2;
	p9[#p9 + 1] = l__Position__10;
	for v13 = 1, #u3 do
		p9[#p9 + 1] = l__Position__10 + v11 * (v12 * u3[v13]);
	end;
end;
function v3.CircleBehavior(p10, p11)
	if p10.mode == u2.CIRCLE1 then
		local v14 = p10.humanoidRootPart.CFrame;
	else
		local l__CoordinateFrame__15 = p10.camera.CoordinateFrame;
		v14 = l__CoordinateFrame__15 - l__CoordinateFrame__15.Position + p10.humanoidRootPart.Position;
	end;
	p11[#p11 + 1] = v14.Position;
	for v16 = 0, 9 do
		local v17 = 2 * math.pi / 10 * v16;
		p11[#p11 + 1] = v14 * (3 * Vector3.new(math.cos(v17), math.sin(v17), 0));
	end;
end;
function v3.LimbMoveBehavior(p12, p13)
	p12:LimbBehavior(p13);
	p12:MoveBehavior(p13);
end;
function v3.CharacterOutlineBehavior(p14, p15)
	local l__unit__18 = p14.torsoPart.CFrame.upVector.unit;
	local l__unit__19 = p14.torsoPart.CFrame.rightVector.unit;
	p15[#p15 + 1] = p14.torsoPart.CFrame.p;
	p15[#p15 + 1] = p14.torsoPart.CFrame.p + l__unit__18;
	p15[#p15 + 1] = p14.torsoPart.CFrame.p - l__unit__18;
	p15[#p15 + 1] = p14.torsoPart.CFrame.p + l__unit__19;
	p15[#p15 + 1] = p14.torsoPart.CFrame.p - l__unit__19;
	if p14.headPart then
		p15[#p15 + 1] = p14.headPart.CFrame.p;
	end;
	local v20 = CFrame.new(u1, Vector3.new(p14.camera.CoordinateFrame.lookVector.X, 0, p14.camera.CoordinateFrame.lookVector.Z));
	local v21 = p14.torsoPart and p14.torsoPart.Position or p14.humanoidRootPart.Position;
	local v22 = { p14.torsoPart };
	if p14.headPart then
		v22[#v22 + 1] = p14.headPart;
	end;
	for v23 = 1, 24 do
		local v24 = 2 * math.pi * v23 / 24;
		local v25 = v20 * (3 * Vector3.new(math.cos(v24), math.sin(v24), 0));
		local v26 = Vector3.new(v25.X, math.max(v25.Y, -2.25), v25.Z);
		local v27, v28 = game.Workspace:FindPartOnRayWithWhitelist(Ray.new(v21 + v26, -3 * v26), v22, false, false);
		if v27 then
			p15[#p15 + 1] = v28 + 0.2 * (v21 - v28).unit;
		end;
	end;
end;
local u4 = 2 * math.pi / 24;
local function u5(p16, p17, p18, p19)
	local v29 = p17:Cross(p19);
	local v30 = p18.x - p16.x;
	local v31 = p18.y - p16.y;
	local v32 = p18.z - p16.z;
	local l__y__33 = p17.y;
	local v34 = -p19.y;
	local l__y__35 = v29.y;
	local l__z__36 = p17.z;
	local v37 = -p19.z;
	local l__z__38 = v29.z;
	local v39 = p17.x * (v34 * l__z__38 - l__y__35 * v37) - -p19.x * (l__y__33 * l__z__38 - l__y__35 * l__z__36) + v29.x * (l__y__33 * v37 - v34 * l__z__36);
	if v39 == 0 then
		return u1;
	end;
	local v40 = -p19.y;
	local l__y__41 = v29.y;
	local v42 = -p19.z;
	local l__z__43 = v29.z;
	local l__y__44 = p17.y;
	local l__y__45 = v29.y;
	local l__z__46 = p17.z;
	local l__z__47 = v29.z;
	local v48 = p16 + (v30 * (v40 * l__z__43 - l__y__41 * v42) - -p19.x * (v31 * l__z__43 - l__y__41 * v32) + v29.x * (v31 * v42 - v40 * v32)) / v39 * p17;
	local v49 = p18 + (p17.x * (v31 * l__z__47 - l__y__45 * v32) - v30 * (l__y__44 * l__z__47 - l__y__45 * l__z__46) + v29.x * (l__y__44 * v32 - v31 * l__z__46)) / v39 * p19;
	if (v49 - v48).Magnitude < 0.25 then
		return v48 + 0.5 * (v49 - v48);
	end;
	return u1;
end;
function v3.SmartCircleBehavior(p20, p21)
	local l__unit__50 = p20.torsoPart.CFrame.upVector.unit;
	local l__unit__51 = p20.torsoPart.CFrame.rightVector.unit;
	p21[#p21 + 1] = p20.torsoPart.CFrame.p;
	p21[#p21 + 1] = p20.torsoPart.CFrame.p + l__unit__50;
	p21[#p21 + 1] = p20.torsoPart.CFrame.p - l__unit__50;
	p21[#p21 + 1] = p20.torsoPart.CFrame.p + l__unit__51;
	p21[#p21 + 1] = p20.torsoPart.CFrame.p - l__unit__51;
	if p20.headPart then
		p21[#p21 + 1] = p20.headPart.CFrame.p;
	end;
	local v52 = p20.camera.CFrame - p20.camera.CFrame.p;
	local v53 = Vector3.new(0, 0.5, 0) + (p20.torsoPart and p20.torsoPart.Position or p20.humanoidRootPart.Position);
	for v54 = 1, 24 do
		local v55 = u4 * v54 - 0.5 * math.pi;
		local v56 = v53 + v52 * (2.5 * Vector3.new(math.cos(v55), math.sin(v55), 0));
		local v57 = v56 - p20.camera.CFrame.p;
		local v58, v59, v60 = game.Workspace:FindPartOnRayWithIgnoreList(Ray.new(v53, v56 - v53), { p20.char }, false, false);
		local v61 = v56;
		if v58 then
			local v62 = v59 + 0.1 * v60.unit;
			local v63 = v62 - v53;
			local l__unit__64 = v63:Cross(v57).unit:Cross(v60).unit;
			if v63.unit:Dot(-l__unit__64) < v63.unit:Dot((v62 - p20.camera.CFrame.p).unit) then
				v61 = u5(v62, l__unit__64, v56, v57);
				if v61.Magnitude > 0 then
					local v65, v66, v67 = game.Workspace:FindPartOnRayWithIgnoreList(Ray.new(v62, v61 - v62), { p20.char }, false, false);
					if v65 then
						v61 = v66 + 0.1 * v67.unit;
					end;
				else
					v61 = v62;
				end;
			else
				v61 = v62;
			end;
			local v68, v69, v70 = game.Workspace:FindPartOnRayWithIgnoreList(Ray.new(v53, v61 - v53), { p20.char }, false, false);
			if v68 then
				v61 = v69 - 0.1 * (v61 - v53).unit;
			end;
		end;
		p21[#p21 + 1] = v61;
	end;
end;
function v3.CheckTorsoReference(p22)
	if p22.char then
		p22.torsoPart = p22.char:FindFirstChild("Torso");
		if not p22.torsoPart then
			p22.torsoPart = p22.char:FindFirstChild("UpperTorso");
			if not p22.torsoPart then
				p22.torsoPart = p22.char:FindFirstChild("HumanoidRootPart");
			end;
		end;
		p22.headPart = p22.char:FindFirstChild("Head");
	end;
end;
local u6 = {
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
function v3.CharacterAdded(p23, p24, p25)
	if p25 ~= l__Players__1.LocalPlayer then
		return;
	end;
	if p23.childAddedConn then
		p23.childAddedConn:Disconnect();
		p23.childAddedConn = nil;
	end;
	if p23.childRemovedConn then
		p23.childRemovedConn:Disconnect();
		p23.childRemovedConn = nil;
	end;
	p23.char = p24;
	p23.trackedLimbs = {};
	p23.childAddedConn = p24.ChildAdded:Connect(function(p26)
		if p26:IsA("BasePart") then
			if u6[p26.Name] then
				p23.trackedLimbs[p26] = true;
			end;
			if p26.Name == "Torso" or p26.Name == "UpperTorso" then
				p23.torsoPart = p26;
			end;
			if p26.Name == "Head" then
				p23.headPart = p26;
			end;
		end;
	end);
	p23.childRemovedConn = p24.ChildRemoved:Connect(function(p27)
		p23.trackedLimbs[p27] = nil;
		p23:CheckTorsoReference();
	end);
	for v71, v72 in pairs(p23.char:GetChildren()) do
		if v72:IsA("BasePart") then
			if u6[v72.Name] then
				p23.trackedLimbs[v72] = true;
			end;
			if v72.Name == "Torso" or v72.Name == "UpperTorso" then
				p23.torsoPart = v72;
			end;
			if v72.Name == "Head" then
				p23.headPart = v72;
			end;
		end;
	end;
end;
local function u7(p28, ...)
	local v73 = {};
	local v74 = "";
	for v75, v76 in pairs({ ... }) do
		v73[v76] = true;
		if v74 == "" then
			local v77 = "";
		else
			v77 = " or ";
		end;
		v74 = v74 .. v77 .. v76;
	end;
	local v78 = type(p28);
	assert(v73[v78], v74 .. " type expected, got: " .. v78);
end;
function v3.SetMode(p29, p30)
	u7(p30, "number");
	for v79, v80 in pairs(u2) do
		if v80 == p30 then
			p29.mode = p30;
			p29.behaviorFunction = p29.behaviors[p29.mode];
			return;
		end;
	end;
	error("Invalid mode number");
end;
function v3.GetObscuredParts(p31)
	return p31.savedHits;
end;
function v3.Cleanup(p32)
	for v81, v82 in pairs(p32.savedHits) do
		v81.LocalTransparencyModifier = v82;
	end;
end;
function v3.Update(p33, p34, p35, p36)
	local v83 = nil;
	if not p33.enabled or not p33.char then
		return p35, p36;
	end;
	p33.camera = game.Workspace.CurrentCamera;
	if not p33.humanoidRootPart then
		local v84 = p33.char:FindFirstChildOfClass("Humanoid");
		if v84 and v84.RootPart then
			p33.humanoidRootPart = v84.RootPart;
		else
			p33.humanoidRootPart = p33.char:FindFirstChild("HumanoidRootPart");
			if not p33.humanoidRootPart then
				return p35, p36;
			end;
		end;
		local u8 = nil;
		u8 = p33.humanoidRootPart.AncestryChanged:Connect(function(p37, p38)
			if p37 == p33.humanoidRootPart and not p38 then
				p33.humanoidRootPart = nil;
				if u8 and u8.Connected then
					u8:Disconnect();
					u8 = nil;
				end;
			end;
		end);
	end;
	if not p33.torsoPart then
		p33:CheckTorsoReference();
		if not p33.torsoPart then
			return p35, p36;
		end;
	end;
	local v85 = {};
	p33:behaviorFunction(v85);
	local v86 = { p33.char };
	local u9 = {};
	local v87 = 0;
	local v88 = {};
	local v89 = 0.75;
	local v90 = 0.75;
	local v91 = p33.camera:GetPartsObscuringTarget({ p33.headPart and p33.headPart.CFrame.p or v85[1], p33.torsoPart and p33.torsoPart.CFrame.p or v85[2] }, v86);
	for v92 = 1, #v91 do
		local v93 = v91[v92];
		v83 = v87 + 1;
		v88[v93] = true;
		for v94, v95 in pairs(v93:GetChildren()) do
			if v95:IsA("Decal") then
				v83 = v83 + 1;
				break;
			end;
			if v95:IsA("Texture") then
				v83 = v83 + 1;
				break;
			end;
		end;
	end;
	if v83 > 0 then
		v89 = math.pow(0.375 + 0.375 / v83, 1 / v83);
		v90 = math.pow(0.25 + 0.25 / v83, 1 / v83);
	end;
	local v96 = p33.camera:GetPartsObscuringTarget(v85, v86);
	local v97 = {};
	for v98 = 1, #v96 do
		local v99 = v96[v98];
		v97[v99] = v88[v99] and v89 or v90;
		if v99.Transparency < v97[v99] then
			u9[v99] = true;
			if not p33.savedHits[v99] then
				p33.savedHits[v99] = v99.LocalTransparencyModifier;
			end;
		end;
		for v100, v101 in pairs(v99:GetChildren()) do
			if (v101:IsA("Decal") or v101:IsA("Texture")) and v101.Transparency < v97[v99] then
				v97[v101] = v97[v99];
				u9[v101] = true;
				if not p33.savedHits[v101] then
					p33.savedHits[v101] = v101.LocalTransparencyModifier;
				end;
			end;
		end;
	end;
	for v102, v103 in pairs(p33.savedHits) do
		if u9[v102] then
			v102.LocalTransparencyModifier = v102.Transparency < 1 and (v97[v102] - v102.Transparency) / (1 - v102.Transparency) or 0;
		else
			v102.LocalTransparencyModifier = v103;
			p33.savedHits[v102] = nil;
		end;
	end;
	return p35, p36;
end;
return v3;
