-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "DragonSlayerController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
function v6.constructor(p1)
	l__KnitController__5.constructor(p1);
	p1.Name = "DragonSlayerController";
	p1.dragonEmblems = {};
end;
local l__ClientSyncEvents__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__BedwarsKit__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__KnitClient__3 = v3.KnitClient;
local l__AnimationType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__default__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__7 = v4.Players;
local l__MapUtil__8 = v1.import(script, v1.getModule(script, "@easy-games", "data-structure").out).MapUtil;
local l__RunService__9 = v4.RunService;
local l__Workspace__10 = v4.Workspace;
local l__ReplicatedStorage__11 = v4.ReplicatedStorage;
local l__DragonSlayerConstants__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "dragon-slayer", "dragon-slayer-constants").DragonSlayerConstants;
local u13 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__DeviceUtil__15 = v2.DeviceUtil;
local l__CombatConstant__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "combat-constant").CombatConstant;
local u17 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__GameAnimationUtil__18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__default__19 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__Linear__20 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).Linear;
local l__SoundManager__21 = v2.SoundManager;
local l__EffectUtil__22 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
local l__WatchCharacter__23 = v2.WatchCharacter;
local l__AnimatorAdded__24 = v2.AnimatorAdded;
local l__KnitClient__25 = v3.KnitClient;
function v6.KnitStart(p2)
	l__KnitController__5.KnitStart(p2);
	l__ClientSyncEvents__1.KitEquip:connect(function(p3)
		if p3.kit ~= l__BedwarsKit__2.DRAGON_SLAYER then
			return nil;
		end;
		l__KnitClient__3.Controllers.PreloadController:runPreload({
			animations = { l__AnimationType__4.DRAGON_SLAYER_PUNCH, l__AnimationType__4.DRAGON_SLAYER_LAUNCH_LOOP, l__AnimationType__4.DRAGON_SLAYER_LAUNCH_IMPACT }, 
			sounds = { l__GameSound__5.DRAGON_SLAYER_EXPLOSION, l__GameSound__5.DRAGON_SLAYER_PUNCH, l__GameSound__5.DRAGON_SLAYER_WALL_HIT }
		});
	end);
	l__default__6.Client:Get("RemoteName"):Connect(function(p4)
		if p4.kitUser ~= l__Players__7.LocalPlayer.UserId then
			return nil;
		end;
		if p4.stacks == 0 then
			p2:deleteEmblem(p4.target);
			return nil;
		end;
		if p2.dragonEmblems[p4.target] == nil then
			local u26 = nil;
			u26 = p4.target.AncestryChanged:Connect(function()
				p2:deleteEmblem(p4.target);
				u26:Disconnect();
			end);
		end;
		l__MapUtil__8.getOrCreate(p2.dragonEmblems, p4.target, {
			stackCount = 0
		}).stackCount = p4.stacks;
	end);
	l__RunService__9.RenderStepped:Connect(function()
		local v8 = l__Workspace__10.CurrentCamera;
		if v8 ~= nil then
			v8 = v8.CFrame;
		end;
		if not v8 then
			return nil;
		end;
		for v9, v10 in pairs(p2.dragonEmblems) do
			if v9.PrimaryPart then
				local l__Position__11 = (v9:GetPrimaryPartCFrame() + Vector3.new(0, 5, 0)).Position;
				if not v10.model then
					v10.model = l__ReplicatedStorage__11.Assets.Misc.DragonEmblem:Clone();
					v10.model.Parent = p2:getDragonEmblemFolder();
				end;
				v10.model:SetPrimaryPartCFrame(CFrame.new(l__Position__11, Vector3.new(v8.X, l__Position__11.Y, v8.Z)) * CFrame.Angles(0, math.pi / 2, 0));
				local v12 = 1;
				local v13 = false;
				while true do
					if v13 then
						v12 = v12 + 1;
					else
						v13 = true;
					end;
					if not (v12 <= l__DragonSlayerConstants__12.MAX_STACKS) then
						break;
					end;
					local v14 = v10.model:FindFirstChild(v12);
					if v14 then
						local v15 = v12 <= v10.stackCount;
						if v15 then
							local v16 = Color3.fromRGB(255, 67, 45);
						else
							v16 = Color3.fromRGB(185, 148, 153);
						end;
						v14.Color = v16;
						if v15 then
							local v17 = Enum.Material.Neon;
						else
							v17 = Enum.Material.Glass;
						end;
						v14.Material = v17;
						v14.Transparency = 0.1;
					end;				
				end;
				local l__DragonPunchPrompt__18 = v9:FindFirstChild("DragonPunchPrompt");
				local v19 = v10.stackCount == l__DragonSlayerConstants__12.MAX_STACKS;
				if not v19 and l__DragonPunchPrompt__18 ~= nil then
					l__DragonPunchPrompt__18:Destroy();
				end;
				if v19 and not l__DragonPunchPrompt__18 then
					u13("ProximityPrompt", {
						Name = "DragonPunchPrompt", 
						ActionText = "Punch", 
						HoldDuration = 0, 
						KeyboardKeyCode = l__Theme__14.promptKeyboardKey, 
						ClickablePrompt = l__DeviceUtil__15.isMobileControls(), 
						RequiresLineOfSight = true, 
						MaxActivationDistance = l__CombatConstant__16.RAYCAST_SWORD_CHARACTER_DISTANCE, 
						Parent = v9
					}).Triggered:Connect(function()
						local l__Position__20 = v9:GetPrimaryPartCFrame().Position;
						local l__Character__21 = l__Players__7.LocalPlayer.Character;
						if not l__Character__21 then
							return nil;
						end;
						p2:deleteEmblem(v9);
						local l__Position__22 = l__Character__21:GetPrimaryPartCFrame().Position;
						local v23 = CFrame.new(l__Position__22, l__Position__20 * Vector3.new(1, 0, 1) + Vector3.new(0, l__Position__22.Y, 0));
						l__Character__21:SetPrimaryPartCFrame(v23);
						p2:playPunchAnimation(v23 - v23.Position);
						l__default__6.Client:Get("RemoteName"):SendToServer({
							target = v9
						});
					end);
				end;
			end;
		end;
	end);
	l__default__6.Client:Get("RemoteName"):Connect(function(p5)
		if not p5.target.PrimaryPart then
			return nil;
		end;
		local v24 = u17.new();
		local l__Position__25 = p5.target:GetPrimaryPartCFrame().Position;
		local v26 = p5.destination.Position - l__Position__25;
		local v27 = CFrame.lookAt(Vector3.zero, (Vector3.new(v26.X, 0, v26.Z))) * CFrame.Angles(0, math.pi, 0);
		local v28 = CFrame.new((p5.target:GetPrimaryPartCFrame() + Vector3.new(0, 5, 0)).Position) * v27 * CFrame.Angles(0, math.pi / 2, 0);
		local v29 = l__ReplicatedStorage__11.Assets.Misc.DragonEmblem:Clone();
		v24:GiveTask(v29);
		v29.Parent = p2:getDragonEmblemFolder();
		v29:SetPrimaryPartCFrame(v28);
		local v30 = p5.target:FindFirstChildWhichIsA("Humanoid");
		if v30 ~= nil then
			v30 = v30:FindFirstChild("Animator");
		end;
		if v30 then
			local u27 = l__GameAnimationUtil__18.playAnimation(v30, l__AnimationType__4.DRAGON_SLAYER_LAUNCH_LOOP);
			v24:GiveTask(function()
				if u27 ~= nil then
					u27:Stop();
				end;
			end);
		end;
		local u28 = CFrame.new(l__Position__25) * v27;
		local u29 = CFrame.new(p5.destination.Position) * v27;
		l__default__19(p5.knockbackDuration, l__Linear__20, function(p6)
			if not p5.target.PrimaryPart then
				return nil;
			end;
			p5.target:SetPrimaryPartCFrame(u28:Lerp(u29, p6));
		end);
		local u30 = p5.target == l__Players__7.LocalPlayer.Character;
		task.delay(math.max(0, p5.knockbackDuration - 0.1), function()
			if u30 or p5.target.PrimaryPart then
				local v31 = {};
				if u30 then
					local v32 = nil;
				else
					v32 = p5.target:GetPrimaryPartCFrame().Position;
				end;
				v31.position = v32;
				l__SoundManager__21:playSound(l__GameSound__5.DRAGON_SLAYER_WALL_HIT, v31);
				local v33 = {
					rollOffMaxDistance = 80, 
					rollOffMinDistsance = 30
				};
				for v34, v35 in pairs(v31) do
					v33[v34] = v35;
				end;
				l__SoundManager__21:playSound(l__GameSound__5.DRAGON_SLAYER_EXPLOSION, v33);
			end;
		end);
		task.delay(p5.knockbackDuration, function()
			v24:DoCleaning();
			if p5.target.PrimaryPart then
				local v36 = l__ReplicatedStorage__11.Assets.Effects.DragonEmblemExplode:Clone();
				v36.Position = p5.target:GetPrimaryPartCFrame().Position + Vector3.new(0, 5, 0);
				v36.Parent = l__Workspace__10;
				l__EffectUtil__22:playEffects({ v36 }, nil, {
					destroyAfterSec = 3
				});
			end;
			if v30 then
				l__GameAnimationUtil__18.playAnimation(v30, l__AnimationType__4.DRAGON_SLAYER_LAUNCH_IMPACT);
			end;
		end);
	end);
	l__WatchCharacter__23(function(p7, p8, p9)
		local u31 = p7 == l__Players__7.LocalPlayer;
		p9:GiveTask(l__AnimatorAdded__24(p8:WaitForChild("Humanoid"), function(p10)
			p10.AnimationPlayed:Connect(function(p11)
				local v37 = p11.Animation;
				if v37 ~= nil then
					v37 = v37.AnimationId;
				end;
				if v37 ~= l__GameAnimationUtil__18.getAssetId(l__AnimationType__4.DRAGON_SLAYER_PUNCH) then
					return nil;
				end;
				if p8.PrimaryPart or u31 then
					local v38 = {};
					if u31 then
						local v39 = nil;
					else
						v39 = p8:GetPrimaryPartCFrame().Position;
					end;
					v38.position = v39;
					l__SoundManager__21:playSound(l__GameSound__5.DRAGON_SLAYER_PUNCH, v38);
				end;
				p11:GetMarkerReachedSignal("impact"):Connect(function()
					if u31 then
						local v40 = l__Players__7.LocalPlayer.Character;
						if v40 ~= nil then
							v40 = v40.PrimaryPart;
							if v40 ~= nil then
								v40 = v40.CFrame;
							end;
						end;
						local v41 = v40;
						if v41 == nil then
							v41 = CFrame.new();
						end;
						l__KnitClient__25.Controllers.ScreenShakeController:shake(Vector3.new(0, 0, 0), v41.LookVector, {
							cycles = 3
						});
					end;
					task.delay(0.03, function()
						local l__RightHand__42 = p8:FindFirstChild("RightHand");
						if l__RightHand__42 then
							local v43 = l__ReplicatedStorage__11.Assets.Misc.DragonPunchRune:Clone();
							local v44 = l__RightHand__42.CFrame * CFrame.Angles(math.pi / 2, 0, 0);
							v43.CFrame = CFrame.new(v44 * Vector3.new(0, 0, 1.5)) * (v44 - l__RightHand__42.Position);
							v43.Parent = l__Workspace__10;
							task.delay(0.04, function()
								local l__Brightness__32 = v43.SurfaceGui.Brightness;
								l__default__19(0.4, l__Linear__20, function(p12)
									local v45, v46, v47 = ipairs(v43:GetChildren());
									while true do
										v45(v46, v47);
										if not v45 then
											break;
										end;
										v47 = v45;
										if v46:IsA("SurfaceGui") then
											v46.Brightness = (1 - p12 / 2) * l__Brightness__32;
											local v48, v49, v50 = ipairs(v46:GetChildren());
											while true do
												v48(v49, v50);
												if not v48 then
													break;
												end;
												v50 = v48;
												if v49:IsA("ImageLabel") then
													print(p12);
													v49.ImageTransparency = p12;
												end;											
											end;
										end;									
									end;
								end):Wait();
								v43:Destroy();
							end);
						end;
					end);
				end);
			end);
		end));
	end);
