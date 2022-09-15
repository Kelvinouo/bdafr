-- Decompiled with the Synapse X Luau decompiler.

local v1 = Vector3.new(0.05, 0.05, 0.05);
local v2 = Color3.new(1, 1, 1);
local v3 = Vector3.new(0, -1, 0);
local v4 = NumberSequence.new(10);
local v5 = NumberRange.new(0.8);
local v6 = NumberSequence.new({ NumberSequenceKeypoint.new(0, 5.33, 2.75), NumberSequenceKeypoint.new(1, 5.33, 2.75) });
local v7 = NumberRange.new(0.8);
local v8 = NumberRange.new(0, 360);
local v9 = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.4, 3), NumberSequenceKeypoint.new(1, 0) });
local v10 = NumberRange.new(0.1, 0.15);
local v11 = NumberRange.new(0, 360);
local v12 = Vector2.new(10, 10);
local v13 = {
	None = 0, 
	Whitelist = 1, 
	Blacklist = 2, 
	Function = 3
};
local l__Players__14 = game:GetService("Players");
local l__TweenService__15 = game:GetService("TweenService");
local l__RunService__16 = game:GetService("RunService");
local v17 = Instance.new("NumberValue");
v17.Value = 1;
local l__None__18 = v13.None;
local v19 = NumberSequenceKeypoint.new(0, 1, 0);
local v20 = NumberSequenceKeypoint.new(1, 1, 0);
local v21 = {};
for v22, v23 in pairs({ Vector3.new(0.141421363, 0, 0.141421363), Vector3.new(-0.141421363, 0, 0.141421363), Vector3.new(-0.141421363, 0, -0.141421363), Vector3.new(0.141421363, 0, -0.141421363), Vector3.new(0.400000006, 0, 0), Vector3.new(0.282842726, 0, 0.282842726), Vector3.new(2.44929371E-17, 0, 0.400000006), Vector3.new(-0.282842726, 0, 0.282842726), Vector3.new(-0.400000006, 0, 4.89858741E-17), Vector3.new(-0.282842726, 0, -0.282842726), Vector3.new(-7.34788045E-17, 0, -0.400000006), Vector3.new(0.282842726, 0, -0.282842726), Vector3.new(0.600000024, 0, 0), Vector3.new(0.485410213, 0, 0.352671146), Vector3.new(0.185410202, 0, 0.570633948), Vector3.new(-0.185410202, 0, 0.570633948), Vector3.new(-0.485410213, 0, 0.352671146), Vector3.new(-0.600000024, 0, 7.34788112E-17), Vector3.new(-0.485410213, 0, -0.352671146), Vector3.new(-0.185410202, 0, -0.570633948), Vector3.new(0.185410202, 0, -0.570633948), Vector3.new(0.485410213, 0, -0.352671146), Vector3.new(0.772740662, 0, 0.207055241), Vector3.new(0.565685451, 0, 0.565685451), Vector3.new(0.207055241, 0, 0.772740662), Vector3.new(-0.207055241, 0, 0.772740662), Vector3.new(-0.565685451, 0, 0.565685451), Vector3.new(-0.772740662, 0, 0.207055241), Vector3.new(-0.772740662, 0, -0.207055241), Vector3.new(-0.565685451, 0, -0.565685451), Vector3.new(-0.207055241, 0, -0.772740662), Vector3.new(0.207055241, 0, -0.772740662), Vector3.new(0.565685451, 0, -0.565685451), Vector3.new(0.772740662, 0, -0.207055241) }) do
	table.insert(v21, v23 * 35);
