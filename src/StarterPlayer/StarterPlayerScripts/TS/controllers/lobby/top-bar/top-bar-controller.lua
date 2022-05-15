
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "TopBarController";
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
	p1.Name = "TopBarController";
end;
local l__PlaceUtil__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__StarterGui__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).StarterGui;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	if l__PlaceUtil__2.isGameServer() then
		return nil;
	end;
	p2:mountHUD();
	l__StarterGui__3:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false);
end;
local l__CreateRoduxApp__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__TopBarAppWrapper__5 = v1.import(script, script.Parent, "top-bar-app").TopBarAppWrapper;
function v3.mountHUD(p3)
	v1.Promise.defer(function()
		l__CreateRoduxApp__4("TopBarApp", l__TopBarAppWrapper__5, {}, {}, {});
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;

