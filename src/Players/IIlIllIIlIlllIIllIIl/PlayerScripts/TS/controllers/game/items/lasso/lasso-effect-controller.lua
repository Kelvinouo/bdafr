-- Script Hash: 524ac073b7532bf7ba8e8e319fa6926df98da60e1bea820d129043cb71ece904b3508a9dda1e0d6fc979ea2aea893806
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "LassoEffectController";
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
	p1.Name = "LassoEffectController";
	p1.lassoWrap = {};
end;
local l__CollectionService__2 = v3.CollectionService;
local l__ReplicatedStorage__3 = v3.ReplicatedStorage;
local l__WeldUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local l__Maid__5 = v2.Maid;
local l__ClientSyncEvents__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__EntityUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__SoundManager__8 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__CollectionService__2:GetInstanceAddedSignal("LassoHooked"):Connect(function(p3)
		local v7 = l__ReplicatedStorage__3.Assets.Misc.LassoWrap:Clone();
		v7.Parent = p3;
		local l__UpperTorso__8 = p3:FindFirstChild("UpperTorso");
		if not l__UpperTorso__8 then
			return nil;
		end;
		v7.Rope.CFrame = l__UpperTorso__8.CFrame * CFrame.Angles(0, math.pi / 2, 0);
		l__WeldUtil__4.weldParts(v7.Rope, l__UpperTorso__8);
		local v9 = l__Maid__5.new();
		v9:GiveTask(v7);
		v9:GiveTask(p3.Destroying:Connect(function()
			p2.lassoWrap[p3] = nil;
		end));
		p2.lassoWrap[p3] = v9;
	end);
	l__CollectionService__2:GetInstanceRemovedSignal("LassoHooked"):Connect(function(p4)
		local v10 = p2.lassoWrap[p4];
		if v10 ~= nil then
			v10:DoCleaning();
		end;
		p2.lassoWrap[p4] = nil;
	end);
	l__ClientSyncEvents__6.ProjectileLaunched:connect(function(p5)
		if p5:isCancelled() then
			return nil;
		end;
		if p5.projectileType ~= "lasso" then
			return nil;
		end;
		if not p5.shooter then
			return nil;
		end;
		local v11 = l__EntityUtil__7:getEntity(p5.shooter);
		if not v11 then
			return nil;
		end;
		local v12 = v11:getInstance():FindFirstChild("RightHand");
		if v12 ~= nil then
			v12 = v12:FindFirstChild("RightGripAttachment");
		end;
		if not v12 then
			return nil;
		end;
		local l__Handle__13 = p5.projectile:FindFirstChild("Handle");
		if not l__Handle__13 then
			return nil;
		end;
		local v14 = p5.projectile:FindFirstChild("Handle");
		if v14 ~= nil then
			v14 = v14:FindFirstChild("Beam");
		end;
		if not v14 then
			return nil;
		end;
		local u10 = l__Maid__5.new();
		v14.Destroying:Connect(function()
			u10:DoCleaning();
		end);
		local v15 = p5.projectile:FindFirstChild("Handle");
		if v15 ~= nil then
			v15 = v15:FindFirstChild("BeamPoint");
		end;
		if not v15 then
			return nil;
		end;
		v14.Attachment0 = v12;
		v14.Attachment1 = v15;
		local v16 = v11:getInstance():FindFirstChild("UpperTorso");
		if v16 ~= nil then
			v16 = v16:FindFirstChild("BodyFrontAttachment");
		end;
		v12.Destroying:Connect(function()
			if v16 and v14.Parent then
				v14.Attachment0 = v16;
			end;
		end);
		local v17 = l__SoundManager__8:playSound(l__GameSound__9.GRAPPLING_HOOK_EXTEND_LOOP, {
			position = l__Handle__13.Position, 
			parent = l__Handle__13, 
			rollOffMaxDistance = 150
		});
		if v17 then
			v17.Looped = true;
		end;
		u10:GiveTask(function()
			if v17 ~= nil then
				v17:Stop();
			end;
			if v17 ~= nil then
				v17:Destroy();
			end;
		end);
	end);
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