end;
function v6.playPunchAnimation(p13, p14)
	local v51 = u17.new();
	local u33 = l__GameAnimationUtil__18.playAnimation(l__Players__7.LocalPlayer, l__AnimationType__4.DRAGON_SLAYER_PUNCH);
	v51:GiveTask(function()
		if u33 ~= nil then
			u33:Stop();
		end;
	end);
	v51:GiveTask(l__KnitClient__25.Controllers.SprintController:getMovementStatusModifier():addModifier({
		moveSpeedMultiplier = 0
	}));
	v51:GiveTask(l__RunService__9.RenderStepped:Connect(function()
		local l__Character__52 = l__Players__7.LocalPlayer.Character;
		local v53 = l__Character__52;
		if v53 ~= nil then
			v53 = v53.PrimaryPart;
		end;
		if not v53 then
			v51:DoCleaning();
			return nil;
		end;
		l__Character__52:SetPrimaryPartCFrame(CFrame.new(l__Character__52:GetPrimaryPartCFrame().Position) * p14);
	end));
	task.delay(0.46, function()
		v51:DoCleaning();
	end);
	return v51;
end;
function v6.deleteEmblem(p15, p16)
	local l__DragonPunchPrompt__54 = p16:FindFirstChild("DragonPunchPrompt");
	if l__DragonPunchPrompt__54 ~= nil then
		l__DragonPunchPrompt__54:Destroy();
	end;
	local v55 = p15.dragonEmblems[p16];
	if v55 ~= nil then
		local l__model__56 = v55.model;
		if l__model__56 ~= nil then
			l__model__56:Destroy();
		end;
	end;
	p15.dragonEmblems[p16] = nil;
end;
function v6.getDragonEmblemFolder(p17)
	if not p17.dragonEmblemFolder then
		p17.dragonEmblemFolder = u13("Folder", {
			Parent = l__Workspace__10, 
			Name = "DragonEmblems"
		});
	end;
	return p17.dragonEmblemFolder;
end;
local v57 = l__KnitClient__25.CreateController(v6.new());
return nil;
