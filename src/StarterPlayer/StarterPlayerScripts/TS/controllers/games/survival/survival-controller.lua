-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions"));
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "SurvivalController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = l__KnitController__5;
local l__SoundManager__2 = v2.SoundManager;
local l__GameSound__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v6.constructor(p1)
	u1.constructor(p1);
	p1.Name = "SurvivalController";
	p1.blockConnections = {};
	p1.health = 750;
	p1.maxHealth = 750;
	p1.wave = 0;
	p1.state = 1;
	p1.endTime = time() + 30;
	p1.lastBedTookDamage = math.huge;
	p1.bedAlarmTrack = l__SoundManager__2:createSound(l__GameSound__3.BED_ALARM);
	p1.waveTrack = l__SoundManager__2:createSound(l__GameSound__3.PENGUIN_SURVIVAL_WAVE_TRACK);
	p1.bossTrack = l__SoundManager__2:createSound(l__GameSound__3.PENGUIN_SURVIVAL_BOSS_TRACK);
	p1.intermissionTrack = l__SoundManager__2:createSound(l__GameSound__3.PENGUIN_SURVIVAL_INTERMISSION_TRACK);
end;
local l__SoundService__4 = v4.SoundService;
local l__KnitClient__5 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__QueueMeta__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta;
local l__GameType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local l__ClientStore__8 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__RunService__9 = v4.RunService;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__SurvivalUi__11 = v1.import(script, script.Parent, "survival-ui").SurvivalUi;
local l__default__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__CollectionService__13 = v4.CollectionService;
local u14 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__default__15 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__InOutQuad__16 = v3.InOutQuad;
local l__ClientSyncEvents__17 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__ExplosionType__18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "explosion", "explosion-type").ExplosionType;
local l__ReplicatedStorage__19 = v4.ReplicatedStorage;
local l__Workspace__20 = v4.Workspace;
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "survival", "survival-monster-definitions").SurvivalMonsterDefinitions;
local l__WeldUtil__22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u23 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__GameAnimationUtil__24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__RandomUtil__26 = v2.RandomUtil;
local l__QueueType__27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local l__MatchState__28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local l__WatchCollectionTag__29 = v2.WatchCollectionTag;
local l__Linear__30 = v3.Linear;
local l__Players__31 = v4.Players;
function v6.KnitStart(p2)
	u1.KnitStart(p2);
	if p2.bedAlarmTrack then
		p2.bedAlarmTrack.Parent = l__SoundService__4;
		p2.bedAlarmTrack.Looped = false;
	end;
	if p2.waveTrack then
		p2.waveTrack.Parent = l__SoundService__4;
		p2.waveTrack.Looped = true;
		p2.waveTrack.SoundGroup = l__KnitClient__5.Controllers.BackgroundMusicController.backgroundMusicGroup;
	end;
	if p2.intermissionTrack then
		p2.intermissionTrack.Parent = l__SoundService__4;
		p2.intermissionTrack.Looped = false;
		p2.intermissionTrack.SoundGroup = l__KnitClient__5.Controllers.BackgroundMusicController.backgroundMusicGroup;
	end;
	if p2.bossTrack then
		p2.bossTrack.Parent = l__SoundService__4;
		p2.bossTrack.Looped = true;
		p2.bossTrack.SoundGroup = l__KnitClient__5.Controllers.BackgroundMusicController.backgroundMusicGroup;
	end;
	l__KnitClient__5.Controllers.MatchController:getQueueType():andThen(function(p3)
		if l__QueueMeta__6[p3].game ~= l__GameType__7.SURVIVAL then
			return nil;
		end;
		l__ClientStore__8.changed:connect(function(p4, p5)
			if p4.Settings.backgroundMusicVolumeGame ~= p5.Settings.backgroundMusicVolumeGame then
				local v8 = p4.Settings.backgroundMusicVolumeGame;
				if p2.intermissionTrack and p2.waveTrack then
					p2.intermissionTrack.Volume = v8;
					p2.waveTrack.Volume = v8;
				end;
			end;
		end);
		l__KnitClient__5.Controllers.PreloadController:runPreload({
			sounds = { l__GameSound__3.PENGUIN_SURVIVAL_INTERMISSION_TRACK, l__GameSound__3.PENGUIN_SURVIVAL_WAVE_TRACK, l__GameSound__3.PENGUIN_SURVIVAL_BOSS_TRACK, l__GameSound__3.PENGUIN_SURVIVAL_VICTORY_TRACK }
		});
	end);
	l__RunService__9.Heartbeat:Connect(function()
		if time() - p2.lastBedTookDamage < 3 and time() - p2.lastBedTookDamage > 0 and p2.bedAlarmTrack and not p2.bedAlarmTrack.IsPlaying then
			p2.bedAlarmTrack:Play();
		end;
		debug.profilebegin("survival-ui");
		if p2.tree then
			p2.tree = u10.update(p2.tree, u10.createElement("ScreenGui", {
				ResetOnSpawn = false, 
				IgnoreGuiInset = false
			}, { u10.createElement(l__SurvivalUi__11, {
					health = p2.health, 
					maxHealth = p2.maxHealth, 
					waveCount = p2.wave, 
					state = p2.state, 
					endTime = p2.endTime
				}) }));
		end;
		debug.profileend();
	end);
	l__default__12.Client:Get("RemoteName"):Connect(function(p6)
		if p6.wave ~= p2.wave then
			l__SoundManager__2:playSound(l__GameSound__3.WAVE_UPDATE);
		end;
		p2.wave = p6.wave;
		p2.state = p6.state;
		p2.endTime = p6.endTime;
		if p6.state == 3 then
			local l__waveTrack__9 = p2.waveTrack;
			if l__waveTrack__9 ~= nil then
				l__waveTrack__9:Stop();
			end;
			local l__bossTrack__10 = p2.bossTrack;
			if l__bossTrack__10 ~= nil then
				l__bossTrack__10:Stop();
			end;
			local l__intermissionTrack__11 = p2.intermissionTrack;
			if l__intermissionTrack__11 ~= nil then
				l__intermissionTrack__11:Stop();
			end;
			l__SoundManager__2:playSound(l__GameSound__3.PENGUIN_SURVIVAL_VICTORY_TRACK);
			return nil;
		end;
		if p2.state ~= 2 then
			if p2.state == 0 then
				task.spawn(function()
					local l__intermissionTrack__12 = p2.intermissionTrack;
					if l__intermissionTrack__12 ~= nil then
						l__intermissionTrack__12:Play();
					end;
					l__default__15(1, l__InOutQuad__16, function(p7)
						if p2.intermissionTrack then
							p2.intermissionTrack.Volume = 1 - p7;
						end;
						if p2.waveTrack then
							p2.waveTrack.Volume = p7;
						end;
					end, 1, 0):Wait();
					local l__waveTrack__13 = p2.waveTrack;
					if l__waveTrack__13 ~= nil then
						l__waveTrack__13:Stop();
					end;
				end);
				return;
			else
				if p2.state == 1 then
					if p2.wave >= 10 then
						local v14 = p2.bossTrack;
					else
						v14 = p2.waveTrack;
					end;
					task.spawn(function()
						if v14 ~= nil then
							v14:Play();
						end;
						l__default__15(1, l__InOutQuad__16, function(p8)
							if p2.intermissionTrack then
								p2.intermissionTrack.Volume = p8;
							end;
							if v14 then
								v14.Volume = 1 - p8;
							end;
						end, 1, 0):Wait();
						local l__intermissionTrack__15 = p2.intermissionTrack;
						if l__intermissionTrack__15 ~= nil then
							l__intermissionTrack__15:Stop();
						end;
					end);
				end;
				return;
			end;
		end;
		for v16, v17 in ipairs(l__CollectionService__13:GetTagged("Monster")) do
			if not v17:FindFirstChildOfClass("Highlight") then
				u14("Highlight", {
					DepthMode = Enum.HighlightDepthMode.AlwaysOnTop, 
					Adornee = v17, 
					FillColor = Color3.fromRGB(255, 217, 0), 
					FillTransparency = 0.6, 
					OutlineColor = Color3.fromRGB(255, 255, 255), 
					OutlineTransparency = 0.2, 
					Parent = v17
				});
			end;
		end;
	end);
	l__ClientSyncEvents__17.ExplosionEffect:connect(function(p9)
		if p9.explosionType == l__ExplosionType__18.BOMBER_PENGUIN_EXPLOSION then
			local v18 = l__ReplicatedStorage__19.Assets.Effects.GuidedMissileExplosion:Clone();
			v18.Position = p9.position;
			v18.Parent = l__Workspace__20;
			v18.Debris1:Emit(5);
			v18.Debris2:Emit(5);
			v18.ExplosionFlames:Emit(50);
			l__SoundManager__2:playSound(l__GameSound__3.GUIDED_MISSILE_EXPLOSION, {
				position = p9.position, 
				rollOffMaxDistance = 160
			});
			task.delay(5, function()
				v18:Destroy();
			end);
		end;
	end);
	l__CollectionService__13:GetInstanceAddedSignal("Monster"):Connect(function(p10)
		p10:GetPropertyChangedSignal("PrimaryPart"):Wait();
		local v19 = u21[p10:GetAttribute("MonsterType")];
		if v19 == nil then
			return nil;
		end;
		local v20 = l__ReplicatedStorage__19.Assets.Misc.Penguins[v19.modelName]:Clone();
		local v21 = v20:FindFirstChildOfClass("Humanoid");
		if v21 ~= nil then
			v21:Destroy();
		end;
		v20:SetPrimaryPartCFrame(p10:GetPrimaryPartCFrame());
		for v22, v23 in ipairs(v20:GetChildren()) do
			if v23:IsA("BasePart") then
				v23.CanCollide = false;
				v23.Massless = true;
			end;
		end;
		v20.Parent = p10;
		l__WeldUtil__22.weldPartsWithJoint(p10.PrimaryPart, v20.PrimaryPart, "Motor6D");
		v20.PrimaryPart.Name = "Main";
		for v24, v25 in ipairs(v20:GetChildren()) do
			v25.Parent = p10;
		end;
		v20:Destroy();
		local l__Humanoid__26 = p10:WaitForChild("Humanoid");
		local l__Animator__27 = l__Humanoid__26:WaitForChild("Animator");
		local v28 = u23.new();
		local v29 = l__Animator__27:LoadAnimation(l__GameAnimationUtil__24.getAnimation(v19.animations.walk));
		v29.Looped = true;
		v29.Priority = Enum.AnimationPriority.Movement;
		v28:GiveTask(v29);
		local v30 = l__Animator__27:LoadAnimation(l__GameAnimationUtil__24.getAnimation(v19.animations.idle));
		v30.Looped = true;
		v30.Priority = Enum.AnimationPriority.Idle;
		v28:GiveTask(v30);
		local v31 = l__Animator__27:LoadAnimation(l__GameAnimationUtil__24.getAnimation(v19.animations.jump));
		v31.Looped = false;
		v31.Priority = Enum.AnimationPriority.Action;
		v28:GiveTask(v31);
		v28:GiveTask(l__RunService__9.Heartbeat:Connect(function()
			if l__Humanoid__26:GetState() == Enum.HumanoidStateType.Running then
				if p10.PrimaryPart.AssemblyLinearVelocity.Magnitude > 10 then
					v29:AdjustSpeed(l__Humanoid__26.WalkSpeed / 16);
					if not v29.IsPlaying then
						v29:Play();
						return;
					end;
				else
					v29:Stop();
					if not v30.IsPlaying then
						v30:Play();
						return;
					end;
				end;
			elseif (l__Humanoid__26:GetState() == Enum.HumanoidStateType.Jumping or l__Humanoid__26:GetState() == Enum.HumanoidStateType.Freefall) and not v31.IsPlaying then
				v29:Stop();
				v30:Stop();
				v31:Play();
			end;
		end));
		local u32 = time() + math.random(1, 300);
		v28:GiveTask(l__RunService__9.Heartbeat:Connect(function()
			if u32 < time() then
				l__SoundManager__2:playSound(l__GameSound__3.PENGUIN_SQUAWK_1, {
					position = p10:GetPrimaryPartCFrame().Position
				});
				u32 = time() + math.random(1, 300);
			end;
		end));
		v28:GiveTask(l__Animator__27.AnimationPlayed:Connect(function(p11)
			local v32 = p11.Animation;
			if v32 ~= nil then
				v32 = v32.AnimationId;
			end;
			local v33 = v32 == l__GameAnimationUtil__24.getAssetId(l__AnimationType__25.PENGUIN_ATTACK_2) and p10.PrimaryPart;
			if v33 then
				l__SoundManager__2:playSound(l__RandomUtil__26.fromList(l__GameSound__3.PENGUIN_ATTACK_1, l__GameSound__3.PENGUIN_ATTACK_2, l__GameSound__3.PENGUIN_ATTACK_3), {
					position = p10:GetPrimaryPartCFrame().Position
				});
			end;
		end));
		local u33 = 100;
		v28:GiveTask(p10:GetAttributeChangedSignal("Health"):Connect(function()
			local v34 = p10:GetAttribute("Health");
			if v34 ~= 0 and v34 == v34 and v34 then
				if v34 < u33 then
					l__SoundManager__2:playSound(l__RandomUtil__26.fromList(l__GameSound__3.PENGUIN_DAMAGED_5, l__GameSound__3.PENGUIN_DAMAGED_6, l__GameSound__3.PENGUIN_DAMAGED_7), {
						position = p10:GetPrimaryPartCFrame().Position
					});
				end;
				u33 = v34;
			end;
		end));
		v28:GiveTask(function()
			if p10.PrimaryPart then
				l__SoundManager__2:playSound(l__RandomUtil__26.fromList(l__GameSound__3.PENGUIN_DAMAGED_5, l__GameSound__3.PENGUIN_DAMAGED_6, l__GameSound__3.PENGUIN_DAMAGED_7), {
					position = p10:GetPrimaryPartCFrame().Position
				});
			end;
		end);
		v28:GiveTask(p10.AncestryChanged:Connect(function()
			if not p10:IsDescendantOf(game) then
				v28:DoCleaning();
			end;
		end));
	end);
	l__default__12.Client:WaitFor("RemoteName"):expect():Connect(function(p12)
		if l__ClientStore__8:getState().Game.queueType == l__QueueType__27.SURVIVAL and p12.matchState == l__MatchState__28.RUNNING then
			local v35 = nil;
			l__WatchCollectionTag__29("block", function(p13)
				if p13:GetAttribute("PlacedByUserId") ~= 0 then
					local u34 = nil;
					p2.blockConnections[p13] = p13:GetAttributeChangedSignal("Health"):Connect(function()
						local v36 = p13:GetAttribute("MaxHealth");
						local v37 = p13:GetAttribute("Health");
						if u34 == nil then
							local v38 = {};
							local v39 = 0;
							for v40, v41 in ipairs((p13:GetChildren())) do
								if v41:IsA("Texture") == true then
									v39 = v39 + 1;
									v38[v39] = v41;
								end;
							end;
							u34 = v38;
						end;
						for v42, v43 in ipairs(u34) do
							v43.Color3 = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(0, 0, 0), l__Linear__30(v36 - v37, 0, 1, v36));
						end;
					end);
				end;
			end);
			l__CollectionService__13:GetInstanceRemovedSignal("block"):Connect(function(p14)
				if p2.blockConnections[p14] then
					p2.blockConnections[p14] = nil;
				end;
			end);
			v35 = function(p15)
				p2.tree = u10.mount(u10.createElement("ScreenGui", {
					ResetOnSpawn = false
				}, { u10.createElement(l__SurvivalUi__11, {
						health = 750, 
						maxHealth = 750, 
						waveCount = p2.wave, 
						endTime = p2.endTime, 
						state = p2.state
					}) }), l__Players__31.LocalPlayer:FindFirstChildOfClass("PlayerGui"));
				p15:GetAttributeChangedSignal("Health"):Connect(function()
					p2.health = p15:GetAttribute("Health");
					p2.maxHealth = p15:GetAttribute("MaxHealth");
					p2.lastBedTookDamage = time();
				end);
			end;
			local v44 = l__CollectionService__13:GetTagged("bed:1")[1];
			if v44 then
				v35(v44);
			else
				l__CollectionService__13:GetInstanceAddedSignal("bed:1"):Connect(function(p16)
					v35(p16);
				end);
			end;
			l__CollectionService__13:GetInstanceRemovedSignal("bed:1"):Connect(function(p17)
				p2.health = 0;
				p2.maxHealth = p17:GetAttribute("MaxHealth");
				l__SoundManager__2:playSound(l__GameSound__3.BED_BREAK, {});
			end);
		end;
	end);
end;
u1 = l__KnitClient__5.CreateController;
u1 = u1(v6.new());
return nil;
