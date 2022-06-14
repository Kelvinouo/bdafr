-- Script Hash: fbe6fffc0493b2599afb83be9492f32f23cd9e01c2d0ff798b1f81a4f5bf52f36ff7ab9efd29cabba63017747d1b586d
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
local function u2(p1)
	local v7 = {};
	for v8, v9 in pairs(p1) do
		v7[v8] = v9;
	end;
	return v7;
end;
local function u3(p2)
	p2.TimePosition = 0;
	p2.Playing = true;
end;
local function u4(p3, p4, p5, p6, p7)
	return (p3 - p4) * (p7 - p6) / (p5 - p4) + p6;
end;
local u5 = v5 or v6;
v1 = function(p8)
	local l__rootPart__10 = p8.rootPart;
	local v11 = {};
	for v12, v13 in pairs(u1) do
		local v14 = Instance.new("Sound");
		v14.Name = v12;
		v14.Archivable = false;
		v14.RollOffMinDistance = 5;
		v14.RollOffMaxDistance = 150;
		v14.Volume = 0.65;
		for v15, v16 in pairs(v13) do
			v14[v15] = v16;
		end;
		v14.Parent = l__rootPart__10;
		v11[v12] = v14;
	end;
	local u6 = {};
	local v17 = {};
	local function u7(p9)
		for v18 in pairs(u2(u6)) do
			if v18 ~= p9 then
				v18.Playing = false;
				u6[v18] = nil;
			end;
		end;
	end;
	v17[Enum.HumanoidStateType.FallingDown] = function()
		u7();
	end;
	v17[Enum.HumanoidStateType.GettingUp] = function()
		u7();
		u3(v11.GettingUp);
	end;
	v17[Enum.HumanoidStateType.Jumping] = function()
		u7();
		u3(v11.Jumping);
	end;
	v17[Enum.HumanoidStateType.Swimming] = function()
		local v19 = math.abs(l__rootPart__10.AssemblyLinearVelocity.Y);
		if v19 > 0.1 then
			v11.Splash.Volume = math.clamp(u4(v19, 100, 350, 0.28, 1), 0, 1);
			u3(v11.Splash);
		end;
		u7(v11.Swimming);
		v11.Swimming.Playing = true;
		u6[v11.Swimming] = true;
	end;
	v17[Enum.HumanoidStateType.Freefall] = function()
		v11.FreeFalling.Volume = 0;
		u7(v11.FreeFalling);
		u6[v11.FreeFalling] = true;
	end;
	v17[Enum.HumanoidStateType.Landed] = function()
		u7();
		local v20 = math.abs(l__rootPart__10.AssemblyLinearVelocity.Y);
		if v20 > 75 then
			v11.Landing.Volume = math.clamp(u4(v20, 50, 100, 0, 1), 0, 1);
			u3(v11.Landing);
		end;
	end;
	v17[Enum.HumanoidStateType.Running] = function()
		u7(v11.Running);
		v11.Running.Playing = true;
		u6[v11.Running] = true;
	end;
	v17[Enum.HumanoidStateType.Climbing] = function()
		local l__Climbing__21 = v11.Climbing;
		if math.abs(l__rootPart__10.AssemblyLinearVelocity.Y) > 0.1 then
			l__Climbing__21.Playing = true;
			u7(l__Climbing__21);
		else
			u7();
		end;
		u6[l__Climbing__21] = true;
	end;
	v17[Enum.HumanoidStateType.Seated] = function()
		u7();
	end;
	v17[Enum.HumanoidStateType.Dead] = function()
		u7();
		u3(v11.Died);
	end;
	local v22 = {
		[v11.Climbing] = function(p10, p11, p12)
			p11.Playing = p12.Magnitude > 0.1;
		end, 
		[v11.FreeFalling] = function(p13, p14, p15)
			if not (p15.Magnitude > 75) then
				p14.Volume = 0;
				return;
			end;
			p14.Volume = math.clamp(p14.Volume + 0.9 * p13, 0, 1);
		end
	};
	local l__humanoid__8 = p8.humanoid;
	v22[v11.Running] = function(p16, p17, p18)
		local v23 = false;
		if p18.Magnitude > 0.5 then
			v23 = l__humanoid__8.MoveDirection.Magnitude > 0.5;
		end;
		p17.Playing = v23;
	end;
	local v24 = {
		[Enum.HumanoidStateType.RunningNoPhysics] = Enum.HumanoidStateType.Running
	};
	local u9 = v24[l__humanoid__8:GetState()] or l__humanoid__8:GetState();
	local u10 = l__humanoid__8.StateChanged:Connect(function(p19, p20)
		p20 = v24[p20] and p20;
		if p20 ~= u9 then
			local v25 = v17[p20];
			if v25 then
				v25();
			end;
			u9 = p20;
		end;
	end);
	local u11 = l__RunService__3.Stepped:Connect(function(p21, p22)
		for v26 in pairs(u6) do
			local v27 = v22[v26];
			if v27 then
				v27(p22, v26, l__rootPart__10.AssemblyLinearVelocity);
			end;
		end;
	end);
	local u12 = nil;
	local u13 = nil;
	local u14 = nil;
	local function v28()
		u10:Disconnect();
		u11:Disconnect();
		if not u5 then
			u12:Disconnect();
			u13:Disconnect();
			u14:Disconnect();
		end;
	end;
	if not u5 then
		u12 = l__humanoid__8.AncestryChanged:Connect(function(p23, p24)
			if not p24 then
				v28();
			end;
		end);
		u13 = l__rootPart__10.AncestryChanged:Connect(function(p25, p26)
			if not p26 then
				v28();
			end;
		end);
		u14 = p8.player.CharacterAdded:Connect(v28);
	end;
	return v28;
