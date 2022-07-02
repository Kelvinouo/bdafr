-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "HugeLuckyBlockController";
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
	p1.Name = "HugeLuckyBlockController";
end;
local l__BlockEngineRemotes__2 = v2.BlockEngineRemotes;
local l__ItemType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__ReplicatedStorage__4 = v3.ReplicatedStorage;
local l__BlockEngine__5 = v2.BlockEngine;
local l__Workspace__6 = v3.Workspace;
local l__EffectUtil__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
local l__SoundManager__8 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__default__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u11 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__BLOCK_SIZE__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local l__default__13 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__Linear__14 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).Linear;
local l__Players__15 = v3.Players;
local l__KnitClient__16 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__BlockEngineRemotes__2.Client:WaitFor("RemoteName"):expect():Connect(function(p3)
		if p3.blockType ~= l__ItemType__3.HUGE_LUCKY_BLOCK then
			return nil;
		end;
		local v7 = l__ReplicatedStorage__4.Assets.Effects.HugeLuckyBlock:FindFirstChild("Destroy"):Clone();
		local v8 = l__BlockEngine__5:getWorldPosition(p3.blockRef.blockPosition);
		v7.Position = v8;
		v7.Parent = l__Workspace__6;
		l__EffectUtil__7:playEffects({ v7 }, nil, {
			destroyAfterSec = 4
		});
		l__SoundManager__8:playSound(l__GameSound__9.FIREWORK_CRACKLE_2, {
			position = v8
		});
		l__SoundManager__8:playSound(l__GameSound__9.FIREWORK_EXPLODE_2, {
			position = v8
		});
		local v9 = 0;
		local v10 = false;
		while true do
			if v10 then
				v9 = v9 + 1;
			else
				v10 = true;
			end;
			if not (v9 < 7) then
				break;
			end;
			l__SoundManager__8:playSound(l__GameSound__9.BALLOON_POP, {
				playbackSpeedMultiplier = 1.2 + v9 / 7 / 4, 
				position = v8
			});
			task.wait(0.2);		
		end;
	end);
	l__default__10.Client:WaitFor("RemoteName"):andThen(function(p4)
		p4:Connect(function(p5)
			local v11 = u11.new();
			local v12 = l__ReplicatedStorage__4.Assets.Effects.HugeLuckyBlock.Ground:Clone();
			local v13 = p5.position + Vector3.new(l__BLOCK_SIZE__12, -l__BLOCK_SIZE__12 / 2, l__BLOCK_SIZE__12);
			v12.Position = v13;
			v12.Parent = l__Workspace__6;
			v11:GiveTask(v12);
			local v14 = l__ReplicatedStorage__4.Assets.Blocks:FindFirstChild(l__ItemType__3.HUGE_LUCKY_BLOCK);
			if v14 ~= nil then
				v14 = v14:Clone();
			end;
			local l__LuckyBlock__15 = v14:FindFirstChild("LuckyBlock");
			if l__LuckyBlock__15 ~= nil then
				local l__Trail__16 = l__LuckyBlock__15:FindFirstChild("Trail");
				if l__Trail__16 ~= nil then
					for v17, v18 in ipairs((l__Trail__16:GetDescendants())) do
						if v18:IsA("ParticleEmitter") then
							v18.Enabled = true;
						end;
					end;
				end;
			end;
			v11:GiveTask(v14);
			local v19 = math.random() * math.pi * 2;
			local v20 = CFrame.new(p5.position) + Vector3.new(15 * math.cos(v19), 450, 15 * math.sin(v19));
			v14:SetPrimaryPartCFrame(v20);
			v14.Parent = l__Workspace__6;
			local v21 = p5.arriveTime - l__Workspace__6:GetServerTimeNow();
			local u17 = nil;
			u17 = l__default__13(v21, l__Linear__14, function(p6)
				local v22 = v14.PrimaryPart;
				if v22 ~= nil then
					v22 = v22.Parent;
				end;
				if not v22 then
					u17:Cancel();
					return nil;
				end;
				v14:SetPrimaryPartCFrame(v20:Lerp(CFrame.new(p5.position), (math.pow(p6, 2) + math.pow(p6, 8)) / 2));
			end);
			task.delay(v21, function()
				v11:DoCleaning();
				local v23 = l__Players__15.LocalPlayer.Character;
				if v23 ~= nil then
					v23 = (v23:GetPrimaryPartCFrame().Position - v13).Magnitude;
				end;
				local v24 = v23;
				if v24 == nil then
					v24 = 250;
				end;
				if v24 < 200 then
					l__KnitClient__16.Controllers.ScreenShakeController:shake(Vector3.new(0, 0, 0), Vector3.new(0, -1, 0), {
						magnitude = 0.4 * v24 / 200
					});
				end;
				l__SoundManager__8:playSound(l__GameSound__9.LUCKY_BLOCK_SLAM, {
					position = v13, 
					rollOffMinDistsance = 20, 
					rollOffMaxDistance = 200, 
					volumeMultiplier = 0.2
				});
				local v25 = l__ReplicatedStorage__4.Assets.Effects.HugeLuckyBlock.Impact:Clone();
				v25.Position = v13;
				v25.Parent = l__Workspace__6;
				l__EffectUtil__7:playEffects({ v25 }, nil, {
					destroyAfterSec = 3
				});
			end);
		end);
	end);
end;
u1 = l__KnitClient__16.CreateController;
u1 = u1(v5.new());
return nil;
