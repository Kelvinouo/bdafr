-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "LassoEffectController";
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
	p1.Name = "LassoEffectController";
	p1.lassoWrap = {};
end;
local l__CollectionService__1 = v2.CollectionService;
local l__ReplicatedStorage__2 = v2.ReplicatedStorage;
local l__WeldUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__ClientSyncEvents__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__EntityUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__SoundManager__7 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__CollectionService__1:GetInstanceAddedSignal("LassoHooked"):Connect(function(p3)
		local v6 = l__ReplicatedStorage__2.Assets.Misc.LassoWrap:Clone();
		v6.Parent = p3;
		local l__UpperTorso__7 = p3:FindFirstChild("UpperTorso");
		if not l__UpperTorso__7 then
			return nil;
		end;
		v6.Rope.CFrame = l__UpperTorso__7.CFrame * CFrame.Angles(0, math.pi / 2, 0);
		l__WeldUtil__3:weldParts(v6.Rope, l__UpperTorso__7);
		local v8 = u4.new();
		v8:GiveTask(v6);
		v8:GiveTask(p3.Destroying:Connect(function()
			p2.lassoWrap[p3] = nil;
		end));
		p2.lassoWrap[p3] = v8;
	end);
	l__CollectionService__1:GetInstanceRemovedSignal("LassoHooked"):Connect(function(p4)
		local v9 = p2.lassoWrap[p4];
		if v9 ~= nil then
			v9:DoCleaning();
		end;
		p2.lassoWrap[p4] = nil;
	end);
	l__ClientSyncEvents__5.ProjectileLaunched:connect(function(p5)
		if p5:isCancelled() then
			return nil;
		end;
		if p5.projectileType ~= "lasso" then
			return nil;
		end;
		if not p5.shooter then
			return nil;
		end;
		local v10 = l__EntityUtil__6:getEntity(p5.shooter);
		if not v10 then
			return nil;
		end;
		local v11 = v10:getInstance():FindFirstChild("RightHand");
		if v11 ~= nil then
			v11 = v11:FindFirstChild("RightGripAttachment");
		end;
		if not v11 then
			return nil;
		end;
		local l__Handle__12 = p5.projectile:FindFirstChild("Handle");
		if not l__Handle__12 then
			return nil;
		end;
		local v13 = p5.projectile:FindFirstChild("Handle");
		if v13 ~= nil then
			v13 = v13:FindFirstChild("Beam");
		end;
		if not v13 then
			return nil;
		end;
		local u9 = u4.new();
		v13.Destroying:Connect(function()
			u9:DoCleaning();
		end);
		local v14 = p5.projectile:FindFirstChild("Handle");
		if v14 ~= nil then
			v14 = v14:FindFirstChild("BeamPoint");
		end;
		if not v14 then
			return nil;
		end;
		v13.Attachment0 = v11;
		v13.Attachment1 = v14;
		local v15 = v10:getInstance():FindFirstChild("UpperTorso");
		if v15 ~= nil then
			v15 = v15:FindFirstChild("BodyFrontAttachment");
		end;
		v11.Destroying:Connect(function()
			if v15 and v13.Parent then
				v13.Attachment0 = v15;
			end;
		end);
		local v16 = l__SoundManager__7:playSound(l__GameSound__8.GRAPPLING_HOOK_EXTEND_LOOP, {
			position = l__Handle__12.Position, 
			parent = l__Handle__12, 
			rollOffMaxDistance = 150
		});
		if v16 then
			v16.Looped = true;
		end;
		u9:GiveTask(function()
			if v16 ~= nil then
				v16:Stop();
			end;
			if v16 ~= nil then
				v16:Destroy();
			end;
		end);
	end);
end;
local v17 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
