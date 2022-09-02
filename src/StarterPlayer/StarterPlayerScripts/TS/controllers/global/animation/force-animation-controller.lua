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
function v3.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "ForceAnimationController";
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__AnimationUtil__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).AnimationUtil;
local l__Players__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	l__default__1.Client:OnEvent("RemoteName", function(p3)
		local v5 = l__AnimationUtil__2.playAnimation(l__Players__3.LocalPlayer, p3.animation, {
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
local v8 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