end;
table.sort(v21, function(p1, p2)
	return p1.magnitude < p2.magnitude;
end);
local v24 = Instance.new("SoundGroup");
v24.Name = "__RainSoundGroup";
v24.Volume = 0.2;
v24.Archivable = false;
local v25 = Instance.new("Sound");
v25.Name = "RainSound";
v25.Volume = 0;
v25.SoundId = "rbxassetid://1516791621";
v25.Looped = true;
v25.SoundGroup = v24;
v25.Parent = v24;
v25.Archivable = false;
local v26 = Instance.new("Part");
v26.Transparency = 1;
v26.Anchored = true;
v26.CanCollide = false;
v26.Locked = false;
v26.Archivable = false;
v26.TopSurface = Enum.SurfaceType.Smooth;
v26.BottomSurface = Enum.SurfaceType.Smooth;
v26.Name = "__RainEmitter";
v26.Size = v1;
v26.Archivable = false;
local v27 = Instance.new("ParticleEmitter");
v27.Name = "RainStraight";
v27.LightEmission = 0.05;
v27.LightInfluence = 0.9;
v27.Size = v4;
v27.Texture = "rbxassetid://1822883048";
v27.LockedToPart = true;
v27.Enabled = false;
v27.Lifetime = v5;
v27.Rate = 600;
v27.Speed = NumberRange.new(60);
v27.EmissionDirection = Enum.NormalId.Bottom;
v27.Parent = v26;
local v28 = Instance.new("ParticleEmitter");
v28.Name = "RainTopDown";
v28.LightEmission = 0.05;
v28.LightInfluence = 0.9;
v28.Size = v6;
v28.Texture = "rbxassetid://1822856633";
v28.LockedToPart = true;
v28.Enabled = false;
v28.Rotation = v8;
v28.Lifetime = v7;
v28.Rate = 600;
v28.Speed = NumberRange.new(60);
v28.EmissionDirection = Enum.NormalId.Bottom;
v28.Parent = v26;
local v29 = {};
local v30 = {};
for v31 = 1, 20 do
	local v32 = Instance.new("Attachment");
	v32.Name = "__RainSplashAttachment";
	local v33 = Instance.new("ParticleEmitter");
	v33.LightEmission = 0.05;
	v33.LightInfluence = 0.9;
	v33.Size = v9;
	v33.Texture = "rbxassetid://1822856633";
	v33.Rotation = v11;
	v33.Lifetime = v10;
	v33.Transparency = NumberSequence.new({ v19, NumberSequenceKeypoint.new(0.25, 0.6, 0), NumberSequenceKeypoint.new(0.75, 0.6, 0), v20 });
	v33.Enabled = false;
	v33.Rate = 0;
	v33.Speed = NumberRange.new(0);
	v33.Name = "RainSplash";
	v33.Parent = v32;
	v32.Archivable = false;
	table.insert(v29, v32);
	local v34 = Instance.new("Attachment");
	v34.Name = "__RainOccludedAttachment";
	local v35 = v26.RainStraight:Clone();
	v35.Speed = NumberRange.new(70, 100);
	v35.SpreadAngle = v12;
	v35.LockedToPart = false;
	v35.Enabled = false;
	v35.Parent = v34;
	local v36 = v26.RainTopDown:Clone();
	v36.Speed = NumberRange.new(70, 100);
	v36.SpreadAngle = v12;
	v36.LockedToPart = false;
	v36.Enabled = false;
	v36.Parent = v34;
	v34.Archivable = false;
	table.insert(v30, v34);
end;
local v37 = {};
local u1 = { v26 };
v37[v13.None] = function(p3, p4)
	if p4 then
		local v38 = { v26, l__Players__14.LocalPlayer and l__Players__14.LocalPlayer.Character } or u1;
	else
		v38 = u1;
	end;
	return workspace:FindPartOnRayWithIgnoreList(p3, v38);
end;
local u2 = nil;
v37[v13.Blacklist] = function(p5)
	return workspace:FindPartOnRayWithIgnoreList(p5, u2);
end;
v37[v13.Whitelist] = function(p6)
	return workspace:FindPartOnRayWithWhitelist(p6, u2);
end;
local u3 = nil;
v37[v13.Function] = function(p7)
	local v39 = p7.Origin + p7.Direction;
	while p7.Direction.magnitude > 0.001 do
		local v40, v41, v42, v43 = workspace:FindPartOnRayWithIgnoreList(p7, u1);
		if not v40 then
			return v40, v41, v42, v43;
		end;
		if u3(v40) then
			return v40, v41, v42, v43;
		end;
		local v44 = v41 + p7.Direction.Unit * 0.001;
		p7 = Ray.new(v44, v39 - v44);	
	end;
