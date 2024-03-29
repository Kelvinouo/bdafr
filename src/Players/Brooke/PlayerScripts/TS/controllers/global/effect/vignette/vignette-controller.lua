-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "VignetteController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
function v5.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "VignetteController";
end;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
end;
local l__Workspace__1 = v3.Workspace;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__RunService__3 = v3.RunService;
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "screen-space");
local l__KnitClient__5 = v2.KnitClient;
function v5.createVignette(p3, p4)
	local v7 = p3:createVignettePart();
	p3:initializeParticles(v7, p4.particleEmitters, Enum.NormalId.Left, p4.speed);
	v7.Parent = l__Workspace__1.CurrentCamera;
	local v8 = p3:createVignettePart();
	p3:initializeParticles(v8, p4.particleEmitters, Enum.NormalId.Right, p4.speed);
	v8.Parent = l__Workspace__1.CurrentCamera;
	local v9 = p3:createVignettePart();
	p3:initializeParticles(v9, p4.particleEmitters, Enum.NormalId.Bottom, p4.speed);
	v9.Parent = l__Workspace__1.CurrentCamera;
	local v10 = p3:createVignettePart();
	p3:initializeParticles(v10, p4.particleEmitters, Enum.NormalId.Top, p4.speed);
	v10.Parent = l__Workspace__1.CurrentCamera;
	local v11 = u2.new();
	v11:GiveTask(l__RunService__3.RenderStepped:Connect(function()
		if p4.shouldShow and p4.shouldShow() == false then
			v7.CFrame = CFrame.new(math.huge, 0, 0);
			v8.CFrame = CFrame.new(math.huge, 0, 0);
			v9.CFrame = CFrame.new(math.huge, 0, 0);
			v10.CFrame = CFrame.new(math.huge, 0, 0);
			return nil;
		end;
		local v12 = Vector3.new(1, u4.ScreenHeightToWorldHeight(u4.ViewSizeY(), -4, l__KnitClient__5.Controllers.FovController:getBaseFOV()) * 1.2, 1);
		local v13 = Vector3.new(u4.ScreenWidthToWorldWidth(u4.ViewSizeX(), -4, l__KnitClient__5.Controllers.FovController:getBaseFOV()) * 1.2, 1, 1);
		v7.CFrame = l__Workspace__1.CurrentCamera.CFrame * CFrame.new(u4.ScreenWidthToWorldWidth(u4.ViewSizeX() / 2, -4), 0, -4.5);
		v8.CFrame = l__Workspace__1.CurrentCamera.CFrame * CFrame.new(u4.ScreenWidthToWorldWidth(-u4.ViewSizeX() / 2, -4), 0, -4.5);
		v9.CFrame = l__Workspace__1.CurrentCamera.CFrame * CFrame.new(0, u4.ScreenHeightToWorldHeight(u4.ViewSizeY() / 2, -4), -4.5);
		v10.CFrame = l__Workspace__1.CurrentCamera.CFrame * CFrame.new(0, u4.ScreenHeightToWorldHeight(-u4.ViewSizeY() / 2, -4), -4.5);
		v7.Size = v12;
		v8.Size = v12;
		v9.Size = v13;
		v10.Size = v13;
	end));
	v11:GiveTask(v7);
	v11:GiveTask(v8);
	v11:GiveTask(v9);
	v11:GiveTask(v10);
	return v11;
end;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
function v5.createVignettePart(p5)
	return u6("Part", {
		Size = Vector3.new(1, 1, 1), 
		CanCollide = false, 
		Transparency = 1, 
		Anchored = true, 
		Parent = l__Workspace__1.CurrentCamera
	});
end;
function v5.initializeParticles(p6, p7, p8, p9, p10)
	local v14, v15, v16 = ipairs(p8);
	while true do
		v14(v15, v16);
		if not v14 then
			break;
		end;
		v16 = v14;
		local v17 = v15:Clone();
		v17.LockedToPart = true;
		v17.ZOffset = 3;
		if p10 ~= 0 and p10 == p10 and p10 then
			v17.Speed = NumberRange.new(p10);
		end;
		v17.EmissionDirection = p9;
		v17.Parent = p7;	
	end;
end;
local v18 = v2.KnitClient.CreateController(v5.new());
return nil;
