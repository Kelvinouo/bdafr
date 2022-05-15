
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__KillEffect__3 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local v4 = setmetatable({}, {
	__tostring = function()
		return "Anonymous";
	end, 
	__index = l__KillEffect__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
function v4.constructor(p1, p2)
	l__KillEffect__3.constructor(p1, p2);
	l__KillEffect__3.setPlayDefaultKillEffect(p1, false);
end;
local l__Workspace__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Workspace;
local l__SoundManager__2 = v2.SoundManager;
local l__GameSound__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__AnimationUtil__4 = v2.AnimationUtil;
local l__GameAnimationUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v4.onKill(p3, p4, p5, p6)
	print("statue character:", p5);
	p5.Archivable = true;
	local v6 = p5:Clone();
	for v7, v8 in ipairs(v6:GetDescendants()) do
		if v8:IsA("BasePart") then
			v8.Material = Enum.Material.Glass;
			v8.Color = Color3.fromRGB(255, 215, 0);
			if v8:IsA("MeshPart") then
				v8.TextureID = "";
			end;
		elseif v8:IsA("Texture") then
			v8:Destroy();
		elseif v8:IsA("Shirt") then
			v8:Destroy();
		end;
	end;
	v6.Parent = l__Workspace__1;
	l__KillEffect__3.hideCharacter(p3, p5);
	l__SoundManager__2:playSound(l__GameSound__3.STATUE, {
		position = v6:GetPrimaryPartCFrame().Position
	});
	l__AnimationUtil__4.playAnimation(v6:FindFirstChild("Humanoid"):FindFirstChild("Animator"), l__GameAnimationUtil__5.getAssetId(l__AnimationType__6.STATUE), {
		looped = false
	});
	v1.Promise.delay(2.8):andThen(function()
		v6:Destroy();
	end);
end;
return v4;

