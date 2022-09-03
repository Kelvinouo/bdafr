-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "FishNetEffectController";
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
	p1.Name = "FishNetEffectController";
	p1.fishNetMap = {};
end;
local l__CollectionService__1 = v2.CollectionService;
local l__ReplicatedStorage__2 = v2.ReplicatedStorage;
local l__WeldUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__CollectionService__1:GetInstanceAddedSignal("FishNetted"):Connect(function(p3)
		local v6 = l__ReplicatedStorage__2.Assets.Misc.LassoWrap:Clone();
		v6.Parent = p3;
		local l__UpperTorso__7 = p3:FindFirstChild("UpperTorso");
		if not l__UpperTorso__7 then
			return nil;
		end;
		v6.Rope.CFrame = l__UpperTorso__7.CFrame * CFrame.Angles(0, math.pi / 2, 0);
		l__WeldUtil__3.weldParts(v6.Rope, l__UpperTorso__7);
		local v8 = u4.new();
		v8:GiveTask(v6);
		v8:GiveTask(p3.Destroying:Connect(function()
			p2.fishNetMap[p3] = nil;
		end));
		p2.fishNetMap[p3] = v8;
	end);
	l__CollectionService__1:GetInstanceRemovedSignal("FishNetted"):Connect(function(p4)
		local v9 = p2.fishNetMap[p4];
		if v9 ~= nil then
			v9:DoCleaning();
		end;
		p2.fishNetMap[p4] = nil;
	end);
end;
local v10 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
