-- Script Hash: b635e8b5ee831fb91ca092e9de30c7c430fa84cf4cc409cbcbe98298ff12032e952daea74524935a6f871bff6fda2773
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "TaserController";
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
	p1.Name = "TaserController";
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:OnEvent("Tase", function(p3)
		p2:taseSelf(p3.duration);
	end);
end;
local l__Players__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
function v3.taseSelf(p4, p5)
	local l__Character__5 = l__Players__3.LocalPlayer.Character;
	if l__Character__5 then
		l__Character__5.Humanoid:ChangeState(Enum.HumanoidStateType.Physics);
		l__Character__5.HumanoidRootPart:ApplyAngularImpulse(Vector3.new(math.random(-30, 30), math.random(-30, 30), math.random(-30, 30)) * l__Character__5.HumanoidRootPart.AssemblyMass);
		task.delay(p5, function()
			l__Character__5.Humanoid:ChangeState(Enum.HumanoidStateType.Running);
		end);
	end;
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
