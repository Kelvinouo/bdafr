-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "ShockwaveTurretController";
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
	p1.Name = "ShockwaveTurretController";
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__default__1.Client:Get("RemoteName"):Connect(function(p3)
		p2:playEffect(p3.CFrame);
		task.delay(0.5, function()
			p2:clear(p3.turret);
		end);
		p2:chargeUp(p3.turret);
	end);
end;
local l__ReplicatedStorage__2 = v2.ReplicatedStorage;
local l__Workspace__3 = v2.Workspace;
local l__RunService__4 = v2.RunService;
local l__scaleModel__5 = v1.import(script, v1.getModule(script, "@rbxts", "scale-model").out).scaleModel;
function v4.playEffect(p4, p5)
	local v6 = l__ReplicatedStorage__2.Assets.Effects.ShockWave:Clone();
	v6:SetPrimaryPartCFrame(p5);
	v6.Parent = l__Workspace__3;
	local u6 = time() + 0.6;
	local u7 = nil;
	local u8 = 1.02;
	u7 = l__RunService__4.Heartbeat:Connect(function(p6)
		if not (u6 < time()) then
			l__scaleModel__5(v6, u8);
			u8 = u8 + p6 / 3;
			return;
		end;
		v6:Destroy();
		u7:Disconnect();
		return nil;
	end);
end;
local l__ItemType__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
v4.chargeUp = v1.async(function(p7, p8)
	if p8.Name == l__ItemType__9.SHOCK_WAVE_TURRET then
		local l__Circle__7 = p8:WaitForChild("Circle", 3);
		if l__Circle__7 == nil then
			return nil;
		end;
		local v8 = 0;
		local v9 = false;
		while true do
			if v9 then
				v8 = v8 + 1;
			else
				v9 = true;
			end;
			if not (v8 < 5) then
				break;
			end;
			wait(0.9);
			local v10 = l__Circle__7:WaitForChild("Circle" .. tostring(v8), 3);
			if v10 then
				v10.Color = Color3.fromRGB(0, 255, 0);
			end;		
		end;
	end;
end);
function v4.clear(p9, p10)
	if p10.Name == l__ItemType__9.SHOCK_WAVE_TURRET then
		local v11 = p10:WaitForChild("Circle", 3);
		if v11 ~= nil then
			v11 = v11:GetChildren();
		end;
		if v11 == nil then
			return nil;
		end;
		local v12, v13, v14 = ipairs(v11);
		while true do
			v12(v13, v14);
			if not v12 then
				break;
			end;
			v14 = v12;
			v13.Color = Color3.fromRGB(77, 77, 77);		
		end;
	end;
end;
local v15 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
