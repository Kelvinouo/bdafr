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
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "BeachChairEmoteController";
end;
local l__Workspace__1 = v2.Workspace;
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__EmoteType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local l__EmoteHandler__4 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__ReplicatedStorage__6 = v2.ReplicatedStorage;
local l__GameQueryUtil__7 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameQueryUtil;
local l__WeldUtil__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	local v6, v7, v8 = ipairs((l__Workspace__1:GetChildren()));
	while true do
		v6(v7, v8);
		if not v6 then
			break;
		end;
		v8 = v6;
		if v7.Name == "BlueBeachChair" and v7:IsA("Model") then
			local l__PrimaryPart__9 = v7.PrimaryPart;
			if l__PrimaryPart__9 ~= nil then
				local v10 = l__PrimaryPart__9.CFrame * CFrame.Angles(0, 3.141592653589793, 0);
			end;
		end;	
	end;
	local l__EmoteHandlerController__11 = l__KnitClient__2.Controllers.EmoteHandlerController;
	local v12 = setmetatable({}, {
		__tostring = function()
			return "Anonymous";
		end, 
		__index = l__EmoteHandler__4
	});
	v12.__index = v12;
	function v12.new(...)
		local v13 = setmetatable({}, v12);
		return v13:constructor(...) and v13;
	end;
	local u9 = l__EmoteHandler__4;
	function v12.constructor(p3, ...)
		u9.constructor(p3, ...);
		p3.maid = u5.new();
	end;
	function v12.onEnable(p4, p5, p6, p7)
		l__ReplicatedStorage__6.Assets.Misc.BlueBeachChair:Clone();
		local v14 = l__ReplicatedStorage__6.Assets.Misc.BlueBeachChair:Clone();
		local v15 = l__ReplicatedStorage__6.Assets.Misc.CoconutDrink:Clone();
		v14.Parent = l__Workspace__1;
		v14:PivotTo((p6.LowerTorso.CFrame + Vector3.new(0, 1.3, 0)) * CFrame.Angles(0, 3.141592653589793, 0));
		local v16, v17, v18 = ipairs((v14:GetDescendants()));
		while true do
			v16(v17, v18);
			if not v16 then
				break;
			end;
			v18 = v16;
			if v17:IsA("BasePart") then
				l__GameQueryUtil__7:setQueryIgnored(v17, true);
				v17.CanCollide = false;
				v17.Anchored = true;
			end;		
		end;
		v15.Parent = p6;
		l__WeldUtil__8:weldCharacterAccessories(p6);
		p4.maid:GiveTask(function()
			v14:Destroy();
			v15:Destroy();
		end);
	end;
	function v12.onDisable(p8, p9, p10, p11)
		p8.maid:DoCleaning();
	end;
	u9 = l__EmoteHandlerController__11.registerHandler;
	u9(l__EmoteHandlerController__11, l__EmoteType__3.BEACH_VACATION, v12);
end;
local v19 = l__KnitClient__2.CreateController(v4.new());
return nil;
