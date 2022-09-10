-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "DisguiseBushController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "DisguiseBushController";
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Workspace__2 = v2.Workspace;
local l__ReplicatedStorage__3 = v2.ReplicatedStorage;
local l__WeldUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__default__1.Client:OnEvent("RemoteName", function(p3)
		local l__Character__6 = p3.target.Character;
		if not l__Character__6 then
			return nil;
		end;
		if not l__Character__6:IsDescendantOf(l__Workspace__2) then
			l__Character__6.AncestryChanged:Wait();
		end;
		local v7 = l__ReplicatedStorage__3.Assets.Misc.BushDisguise:Clone();
		l__Character__6:WaitForChild("Humanoid"):AddAccessory(v7);
		l__WeldUtil__4:weldCharacterAccessories(l__Character__6);
		l__Character__6.Destroying:Connect(function()
			v7:Destroy();
		end);
		task.delay(60, function()
			if v7 then
				v7:Destroy();
			end;
		end);
	end);
end;
local v8 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
