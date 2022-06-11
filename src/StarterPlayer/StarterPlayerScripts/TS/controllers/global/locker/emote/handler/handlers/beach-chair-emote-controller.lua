-- Script Hash: 92fdd65a5359252e062d3b5985a86ad5891ee59c48e186c063b9b37ab5137b4cb23beb4245a502776dfaebae07d0d13b
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
	local v6 = l__Workspace__2:GetChildren();
	local function v7(p3)
		if p3.Name == "BlueBeachChair" and p3:IsA("Model") then
			local l__PrimaryPart__8 = p3.PrimaryPart;
			if l__PrimaryPart__8 ~= nil then
				local v9 = l__PrimaryPart__8.CFrame * CFrame.Angles(0, math.rad(180), 0);
			end;
		end;
	end;
	for v10, v11 in ipairs(v6) do
		v7(v11, v10 - 1, v6);
	end;
	local l__EmoteHandlerController__12 = l__KnitClient__3.Controllers.EmoteHandlerController;
	local v13 = setmetatable({}, {
		__tostring = function()
			return "Anonymous";
		end, 
		__index = l__EmoteHandler__5
	});
	v13.__index = v13;
	function v13.new(...)
		local v14 = setmetatable({}, v13);
		return v14:constructor(...) and v14;
	end;
	local u10 = l__EmoteHandler__5;
	function v13.constructor(p4, ...)
		u10.constructor(p4, ...);
		p4.maid = u6.new();
	end;
	function v13.onEnable(p5, p6, p7, p8)
		l__ReplicatedStorage__7.Assets.Misc.BlueBeachChair:Clone();
		local v15 = l__ReplicatedStorage__7.Assets.Misc.BlueBeachChair:Clone();
		local v16 = l__ReplicatedStorage__7.Assets.Misc.CoconutDrink:Clone();
		v15.Parent = l__Workspace__2;
		v15:PivotTo((p7.LowerTorso.CFrame + Vector3.new(0, 1.3, 0)) * CFrame.Angles(0, math.rad(180), 0));
		local v17 = v15:GetDescendants();
		local function v18(p9)
			if p9:IsA("BasePart") then
				l__GameQueryUtil__8:setQueryIgnored(p9, true);
				p9.CanCollide = false;
				p9.Anchored = true;
			end;
		end;
		for v19, v20 in ipairs(v17) do
			v18(v20, v19 - 1, v17);
		end;
		v16.Parent = p7;
		l__WeldUtil__9.weldCharacterAccessories(p7);
		p5.maid:GiveTask(function()
			v15:Destroy();
			v16:Destroy();
		end);
	end;
	function v13.onDisable(p10, p11, p12, p13)
		p10.maid:DoCleaning();
	end;
	u10 = l__EmoteHandlerController__12.registerHandler;
	u10(l__EmoteHandlerController__12, l__EmoteType__4.BEACH_VACATION, v13);
end;
u1 = l__KnitClient__3.CreateController;
u1 = u1(v4.new());
return nil;
