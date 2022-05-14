-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "PickupEffectController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "PickupEffectController";
end;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
end;
local l__Players__2 = v2.Players;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__RunService__4 = v2.RunService;
local l__Workspace__5 = v2.Workspace;
function v4.playEffect(p3, p4, p5)
	if p5 == nil then
		p5 = l__Players__2.LocalPlayer.Character;
	end;
	local v6 = u3.new();
	local v7 = math.random() * math.pi * 2;
	local v8 = p5;
	if v8 ~= nil then
		v8 = v8.PrimaryPart;
	end;
	if not v8 then
		return nil;
	end;
	local u6 = p5:GetPrimaryPartCFrame();
	local u7 = 0;
	local u8 = Vector3.new(math.cos(v7), 0, math.sin(v7)) * 3;
	local l__CFrame__9 = p4.CFrame;
	v6:GiveTask(l__RunService__4.RenderStepped:Connect(function(p6)
		local v9 = nil;
		local v10 = p5;
		if v10 ~= nil then
			v10 = v10.PrimaryPart;
			if v10 ~= nil then
				v10 = v10.CFrame;
			end;
		end;
		if not v10 then
			v6:DoCleaning();
			return nil;
		end;
		local v11 = p6 * 80;
		local l__Magnitude__12 = (u6.Position - v10.Position).Magnitude;
		local v13 = v11 / l__Magnitude__12;
		if l__Magnitude__12 > 20 then
			v13 = (l__Magnitude__12 - 20 + v11) / l__Magnitude__12;
		end;
		u6 = u6:Lerp(v10, math.clamp(v13, 0, 1));
		local v14 = l__Workspace__5.CurrentCamera;
		if v14 ~= nil then
			v14 = v14.CFrame;
		end;
		if not v14 then
			v6:DoCleaning();
			return nil;
		end;
		u7 = u7 + p6;
		local u10 = 0;
		v9 = function(p7)
			return (u7 - (u10 - p7)) / p7;
		end;
		u10 = u10 + 0.14;
		if u7 < u10 then
			local v15 = v9(0.14);
			local v16 = v10 + (u8 + Vector3.new(0, 8, 0));
			p4.CFrame = l__CFrame__9:Lerp(CFrame.new(v16.Position) * (function(p8)
				local l__LookVector__17 = CFrame.new(p8, v14.Position).LookVector;
				local v18 = Vector3.new(l__LookVector__17.X, 0, l__LookVector__17.Z);
				if v18.Magnitude == 0 then
					v18 = Vector3.new(1, 0, 0);
				end;
				return CFrame.new(Vector3.new(0, 0, 0), v18.Unit);
			end)(v16.Position), math.pow(v15, 0.4));
		else
			u10 = u10 + 0.12;
			if u7 < u10 then
				p4.CFrame = CFrame.new((u8 + Vector3.new(0, 8, 0)):Lerp(u8 + Vector3.new(0, 6, 0), math.pow(v9(0.12), 0.25)) + u6.Position);
			else
				u10 = u10 + 0.08;
				if u7 < u10 then
					p4.CFrame = CFrame.new(u8 + Vector3.new(0, 6, 0) + u6.Position);
				else
					u10 = u10 + 0.06;
					if not (u7 < u10) then
						v6:DoCleaning();
						return nil;
					end;
					local v19 = v9(0.06);
					p4.CFrame = CFrame.new((u8 + Vector3.new(0, 6, 0)):Lerp(u8 + Vector3.new(0, 3, 0), v19) + u6.Position);
					p4.Size = p4.Size:Lerp(Vector3.new(0, 0, 0), v19);
				end;
			end;
		end;
	end));
	return v6;
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
