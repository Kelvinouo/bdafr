-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "ScreenParticlesController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__KnitController__4;
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "ScreenParticlesController";
end;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__3 = v3.Workspace;
local l__GameQueryUtil__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameQueryUtil;
local l__RunService__5 = v3.RunService;
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "screen-space");
local l__KnitClient__7 = v2.KnitClient;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v5.emitParticlesOnScreen(p3, p4)
	local v7 = u2("Part", {
		Size = Vector3.new(1, 1, 1), 
		CanCollide = false, 
		Transparency = 1, 
		Anchored = true, 
		Parent = l__Workspace__3.CurrentCamera
	});
	l__GameQueryUtil__4:setQueryIgnored(v7, true);
	local v8 = {};
	for v9, v10 in ipairs(p4.particleEmitter) do
		local v11 = v10:Clone();
		v11.LockedToPart = true;
		v11.ZOffset = 0;
		v11.EmissionDirection = Enum.NormalId.Back;
		v11.Enabled = false;
		v11.Parent = v7;
		table.insert(v8, v11);
	end;
	local v12 = l__RunService__5.RenderStepped:Connect(function()
		local v13 = p4.depth;
		if v13 == nil then
			v13 = 0.5;
		end;
		v7.CFrame = l__Workspace__3.CurrentCamera.CFrame * CFrame.new(0, 0, -v13 - 0.5);
		v7.Size = Vector3.new(u6.ScreenWidthToWorldWidth(u6.ViewSizeX(), -v13, l__KnitClient__7.Controllers.FovController:getBaseFOV()) * 1.2, u6.ScreenHeightToWorldHeight(u6.ViewSizeY(), -v13, l__KnitClient__7.Controllers.FovController:getBaseFOV()) * 1.2, 1);
	end);
	for v14, v15 in ipairs(v8) do
		local v16 = v15:GetAttribute("EmitCount");
		if v16 == nil then
			v16 = 30;
		end;
		v15:Emit(v16);
	end;
	local v17 = u8.new();
	v17:GiveTask(v7);
	v17:GiveTask(v12);
	task.delay(p4.cleanupAfter, function()
		v17:DoCleaning();
	end);
	return v17;
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