end;
local u4 = {};
local u5 = v37[l__None__18];
local u6 = v3;
local u7 = nil;
local u8 = 0;
local u9 = true;
local l__Vector3_new__10 = Vector3.new;
local u11 = 1;
local u12 = 1;
local u13 = 0;
local u14 = 0;
local function u15()
	if #u4 > 0 then
		for v45, v46 in pairs(u4) do
			v46:disconnect();
		end;
		u4 = {};
	end;
end;
local function u16(p8)
	u8 = 0;
	local v47 = l__TweenService__15:Create(v25, p8, {
		Volume = 0
	});
	v47.Completed:connect(function(p9)
		if p9 == Enum.PlaybackState.Completed then
			v25:Stop();
		end;
		v47:Destroy();
	end);
	v47:Play();
end;
local function v48(p10)
	local v49 = ColorSequence.new(p10);
	v26.RainStraight.Color = v49;
	v26.RainTopDown.Color = v49;
	for v50, v51 in pairs(v29) do
		v51.RainSplash.Color = v49;
	end;
	for v52, v53 in pairs(v30) do
		v53.RainStraight.Color = v49;
		v53.RainTopDown.Color = v49;
	end;
end;
local v54 = Instance.new("Color3Value");
if v2 then
	v54.Value = v2;
end;
v54.Changed:connect(v48);
v48(v54.Value);
local function v55(p11)
	local v56 = (1 - p11) * (1 - v17.Value);
	local v57 = 1 - v56;
	u11 = 0.7 * v56 + v57;
	u12 = 0.85 * v56 + v57;
	local v58 = NumberSequence.new({ v19, NumberSequenceKeypoint.new(0.25, v56 * 0.6 + v57, 0), NumberSequenceKeypoint.new(0.75, v56 * 0.6 + v57, 0), v20 });
	for v59, v60 in pairs(v29) do
		v60.RainSplash.Transparency = v58;
	end;
end;
local v61 = Instance.new("NumberValue");
v61.Value = 0;
v61.Changed:connect(v55);
v55(v61.Value);
v17.Changed:connect(v55);
local function v62(p12)
	v26.RainStraight.Speed = NumberRange.new(p12 * 60);
	v26.RainTopDown.Speed = NumberRange.new(p12 * 60);
end;
local v63 = Instance.new("NumberValue");
v63.Value = 1;
v63.Changed:connect(v62);
v62(v63.Value);
local function v64(p13)
	v26.RainStraight.Rate = 600 * p13;
	v26.RainTopDown.Rate = 600 * p13;
	u14 = math.ceil(2 * p13);
	u13 = 20 * p13;
end;
local v65 = Instance.new("NumberValue");
v65.Value = 1;
v65.Changed:connect(v64);
v64(v65.Value);
local function v66(p14)
	v26.RainStraight.LightEmission = p14;
	v26.RainTopDown.LightEmission = p14;
	for v67, v68 in pairs(v30) do
		v68.RainStraight.LightEmission = p14;
		v68.RainTopDown.LightEmission = p14;
	end;
	for v69, v70 in pairs(v29) do
		v70.RainSplash.LightEmission = p14;
	end;
end;
local v71 = Instance.new("NumberValue");
v71.Value = 0.05;
v71.Changed:connect(v66);
v66(v71.Value);
local function v72(p15)
	v26.RainStraight.LightInfluence = p15;
	v26.RainTopDown.LightInfluence = p15;
	for v73, v74 in pairs(v30) do
		v74.RainStraight.LightInfluence = p15;
		v74.RainTopDown.LightInfluence = p15;
	end;
	for v75, v76 in pairs(v29) do
		v76.RainSplash.LightInfluence = p15;
	end;
end;
local v77 = Instance.new("NumberValue");
v77.Value = 0.9;
v77.Changed:connect(v72);
v72(v77.Value);
local function v78(p16)
	if p16.magnitude > 0.001 then
		u6 = p16.unit;
	end;
end;
local v79 = Instance.new("Vector3Value");
if v3 then
	v79.Value = v3;
