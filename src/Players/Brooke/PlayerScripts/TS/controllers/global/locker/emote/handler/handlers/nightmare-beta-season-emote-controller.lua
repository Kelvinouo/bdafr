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
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "NightmareBetaSeasonEmoteController";
end;
local l__KnitClient__1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__EmoteType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local l__EmoteHandler__3 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__ReplicatedStorage__5 = v2.ReplicatedStorage;
local l__Workspace__6 = v2.Workspace;
local l__GameQueryUtil__7 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameQueryUtil;
local l__TweenService__8 = v2.TweenService;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	local l__EmoteHandlerController__6 = l__KnitClient__1.Controllers.EmoteHandlerController;
	local v7 = setmetatable({}, {
		__tostring = function()
			return "Anonymous";
		end, 
		__index = l__EmoteHandler__3
	});
	v7.__index = v7;
	function v7.new(...)
		local v8 = setmetatable({}, v7);
		return v8:constructor(...) and v8;
	end;
	local u9 = l__EmoteHandler__3;
	function v7.constructor(p3, ...)
		u9.constructor(p3, ...);
		p3.maid = u4.new();
	end;
	function v7.onEnable(p4, p5, p6, p7)
		local v9 = l__ReplicatedStorage__5.Assets.Effects.NightmareEmote:Clone();
		v9.Parent = l__Workspace__6;
		v9:SetPrimaryPartCFrame(p6.LowerTorso.CFrame + Vector3.new(0, -2, 0));
		local v10, v11, v12 = ipairs((v9:GetDescendants()));
		while true do
			v10(v11, v12);
			if not v10 then
				break;
			end;
			v12 = v10;
			if v11:IsA("BasePart") then
				l__GameQueryUtil__7:setQueryIgnored(v11, true);
				v11.CanCollide = false;
				v11.Anchored = true;
			end;		
		end;
		local l__Outer__13 = v9:FindFirstChild("Outer");
		if l__Outer__13 then
			l__TweenService__8:Create(l__Outer__13, TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1), {
				Orientation = l__Outer__13.Orientation + Vector3.new(0, 360, 0)
			}):Play();
		end;
		local l__Middle__14 = v9:FindFirstChild("Middle");
		if l__Middle__14 then
			l__TweenService__8:Create(l__Middle__14, TweenInfo.new(12.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1), {
				Orientation = l__Middle__14.Orientation + Vector3.new(0, -360, 0)
			}):Play();
		end;
		p4.maid:GiveTask(function()
			v9:Destroy();
		end);
	end;
	function v7.onDisable(p8, p9, p10, p11)
		p8.maid:DoCleaning();
	end;
	u9 = l__EmoteHandlerController__6.registerHandler;
	u9(l__EmoteHandlerController__6, l__EmoteType__2.NIGHTMARE_1, v7);
end;
local v15 = l__KnitClient__1.CreateController(v4.new());
return nil;
