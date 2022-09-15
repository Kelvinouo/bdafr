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
function v5.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "ScreenParticlesController";
end;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__2 = v3.Workspace;
local l__GameQueryUtil__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameQueryUtil;
local l__RunService__4 = v3.RunService;
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "screen-space");
local l__KnitClient__6 = v2.KnitClient;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v5.emitParticlesOnScreen(p3, p4)
	local v7 = u1("Part", {
		Size = Vector3.new(1, 1, 1), 
		CanCollide = false, 
		Transparency = 1, 
		Anchored = true, 
		Parent = l__Workspace__2.CurrentCamera
	});
	l__GameQueryUtil__3:setQueryIgnored(v7, true);
	local v8 = {};
	local v9, v10, v11 = ipairs(p4.particleEmitter);
	while true do
		v9(v10, v11);
		if not v9 then
			break;
		end;
		v11 = v9;
		local v12 = v10:Clone();
		v12.LockedToPart = true;
		v12.ZOffset = 0;
		v12.EmissionDirection = Enum.NormalId.Back;
		v12.Enabled = false;
		v12.Parent = v7;
		table.insert(v8, v12);	
	end;
	local v13 = l__RunService__4.RenderStepped:Connect(function()
		local v14 = p4.depth;
		if v14 == nil then
			v14 = 0.5;
		end;
		v7.CFrame = l__Workspace__2.CurrentCamera.CFrame * CFrame.new(0, 0, -v14 - 0.5);
		v7.Size = Vector3.new(u5.ScreenWidthToWorldWidth(u5.ViewSizeX(), -v14, l__KnitClient__6.Controllers.FovController:getBaseFOV()) * 1.2, u5.ScreenHeightToWorldHeight(u5.ViewSizeY(), -v14, l__KnitClient__6.Controllers.FovController:getBaseFOV()) * 1.2, 1);
	end);
	local v15, v16, v17 = ipairs(v8);
	while true do
		v15(v16, v17);
		if not v15 then
			break;
		end;
		v17 = v15;
		local v18 = v16:GetAttribute("EmitCount");
		if v18 == nil then
			v18 = 30;
		end;
		v16:Emit(v18);	
	end;
	local v19 = u7.new();
	v19:GiveTask(v7);
	v19:GiveTask(v13);
	task.delay(p4.cleanupAfter, function()
		v19:DoCleaning();
	end);
	return v19;
end;
local v20 = v2.KnitClient.CreateController(v5.new());
return nil;