end;
v79.Changed:connect(v78);
v78(v79.Value);
local v80 = {
	CollisionMode = v13
};
local function u17()
	local v81 = Random.new();
	local u18 = 6;
	local u19 = true;
	table.insert(u4, l__RunService__16.RenderStepped:connect(function()
		local v82, v83 = u5(Ray.new(workspace.CurrentCamera.CFrame.p, -u6 * 1000), true);
		if not (not u7) and not (workspace.CurrentCamera.CFrame.p.y <= u7) or not (not v82) then
			v26.RainStraight.Enabled = false;
			v26.RainTopDown.Enabled = false;
			u19 = true;
			return;
		end;
		if u8 < 1 and not u9 then
			u8 = 1;
			l__TweenService__15:Create(v25, TweenInfo.new(0.5), {
				Volume = 1
			}):Play();
		end;
		u18 = 6;
		local v84 = math.abs(workspace.CurrentCamera.CFrame.lookVector:Dot(u6));
		local l__p__85 = workspace.CurrentCamera.CFrame.p;
		local v86 = workspace.CurrentCamera.CFrame.lookVector:Cross(-u6);
		local v87 = v86.magnitude > 0.001 and v86.unit or -u6;
		local l__unit__88 = u6:Cross(v87).unit;
		v26.Size = l__Vector3_new__10(40, 40, 40 + (1 - v84) * 60);
		v26.CFrame = CFrame.new(l__p__85.x, l__p__85.y, l__p__85.z, v87.x, -u6.x, l__unit__88.x, v87.y, -u6.y, l__unit__88.y, v87.z, -u6.z, l__unit__88.z) + (1 - v84) * workspace.CurrentCamera.CFrame.lookVector * v26.Size.Z / 3 - v84 * u6 * 20;
		v26.RainStraight.Enabled = true;
		v26.RainTopDown.Enabled = true;
		u19 = false;
	end));
	table.insert(u4, (l__RunService__16:IsRunning() and l__RunService__16.Stepped or l__RunService__16.RenderStepped):connect(function()
		u18 = u18 + 1;
		if u18 >= 6 then
			local v89 = math.abs(workspace.CurrentCamera.CFrame.lookVector:Dot(u6));
			local v90 = NumberSequence.new({ v19, NumberSequenceKeypoint.new(0.25, (1 - v89) * u11 + v89, 0), NumberSequenceKeypoint.new(0.75, (1 - v89) * u11 + v89, 0), v20 });
			local v91 = NumberSequence.new({ v19, NumberSequenceKeypoint.new(0.25, v89 * u12 + (1 - v89), 0), NumberSequenceKeypoint.new(0.75, v89 * u12 + (1 - v89), 0), v20 });
			local v92 = workspace.Camera.CFrame:inverse() * (workspace.Camera.CFrame.p - u6);
			local v93 = NumberRange.new(math.deg(math.atan2(-v92.x, v92.y)));
			if u19 then
				for v94, v95 in pairs(v30) do
					v95.RainStraight.Transparency = v90;
					v95.RainStraight.Rotation = v93;
					v95.RainTopDown.Transparency = v91;
				end;
				if not u9 then
					local v96 = 0;
					if not u7 or workspace.CurrentCamera.CFrame.p.y <= u7 then
						local v97 = 35;
						local v98 = -u6 * 1000;
						for v99 = 1, #v21 do
							if not u5(Ray.new(workspace.CurrentCamera.CFrame * v21[v99], v98), true) then
								v97 = v21[v99].magnitude;
								break;
							end;
						end;
						v96 = 1 - v97 / 35;
					end;
					if math.abs(v96 - u8) > 0.01 then
						u8 = v96;
						l__TweenService__15:Create(v25, TweenInfo.new(1), {
							Volume = u8
						}):Play();
					end;
				end;
			else
				v26.RainStraight.Transparency = v90;
				v26.RainStraight.Rotation = v93;
				v26.RainTopDown.Transparency = v91;
			end;
			u18 = 0;
		end;
		local l__p__100 = workspace.CurrentCamera.CFrame.p;
		local v101 = workspace.CurrentCamera.CFrame.lookVector:Cross(-u6);
		local v102 = v101.magnitude > 0.001 and v101.unit or -u6;
		local l__unit__103 = u6:Cross(v102).unit;
		local v104 = CFrame.new(l__p__100.x, l__p__100.y, l__p__100.z, v102.x, -u6.x, l__unit__103.x, v102.y, -u6.y, l__unit__103.y, v102.z, -u6.z, l__unit__103.z);
		local v105 = u6 * 550;
		for v106 = 1, u13 do
			local v107 = v29[v106];
			local v108 = v30[v106];
			local v109 = v81:NextNumber(-100, 100);
			local v110 = v81:NextNumber(-100, 100);
			local v111, v112, v113 = u5(Ray.new(v104 * l__Vector3_new__10(v109, 500, v110), v105));
			if v111 then
				v107.Position = v112 + v113 * 0.5;
				v107.RainSplash:Emit(1);
				if u19 then
					local v114 = v112 - u6 * 50;
					if u7 and u7 < v114.Y and u6.Y < 0 then
						v114 = v114 + u6 * (u7 - v114.Y) / u6.Y;
					end;
					v108.CFrame = v104 - v104.p + v114;
					v108.RainStraight:Emit(u14);
					v108.RainTopDown:Emit(u14);
				end;
			elseif u19 then
				local v115 = v104 * l__Vector3_new__10(v109, v81:NextNumber(20, 100), v110);
				if u7 and u7 < v115.Y and u6.Y < 0 then
					v115 = v115 + u6 * (u7 - v115.Y) / u6.Y;
				end;
				v108.CFrame = v104 - v104.p + v115;
				v108.RainStraight:Emit(u14);
				v108.RainTopDown:Emit(u14);
			end;
		end;
	end));
