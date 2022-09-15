-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "VoidCrabController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
function v3.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "VoidCrabController";
end;
local l__CollectionTagAdded__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded;
local l__AnimatorAdded__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).AnimatorAdded;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__GameAnimationUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__default__6 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__Linear__7 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).Linear;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	l__CollectionTagAdded__1("VoidCrab", function(p3)
		local l__TargetBeam__8 = p3:WaitForChild("TargetBeam");
		local l__BlastBeam__9 = p3:WaitForChild("BlastBeam");
		local l__LaserTarget__10 = p3:WaitForChild("LaserTarget");
		l__AnimatorAdded__2(p3:WaitForChild("Humanoid"), function(p4)
			p4.AnimationPlayed:Connect(function(p5)
				local v5 = p5.Animation;
				if v5 ~= nil then
					v5 = v5.AnimationId;
				end;
				local u11 = u3.new();
				u11:GiveTask(p5.Stopped:Connect(function()
					u11:DoCleaning();
				end));
				u11:GiveTask(p5);
				if v5 == l__GameAnimationUtil__4.getAssetId(l__AnimationType__5.VOID_CRAB_BEAM_ATTACK) then
					l__TargetBeam__8.Enabled = true;
					local v6 = l__LaserTarget__10.Value;
					if v6 ~= nil then
						v6 = v6:FindFirstChild("UpperTorso");
						if v6 ~= nil then
							v6 = v6:FindFirstChild("BodyFrontAttachment");
						end;
					end;
					l__TargetBeam__8.Attachment1 = v6;
					l__BlastBeam__9.Attachment1 = v6;
					u11:GiveTask(l__LaserTarget__10.Changed:Connect(function()
						local v7 = l__LaserTarget__10.Value;
						if v7 ~= nil then
							v7 = v7:FindFirstChild("UpperTorso");
							if v7 ~= nil then
								v7 = v7:FindFirstChild("BodyFrontAttachment");
							end;
						end;
						l__TargetBeam__8.Attachment1 = v7;
						l__BlastBeam__9.Attachment1 = v7;
					end));
					u11:GiveTask(p5:GetMarkerReachedSignal("blast"):Connect(function()
						l__TargetBeam__8.Enabled = false;
						l__BlastBeam__9.Enabled = true;
						local u12 = l__default__6(0.1, l__Linear__7, function(p6)
							l__BlastBeam__9.Width0 = 0.1 + p6 * 0.4;
							l__BlastBeam__9.Width1 = 0.2 + p6 * 0.6;
						end);
						u11:GiveTask(function()
							return u12:Cancel();
						end);
						task.delay(0.3, function()
							if not l__BlastBeam__9.Parent then
								return nil;
							end;
							local u13 = l__default__6(0.05, l__Linear__7, function(p7)
								l__BlastBeam__9.Width0 = 0.5 * (1 - p7);
								l__BlastBeam__9.Width1 = 0.8 * (1 - p7);
							end);
							u11:GiveTask(function()
								return u13:Cancel();
							end);
						end);
					end));
				end;
			end);
		end);
	end);
end;
local v8 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