end;
if u5 then
	local u15 = v4.new({
		humanoid = "Humanoid", 
		rootPart = "HumanoidRootPart"
	}, v1);
	local u16 = {};
	local function u17(p27)
		u15:bindRoot(p27);
	end;
	local function u18(p28)
		u15:unbindRoot(p28);
	end;
	local function v29(p29)
		local v30 = u16[p29];
		if not v30 then
			v30 = {};
			u16[p29] = v30;
		end;
		if p29.Character then
			u17(p29.Character);
		end;
		table.insert(v30, p29.CharacterAdded:Connect(u17));
		table.insert(v30, p29.CharacterRemoving:Connect(u18));
	end;
	for v31, v32 in ipairs(l__Players__2:GetPlayers()) do
		task.spawn(v29, v32);
	end;
	l__Players__2.PlayerAdded:Connect(v29);
	l__Players__2.PlayerRemoving:Connect(function(p30)
		local v33 = u16[p30];
		if v33 then
			for v34, v35 in ipairs(v33) do
				v35:Disconnect();
			end;
			u16[p30] = nil;
		end;
		if p30.Character then
			u18(p30.Character);
		end;
	end);
else
	local function u19(...)
		local u20 = { ... };
		local u21 = Instance.new("BindableEvent");
		local function v36(...)
			for v37 = 1, #u20 do
				u20[v37]:Disconnect();
			end;
			return u21:Fire(...);
		end;
		for v38 = 1, #u20 do
			u20[v38] = u20[v38]:Connect(v36);
		end;
		return u21.Event:Wait();
	end;
	local function v39(p31)
		local function v40(p32)
			if not p32.Parent then
				u19(p32.AncestryChanged, p31.CharacterAdded);
			end;
			if p31.Character ~= p32 or not p32.Parent then
				return;
			end;
			local v41 = p32:FindFirstChildOfClass("Humanoid");
			while p32:IsDescendantOf(game) and not v41 do
				u19(p32.ChildAdded, p32.AncestryChanged, p31.CharacterAdded);
				v41 = p32:FindFirstChildOfClass("Humanoid");			
			end;
			if p31.Character ~= p32 or not p32:IsDescendantOf(game) then
				return;
			end;
			local v42 = p32:FindFirstChild("HumanoidRootPart");
			while p32:IsDescendantOf(game) and not v42 do
				u19(p32.ChildAdded, p32.AncestryChanged, v41.AncestryChanged, p31.CharacterAdded);
				v42 = p32:FindFirstChild("HumanoidRootPart");			
			end;
			if v42 and v41:IsDescendantOf(game) and p32:IsDescendantOf(game) and p31.Character == p32 then
				v1({
					player = p31, 
					humanoid = v41, 
					rootPart = v42
				});
			end;
		end;
		if p31.Character then
			v40(p31.Character);
		end;
		p31.CharacterAdded:Connect(v40);
	end;
	l__Players__2.PlayerAdded:Connect(v39);
	for v43, v44 in ipairs(l__Players__2:GetPlayers()) do
		v39(v44);
	end;
end;
