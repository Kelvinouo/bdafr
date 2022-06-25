-- Script Hash: 2c0ad54eda6721a39a13c18129ccfa889ea1fea7fb2ce7f5ad4333d7afbec5a98c7865f9e04603f1218f937647bcc2be
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
		for v18, v19 in pairs(u2(u6)) do
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
		local v20 = math.abs(l__rootPart__10.AssemblyLinearVelocity.Y);
		if v20 > 0.1 then
			v11.Splash.Volume = math.clamp(u4(v20, 100, 350, 0.28, 1), 0, 1);
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
		local v21 = math.abs(l__rootPart__10.AssemblyLinearVelocity.Y);
		if v21 > 75 then
			v11.Landing.Volume = math.clamp(u4(v21, 50, 100, 0, 1), 0, 1);
			u3(v11.Landing);
		end;
	end;
	v17[Enum.HumanoidStateType.Running] = function()
		u7(v11.Running);
		v11.Running.Playing = true;
		u6[v11.Running] = true;
	end;
	v17[Enum.HumanoidStateType.Climbing] = function()
		local l__Climbing__22 = v11.Climbing;
		if math.abs(l__rootPart__10.AssemblyLinearVelocity.Y) > 0.1 then
			l__Climbing__22.Playing = true;
			u7(l__Climbing__22);
		else
			u7();
		end;
		u6[l__Climbing__22] = true;
	end;
	v17[Enum.HumanoidStateType.Seated] = function()
		u7();
	end;
	v17[Enum.HumanoidStateType.Dead] = function()
		u7();
		u3(v11.Died);
	end;
	local v23 = {
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
	v23[v11.Running] = function(p16, p17, p18)
		local v24 = false;
		if p18.Magnitude > 0.5 then
			v24 = l__humanoid__8.MoveDirection.Magnitude > 0.5;
		end;
		p17.Playing = v24;
	end;
	local v25 = {
		[Enum.HumanoidStateType.RunningNoPhysics] = Enum.HumanoidStateType.Running
	};
	local u9 = v25[l__humanoid__8:GetState()] or l__humanoid__8:GetState();
	local u10 = l__humanoid__8.StateChanged:Connect(function(p19, p20)
		p20 = v25[p20] and p20;
		if p20 ~= u9 then
			local v26 = v17[p20];
			if v26 then
				v26();
			end;
			u9 = p20;
		end;
	end);
	local u11 = l__RunService__3.Stepped:Connect(function(p21, p22)
		for v27, v28 in pairs(u6) do
			local v29 = v23[v27];
			if v29 then
				v29(p22, v27, l__rootPart__10.AssemblyLinearVelocity);
			end;
		end;
	end);
	local u12 = nil;
	local u13 = nil;
	local u14 = nil;
	local function v30()
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
				v30();
			end;
		end);
		u13 = l__rootPart__10.AncestryChanged:Connect(function(p25, p26)
			if not p26 then
				v30();
			end;
		end);
		u14 = p8.player.CharacterAdded:Connect(v30);
	end;
	return v30;
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
	local function v31(p29)
		local v32 = u16[p29];
		if not v32 then
			v32 = {};
			u16[p29] = v32;
		end;
		if p29.Character then
			u17(p29.Character);
		end;
		table.insert(v32, p29.CharacterAdded:Connect(u17));
		table.insert(v32, p29.CharacterRemoving:Connect(u18));
	end;
	for v33, v34 in ipairs(l__Players__2:GetPlayers()) do
		task.spawn(v31, v34);
	end;
	l__Players__2.PlayerAdded:Connect(v31);
	l__Players__2.PlayerRemoving:Connect(function(p30)
		local v35 = u16[p30];
		if v35 then
			for v36, v37 in ipairs(v35) do
				v37:Disconnect();
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
		local function v38(...)
			for v39 = 1, #u20 do
				u20[v39]:Disconnect();
			end;
			return u21:Fire(...);
		end;
		for v40 = 1, #u20 do
			u20[v40] = u20[v40]:Connect(v38);
		end;
		return u21.Event:Wait();
	end;
	local function v41(p31)
		local function v42(p32)
			if not p32.Parent then
				u19(p32.AncestryChanged, p31.CharacterAdded);
			end;
			if p31.Character ~= p32 or not p32.Parent then
				return;
			end;
			local v43 = p32:FindFirstChildOfClass("Humanoid");
			while p32:IsDescendantOf(game) and not v43 do
				u19(p32.ChildAdded, p32.AncestryChanged, p31.CharacterAdded);
				v43 = p32:FindFirstChildOfClass("Humanoid");			
			end;
			if p31.Character ~= p32 or not p32:IsDescendantOf(game) then
				return;
			end;
			local v44 = p32:FindFirstChild("HumanoidRootPart");
			while p32:IsDescendantOf(game) and not v44 do
				u19(p32.ChildAdded, p32.AncestryChanged, v43.AncestryChanged, p31.CharacterAdded);
				v44 = p32:FindFirstChild("HumanoidRootPart");			
			end;
			if v44 and v43:IsDescendantOf(game) and p32:IsDescendantOf(game) and p31.Character == p32 then
				v1({
					player = p31, 
					humanoid = v43, 
					rootPart = v44
				});
			end;
		end;
		if p31.Character then
			v42(p31.Character);
		end;
		p31.CharacterAdded:Connect(v42);
	end;
	l__Players__2.PlayerAdded:Connect(v41);
	for v45, v46 in ipairs(l__Players__2:GetPlayers()) do
		v41(v46);
	end;
end;
