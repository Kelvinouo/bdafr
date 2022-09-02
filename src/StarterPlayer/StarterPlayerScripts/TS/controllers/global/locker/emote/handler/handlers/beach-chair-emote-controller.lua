-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "BeachChairEmoteController";
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
	p1.Name = "BeachChairEmoteController";
end;
local l__Workspace__2 = v2.Workspace;
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__EmoteType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local l__EmoteHandler__5 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__ReplicatedStorage__7 = v2.ReplicatedStorage;
local l__GameQueryUtil__8 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameQueryUtil;
local l__WeldUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	for v6, v7 in ipairs((l__Workspace__2:GetChildren())) do
		if v7.Name == "BlueBeachChair" and v7:IsA("Model") then
			local l__PrimaryPart__8 = v7.PrimaryPart;
			if l__PrimaryPart__8 ~= nil then
				local v9 = l__PrimaryPart__8.CFrame * CFrame.Angles(0, 3.141592653589793, 0);
			end;
		end;
	end;
	local l__EmoteHandlerController__10 = l__KnitClient__3.Controllers.EmoteHandlerController;
	local v11 = setmetatable({}, {
		__tostring = function()
			return "Anonymous";
		end, 
		__index = l__EmoteHandler__5
	});
	v11.__index = v11;
	function v11.new(...)
		local v12 = setmetatable({}, v11);
		return v12:constructor(...) and v12;
	end;
	local u10 = l__EmoteHandler__5;
	function v11.constructor(p3, ...)
		u10.constructor(p3, ...);
		p3.maid = u6.new();
	end;
	function v11.onEnable(p4, p5, p6, p7)
		l__ReplicatedStorage__7.Assets.Misc.BlueBeachChair:Clone();
		local v13 = l__ReplicatedStorage__7.Assets.Misc.BlueBeachChair:Clone();
		local v14 = l__ReplicatedStorage__7.Assets.Misc.CoconutDrink:Clone();
		v13.Parent = l__Workspace__2;
		v13:PivotTo((p6.LowerTorso.CFrame + Vector3.new(0, 1.3, 0)) * CFrame.Angles(0, 3.141592653589793, 0));
		for v15, v16 in ipairs((v13:GetDescendants())) do
			if v16:IsA("BasePart") then
				l__GameQueryUtil__8:setQueryIgnored(v16, true);
				v16.CanCollide = false;
				v16.Anchored = true;
			end;
		end;
		v14.Parent = p6;
		l__WeldUtil__9.weldCharacterAccessories(p6);
		p4.maid:GiveTask(function()
			v13:Destroy();
			v14:Destroy();
		end);
	end;
	function v11.onDisable(p8, p9, p10, p11)
		p8.maid:DoCleaning();
	end;
	u10 = l__EmoteHandlerController__10.registerHandler;
	u10(l__EmoteHandlerController__10, l__EmoteType__4.BEACH_VACATION, v11);
end;
u1 = l__KnitClient__3.CreateController;
u1 = u1(v4.new());
return nil;