end;
function v80.Enable(p17, p18)
	if p18 ~= nil and typeof(p18) ~= "TweenInfo" then
		error("bad argument #1 to 'Enable' (TweenInfo expected, got " .. typeof(p18) .. ")", 2);
	end;
	u15();
	v26.RainStraight.Enabled = true;
	v26.RainTopDown.Enabled = true;
	v26.Parent = workspace.CurrentCamera;
	for v116 = 1, 20 do
		v29[v116].Parent = workspace.Terrain;
		v30[v116].Parent = workspace.Terrain;
	end;
	if l__RunService__16:IsRunning() then
		v24.Parent = game:GetService("SoundService");
	end;
	u17();
	if p18 then
		l__TweenService__15:Create(v17, p18, {
			Value = 0
		}):Play();
	else
		v17.Value = 0;
	end;
	if not v25.Playing then
		v25:Play();
		v25.TimePosition = math.random() * v25.TimeLength;
	end;
	u9 = false;
end;
function v80.Disable(p19, p20)
	if p20 ~= nil and typeof(p20) ~= "TweenInfo" then
		error("bad argument #1 to 'Disable' (TweenInfo expected, got " .. typeof(p20) .. ")", 2);
	end;
	if p20 then
		local v117 = l__TweenService__15:Create(v17, p20, {
			Value = 1
		});
		v117.Completed:connect(function(p21)
			if p21 == Enum.PlaybackState.Completed then
				u15();
				v26.RainStraight.Enabled = false;
				v26.RainTopDown.Enabled = false;
				v26.Size = v1;
				if not u9 then
					u16(TweenInfo.new(1));
				end;
			end;
			v117:Destroy();
		end);
		v117:Play();
		u16(p20);
	else
		v17.Value = 1;
		u15();
		v26.RainStraight.Enabled = false;
		v26.RainTopDown.Enabled = false;
		v26.Size = v1;
		if not u9 then
			u16(TweenInfo.new(1));
		end;
	end;
	u9 = true;
end;
function v80.SetColor(p22, p23, p24)
	if typeof(p23) ~= "Color3" then
		error("bad argument #1 to 'SetColor' (Color3 expected, got " .. typeof(p23) .. ")", 2);
	elseif p24 ~= nil and typeof(p24) ~= "TweenInfo" then
		error("bad argument #2 to 'SetColor' (TweenInfo expected, got " .. typeof(p24) .. ")", 2);
	end;
	if not p24 then
		v54.Value = p23;
		return;
	end;
	l__TweenService__15:Create(v54, p24, {
		Value = p23
	}):Play();
end;
local u20 = "SetTransparency";
function v80.SetTransparency(p25, p26, p27)
	if typeof(p26) ~= "number" then
		error("bad argument #1 to '" .. u20 .. "' (number expected, got " .. typeof(p26) .. ")", 2);
	elseif p27 ~= nil and typeof(p27) ~= "TweenInfo" then
		error("bad argument #2 to '" .. u20 .. "' (TweenInfo expected, got " .. typeof(p27) .. ")", 2);
	end;
	p26 = math.clamp(p26, 0, 1);
	if not p27 then
		v61.Value = p26;
		return;
	end;
	l__TweenService__15:Create(v61, p27, {
		Value = p26
	}):Play();
