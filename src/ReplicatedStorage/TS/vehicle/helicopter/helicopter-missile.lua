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
				local v11, v12, v13 = ipairs(l__Parent__10:GetDescendants());
				while true do
					v11(v12, v13);
					if not v11 then
						break;
					end;
					v13 = v11;
					if v12:IsA("Seat") then
						local l__Occupant__14 = v12.Occupant;
						if l__Occupant__14 then
							table.insert(v8, l__Occupant__14.Parent);
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
	local l__startPosition__15 = p7.startPosition;
	local v16 = time() - p8;
	local v17 = l__RunService__4:IsClient();
	local v18 = nil;
	local v19 = nil;
	if v17 then
		v18 = l__ReplicatedStorage__6.Assets.Misc.HeliMissile:Clone();
		if not u1 then
			u1 = u2("Folder", {
				Name = "HeliMissiles", 
				Parent = l__Workspace__3
			});
		end;
		v18.Parent = u1;
		l__SoundManager__2:playSound(l__GameSound__4.GUIDED_MISSILE_FIRE, {
			position = l__startPosition__15
		});
		v19 = l__SoundManager__2:playSound(l__GameSound__4.GUIDED_MISSILE_LOOP, {
			looped = true, 
			parent = v18, 
			rollOffMaxDistance = 100
		});
	end;
	local v20 = u7(p7.owner, v18);
	local u8 = nil;
	local u9 = math.random() * u5;
	local u10 = l__startPosition__15;
	local l__direction__11 = p7.direction;
	local function u12(p10)
		u8:Disconnect();
		p9(p10);
		if v18 then
			v18.Transparency = 1;
			v19:Stop();
			local v21, v22, v23 = ipairs(v18:GetDescendants());
			while true do
				v21(v22, v23);
				if not v21 then
					break;
				end;
				v23 = v21;
				if not (not v22:IsA("Beam")) or not (not v22:IsA("Trail")) or v22:IsA("ParticleEmitter") then
					v22.Enabled = false;
				end;			
			end;
			task.delay(4, function()
				local v24 = v18;
				if v24 ~= nil then
					v24 = v24:Destroy();
				end;
				return v24;
			end);
		end;
		task.spawn(p9, p10);
	end;
	local function u13(p11, p12)
		local v25 = l__Workspace__3:Raycast(u10, l__direction__11 * (100 * p11), v20);
		if v25 ~= nil then
			if not v25.Instance.CanCollide then
				local v26 = v20.FilterDescendantsInstances;
				table.insert(v26, v25.Instance);
				v20.FilterDescendantsInstances = v26;
				u13(p11, p12);
				return nil;
			end;
			u10 = v25.Position;
			u12(v25);
		else
			u10 = l__startPosition__15 + l__direction__11 * (100 * p12);
		end;
		if v17 then
			u9 = (u9 + 12.566370614359172 * p11) % u5;
			v18.CFrame = CFrame.lookAt(u10, u10 + l__direction__11) * CFrame.Angles(0, 0, u9);
		end;
	end;
	u8 = l__RunService__4.Heartbeat:Connect(function(p13)
		debug.profilebegin("HelicopterMissileUpdate");
		local v27 = time() - v16;
		if v27 > 3 then
			u12();
			debug.profileend();
			return nil;
		end;
		u13(p13, v27);
		debug.profileend();
	end);
	u13(p8, p8);
end;
return {
	MISSILE_FIRE_RATE = 0.75, 
	HelicopterMissile = v5
};
