-- Script Hash: 1f73882f6f5431b06bba46512b9442406ea5338c3a4f76e7b6f1fe77220875f53cfd992cddd1d236e32ed596cd86fcd9
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "DodoBirdSittingController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
function v4.constructor(p1, ...)
	u1.constructor(p1, ...);
	p1.Name = "DodoBirdSittingController";
end;
local l__RunService__2 = v2.RunService;
local l__CollectionService__3 = v2.CollectionService;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__RunService__2.Stepped:Connect(function()
		for v6, v7 in ipairs(l__CollectionService__3:GetTagged("dodo-bird-mount")) do
			local l__Parent__8 = v7.Parent;
			if l__Parent__8 and l__Parent__8.PrimaryPart then
				l__Parent__8.LowerTorso.Root.Transform = (l__Parent__8.HumanoidRootPart.CFrame * CFrame.new(0, -1.3, 0)):ToObjectSpace(v7.RootPart.master.torso["torso.001"].TransformedWorldCFrame) * CFrame.Angles(math.rad(70), 0, 0);
			end;
		end;
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