end;
u20 = "SetSpeedRatio";
function v80.SetSpeedRatio(p28, p29, p30)
	if typeof(p29) ~= "number" then
		error("bad argument #1 to '" .. u20 .. "' (number expected, got " .. typeof(p29) .. ")", 2);
	elseif p30 ~= nil and typeof(p30) ~= "TweenInfo" then
		error("bad argument #2 to '" .. u20 .. "' (TweenInfo expected, got " .. typeof(p30) .. ")", 2);
	end;
	p29 = math.clamp(p29, 0, 1);
	if not p30 then
		v63.Value = p29;
		return;
	end;
	l__TweenService__15:Create(v63, p30, {
		Value = p29
	}):Play();
end;
u20 = "SetIntensityRatio";
function v80.SetIntensityRatio(p31, p32, p33)
	if typeof(p32) ~= "number" then
		error("bad argument #1 to '" .. u20 .. "' (number expected, got " .. typeof(p32) .. ")", 2);
	elseif p33 ~= nil and typeof(p33) ~= "TweenInfo" then
		error("bad argument #2 to '" .. u20 .. "' (TweenInfo expected, got " .. typeof(p33) .. ")", 2);
	end;
	p32 = math.clamp(p32, 0, 1);
	if not p33 then
		v65.Value = p32;
		return;
	end;
	l__TweenService__15:Create(v65, p33, {
		Value = p32
	}):Play();
end;
u20 = "SetLightEmission";
function v80.SetLightEmission(p34, p35, p36)
	if typeof(p35) ~= "number" then
		error("bad argument #1 to '" .. u20 .. "' (number expected, got " .. typeof(p35) .. ")", 2);
	elseif p36 ~= nil and typeof(p36) ~= "TweenInfo" then
		error("bad argument #2 to '" .. u20 .. "' (TweenInfo expected, got " .. typeof(p36) .. ")", 2);
	end;
	p35 = math.clamp(p35, 0, 1);
	if not p36 then
		v71.Value = p35;
		return;
	end;
	l__TweenService__15:Create(v71, p36, {
		Value = p35
	}):Play();
end;
u20 = "SetLightInfluence";
function v80.SetLightInfluence(p37, p38, p39)
	if typeof(p38) ~= "number" then
		error("bad argument #1 to '" .. u20 .. "' (number expected, got " .. typeof(p38) .. ")", 2);
	elseif p39 ~= nil and typeof(p39) ~= "TweenInfo" then
		error("bad argument #2 to '" .. u20 .. "' (TweenInfo expected, got " .. typeof(p39) .. ")", 2);
	end;
	p38 = math.clamp(p38, 0, 1);
	if not p39 then
		v77.Value = p38;
		return;
	end;
	l__TweenService__15:Create(v77, p39, {
		Value = p38
	}):Play();
end;
function v80.SetVolume(p40, p41, p42)
	if typeof(p41) ~= "number" then
		error("bad argument #1 to 'SetVolume' (number expected, got " .. typeof(p41) .. ")", 2);
	elseif p42 ~= nil and typeof(p42) ~= "TweenInfo" then
		error("bad argument #2 to 'SetVolume' (TweenInfo expected, got " .. typeof(p42) .. ")", 2);
	end;
	if not p42 then
		v24.Volume = p41;
		return;
	end;
	l__TweenService__15:Create(v24, p42, {
		Volume = p41
	}):Play();
end;
function v80.SetDirection(p43, p44, p45)
	if typeof(p44) ~= "Vector3" then
		error("bad argument #1 to 'SetDirection' (Vector3 expected, got " .. typeof(p44) .. ")", 2);
	elseif p45 ~= nil and typeof(p45) ~= "TweenInfo" then
		error("bad argument #2 to 'SetDirection' (TweenInfo expected, got " .. typeof(p45) .. ")", 2);
	end;
	if not (p44.unit.magnitude > 0) then
		warn("Attempt to set rain direction to a zero-length vector, falling back on default direction = (" .. tostring(v3) .. ")");
		p44 = v3;
	end;
	if not p45 then
		v79.Value = p44;
		return;
	end;
	l__TweenService__15:Create(v79, p45, {
		Value = p44
	}):Play();
