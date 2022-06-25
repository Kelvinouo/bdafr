-- Script Hash: a4b1cb9bfae2f49021d9aaf9f3636540b879aae761be9ab5f801fe123a3ece8aa2b404ed5bc9163736d8c628913c10d9
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "EasterBunnyEmoteHandlerController";
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
	p1.Name = "EasterBunnyEmoteHandlerController";
end;
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__EmoteType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local l__EmoteHandler__4 = v1.import(script, script.Parent.Parent.Parent, "emote-handler").EmoteHandler;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__ReplicatedStorage__6 = v3.ReplicatedStorage;
local l__GameQueryUtil__7 = v2.GameQueryUtil;
local l__Workspace__8 = v3.Workspace;
local l__GameAnimationUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local u11 = v2.ConstantManager.registerConstants(script, {
	PlayerAnimStartTime = 0.5
});
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
	local u12 = l__EmoteHandler__4;
	function v8.constructor(p3, ...)
		u12.constructor(p3, ...);
		p3.maid = u5.new();
	end;
	function v8.onEnable(p4, p5, p6, p7)
		if not p6.PrimaryPart then
			return nil;
		end;
		local v10 = l__ReplicatedStorage__6.Assets.Misc.EasterBunny:Clone();
		for v11, v12 in ipairs(v10:GetDescendants()) do
			if v12:IsA("BasePart") then
				v12.CanCollide = false;
				l__GameQueryUtil__7:setQueryIgnored(v12, true);
			end;
		end;
		v10.Parent = l__Workspace__8;
		local v13 = v10:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(l__GameAnimationUtil__9.getAnimation(l__AnimationType__10.EASTER_BUNNY_EMOTE_BUNNY));
		local v14 = p6:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(l__GameAnimationUtil__9.getAnimation(l__AnimationType__10.EASTER_BUNNY_EMOTE_PLAYER));
		v10:SetPrimaryPartCFrame(p6.PrimaryPart.CFrame - Vector3.new(0, p6.Humanoid.HipHeight + p6.PrimaryPart.Size.Y / 2, 0) + Vector3.new(0, 0.2, 0));
		v13:Play();
		v14:Play();
		v14.TimePosition = u11.PlayerAnimStartTime;
		p4.maid:GiveTask(function()
			v10:Destroy();
			v13:Stop();
			v13:Destroy();
			v14:Stop();
			v14:Destroy();
		end);
	end;
	function v8.onDisable(p8, p9, p10, p11)
		p8.maid:DoCleaning();
	end;
	u12 = l__EmoteHandlerController__7.registerHandler;
	u12(l__EmoteHandlerController__7, l__EmoteType__3.EASTER_BUNNY, v8);
end;
u1 = l__KnitClient__2.CreateController;
u1 = u1(v5.new());
return nil;
