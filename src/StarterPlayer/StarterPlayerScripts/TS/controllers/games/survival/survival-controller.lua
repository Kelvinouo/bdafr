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
local l__SoundManager__1 = v2.SoundManager;
local l__GameSound__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v6.constructor(p1)
	l__KnitController__5.constructor(p1);
	p1.Name = "SurvivalController";
	p1.blockConnections = {};
	p1.health = 750;
	p1.maxHealth = 750;
	p1.wave = 0;
	p1.state = 1;
	p1.endTime = time() + 30;
	p1.lastBedTookDamage = math.huge;
	p1.bedAlarmTrack = l__SoundManager__1:createSound(l__GameSound__2.BED_ALARM);
	p1.waveTrack = l__SoundManager__1:createSound(l__GameSound__2.PENGUIN_SURVIVAL_WAVE_TRACK);
	p1.bossTrack = l__SoundManager__1:createSound(l__GameSound__2.PENGUIN_SURVIVAL_BOSS_TRACK);
	p1.intermissionTrack = l__SoundManager__1:createSound(l__GameSound__2.PENGUIN_SURVIVAL_INTERMISSION_TRACK);
end;
local l__SoundService__3 = v4.SoundService;
local l__KnitClient__4 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__QueueMeta__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta;
local l__GameType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local l__ClientStore__7 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__RunService__8 = v4.RunService;
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__SurvivalUi__10 = v1.import(script, script.Parent, "survival-ui").SurvivalUi;
local l__default__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__CollectionService__12 = v4.CollectionService;
local u13 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__default__14 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__InOutQuad__15 = v3.InOutQuad;
local l__ClientSyncEvents__16 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__ExplosionType__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "explosion", "explosion-type").ExplosionType;
local l__ReplicatedStorage__18 = v4.ReplicatedStorage;
local l__Workspace__19 = v4.Workspace;
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "survival", "survival-monster-definitions").SurvivalMonsterDefinitions;
local l__WeldUtil__21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u22 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__GameAnimationUtil__23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__RandomUtil__25 = v2.RandomUtil;
local l__QueueType__26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local l__MatchState__27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local l__WatchCollectionTag__28 = v2.WatchCollectionTag;
local l__Linear__29 = v3.Linear;
local l__Players__30 = v4.Players;
function v6.KnitStart(p2)
	l__KnitController__5.KnitStart(p2);
	if p2.bedAlarmTrack then
		p2.bedAlarmTrack.Parent = l__SoundService__3;
		p2.bedAlarmTrack.Looped = false;
	end;
	if p2.waveTrack then
		p2.waveTrack.Parent = l__SoundService__3;
		p2.waveTrack.Looped = true;
		p2.waveTrack.SoundGroup = l__KnitClient__4.Controllers.BackgroundMusicController.backgroundMusicGroup;
	end;
	if p2.intermissionTrack then
		p2.intermissionTrack.Parent = l__SoundService__3;
		p2.intermissionTrack.Looped = false;
		p2.intermissionTrack.SoundGroup = l__KnitClient__4.Controllers.BackgroundMusicController.backgroundMusicGroup;
	end;
	if p2.bossTrack then
		p2.bossTrack.Parent = l__SoundService__3;
		p2.bossTrack.Looped = true;
		p2.bossTrack.SoundGroup = l__KnitClient__4.Controllers.BackgroundMusicController.backgroundMusicGroup;
	end;
	l__KnitClient__4.Controllers.MatchController:getQueueType():andThen(function(p3)
		if l__QueueMeta__5[p3].game ~= l__GameType__6.SURVIVAL then
			return nil;
		end;
		l__ClientStore__7.changed:connect(function(p4, p5)
			if p4.Settings.backgroundMusicVolumeGame ~= p5.Settings.backgroundMusicVolumeGame then
				local v8 = p4.Settings.backgroundMusicVolumeGame;
				if p2.intermissionTrack and p2.waveTrack then
					p2.intermissionTrack.Volume = v8;
					p2.waveTrack.Volume = v8;
				end;
			end;
		end);
		l__KnitClient__4.Controllers.PreloadController:runPreload({
			sounds = { l__GameSound__2.PENGUIN_SURVIVAL_INTERMISSION_TRACK, l__GameSound__2.PENGUIN_SURVIVAL_WAVE_TRACK, l__GameSound__2.PENGUIN_SURVIVAL_BOSS_TRACK, l__GameSound__2.PENGUIN_SURVIVAL_VICTORY_TRACK }
		});
	end);
	l__RunService__8.Heartbeat:Connect(function()
		if time() - p2.lastBedTookDamage < 3 and time() - p2.lastBedTookDamage > 0 and p2.bedAlarmTrack and not p2.bedAlarmTrack.IsPlaying then
			p2.bedAlarmTrack:Play();
		end;
		debug.profilebegin("survival-ui");
		if p2.tree then
			p2.tree = u9.update(p2.tree, u9.createElement("ScreenGui", {
				ResetOnSpawn = false, 
				IgnoreGuiInset = false
			}, { u9.createElement(l__SurvivalUi__10, {
					health = p2.health, 
					maxHealth = p2.maxHealth, 
					waveCount = p2.wave, 
					state = p2.state, 
					endTime = p2.endTime
				}) }));
		end;
		debug.profileend();
	end);
	l__default__11.Client:Get("RemoteName"):Connect(function(p6)
		if p6.wave ~= p2.wave then
			l__SoundManager__1:playSound(l__GameSound__2.WAVE_UPDATE);
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
			l__SoundManager__1:playSound(l__GameSound__2.PENGUIN_SURVIVAL_VICTORY_TRACK);
			return nil;
		end;
		if p2.state ~= 2 then
			if p2.state == 0 then
				task.spawn(function()
					local l__intermissionTrack__12 = p2.intermissionTrack;
					if l__intermissionTrack__12 ~= nil then
						l__intermissionTrack__12:Play();
					end;
					l__default__14(1, l__InOutQuad__15, function(p7)
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
						l__default__14(1, l__InOutQuad__15, function(p8)
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
		local v16, v17, v18 = ipairs(l__CollectionService__12:GetTagged("Monster"));
		while true do
			v16(v17, v18);
			if not v16 then
				break;
			end;
			v18 = v16;
			if not v17:FindFirstChildOfClass("Highlight") then
				u13("Highlight", {
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
	l__ClientSyncEvents__16.ExplosionEffect:connect(function(p9)
		if p9.explosionType == l__ExplosionType__17.BOMBER_PENGUIN_EXPLOSION then
			local v19 = l__ReplicatedStorage__18.Assets.Effects.GuidedMissileExplosion:Clone();
			v19.Position = p9.position;
			v19.Parent = l__Workspace__19;
			v19.Debris1:Emit(5);
			v19.Debris2:Emit(5);
			v19.ExplosionFlames:Emit(50);
			l__SoundManager__1:playSound(l__GameSound__2.GUIDED_MISSILE_EXPLOSION, {
				position = p9.position, 
				rollOffMaxDistance = 160
			});
			task.delay(5, function()
				v19:Destroy();
			end);
		end;
	end);
	l__CollectionService__12:GetInstanceAddedSignal("Monster"):Connect(function(p10)
		p10:GetPropertyChangedSignal("PrimaryPart"):Wait();
		local v20 = u20[p10:GetAttribute("MonsterType")];
		if v20 == nil then
			return nil;
		end;
		local v21 = l__ReplicatedStorage__18.Assets.Misc.Penguins[v20.modelName]:Clone();
		local v22 = v21:FindFirstChildOfClass("Humanoid");
		if v22 ~= nil then
			v22:Destroy();
		end;
		v21:SetPrimaryPartCFrame(p10:GetPrimaryPartCFrame());
		local v23, v24, v25 = ipairs(v21:GetChildren());
		while true do
			v23(v24, v25);
			if not v23 then
				break;
			end;
			v25 = v23;
			if v24:IsA("BasePart") then
				v24.CanCollide = false;
				v24.Massless = true;
			end;		
		end;
		v21.Parent = p10;
		l__WeldUtil__21.weldPartsWithJoint(p10.PrimaryPart, v21.PrimaryPart, "Motor6D");
		v21.PrimaryPart.Name = "Main";
		local v26, v27, v28 = ipairs(v21:GetChildren());
		while true do
			v26(v27, v28);
			if not v26 then
				break;
			end;
			v28 = v26;
			v27.Parent = p10;		
		end;
		v21:Destroy();
		local l__Humanoid__29 = p10:WaitForChild("Humanoid");
		local l__Animator__30 = l__Humanoid__29:WaitForChild("Animator");
		local v31 = u22.new();
		local v32 = l__Animator__30:LoadAnimation(l__GameAnimationUtil__23.getAnimation(v20.animations.walk));
		v32.Looped = true;
		v32.Priority = Enum.AnimationPriority.Movement;
		v31:GiveTask(v32);
		local v33 = l__Animator__30:LoadAnimation(l__GameAnimationUtil__23.getAnimation(v20.animations.idle));
		v33.Looped = true;
		v33.Priority = Enum.AnimationPriority.Idle;
		v31:GiveTask(v33);
		local v34 = l__Animator__30:LoadAnimation(l__GameAnimationUtil__23.getAnimation(v20.animations.jump));
		v34.Looped = false;
		v34.Priority = Enum.AnimationPriority.Action;
		v31:GiveTask(v34);
		v31:GiveTask(l__RunService__8.Heartbeat:Connect(function()
			if l__Humanoid__29:GetState() == Enum.HumanoidStateType.Running then
				if p10.PrimaryPart.AssemblyLinearVelocity.Magnitude > 10 then
					v32:AdjustSpeed(l__Humanoid__29.WalkSpeed / 16);
					if not v32.IsPlaying then
						v32:Play();
						return;
					end;
				else
					v32:Stop();
					if not v33.IsPlaying then
						v33:Play();
						return;
					end;
				end;
			elseif (l__Humanoid__29:GetState() == Enum.HumanoidStateType.Jumping or l__Humanoid__29:GetState() == Enum.HumanoidStateType.Freefall) and not v34.IsPlaying then
				v32:Stop();
				v33:Stop();
				v34:Play();
			end;
		end));
		local u31 = time() + math.random(1, 300);
		v31:GiveTask(l__RunService__8.Heartbeat:Connect(function()
			if u31 < time() then
				l__SoundManager__1:playSound(l__GameSound__2.PENGUIN_SQUAWK_1, {
					position = p10:GetPrimaryPartCFrame().Position
				});
				u31 = time() + math.random(1, 300);
			end;
		end));
		v31:GiveTask(l__Animator__30.AnimationPlayed:Connect(function(p11)
			local v35 = p11.Animation;
			if v35 ~= nil then
				v35 = v35.AnimationId;
			end;
			local v36 = v35 == l__GameAnimationUtil__23.getAssetId(l__AnimationType__24.PENGUIN_ATTACK_2) and p10.PrimaryPart;
			if v36 then
				l__SoundManager__1:playSound(l__RandomUtil__25.fromList(l__GameSound__2.PENGUIN_ATTACK_1, l__GameSound__2.PENGUIN_ATTACK_2, l__GameSound__2.PENGUIN_ATTACK_3), {
					position = p10:GetPrimaryPartCFrame().Position
				});
			end;
		end));
		local u32 = 100;
		v31:GiveTask(p10:GetAttributeChangedSignal("Health"):Connect(function()
			local v37 = p10:GetAttribute("Health");
			if v37 ~= 0 and v37 == v37 and v37 then
				if v37 < u32 then
					l__SoundManager__1:playSound(l__RandomUtil__25.fromList(l__GameSound__2.PENGUIN_DAMAGED_5, l__GameSound__2.PENGUIN_DAMAGED_6, l__GameSound__2.PENGUIN_DAMAGED_7), {
						position = p10:GetPrimaryPartCFrame().Position
					});
				end;
				u32 = v37;
			end;
		end));
		v31:GiveTask(function()
			if p10.PrimaryPart then
				l__SoundManager__1:playSound(l__RandomUtil__25.fromList(l__GameSound__2.PENGUIN_DAMAGED_5, l__GameSound__2.PENGUIN_DAMAGED_6, l__GameSound__2.PENGUIN_DAMAGED_7), {
					position = p10:GetPrimaryPartCFrame().Position
				});
			end;
		end);
		v31:GiveTask(p10.AncestryChanged:Connect(function()
			if not p10:IsDescendantOf(game) then
				v31:DoCleaning();
			end;
		end));
	end);
	l__default__11.Client:WaitFor("RemoteName"):expect():Connect(function(p12)
		if l__ClientStore__7:getState().Game.queueType == l__QueueType__26.SURVIVAL and p12.matchState == l__MatchState__27.RUNNING then
			local v38 = nil;
			l__WatchCollectionTag__28("block", function(p13)
				if p13:GetAttribute("PlacedByUserId") ~= 0 then
					local u33 = nil;
					p2.blockConnections[p13] = p13:GetAttributeChangedSignal("Health"):Connect(function()
						local v39 = p13:GetAttribute("MaxHealth");
						local v40 = p13:GetAttribute("Health");
						if u33 == nil then
							local v41 = {};
							local v42 = 0;
							local v43, v44, v45 = ipairs((p13:GetChildren()));
							while true do
								v43(v44, v45);
								if not v43 then
									break;
								end;
								v45 = v43;
								if v44:IsA("Texture") == true then
									v42 = v42 + 1;
									v41[v42] = v44;
								end;							
							end;
							u33 = v41;
						end;
						local v46, v47, v48 = ipairs(u33);
						while true do
							v46(v47, v48);
							if not v46 then
								break;
							end;
							v48 = v46;
							v47.Color3 = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(0, 0, 0), l__Linear__29(v39 - v40, 0, 1, v39));						
						end;
					end);
				end;
			end);
			l__CollectionService__12:GetInstanceRemovedSignal("block"):Connect(function(p14)
				if p2.blockConnections[p14] then
					p2.blockConnections[p14] = nil;
				end;
			end);
			v38 = function(p15)
				p2.tree = u9.mount(u9.createElement("ScreenGui", {
					ResetOnSpawn = false
				}, { u9.createElement(l__SurvivalUi__10, {
						health = 750, 
						maxHealth = 750, 
						waveCount = p2.wave, 
						endTime = p2.endTime, 
						state = p2.state
					}) }), l__Players__30.LocalPlayer:FindFirstChildOfClass("PlayerGui"));
				p15:GetAttributeChangedSignal("Health"):Connect(function()
					p2.health = p15:GetAttribute("Health");
					p2.maxHealth = p15:GetAttribute("MaxHealth");
					p2.lastBedTookDamage = time();
				end);
			end;
			local v49 = l__CollectionService__12:GetTagged("bed:1")[1];
			if v49 then
				v38(v49);
			else
				l__CollectionService__12:GetInstanceAddedSignal("bed:1"):Connect(function(p16)
					v38(p16);
				end);
			end;
			l__CollectionService__12:GetInstanceRemovedSignal("bed:1"):Connect(function(p17)
				p2.health = 0;
				p2.maxHealth = p17:GetAttribute("MaxHealth");
				l__SoundManager__1:playSound(l__GameSound__2.BED_BREAK, {});
			end);
		end;
	end);
end;
local v50 = l__KnitClient__4.CreateController(v6.new());
return nil;
