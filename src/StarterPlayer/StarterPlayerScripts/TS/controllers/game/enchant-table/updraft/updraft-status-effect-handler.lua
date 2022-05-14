-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v4 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "status-effect", "handlers", "client-status-effect-handler").ClientStatusEffectHandler;
local v5 = setmetatable({}, {
	__tostring = function()
		return "UpdraftStatusEffectHandler";
	end, 
	__index = v4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = v4;
function v5.constructor(p1, ...)
	u1.constructor(p1, ...);
end;
local l__Players__2 = v3.Players;
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local l__SoundManager__4 = v2.SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ReplicatedStorage__6 = v3.ReplicatedStorage;
local l__Workspace__7 = v3.Workspace;
local l__GameQueryUtil__8 = v2.GameQueryUtil;
local l__EffectUtil__9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function v5.onApply(p2, p3, p4)
	if p3.PrimaryPart == nil then
		return nil;
	end;
	local v7 = p3 == l__Players__2.LocalPlayer.Character;
	if v7 then
		p2.maid:GiveTask(l__KnitClient__3.Controllers.JumpHeightController:getJumpModifier():addModifier({
			jumpHeightMultiplier = 2, 
			airJumps = 1
		}));
	end;
	p2.maid:GiveTask(p3.Humanoid.StateChanged:Connect(function(p5, p6)
		if p5 == Enum.HumanoidStateType.Freefall and p6 == Enum.HumanoidStateType.Jumping then
			local v8 = nil;
			local v9 = {};
			if v7 then
				local v10 = nil;
			else
				v10 = p3.PrimaryPart.Position;
			end;
			v9.position = v10;
			l__SoundManager__4:playSound(l__GameSound__5.DUCK_JUMP, v9);
			local v11 = l__ReplicatedStorage__6.Assets.Effects.Enchant.Updraft:Clone();
			v11.Parent = l__Workspace__7;
			local v12 = p3.PrimaryPart;
			if v12 ~= nil then
				v12 = v12.CFrame;
			end;
			local v13 = v12;
			if v13 == nil then
				v13 = CFrame.new();
			end;
			v8 = v13;
			local l__LeftFoot__14 = p3:FindFirstChild("LeftFoot");
			if l__LeftFoot__14 then
				local v15 = CFrame.new(Vector3.new(v8.X, l__LeftFoot__14.CFrame.Y, v8.Z));
			else
				v15 = v8 + Vector3.new(0, -2.5, 0);
			end;
			v11.CFrame = v15;
			l__GameQueryUtil__8:setQueryIgnored(v11, true);
			l__EffectUtil__9:playEffects({ v11 }, nil);
		end;
	end));
end;
function v5.onRemove(p7, p8, p9)

end;
u1 = {
	UpdraftStatusEffectHandler = v5
};
return v4;
