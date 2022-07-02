-- Decompiled with the Synapse X Luau decompiler.

local v1 = nil;
local l__Players__2 = game:GetService("Players");
local l__RunService__3 = game:GetService("RunService");
local v4 = require(script:WaitForChild("AtomicBinding"));
local v5, v6 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserAtomicCharacterSounds2");
end);
local u1 = {
	Climbing = {
		SoundId = "rbxasset://sounds/action_footsteps_plastic.mp3", 
		Looped = true
	}, 
	Died = {
		SoundId = "rbxasset://sounds/uuhhh.mp3"
	}, 
	FreeFalling = {
		SoundId = "rbxasset://sounds/action_falling.mp3", 
		Looped = true
	}, 
	GettingUp = {
		SoundId = "rbxasset://sounds/action_get_up.mp3"
	}, 
	Jumping = {
		SoundId = "rbxasset://sounds/action_jump.mp3"
	}, 
	Landing = {
		SoundId = "rbxasset://sounds/action_jump_land.mp3"
	}, 
	Running = {
		SoundId = "rbxasset://sounds/action_footsteps_plastic.mp3", 
		Looped = true, 
		Pitch = 1.85
	}, 
	Splash = {
		SoundId = "rbxasset://sounds/impact_water.mp3"
	}, 
	Swimming = {
		SoundId = "rbxasset://sounds/action_swim.mp3", 
		Looped = true, 
		Pitch = 1.6
	}
};
local u2 = v5 or v6;
v1 = function(p1)
	local l__rootPart__7 = p1.rootPart;
	local v8 = {};
	for v9, v10 in pairs(u1) do
		local v11 = Instance.new("Sound");
		v11.Name = v9;
		v11.Archivable = false;
		v11.RollOffMinDistance = 5;
		v11.RollOffMaxDistance = 150;
		v11.Volume = 0.65;
		for v12, v13 in pairs(v10) do
			v11[v12] = v13;
		end;
		v11.Parent = l__rootPart__7;
		v8[v9] = v11;
	end;
	local u3 = {};
	local v14 = {
		[Enum.HumanoidStateType.FallingDown] = function()
			local v15 = {};
			for v16, v17 in pairs(u3) do
				v15[v16] = v17;
			end;
			for v18 in pairs(v15) do
				if v18 ~= nil then
					v18.Playing = false;
					u3[v18] = nil;
				end;
			end;
		end
	};
	v14[Enum.HumanoidStateType.GettingUp] = function()
		local v19 = {};
		for v20, v21 in pairs(u3) do
			v19[v20] = v21;
		end;
		for v22 in pairs(v19) do
			if v22 ~= nil then
				v22.Playing = false;
				u3[v22] = nil;
			end;
		end;
		local l__GettingUp__23 = v8.GettingUp;
		l__GettingUp__23.TimePosition = 0;
		l__GettingUp__23.Playing = true;
	end;
	v14[Enum.HumanoidStateType.Jumping] = function()
		local v24 = {};
		for v25, v26 in pairs(u3) do
			v24[v25] = v26;
		end;
		for v27 in pairs(v24) do
			if v27 ~= nil then
				v27.Playing = false;
				u3[v27] = nil;
			end;
		end;
		local l__Jumping__28 = v8.Jumping;
		l__Jumping__28.TimePosition = 0;
		l__Jumping__28.Playing = true;
	end;
	v14[Enum.HumanoidStateType.Swimming] = function()
		local v29 = math.abs(l__rootPart__7.AssemblyLinearVelocity.Y);
		if v29 > 0.1 then
			v8.Splash.Volume = math.clamp((v29 - 100) * 0.72 / 250 + 0.28, 0, 1);
			local l__Splash__30 = v8.Splash;
			l__Splash__30.TimePosition = 0;
			l__Splash__30.Playing = true;
		end;
		local l__Swimming__31 = v8.Swimming;
		local v32 = {};
		for v33, v34 in pairs(u3) do
			v32[v33] = v34;
		end;
		for v35 in pairs(v32) do
			if v35 ~= l__Swimming__31 then
				v35.Playing = false;
				u3[v35] = nil;
			end;
		end;
		v8.Swimming.Playing = true;
		u3[v8.Swimming] = true;
	end;
	v14[Enum.HumanoidStateType.Freefall] = function()
		v8.FreeFalling.Volume = 0;
		local l__FreeFalling__36 = v8.FreeFalling;
		local v37 = {};
		for v38, v39 in pairs(u3) do
			v37[v38] = v39;
		end;
		for v40 in pairs(v37) do
			if v40 ~= l__FreeFalling__36 then
				v40.Playing = false;
				u3[v40] = nil;
			end;
		end;
		u3[v8.FreeFalling] = true;
	end;
	v14[Enum.HumanoidStateType.Landed] = function()
		local v41 = {};
		for v42, v43 in pairs(u3) do
			v41[v42] = v43;
		end;
		for v44 in pairs(v41) do
			if v44 ~= nil then
				v44.Playing = false;
				u3[v44] = nil;
			end;
		end;
		local v45 = math.abs(l__rootPart__7.AssemblyLinearVelocity.Y);
		if v45 > 75 then
			v8.Landing.Volume = math.clamp((v45 - 50) * 1 / 50 + 0, 0, 1);
			local l__Landing__46 = v8.Landing;
			l__Landing__46.TimePosition = 0;
			l__Landing__46.Playing = true;
		end;
	end;
	v14[Enum.HumanoidStateType.Running] = function()
		local l__Running__47 = v8.Running;
		local v48 = {};
		for v49, v50 in pairs(u3) do
			v48[v49] = v50;
		end;
		for v51 in pairs(v48) do
			if v51 ~= l__Running__47 then
				v51.Playing = false;
				u3[v51] = nil;
			end;
		end;
		v8.Running.Playing = true;
		u3[v8.Running] = true;
	end;
	v14[Enum.HumanoidStateType.Climbing] = function()
		local l__Climbing__52 = v8.Climbing;
		if math.abs(l__rootPart__7.AssemblyLinearVelocity.Y) > 0.1 then
			l__Climbing__52.Playing = true;
			local v53 = {};
			for v54, v55 in pairs(u3) do
				v53[v54] = v55;
			end;
			for v56 in pairs(v53) do
				if v56 ~= l__Climbing__52 then
					v56.Playing = false;
					u3[v56] = nil;
				end;
			end;
		else
			local v57 = {};
			for v58, v59 in pairs(u3) do
				v57[v58] = v59;
			end;
			for v60 in pairs(v57) do
				if v60 ~= nil then
					v60.Playing = false;
					u3[v60] = nil;
				end;
			end;
		end;
		u3[l__Climbing__52] = true;
	end;
	v14[Enum.HumanoidStateType.Seated] = function()
		local v61 = {};
		for v62, v63 in pairs(u3) do
			v61[v62] = v63;
		end;
		for v64 in pairs(v61) do
			if v64 ~= nil then
				v64.Playing = false;
				u3[v64] = nil;
			end;
		end;
	end;
	v14[Enum.HumanoidStateType.Dead] = function()
		local v65 = {};
		for v66, v67 in pairs(u3) do
			v65[v66] = v67;
		end;
		for v68 in pairs(v65) do
			if v68 ~= nil then
				v68.Playing = false;
				u3[v68] = nil;
			end;
		end;
		local l__Died__69 = v8.Died;
		l__Died__69.TimePosition = 0;
		l__Died__69.Playing = true;
	end;
	local v70 = {
		[v8.Climbing] = function(p2, p3, p4)
			p3.Playing = p4.Magnitude > 0.1;
		end, 
		[v8.FreeFalling] = function(p5, p6, p7)
			if not (p7.Magnitude > 75) then
				p6.Volume = 0;
				return;
			end;
			p6.Volume = math.clamp(p6.Volume + 0.9 * p5, 0, 1);
		end
	};
	local l__humanoid__4 = p1.humanoid;
	v70[v8.Running] = function(p8, p9, p10)
		local v71 = false;
		if p10.Magnitude > 0.5 then
			v71 = l__humanoid__4.MoveDirection.Magnitude > 0.5;
		end;
		p9.Playing = v71;
	end;
	local v72 = {
		[Enum.HumanoidStateType.RunningNoPhysics] = Enum.HumanoidStateType.Running
	};
	local u5 = v72[l__humanoid__4:GetState()] or l__humanoid__4:GetState();
	local u6 = l__humanoid__4.StateChanged:Connect(function(p11, p12)
		p12 = v72[p12] and p12;
		if p12 ~= u5 then
			local v73 = v14[p12];
			if v73 then
				v73();
			end;
			u5 = p12;
		end;
	end);
	local u7 = l__RunService__3.Stepped:Connect(function(p13, p14)
		for v74 in pairs(u3) do
			local v75 = v70[v74];
			if v75 then
				v75(p14, v74, l__rootPart__7.AssemblyLinearVelocity);
			end;
		end;
	end);
	local u8 = nil;
	local u9 = nil;
	local u10 = nil;
	local function v76()
		u6:Disconnect();
		u7:Disconnect();
		if not u2 then
			u8:Disconnect();
			u9:Disconnect();
			u10:Disconnect();
		end;
	end;
	if not u2 then
		u8 = l__humanoid__4.AncestryChanged:Connect(function(p15, p16)
			if not p16 then
				u6:Disconnect();
				u7:Disconnect();
				if not u2 then
					u8:Disconnect();
					u9:Disconnect();
					u10:Disconnect();
				end;
			end;
		end);
		u9 = l__rootPart__7.AncestryChanged:Connect(function(p17, p18)
			if not p18 then
				u6:Disconnect();
				u7:Disconnect();
				if not u2 then
					u8:Disconnect();
					u9:Disconnect();
					u10:Disconnect();
				end;
			end;
		end);
		u10 = p1.player.CharacterAdded:Connect(v76);
	end;
	return v76;