end;
function v80.SetCeiling(p46, p47)
	if p47 ~= nil and typeof(p47) ~= "number" then
		error("bad argument #1 to 'SetCeiling' (number expected, got " .. typeof(p47) .. ")", 2);
	end;
	u7 = p47;
end;
function v80.SetStraightTexture(p48, p49)
	if typeof(p49) ~= "string" then
		error("bad argument #1 to 'SetStraightTexture' (string expected, got " .. typeof(p49) .. ")", 2);
	end;
	v26.RainStraight.Texture = p49;
	for v118, v119 in pairs(v30) do
		v119.RainStraight.Texture = p49;
	end;
end;
function v80.SetTopDownTexture(p50, p51)
	if typeof(p51) ~= "string" then
		error("bad argument #1 to 'SetStraightTexture' (string expected, got " .. typeof(p51) .. ")", 2);
	end;
	v26.RainTopDown.Texture = p51;
	for v120, v121 in pairs(v30) do
		v121.RainTopDown.Texture = p51;
	end;
end;
function v80.SetSplashTexture(p52, p53)
	if typeof(p53) ~= "string" then
		error("bad argument #1 to 'SetStraightTexture' (string expected, got " .. typeof(p53) .. ")", 2);
	end;
	for v122, v123 in pairs(v29) do
		v123.RainSplash.Texture = p53;
	end;
end;
function v80.SetSize(p54, p55)
	v26.RainStraight.Size = NumberSequence.new(p55);
	for v124, v125 in pairs(v30) do
		v125.RainStraight.Size = NumberSequence.new(p55);
	end;
end;
function v80.SetSoundId(p56, p57)
	if typeof(p57) ~= "string" then
		error("bad argument #1 to 'SetSoundId' (string expected, got " .. typeof(p57) .. ")", 2);
	end;
	v25.SoundId = p57;
end;
local u21 = l__None__18;
function v80.SetCollisionMode(p58, p59, p60)
	if p59 == v13.None then
		u2 = nil;
		u3 = nil;
	elseif p59 == v13.Blacklist then
		if typeof(p60) == "Instance" then
			u2 = { p60, v26 };
		elseif typeof(p60) == "table" then
			for v126 = 1, #p60 do
				if typeof(p60[v126]) ~= "Instance" then
					error("bad argument #2 to 'SetCollisionMode' (blacklist contained a " .. typeof(p60[v126]) .. " on index " .. tostring(v126) .. " which is not an Instance)", 2);
				end;
			end;
			u2 = { v26 };
			for v127 = 1, #p60 do
				table.insert(u2, p60[v127]);
			end;
		else
			error("bad argument #2 to 'SetCollisionMode (Instance or array of Instance expected, got " .. typeof(p60) .. ")'", 2);
		end;
		u3 = nil;
	elseif p59 == v13.Whitelist then
		if typeof(p60) == "Instance" then
			u2 = { p60 };
		elseif typeof(p60) == "table" then
			for v128 = 1, #p60 do
				if typeof(p60[v128]) ~= "Instance" then
					error("bad argument #2 to 'SetCollisionMode' (whitelist contained a " .. typeof(p60[v128]) .. " on index " .. tostring(v128) .. " which is not an Instance)", 2);
				end;
			end;
			u2 = {};
			for v129 = 1, #p60 do
				table.insert(u2, p60[v129]);
			end;
		else
			error("bad argument #2 to 'SetCollisionMode (Instance or array of Instance expected, got " .. typeof(p60) .. ")'", 2);
		end;
		u3 = nil;
	elseif p59 == v13.Function then
		if typeof(p60) ~= "function" then
			error("bad argument #2 to 'SetCollisionMode' (function expected, got " .. typeof(p60) .. ")", 2);
		end;
		u2 = nil;
		u3 = p60;
	else
		error("bad argument #1 to 'SetCollisionMode (Rain.CollisionMode expected, got " .. typeof(p60) .. ")'", 2);
	end;
	u21 = p59;
	u5 = v37[p59];
end;
return v80;
