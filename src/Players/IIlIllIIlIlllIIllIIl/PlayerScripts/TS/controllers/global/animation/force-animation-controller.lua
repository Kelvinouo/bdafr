-- Script Hash: 4af1439081bf109032f2996c93e63cac68dfe069a7e7fceced980c67d62daab8a02a5d4591349ef8d14916b4885e842c
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "ForceAnimationController";
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
	p1.Name = "ForceAnimationController";
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__AnimationUtil__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).AnimationUtil;
local l__Players__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:OnEvent("ForcePlayAnimation", function(p3)
		local v5 = l__AnimationUtil__3.playAnimation(l__Players__4.LocalPlayer, p3.animation, {
			looped = p3.looped ~= nil
		});
		if p3.priority and v5 then
			v5.Priority = p3.priority;
		end;
		local v6 = false;
		if p3.looped ~= nil then
			v6 = p3.looped ~= true;
		end;
		if v6 then
			local v7 = p3.looped;
			if v7 ~= nil then
				v7 = v7.duration;
			end;
			v6 = v7;
		end;
		if v6 ~= 0 and v6 == v6 and v6 then
			task.delay(p3.looped.duration, function()
				if v5 ~= nil then
					v5:Stop();
				end;
			end);
		end;
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
