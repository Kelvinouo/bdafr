-- Decompiled with the Synapse X Luau decompiler.

local l__Players__1 = game:GetService("Players");
local l__RunService__2 = game:GetService("RunService");
local v3 = require(script:WaitForChild("AtomicBinding"));
local u1 = "UserAtomicCharacterSoundsUnparent";
local v4, v5 = pcall(function()
	return UserSettings():IsUserFeatureEnabled(u1);
end);
local v6 = {};
local v7 = {};
u1 = "rbxasset://sounds/action_footsteps_plastic.mp3";
v7.SoundId = u1;
u1 = true;
v7.Looped = u1;
v6.Climbing = v7;
local v8 = {};
u1 = "rbxasset://sounds/uuhhh.mp3";
v8.SoundId = u1;
v6.Died = v8;
local v9 = {};
u1 = "rbxasset://sounds/action_falling.mp3";
v9.SoundId = u1;
u1 = true;
v9.Looped = u1;
v6.FreeFalling = v9;
local v10 = {};
u1 = "rbxasset://sounds/action_get_up.mp3";
v10.SoundId = u1;
v6.GettingUp = v10;
local v11 = {};
u1 = "rbxasset://sounds/action_jump.mp3";
v11.SoundId = u1;
v6.Jumping = v11;
local v12 = {};
u1 = "rbxasset://sounds/action_jump_land.mp3";
v12.SoundId = u1;
v6.Landing = v12;
local v13 = {};
u1 = "rbxasset://sounds/action_footsteps_plastic.mp3";
v13.SoundId = u1;
u1 = true;
v13.Looped = u1;
u1 = 1.85;
v13.Pitch = u1;
v6.Running = v13;
local v14 = {};
u1 = "rbxasset://sounds/impact_water.mp3";
v14.SoundId = u1;
v6.Splash = v14;
local v15 = {};
u1 = "rbxasset://sounds/action_swim.mp3";
v15.SoundId = u1;
u1 = true;
v15.Looped = u1;
u1 = 1.6;
v15.Pitch = u1;
v6.Swimming = v15;
u1 = function(p1)
	p1.TimePosition = 0;
	p1.Playing = true;
