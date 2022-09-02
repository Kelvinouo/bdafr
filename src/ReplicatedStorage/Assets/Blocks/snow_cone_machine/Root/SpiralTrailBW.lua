-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local l__TweenService__1 = game:GetService("TweenService");
local u2 = require(script.CreateTrail);
local l__RunService__3 = game:GetService("RunService");
local l__Debris__4 = game:GetService("Debris");
function v1.Init(p1, p2, p3)
	local v2 = p3.Radius and 2;
	local v3 = p3.Lifetime or math.huge;
	local v4 = p3.Time and 0.45;
	local v5 = p3.Offset and 0.05;
	for v6 = 1, p3.Frequency or math.huge do
		local v7 = p3.Color or Color3.fromRGB(255, 255, 255);
		local v8 = Instance.new("Part");
		v8.Anchored = true;
		v8.CanCollide = false;
		v8.CanTouch = false;
		v8.CanQuery = false;
		v8.CFrame = p2.CFrame * CFrame.new(0, -(p2.Size.Y / 2), 0);
		v8.Size = Vector3.one;
		v8.Transparency = 1;
		v8.Parent = p2;
		l__TweenService__1:Create(v8, TweenInfo.new(v4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1), {
			Orientation = v8.Orientation + Vector3.new(0, 360, 0)
		}):Play();
		local v9 = game.ReplicatedStorage.Assets.Effects.SnowConeMachineParticle:Clone();
		v9.Anchored = true;
		v9.CanCollide = false;
		v9.CanTouch = false;
		v9.CanQuery = false;
		v9.CFrame = v8.CFrame;
		v9.Size = Vector3.one;
		v9.Transparency = 1;
		v9.Parent = workspace;
		local v10 = u2(v9, p3.Size and 0.275, v7, p3.Transparency and 0);
		local u5 = 0;
		local v11 = l__RunService__3.RenderStepped:Connect(function(p4)
			u5 = (u5 + p4 / v3) % 1;
			v8.CFrame = v8.CFrame * CFrame.new(0, v5, 0);
			v9.CFrame = v8.CFrame * CFrame.Angles(0, 2 * math.pi * u5, 0) * CFrame.new(0, 0, v2);
		end);
		task.wait(1.35);
		v9.Attachment.Snowflake.Enabled = false;
		v10.Enabled = false;
		l__Debris__4:AddItem(v8, 1);
		l__Debris__4:AddItem(v9, 1);
		task.wait(1);
		v11:Disconnect();
	end;
end;
return v1;
