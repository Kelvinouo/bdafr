-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "ResetController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
local u1 = v4;
function u1.new(...)
	local v5 = setmetatable({}, u1);
	return v5:constructor(...) and v5;
end;
function u1.constructor(p1, ...)
	l__KnitController__3.constructor(p1, ...);
	p1.Name = "ResetController";
end;
local l__StarterGui__2 = v2.StarterGui;
local l__RunService__3 = v2.RunService;
function u1.KnitStart(p2)
	local v6 = u1:createBindable();
	while not false do
		local u4 = false;
		v1.try(function()
			l__StarterGui__2:SetCore("ResetButtonCallback", v6);
			u4 = true;
		end, function(p3)

		end);
		l__RunService__3.Stepped:Wait();	
	end;
end;
local l__default__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function u1.createBindable(p4)
	local v7 = Instance.new("BindableEvent");
	v7.Event:Connect(function()
		l__default__5.Client:Get("RemoteName"):SendToServer();
	end);
	return v7;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1(u1.new());
u1 = nil;
return u1;
