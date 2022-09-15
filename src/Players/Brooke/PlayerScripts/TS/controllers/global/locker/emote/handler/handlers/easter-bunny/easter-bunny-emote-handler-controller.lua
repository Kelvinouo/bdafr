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
function v5.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "EasterBunnyEmoteHandlerController";
end;
local l__KnitClient__1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__EmoteType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local l__EmoteHandler__3 = v1.import(script, script.Parent.Parent.Parent, "emote-handler").EmoteHandler;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__ReplicatedStorage__5 = v3.ReplicatedStorage;
local l__GameQueryUtil__6 = v2.GameQueryUtil;
local l__Workspace__7 = v3.Workspace;
local l__GameAnimationUtil__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local u10 = v2.ConstantManager.registerConstants(script, {
	PlayerAnimStartTime = 0.5
});
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	local l__EmoteHandlerController__7 = l__KnitClient__1.Controllers.EmoteHandlerController;
	local v8 = setmetatable({}, {
		__tostring = function()
			return "Anonymous";
		end, 
		__index = l__EmoteHandler__3
	});
	v8.__index = v8;
	function v8.new(...)
		local v9 = setmetatable({}, v8);
		return v9:constructor(...) and v9;
	end;
	local u11 = l__EmoteHandler__3;
	function v8.constructor(p3, ...)
		u11.constructor(p3, ...);
		p3.maid = u4.new();
	end;
	function v8.onEnable(p4, p5, p6, p7)
		if not p6.PrimaryPart then
			return nil;
		end;
		local v10 = l__ReplicatedStorage__5.Assets.Misc.EasterBunny:Clone();
		local v11, v12, v13 = ipairs(v10:GetDescendants());
		while true do
			v11(v12, v13);
			if not v11 then
				break;
			end;
			v13 = v11;
			if v12:IsA("BasePart") then
				v12.CanCollide = false;
				l__GameQueryUtil__6:setQueryIgnored(v12, true);
			end;		
		end;
		v10.Parent = l__Workspace__7;
		local v14 = v10:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(l__GameAnimationUtil__8.getAnimation(l__AnimationType__9.EASTER_BUNNY_EMOTE_BUNNY));
		local v15 = p6:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(l__GameAnimationUtil__8.getAnimation(l__AnimationType__9.EASTER_BUNNY_EMOTE_PLAYER));
		v10:SetPrimaryPartCFrame(p6.PrimaryPart.CFrame - Vector3.new(0, p6.Humanoid.HipHeight + p6.PrimaryPart.Size.Y / 2, 0) + Vector3.new(0, 0.2, 0));
		v14:Play();
		v15:Play();
		v15.TimePosition = u10.PlayerAnimStartTime;
		p4.maid:GiveTask(function()
			v10:Destroy();
			v14:Stop();
			v14:Destroy();
			v15:Stop();
			v15:Destroy();
		end);
	end;
	function v8.onDisable(p8, p9, p10, p11)
		p8.maid:DoCleaning();
	end;
	u11 = l__EmoteHandlerController__7.registerHandler;
	u11(l__EmoteHandlerController__7, l__EmoteType__2.EASTER_BUNNY, v8);
end;
local v16 = l__KnitClient__1.CreateController(v5.new());
return nil;