end;
local u2 = v4 or v5;
local u3 = v3.new({
	humanoid = "Humanoid", 
	rootPart = "HumanoidRootPart"
}, function(p2)
	local l__player__16 = p2.player;
	local l__rootPart__17 = p2.rootPart;
	local v18 = {};
	for v19, v20 in pairs(v6) do
		local v21 = Instance.new("Sound");
		v21.Name = v19;
		v21.Archivable = false;
		v21.RollOffMinDistance = 5;
		v21.RollOffMaxDistance = 150;
		v21.Volume = 0.65;
		for v22, v23 in pairs(v20) do
			v21[v22] = v23;
		end;
		v21.Parent = l__rootPart__17;
		v18[v19] = v21;
	end;
	local u4 = {};
	local v24 = {
		[Enum.HumanoidStateType.FallingDown] = function()
			local v25 = {};
			for v26, v27 in pairs(u4) do
				v25[v26] = v27;
			end;
			for v28 in pairs(v25) do
				if v28 ~= nil then
					v28.Playing = false;
					u4[v28] = nil;
				end;
			end;
		end
	};
	v24[Enum.HumanoidStateType.GettingUp] = function()
		local v29 = {};
		for v30, v31 in pairs(u4) do
			v29[v30] = v31;
		end;
		for v32 in pairs(v29) do
			if v32 ~= nil then
				v32.Playing = false;
				u4[v32] = nil;
			end;
		end;
		local l__GettingUp__33 = v18.GettingUp;
		l__GettingUp__33.TimePosition = 0;
		l__GettingUp__33.Playing = true;
	end;
	v24[Enum.HumanoidStateType.Jumping] = function()
		local v34 = {};
		for v35, v36 in pairs(u4) do
			v34[v35] = v36;
		end;
		for v37 in pairs(v34) do
			if v37 ~= nil then
				v37.Playing = false;
				u4[v37] = nil;
			end;
		end;
		local l__Jumping__38 = v18.Jumping;
		l__Jumping__38.TimePosition = 0;
		l__Jumping__38.Playing = true;
	end;
	v24[Enum.HumanoidStateType.Swimming] = function()
		local v39 = math.abs(l__rootPart__17.AssemblyLinearVelocity.Y);
		if v39 > 0.1 then
			v18.Splash.Volume = math.clamp((v39 - 100) * 0.72 / 250 + 0.28, 0, 1);
			local l__Splash__40 = v18.Splash;
			l__Splash__40.TimePosition = 0;
			l__Splash__40.Playing = true;
		end;
		local l__Swimming__41 = v18.Swimming;
		local v42 = {};
		for v43, v44 in pairs(u4) do
			v42[v43] = v44;
		end;
		for v45 in pairs(v42) do
			if v45 ~= l__Swimming__41 then
				v45.Playing = false;
				u4[v45] = nil;
			end;
		end;
		v18.Swimming.Playing = true;
		u4[v18.Swimming] = true;
	end;
	v24[Enum.HumanoidStateType.Freefall] = function()
		v18.FreeFalling.Volume = 0;
		local l__FreeFalling__46 = v18.FreeFalling;
		local v47 = {};
		for v48, v49 in pairs(u4) do
			v47[v48] = v49;
		end;
		for v50 in pairs(v47) do
			if v50 ~= l__FreeFalling__46 then
				v50.Playing = false;
				u4[v50] = nil;
			end;
		end;
		u4[v18.FreeFalling] = true;
	end;
	v24[Enum.HumanoidStateType.Landed] = function()
		local v51 = {};
		for v52, v53 in pairs(u4) do
			v51[v52] = v53;
		end;
		for v54 in pairs(v51) do
			if v54 ~= nil then
				v54.Playing = false;
				u4[v54] = nil;
			end;
		end;
		local v55 = math.abs(l__rootPart__17.AssemblyLinearVelocity.Y);
		if v55 > 75 then
			v18.Landing.Volume = math.clamp((v55 - 50) * 1 / 50 + 0, 0, 1);
			local l__Landing__56 = v18.Landing;
			l__Landing__56.TimePosition = 0;
			l__Landing__56.Playing = true;
		end;
	end;
	v24[Enum.HumanoidStateType.Running] = function()
		local l__Running__57 = v18.Running;
		local v58 = {};
		for v59, v60 in pairs(u4) do
			v58[v59] = v60;
		end;
		for v61 in pairs(v58) do
			if v61 ~= l__Running__57 then
				v61.Playing = false;
				u4[v61] = nil;
			end;
		end;
		v18.Running.Playing = true;
		u4[v18.Running] = true;
	end;
	v24[Enum.HumanoidStateType.Climbing] = function()
		local l__Climbing__62 = v18.Climbing;
		if math.abs(l__rootPart__17.AssemblyLinearVelocity.Y) > 0.1 then
			l__Climbing__62.Playing = true;
			local v63 = {};
			for v64, v65 in pairs(u4) do
				v63[v64] = v65;
			end;
			for v66 in pairs(v63) do
				if v66 ~= l__Climbing__62 then
					v66.Playing = false;
					u4[v66] = nil;
				end;
			end;
		else
			local v67 = {};
			for v68, v69 in pairs(u4) do
				v67[v68] = v69;
			end;
			for v70 in pairs(v67) do
				if v70 ~= nil then
					v70.Playing = false;
					u4[v70] = nil;
				end;
			end;
		end;
		u4[l__Climbing__62] = true;
	end;
	v24[Enum.HumanoidStateType.Seated] = function()
		local v71 = {};
		for v72, v73 in pairs(u4) do
			v71[v72] = v73;
		end;
		for v74 in pairs(v71) do
			if v74 ~= nil then
				v74.Playing = false;
				u4[v74] = nil;
			end;
		end;
	end;
	v24[Enum.HumanoidStateType.Dead] = function()
		local v75 = {};
		for v76, v77 in pairs(u4) do
			v75[v76] = v77;
		end;
		for v78 in pairs(v75) do
			if v78 ~= nil then
				v78.Playing = false;
				u4[v78] = nil;
			end;
		end;
		local l__Died__79 = v18.Died;
		l__Died__79.TimePosition = 0;
		l__Died__79.Playing = true;
	end;
	local v80 = {
		[v18.Climbing] = function(p3, p4, p5)
			p4.Playing = p5.Magnitude > 0.1;
		end, 
		[v18.FreeFalling] = function(p6, p7, p8)
			if not (p8.Magnitude > 75) then
				p7.Volume = 0;
				return;
			end;
			p7.Volume = math.clamp(p7.Volume + 0.9 * p6, 0, 1);
		end
	};
	local l__humanoid__5 = p2.humanoid;
	v80[v18.Running] = function(p9, p10, p11)
		local v81 = false;
		if p11.Magnitude > 0.5 then
			v81 = l__humanoid__5.MoveDirection.Magnitude > 0.5;
		end;
		p10.Playing = v81;
	end;
	local v82 = {
		[Enum.HumanoidStateType.RunningNoPhysics] = Enum.HumanoidStateType.Running
	};
	local u6 = v82[l__humanoid__5:GetState()] or l__humanoid__5:GetState();
	local u7 = l__humanoid__5.StateChanged:Connect(function(p12, p13)
		p13 = v82[p13] and p13;
		if p13 ~= u6 then
			local v83 = v24[p13];
			if v83 then
				v83();
			end;
			u6 = p13;
		end;
	end);
	local u8 = l__RunService__2.Stepped:Connect(function(p14, p15)
		for v84 in pairs(u4) do
			local v85 = v80[v84];
			if v85 then
				v85(p15, v84, l__rootPart__17.AssemblyLinearVelocity);
			end;
		end;
	end);
	return function()
		u7:Disconnect();
		u8:Disconnect();
		if u2 then
			for v86, v87 in pairs(v18) do
				v87:Destroy();
			end;
			table.clear(v18);
		end;
	end;
end);
local u9 = {};
local function u10(p16)
	u3:bindRoot(p16);
end;
local function u11(p17)
	u3:unbindRoot(p17);
end;
local function v88(p18)
	local v89 = u9[p18];
	if not v89 then
		v89 = {};
		u9[p18] = v89;
	end;
	if p18.Character then
		u3:bindRoot(p18.Character);
	end;
	table.insert(v89, p18.CharacterAdded:Connect(u10));
	table.insert(v89, p18.CharacterRemoving:Connect(u11));
end;
for v90, v91 in ipairs(l__Players__1:GetPlayers()) do
	task.spawn(v88, v91);
end;
l__Players__1.PlayerAdded:Connect(v88);
l__Players__1.PlayerRemoving:Connect(function(p19)
	local v92 = u9[p19];
	if v92 then
		for v93, v94 in ipairs(v92) do
			v94:Disconnect();
		end;
		u9[p19] = nil;
	end;
	if p19.Character then
		u3:unbindRoot(p19.Character);
	end;
end);
