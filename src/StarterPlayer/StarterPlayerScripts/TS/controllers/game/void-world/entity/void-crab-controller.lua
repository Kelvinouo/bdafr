-- Script Hash: f22edca305057a5974963205074740b2dd53ca0000105776063c94b8328824edcb5c978e488cb14741009aab4551e523
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
local u1 = l__KnitController__2;
function v3.constructor(p1)
	u1.constructor(p1);
	p1.Name = "VoidCrabController";
end;
local l__CollectionTagAdded__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded;
local l__AnimatorAdded__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).AnimatorAdded;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__GameAnimationUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__default__7 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__Linear__8 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).Linear;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	l__CollectionTagAdded__2("VoidCrab", function(p3)
		local l__TargetBeam__9 = p3:WaitForChild("TargetBeam");
		local l__BlastBeam__10 = p3:WaitForChild("BlastBeam");
		local l__LaserTarget__11 = p3:WaitForChild("LaserTarget");
		l__AnimatorAdded__3(p3:WaitForChild("Humanoid"), function(p4)
			p4.AnimationPlayed:Connect(function(p5)
				local v5 = p5.Animation;
				if v5 ~= nil then
					v5 = v5.AnimationId;
				end;
				local u12 = u4.new();
				u12:GiveTask(p5.Stopped:Connect(function()
					u12:DoCleaning();
				end));
				u12:GiveTask(p5);
				if v5 == l__GameAnimationUtil__5.getAssetId(l__AnimationType__6.VOID_CRAB_BEAM_ATTACK) then
					l__TargetBeam__9.Enabled = true;
					local function v6(p6)
						local v7 = p6;
						if v7 ~= nil then
							v7 = v7:FindFirstChild("UpperTorso");
							if v7 ~= nil then
								v7 = v7:FindFirstChild("BodyFrontAttachment");
							end;
						end;
						l__TargetBeam__9.Attachment1 = v7;
						l__BlastBeam__10.Attachment1 = v7;
					end;
					v6(l__LaserTarget__11.Value);
					u12:GiveTask(l__LaserTarget__11.Changed:Connect(function()
						v6(l__LaserTarget__11.Value);
					end));
					u12:GiveTask(p5:GetMarkerReachedSignal("blast"):Connect(function()
						l__TargetBeam__9.Enabled = false;
						l__BlastBeam__10.Enabled = true;
						local u13 = l__default__7(0.1, l__Linear__8, function(p7)
							l__BlastBeam__10.Width0 = 0.1 + p7 * 0.4;
							l__BlastBeam__10.Width1 = 0.2 + p7 * 0.6;
						end);
						u12:GiveTask(function()
							return u13:Cancel();
						end);
						task.delay(0.3, function()
							if not l__BlastBeam__10.Parent then
								return nil;
							end;
							local u14 = l__default__7(0.05, l__Linear__8, function(p8)
								l__BlastBeam__10.Width0 = 0.5 * (1 - p8);
								l__BlastBeam__10.Width1 = 0.8 * (1 - p8);
							end);
							u12:GiveTask(function()
								return u14:Cancel();
							end);
						end);
					end));
				end;
			end);
		end);
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
