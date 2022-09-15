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
function v4.constructor(p1, ...)
	l__KnitController__3.constructor(p1, ...);
	p1.Name = "DodoBirdSittingController";
end;
local l__RunService__1 = v2.RunService;
local l__CollectionService__2 = v2.CollectionService;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__RunService__1.Stepped:Connect(function()
		local v6, v7, v8 = ipairs(l__CollectionService__2:GetTagged("dodo-bird-mount"));
		while true do
			v6(v7, v8);
			if not v6 then
				break;
			end;
			v8 = v6;
			local l__Parent__9 = v7.Parent;
			if l__Parent__9 and l__Parent__9.PrimaryPart then
				l__Parent__9.LowerTorso.Root.Transform = (l__Parent__9.HumanoidRootPart.CFrame * CFrame.new(0, -1.3, 0)):ToObjectSpace(v7.RootPart.master.torso["torso.001"].TransformedWorldCFrame) * CFrame.Angles(1.2217304763960306, 0, 0);
			end;		
		end;
	end);
end;
local v10 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
