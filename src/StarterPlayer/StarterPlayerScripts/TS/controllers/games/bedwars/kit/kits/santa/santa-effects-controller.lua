
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "SantaEffectsController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__KnitController__4;
function v5.constructor(p1, ...)
	u1.constructor(p1, ...);
	p1.Name = "SantaEffectsController";
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ReplicatedStorage__3 = v3.ReplicatedStorage;
local l__Workspace__4 = v3.Workspace;
local l__AnimationUtil__5 = v2.AnimationUtil;
local l__SoundManager__6 = v2.SoundManager;
local l__GameSound__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__default__8 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__SantaUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "santa", "santa-util").SantaUtil;
local l__Linear__10 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).Linear;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:WaitFor("SantaStrafeEffect"):andThen(function(p3)
		return p3:Connect(function(p4)
			local v7 = l__ReplicatedStorage__3.Assets.Misc:WaitForChild("santa"):WaitForChild("santa_sleigh"):Clone();
			v7.Parent = l__Workspace__4;
			local v8 = CFrame.new(p4.originPosition, p4.dropPosition);
			local l__sleigh__9 = v7:WaitForChild("sleigh");
			local v10 = { {
					model = l__sleigh__9, 
					sleighDelta = Vector3.new(0, 0, 0)
				} };
			for v11, v12 in ipairs(v7:GetChildren()) do
				if v12:IsA("Model") and v12.Name == "deer" then
					table.insert(v10, {
						model = v12, 
						sleighDelta = (v12:GetPrimaryPartCFrame():Inverse() * l__sleigh__9:GetPrimaryPartCFrame()).Position
					});
					l__AnimationUtil__5.playAnimation(v12:FindFirstChildWhichIsA("AnimationController"):FindFirstChildWhichIsA("Animator"), "rbxassetid://8246523829", {
						looped = true
					});
				end;
			end;
			l__SoundManager__6:playSound(l__GameSound__7.SANTA_BELLS, {
				position = v8.Position, 
				rollOffMinDistsance = 150, 
				rollOffMaxDistance = 300
			});
			local u11 = v8 + (p4.dropPosition - p4.originPosition) * 2;
			local u12 = l__default__8(l__SantaUtil__9.DROP_DELAY * 2, l__Linear__10, function(p5)
				for v13, v14 in ipairs(v10) do
					local v15 = v8:Lerp(u11, p5) * CFrame.new(v14.sleighDelta * -1);
					if v14.model.Name == "sleigh" then
						v15 = v15 * CFrame.Angles(0, -math.pi / 2, 0);
					end;
					v14.model:SetPrimaryPartCFrame(v15);
				end;
			end, 0, 1);
			task.spawn(function()
				u12:Wait();
				v7:Destroy();
			end);
		end);
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v5.new());
return nil;

