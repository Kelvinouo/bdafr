-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "MountSittingController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "MountSittingController";
end;
local l__RunService__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).RunService;
local l__KnitClient__3 = v2.KnitClient;
local l__MountMeta__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-meta").MountMeta;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__RunService__2.Stepped:Connect(function()
		for v6, v7 in pairs(l__KnitClient__3.Controllers.MountController:getActiveMounts()) do
			local v8 = l__MountMeta__4[v7.mountType];
			if v8 ~= nil then
				local l__Parent__9 = v7.model.Parent;
				if l__Parent__9 ~= nil and v7.model.PrimaryPart and v8.controlBoneCallback then
					local v10 = v8.controlBoneCallback(v7.model);
					if v10 then
						l__Parent__9.LowerTorso.Root.Transform = (l__Parent__9.HumanoidRootPart.CFrame * CFrame.new(0, -1.3, 0)):ToObjectSpace(v10.TransformedWorldCFrame) * CFrame.Angles(1.2217304763960306, 0, 0);
					end;
				end;
			end;
		end;
	end);
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
