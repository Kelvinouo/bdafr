-- Script Hash: ec9b5d079a2d68f403b81baeeea6b1fbbb84d3a40e2b10ea6440136fb99ce8135398440491e4ad2fd14735b37a9d2c4c
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "NightmareBetaSeasonEmoteController";
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
	p1.Name = "NightmareBetaSeasonEmoteController";
end;
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__EmoteType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local l__EmoteHandler__4 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__ReplicatedStorage__6 = v2.ReplicatedStorage;
local l__Workspace__7 = v2.Workspace;
local l__GameQueryUtil__8 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameQueryUtil;
local l__TweenService__9 = v2.TweenService;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	local l__EmoteHandlerController__6 = l__KnitClient__2.Controllers.EmoteHandlerController;
	local v7 = setmetatable({}, {
		__tostring = function()
			return "Anonymous";
		end, 
		__index = l__EmoteHandler__4
	});
	v7.__index = v7;
	function v7.new(...)
		local v8 = setmetatable({}, v7);
		return v8:constructor(...) and v8;
	end;
	local u10 = l__EmoteHandler__4;
	function v7.constructor(p3, ...)
		u10.constructor(p3, ...);
		p3.maid = u5.new();
	end;
	function v7.onEnable(p4, p5, p6, p7)
		local v9 = l__ReplicatedStorage__6.Assets.Effects.NightmareEmote:Clone();
		v9.Parent = l__Workspace__7;
		v9:SetPrimaryPartCFrame(p6.LowerTorso.CFrame + Vector3.new(0, -2, 0));
		local v10 = v9:GetDescendants();
		local function v11(p8)
			if p8:IsA("BasePart") then
				l__GameQueryUtil__8:setQueryIgnored(p8, true);
				p8.CanCollide = false;
				p8.Anchored = true;
			end;
		end;
		for v12, v13 in ipairs(v10) do
			v11(v13, v12 - 1, v10);
		end;
		local l__Outer__14 = v9:FindFirstChild("Outer");
		if l__Outer__14 then
			l__TweenService__9:Create(l__Outer__14, TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1), {
				Orientation = l__Outer__14.Orientation + Vector3.new(0, 360, 0)
			}):Play();
		end;
		local l__Middle__15 = v9:FindFirstChild("Middle");
		if l__Middle__15 then
			l__TweenService__9:Create(l__Middle__15, TweenInfo.new(12.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1), {
				Orientation = l__Middle__15.Orientation + Vector3.new(0, -360, 0)
			}):Play();
		end;
		p4.maid:GiveTask(function()
			v9:Destroy();
		end);
	end;
	function v7.onDisable(p9, p10, p11, p12)
		p9.maid:DoCleaning();
	end;
	u10 = l__EmoteHandlerController__6.registerHandler;
	u10(l__EmoteHandlerController__6, l__EmoteType__3.NIGHTMARE_1, v7);
end;
u1 = l__KnitClient__2.CreateController;
u1 = u1(v4.new());
return nil;
