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
function v5.constructor(p1, ...)
	l__KnitController__4.constructor(p1, ...);
	p1.Name = "SantaEffectsController";
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ReplicatedStorage__2 = v3.ReplicatedStorage;
local l__Workspace__3 = v3.Workspace;
local l__AnimationUtil__4 = v2.AnimationUtil;
local l__SoundManager__5 = v2.SoundManager;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__default__7 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__SantaUtil__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "santa", "santa-util").SantaUtil;
local l__Linear__9 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).Linear;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__default__1.Client:WaitFor("RemoteName"):andThen(function(p3)
		return p3:Connect(function(p4)
			local v7 = l__ReplicatedStorage__2.Assets.Misc:WaitForChild("santa"):WaitForChild("santa_sleigh"):Clone();
			v7.Parent = l__Workspace__3;
			local v8 = CFrame.new(p4.originPosition, p4.dropPosition);
			local l__sleigh__9 = v7:WaitForChild("sleigh");
			local v10 = { {
					model = l__sleigh__9, 
					sleighDelta = Vector3.new(0, 0, 0)
				} };
			local v11, v12, v13 = ipairs(v7:GetChildren());
			while true do
				v11(v12, v13);
				if not v11 then
					break;
				end;
				v13 = v11;
				if v12:IsA("Model") and v12.Name == "deer" then
					table.insert(v10, {
						model = v12, 
						sleighDelta = (v12:GetPrimaryPartCFrame():Inverse() * l__sleigh__9:GetPrimaryPartCFrame()).Position
					});
					l__AnimationUtil__4.playAnimation(v12:FindFirstChildWhichIsA("AnimationController"):FindFirstChildWhichIsA("Animator"), "rbxassetid://8246523829", {
						looped = true
					});
				end;			
			end;
			l__SoundManager__5:playSound(l__GameSound__6.SANTA_BELLS, {
				position = v8.Position, 
				rollOffMinDistsance = 150, 
				rollOffMaxDistance = 300
			});
			local u10 = v8 + (p4.dropPosition - p4.originPosition) * 2;
			local u11 = l__default__7(l__SantaUtil__8.DROP_DELAY * 2, l__Linear__9, function(p5)
				local v14, v15, v16 = ipairs(v10);
				while true do
					v14(v15, v16);
					if not v14 then
						break;
					end;
					v16 = v14;
					local v17 = v8:Lerp(u10, p5) * CFrame.new(v15.sleighDelta * -1);
					if v15.model.Name == "sleigh" then
						v17 = v17 * CFrame.Angles(0, -math.pi / 2, 0);
					end;
					v15.model:SetPrimaryPartCFrame(v17);				
				end;
			end, 0, 1);
			task.spawn(function()
				u11:Wait();
				v7:Destroy();
			end);
		end);
	end);
end;
local v18 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v5.new());
return nil;
