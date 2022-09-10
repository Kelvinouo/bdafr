-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "GlitchTaserController";
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
	p1.Name = "GlitchTaserController";
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	l__default__1.Client:OnEvent("RemoteName", function(p3)
		p2:taseSelf(p3.duration);
	end);
end;
local l__Players__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
function v3.taseSelf(p4, p5)
	local l__Character__5 = l__Players__2.LocalPlayer.Character;
	if l__Character__5 then
		l__Character__5.Humanoid:ChangeState(Enum.HumanoidStateType.Physics);
		l__Character__5.HumanoidRootPart:ApplyAngularImpulse(Vector3.new(math.random(-30, 30), math.random(-30, 30), math.random(-30, 30)) * l__Character__5.HumanoidRootPart.AssemblyMass);
		task.delay(p5, function()
			l__Character__5.Humanoid:ChangeState(Enum.HumanoidStateType.Running);
		end);
	end;
end;
local v6 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
