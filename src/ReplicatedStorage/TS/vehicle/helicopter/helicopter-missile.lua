-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__SoundManager__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u1 = nil;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__3 = v3.Workspace;
local v5 = setmetatable({}, {
	__tostring = function()
		return "HelicopterMissile";
	end
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
function v5.constructor(p1, p2, p3, p4)
	p1.startPosition = p2;
	p1.direction = p3;
	p1.owner = p4;
end;
local l__RunService__4 = v3.RunService;
local u5 = math.pi * 2;
local l__ReplicatedStorage__6 = v3.ReplicatedStorage;
local function u7(p5, p6)
	local v7 = RaycastParams.new();
	v7.FilterType = Enum.RaycastFilterType.Blacklist;
	local v8 = {};
	if p6 then
		table.insert(v8, p6);
	end;
	if p5.Character then
		table.insert(v8, p5.Character);
		local v9 = p5.Character:FindFirstChildOfClass("Humanoid");
		if v9 and v9.SeatPart then
			local l__Parent__10 = v9.SeatPart.Parent;
			if l__Parent__10 and l__Parent__10:IsA("Model") then
				table.insert(v8, l__Parent__10);
				for v11, v12 in ipairs(l__Parent__10:GetDescendants()) do
					if v12:IsA("Seat") then
						local l__Occupant__13 = v12.Occupant;
						if l__Occupant__13 then
							table.insert(v8, l__Occupant__13.Parent);
						end;
					end;
				end;
			end;
		end;
	end;
	v7.FilterDescendantsInstances = v8;
	return v7;
end;
function v5.fire(p7, p8, p9)
	local l__startPosition__14 = p7.startPosition;
	local v15 = time() - p8;
	local v16 = l__RunService__4:IsClient();
	local v17 = nil;
	local v18 = nil;
	if v16 then
		v17 = l__ReplicatedStorage__6.Assets.Misc.HeliMissile:Clone();
		if not u1 then
			u1 = u2("Folder", {
				Name = "HeliMissiles", 
				Parent = l__Workspace__3
			});
		end;
		v17.Parent = u1;
		l__SoundManager__2:playSound(l__GameSound__4.GUIDED_MISSILE_FIRE, {
			position = l__startPosition__14
		});
		v18 = l__SoundManager__2:playSound(l__GameSound__4.GUIDED_MISSILE_LOOP, {
			looped = true, 
			parent = v17, 
			rollOffMaxDistance = 100
		});
	end;
	local v19 = u7(p7.owner, v17);
	local u8 = nil;
	local u9 = math.random() * u5;
	local u10 = l__startPosition__14;
	local l__direction__11 = p7.direction;
	local function u12(p10)
		u8:Disconnect();
		p9(p10);
		if v17 then
			v17.Transparency = 1;
			v18:Stop();
			for v20, v21 in ipairs(v17:GetDescendants()) do
				if not (not v21:IsA("Beam")) or not (not v21:IsA("Trail")) or v21:IsA("ParticleEmitter") then
					v21.Enabled = false;
				end;
			end;
			task.delay(4, function()
				local v22 = v17;
				if v22 ~= nil then
					v22 = v22:Destroy();
				end;
				return v22;
			end);
		end;
		task.spawn(p9, p10);
	end;
	local function u13(p11, p12)
		local v23 = l__Workspace__3:Raycast(u10, l__direction__11 * (100 * p11), v19);
		if v23 ~= nil then
			if not v23.Instance.CanCollide then
				local v24 = v19.FilterDescendantsInstances;
				table.insert(v24, v23.Instance);
				v19.FilterDescendantsInstances = v24;
				u13(p11, p12);
				return nil;
			end;
			u10 = v23.Position;
			u12(v23);
		else
			u10 = l__startPosition__14 + l__direction__11 * (100 * p12);
		end;
		if v16 then
			u9 = (u9 + 12.566370614359172 * p11) % u5;
			v17.CFrame = CFrame.lookAt(u10, u10 + l__direction__11) * CFrame.Angles(0, 0, u9);
		end;
	end;
	u8 = l__RunService__4.Heartbeat:Connect(function(p13)
		debug.profilebegin("HelicopterMissileUpdate");
		local v25 = time() - v15;
		if v25 > 3 then
			u12();
			debug.profileend();
			return nil;
		end;
		u13(p13, v25);
		debug.profileend();
	end);
	u13(p8, p8);
end;
return {
	MISSILE_FIRE_RATE = 0.75, 
	HelicopterMissile = v5
};
