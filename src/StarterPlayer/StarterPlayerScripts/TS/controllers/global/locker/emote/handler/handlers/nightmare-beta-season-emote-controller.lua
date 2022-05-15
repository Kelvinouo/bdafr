
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "NightmareBetaSeasonEmoteController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__KnitController__4;
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "NightmareBetaSeasonEmoteController";
end;
local l__KnitClient__2 = v2.KnitClient;
local l__EmoteType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local l__EmoteHandler__4 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local l__Maid__5 = v2.Maid;
local l__ReplicatedStorage__6 = v3.ReplicatedStorage;
local l__Workspace__7 = v3.Workspace;
local l__GameQueryUtil__8 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameQueryUtil;
local l__TweenService__9 = v3.TweenService;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	local l__EmoteHandlerController__7 = l__KnitClient__2.Controllers.EmoteHandlerController;
	local v8 = setmetatable({}, {
		__tostring = function()
			return "Anonymous";
		end, 
		__index = l__EmoteHandler__4
	});
	v8.__index = v8;
	function v8.new(...)
		local v9 = setmetatable({}, v8);
		return v9:constructor(...) and v9;
	end;
	local u10 = l__EmoteHandler__4;
	function v8.constructor(p3, ...)
		u10.constructor(p3, ...);
		p3.maid = l__Maid__5.new();
	end;
	function v8.onEnable(p4, p5, p6, p7)
		local v10 = l__ReplicatedStorage__6.Assets.Effects.NightmareEmote:Clone();
		v10.Parent = l__Workspace__7;
		v10:SetPrimaryPartCFrame(p6.LowerTorso.CFrame + Vector3.new(0, -2, 0));
		local v11 = v10:GetDescendants();
		local function v12(p8)
			if p8:IsA("BasePart") then
				l__GameQueryUtil__8:setQueryIgnored(p8, true);
				p8.CanCollide = false;
				p8.Anchored = true;
			end;
		end;
		for v13, v14 in ipairs(v11) do
			v12(v14, v13 - 1, v11);
		end;
		local l__Outer__15 = v10:FindFirstChild("Outer");
		if l__Outer__15 then
			l__TweenService__9:Create(l__Outer__15, TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1), {
				Orientation = l__Outer__15.Orientation + Vector3.new(0, 360, 0)
			}):Play();
		end;
		local l__Middle__16 = v10:FindFirstChild("Middle");
		if l__Middle__16 then
			l__TweenService__9:Create(l__Middle__16, TweenInfo.new(12.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1), {
				Orientation = l__Middle__16.Orientation + Vector3.new(0, -360, 0)
			}):Play();
		end;
		p4.maid:GiveTask(function()
			v10:Destroy();
		end);
	end;
	function v8.onDisable(p9, p10, p11, p12)
		p9.maid:DoCleaning();
	end;
	u10 = l__EmoteHandlerController__7.registerHandler;
	u10(l__EmoteHandlerController__7, l__EmoteType__3.NIGHTMARE_1, v8);
end;
u1 = l__KnitClient__2.CreateController;
u1 = u1(v5.new());
return nil;