end;
if u2 then
	local u11 = v4.new({
		humanoid = "Humanoid", 
		rootPart = "HumanoidRootPart"
	}, v1);
	local u12 = {};
	local function u13(p19)
		u11:bindRoot(p19);
	end;
	local function u14(p20)
		u11:unbindRoot(p20);
	end;
	local function v77(p21)
		local v78 = u12[p21];
		if not v78 then
			v78 = {};
			u12[p21] = v78;
		end;
		if p21.Character then
			u11:bindRoot(p21.Character);
		end;
		table.insert(v78, p21.CharacterAdded:Connect(u13));
		table.insert(v78, p21.CharacterRemoving:Connect(u14));
	end;
	for v79, v80 in ipairs(l__Players__2:GetPlayers()) do
		task.spawn(v77, v80);
	end;
	l__Players__2.PlayerAdded:Connect(v77);
	l__Players__2.PlayerRemoving:Connect(function(p22)
		local v81 = u12[p22];
		if v81 then
			for v82, v83 in ipairs(v81) do
				v83:Disconnect();
			end;
			u12[p22] = nil;
		end;
		if p22.Character then
			u11:unbindRoot(p22.Character);
		end;
	end);
else
	local function u15(...)
		local u16 = { ... };
		local u17 = Instance.new("BindableEvent");
		local function v84(...)
			for v85 = 1, #u16 do
				u16[v85]:Disconnect();
			end;
			return u17:Fire(...);
		end;
		for v86 = 1, #u16 do
			u16[v86] = u16[v86]:Connect(v84);
		end;
		return u17.Event:Wait();
	end;
	l__Players__2.PlayerAdded:Connect(function(p23)
		local function v87(p24)
			if not p24.Parent then
				u15(p24.AncestryChanged, p23.CharacterAdded);
			end;
			if p23.Character ~= p24 or not p24.Parent then
				return;
			end;
			local v88 = p24:FindFirstChildOfClass("Humanoid");
			while p24:IsDescendantOf(game) and not v88 do
				u15(p24.ChildAdded, p24.AncestryChanged, p23.CharacterAdded);
				v88 = p24:FindFirstChildOfClass("Humanoid");			
			end;
			if p23.Character ~= p24 or not p24:IsDescendantOf(game) then
				return;
			end;
			local v89 = p24:FindFirstChild("HumanoidRootPart");
			while p24:IsDescendantOf(game) and not v89 do
				u15(p24.ChildAdded, p24.AncestryChanged, v88.AncestryChanged, p23.CharacterAdded);
				v89 = p24:FindFirstChild("HumanoidRootPart");			
			end;
			if v89 and v88:IsDescendantOf(game) and p24:IsDescendantOf(game) and p23.Character == p24 then
				v1({
					player = p23, 
					humanoid = v88, 
					rootPart = v89
				});
			end;
		end;
		if p23.Character then
			v87(p23.Character);
		end;
		p23.CharacterAdded:Connect(v87);
	end);
	for v90, v91 in ipairs(l__Players__2:GetPlayers()) do
		local function v92(p25)
			if not p25.Parent then
				u15(p25.AncestryChanged, v91.CharacterAdded);
			end;
			if v91.Character ~= p25 or not p25.Parent then
				return;
			end;
			local v93 = p25:FindFirstChildOfClass("Humanoid");
			while p25:IsDescendantOf(game) and not v93 do
				u15(p25.ChildAdded, p25.AncestryChanged, v91.CharacterAdded);
				v93 = p25:FindFirstChildOfClass("Humanoid");			
			end;
			if v91.Character ~= p25 or not p25:IsDescendantOf(game) then
				return;
			end;
			local v94 = p25:FindFirstChild("HumanoidRootPart");
			while p25:IsDescendantOf(game) and not v94 do
				u15(p25.ChildAdded, p25.AncestryChanged, v93.AncestryChanged, v91.CharacterAdded);
				v94 = p25:FindFirstChild("HumanoidRootPart");			
			end;
			if v94 and v93:IsDescendantOf(game) and p25:IsDescendantOf(game) and v91.Character == p25 then
				v1({
					player = v91, 
					humanoid = v93, 
					rootPart = v94
				});
			end;
		end;
		if v91.Character then
			v92(v91.Character);
		end;
		v91.CharacterAdded:Connect(v92);
	end;
end;
