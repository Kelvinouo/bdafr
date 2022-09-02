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
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "PickupEffectController";
end;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
end;
local l__Players__1 = v2.Players;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__RunService__3 = v2.RunService;
local l__Workspace__4 = v2.Workspace;
function v4.playEffect(p3, p4, p5)
	if p5 == nil then
		p5 = l__Players__1.LocalPlayer.Character;
	end;
	local v6 = u2.new();
	local v7 = math.random() * math.pi * 2;
	local v8 = p5;
	if v8 ~= nil then
		v8 = v8.PrimaryPart;
	end;
	if not v8 then
		return nil;
	end;
	local u5 = p5:GetPrimaryPartCFrame();
	local u6 = 0;
	local u7 = Vector3.new(math.cos(v7), 0, math.sin(v7)) * 3;
	local l__CFrame__8 = p4.CFrame;
	v6:GiveTask(l__RunService__3.RenderStepped:Connect(function(p6)
		local v9 = p5;
		if v9 ~= nil then
			v9 = v9.PrimaryPart;
			if v9 ~= nil then
				v9 = v9.CFrame;
			end;
		end;
		if not v9 then
			v6:DoCleaning();
			return nil;
		end;
		local v10 = p6 * 80;
		local l__Magnitude__11 = (u5.Position - v9.Position).Magnitude;
		local v12 = v10 / l__Magnitude__11;
		if l__Magnitude__11 > 20 then
			v12 = (l__Magnitude__11 - 20 + v10) / l__Magnitude__11;
		end;
		u5 = u5:Lerp(v9, math.clamp(v12, 0, 1));
		local v13 = l__Workspace__4.CurrentCamera;
		if v13 ~= nil then
			v13 = v13.CFrame;
		end;
		if not v13 then
			v6:DoCleaning();
			return nil;
		end;
		u6 = u6 + p6;
		local u9 = 0;
		u9 = u9 + 0.14;
		if u6 < u9 then
			local v14 = v9 + (u7 + Vector3.new(0, 8, 0));
			p4.CFrame = l__CFrame__8:Lerp(CFrame.new(v14.Position) * (function(p7)
				local l__LookVector__15 = CFrame.new(p7, v13.Position).LookVector;
				local v16 = Vector3.new(l__LookVector__15.X, 0, l__LookVector__15.Z);
				if v16.Magnitude == 0 then
					v16 = Vector3.new(1, 0, 0);
				end;
				return CFrame.new(Vector3.new(0, 0, 0), v16.Unit);
			end)(v14.Position), math.pow((u6 - (u9 - 0.14)) / 0.14, 0.4));
		else
			u9 = u9 + 0.12;
			if u6 < u9 then
				p4.CFrame = CFrame.new((u7 + Vector3.new(0, 8, 0)):Lerp(u7 + Vector3.new(0, 6, 0), math.pow((u6 - (u9 - 0.12)) / 0.12, 0.25)) + u5.Position);
			else
				u9 = u9 + 0.08;
				if u6 < u9 then
					p4.CFrame = CFrame.new(u7 + Vector3.new(0, 6, 0) + u5.Position);
				else
					u9 = u9 + 0.06;
					if not (u6 < u9) then
						v6:DoCleaning();
						return nil;
					end;
					local v17 = (u6 - (u9 - 0.06)) / 0.06;
					p4.CFrame = CFrame.new((u7 + Vector3.new(0, 6, 0)):Lerp(u7 + Vector3.new(0, 3, 0), v17) + u5.Position);
					p4.Size = p4.Size:Lerp(Vector3.new(0, 0, 0), v17);
				end;
			end;
		end;
	end));
	return v6;
end;
local v18 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
