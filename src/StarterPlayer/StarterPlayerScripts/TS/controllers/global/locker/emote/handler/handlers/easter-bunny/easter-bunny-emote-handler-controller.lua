-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "EasterBunnyEmoteHandlerController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = l__KnitController__5;
function v6.constructor(p1)
	u1.constructor(p1);
	p1.Name = "EasterBunnyEmoteHandlerController";
end;
local l__KnitClient__2 = v3.KnitClient;
local l__EmoteType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local l__EmoteHandler__4 = v1.import(script, script.Parent.Parent.Parent, "emote-handler").EmoteHandler;
local l__Maid__5 = v3.Maid;
local l__ReplicatedStorage__6 = v4.ReplicatedStorage;
local l__GameQueryUtil__7 = v2.GameQueryUtil;
local l__Workspace__8 = v4.Workspace;
local l__GameAnimationUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local u11 = v2.ConstantManager.registerConstants(script, {
	PlayerAnimStartTime = 0.5
});
function v6.KnitStart(p2)
	u1.KnitStart(p2);
	local l__EmoteHandlerController__8 = l__KnitClient__2.Controllers.EmoteHandlerController;
	local v9 = setmetatable({}, {
		__tostring = function()
			return "Anonymous";
		end, 
		__index = l__EmoteHandler__4
	});
	v9.__index = v9;
	function v9.new(...)
		local v10 = setmetatable({}, v9);
		return v10:constructor(...) and v10;
	end;
	local u12 = l__EmoteHandler__4;
	function v9.constructor(p3, ...)
		u12.constructor(p3, ...);
		p3.maid = l__Maid__5.new();
	end;
	function v9.onEnable(p4, p5, p6, p7)
		if not p6.PrimaryPart then
			return nil;
		end;
		local v11 = l__ReplicatedStorage__6.Assets.Misc.EasterBunny:Clone();
		for v12, v13 in ipairs(v11:GetDescendants()) do
			if v13:IsA("BasePart") then
				v13.CanCollide = false;
				l__GameQueryUtil__7:setQueryIgnored(v13, true);
			end;
		end;
		v11.Parent = l__Workspace__8;
		local v14 = v11:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(l__GameAnimationUtil__9.getAnimation(l__AnimationType__10.EASTER_BUNNY_EMOTE_BUNNY));
		local v15 = p6:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(l__GameAnimationUtil__9.getAnimation(l__AnimationType__10.EASTER_BUNNY_EMOTE_PLAYER));
		v11:SetPrimaryPartCFrame(p6.PrimaryPart.CFrame - Vector3.new(0, p6.Humanoid.HipHeight + p6.PrimaryPart.Size.Y / 2, 0) + Vector3.new(0, 0.2, 0));
		v14:Play();
		v15:Play();
		v15.TimePosition = u11.PlayerAnimStartTime;
		p4.maid:GiveTask(function()
			v11:Destroy();
			v14:Stop();
			v14:Destroy();
			v15:Stop();
			v15:Destroy();
		end);
	end;
	function v9.onDisable(p8, p9, p10, p11)
		p8.maid:DoCleaning();
	end;
	u12 = l__EmoteHandlerController__8.registerHandler;
	u12(l__EmoteHandlerController__8, l__EmoteType__3.EASTER_BUNNY, v9);
end;
u1 = l__KnitClient__2.CreateController;
u1 = u1(v6.new());
return nil;
