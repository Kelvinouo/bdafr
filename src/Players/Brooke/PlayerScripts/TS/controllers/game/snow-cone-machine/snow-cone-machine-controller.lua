-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "SnowConeMachineController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local l__ExpireList__1 = v2.ExpireList;
function v5.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "SnowConeMachineController";
	p1.upgradeCooldowns = l__ExpireList__1.new(2);
end;
local l__BalanceFile__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__KnitClient__4 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__AnimationType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__WatchCollectionTag__6 = v2.WatchCollectionTag;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__DeviceUtil__9 = v2.DeviceUtil;
local l__ClientStore__10 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__Flamework__11 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__InventoryUtil__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__ItemType__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local u14 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__GameAnimationUtil__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__Players__16 = v3.Players;
local l__ReplicatedStorage__17 = v3.ReplicatedStorage;
local l__EffectUtil__18 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
local l__TimeToMakeSnowCone__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "snow-cone", "snow-cone-loot-table").TimeToMakeSnowCone;
local l__SnowConeMachineState__20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "snow-cone", "snow-cone-machine-state").SnowConeMachineState;
local l__SoundManager__21 = v2.SoundManager;
local l__GameSound__22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__WatchCharacter__23 = v2.WatchCharacter;
local l__AnimatorAdded__24 = v2.AnimatorAdded;
local l__EntityUtil__25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__WeldUtil__26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	if l__BalanceFile__2.SNOW_CONE_MACHINE_DISABLED then
		return nil;
	end;
	local v7 = l__default__3.Client:Get("RemoteName");
	local v8 = l__default__3.Client:Get("RemoteName");
	task.spawn(function()
		l__KnitClient__4.Controllers.PreloadController:runPreload({
			animations = { l__AnimationType__5.REPAIR_SNOW_CONE_MACHINE }
		});
	end);
	l__WatchCollectionTag__6("BrokenSnowConeMachine", function(p3)
		local v9 = u7("ProximityPrompt", {
			Parent = p3, 
			ActionText = tostring(l__BalanceFile__2.RepairSnowConeMachinePrice) .. " Diamonds", 
			ObjectText = "Repair Snow Cone Machine", 
			KeyboardKeyCode = l__Theme__8.promptKeyboardKey, 
			RequiresLineOfSight = false, 
			MaxActivationDistance = 6, 
			HoldDuration = 3.68, 
			ClickablePrompt = l__DeviceUtil__9.isMobileControls()
		});
		v9.PromptButtonHoldBegan:Connect(function(p4)
			local v10 = l__ClientStore__10:getState().Game.myTeam;
			if v10 ~= nil then
				v10 = v10.id;
			end;
			if p3:GetAttribute("Team") ~= v10 then
				v9:InputHoldEnd();
				l__Flamework__11.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
					message = "You can only repair your team's Snow Cone Machine."
				});
				return nil;
			end;
			if l__InventoryUtil__12.hasEnough(p4, l__ItemType__13.DIAMOND, l__BalanceFile__2.RepairSnowConeMachinePrice) then
				local v11 = u14.new();
				local u27 = l__GameAnimationUtil__15.playAnimation(l__Players__16.LocalPlayer, l__AnimationType__5.REPAIR_SNOW_CONE_MACHINE);
				v11:GiveTask(function()
					if u27 ~= nil then
						u27:Stop();
					end;
					if u27 ~= nil then
						u27:Destroy();
					end;
				end);
				v9.PromptButtonHoldEnded:Connect(function()
					v11:DoCleaning();
				end);
				return;
			end;
			v9:InputHoldEnd();
			l__Flamework__11.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
				message = "You need " .. tostring(l__BalanceFile__2.RepairSnowConeMachinePrice) .. " diamonds to repair the Snow Cone Machine."
			});
			return nil;
		end);
		v9.Triggered:Connect(function(p5)
			v8:CallServer(p3);
		end);
	end);
	l__WatchCollectionTag__6("SnowConeMachine", function(p6)
		local v12 = l__ReplicatedStorage__17.Assets.Effects.SnowBlast:Clone();
		v12.Parent = p6;
		v12.Position = p6.Position + Vector3.new(0, 2.75, 0);
		task.spawn(function()
			l__EffectUtil__18:playEffects(v12:GetChildren(), nil, {
				destroyAfterSec = 3, 
				sizeMultiplier = 2
			});
		end);
		local v13 = u7("ProximityPrompt", {
			Parent = p6, 
			ActionText = "1 Emerald", 
			ObjectText = "Make Snow Cone", 
			KeyboardKeyCode = l__Theme__8.promptKeyboardKey, 
			RequiresLineOfSight = false, 
			MaxActivationDistance = 6, 
			HoldDuration = 0.5, 
			ClickablePrompt = l__DeviceUtil__9.isMobileControls()
		});
		local v14 = l__ClientStore__10:getState().Game.myTeam;
		if v14 ~= nil then
			v14 = v14.id;
		end;
		if p6:GetAttribute("Team") ~= v14 then
			v13.Enabled = false;
		end;
		v13.Triggered:Connect(function(p7)
			if p7 ~= l__Players__16.LocalPlayer then
				return nil;
			end;
			p2:makeSnowCone(p6);
		end);
		local u28 = u14.new();
		p6:GetAttributeChangedSignal("SnowConeMachineState"):Connect(function()
			local v15 = p6:GetAttribute("SnowConeMachineState");
			local v16 = p6:FindFirstChild("Model");
			if v16 ~= nil then
				v16 = v16:FindFirstChild("Button");
			end;
			if not v16 then
				return nil;
			end;
			local v17 = l__TimeToMakeSnowCone__19 / 10;
			u28:DoCleaning();
			if v15 == l__SnowConeMachineState__20.GENERATING then
				task.spawn(function()
					local u29 = l__SoundManager__21:playSound(l__GameSound__22.SNOW_CONE_MACHINE_MAKING, {
						rollOffMaxDistance = 100, 
						looped = true, 
						position = p6.Position
					});
					u28:GiveTask(function()
						if u29 ~= nil then
							u29:Stop();
						end;
						if u29 ~= nil then
							u29:Destroy();
						end;
					end);
					local l__SpiralTrailBW__18 = p6:FindFirstChild("SpiralTrailBW");
					if l__SpiralTrailBW__18 then
						local u30 = require(l__SpiralTrailBW__18);
						task.spawn(function()
							u30:Init(p6, {
								Color = Color3.fromRGB(135, 177, 255), 
								Size = 0.15, 
								Offset = 0.065, 
								Frequency = 1
							});
						end);
					end;
				end);
				local v19 = true;
				local v20 = 0;
				local v21 = false;
				while true do
					if v21 then
						v20 = v20 + 1;
					else
						v21 = true;
					end;
					if not (v20 < 10) then
						break;
					end;
					if v19 then
						v16.Color = Color3.fromRGB(105, 237, 112);
						v16.Material = Enum.Material.Neon;
						v16.Transparency = 0;
					else
						v16.Color = Color3.fromRGB(255, 255, 255);
						v16.Material = Enum.Material.Neon;
						v16.Transparency = 0.5;
					end;
					v19 = not v19;
					wait(v17);				
				end;
			else
				v16.Color = Color3.fromRGB(85, 159, 255);
				v16.Material = Enum.Material.SmoothPlastic;
				v16.Transparency = 0.2;
			end;
		end);
	end);
	l__WatchCharacter__23(function(p8, p9)
		l__AnimatorAdded__24(p9:WaitForChild("Humanoid"), function(p10)
			p10.AnimationPlayed:Connect(function(p11)
				local v22 = p11.Animation;
				if v22 ~= nil then
					v22 = v22.AnimationId;
				end;
				if v22 == l__GameAnimationUtil__15.getAssetId(l__AnimationType__5.REPAIR_SNOW_CONE_MACHINE) then
					if p2.upgradeCooldowns:has(p8.UserId) and p8.UserId ~= l__Players__16.LocalPlayer.UserId then
						return nil;
					end;
					p2.upgradeCooldowns:add(p8.UserId);
					local v23 = l__EntityUtil__25:getEntity(p8);
					if not v23 then
						return nil;
					end;
					if not p9.PrimaryPart then
						return nil;
					end;
					local l__Position__24 = p9.PrimaryPart.Position;
					if not l__Position__24 then
						return nil;
					end;
					local v25 = p2:getClosestBrokenSnowConeMachine(l__Position__24);
					if not v25 then
						return nil;
					end;
					local v26 = u14.new();
					local v27 = v23:getItemInHandClient();
					if v27 then
						local v28, v29, v30 = ipairs(v27:GetDescendants());
						while true do
							v28(v29, v30);
							if not v28 then
								break;
							end;
							v30 = v28;
							if v29:IsA("BasePart") then
								v29.Transparency = 1;
								local l__Transparency__31 = v29.Transparency;
								v26:GiveTask(function()
									v29.Transparency = l__Transparency__31;
								end);
							end;						
						end;
					end;
					local v31 = l__ReplicatedStorage__17.Assets.Effects.RepairEnchantTableHammer:Clone();
					v31.Parent = p9;
					l__WeldUtil__26:weldCharacterAccessories(p9);
					local u32 = p9 == l__Players__16.LocalPlayer.Character;
					p11:GetMarkerReachedSignal("hammer_1"):Connect(function()
						l__EffectUtil__18:playEffects(v25.HammerEffect:GetChildren(), nil);
						local v32 = {};
						if u32 then
							local v33 = nil;
						else
							local v34 = p9.PrimaryPart;
							if v34 ~= nil then
								v34 = v34.Position;
							end;
							v33 = v34;
						end;
						v32.position = v33;
						l__SoundManager__21:playSound(l__GameSound__22.SNOW_CONE_MACHINE_REPAIR_HAMMER_1, v32);
					end);
					p11:GetMarkerReachedSignal("hammer_2"):Connect(function()
						l__EffectUtil__18:playEffects(v25.HammerEffect:GetChildren(), nil);
						local v35 = {};
						if u32 then
							local v36 = nil;
						else
							local v37 = p9.PrimaryPart;
							if v37 ~= nil then
								v37 = v37.Position;
							end;
							v36 = v37;
						end;
						v35.position = v36;
						l__SoundManager__21:playSound(l__GameSound__22.SNOW_CONE_MACHINE_REPAIR_HAMMER_2, v35);
					end);
					p11:GetMarkerReachedSignal("hammer_3"):Connect(function()
						l__EffectUtil__18:playEffects(v25.HammerEffect:GetChildren(), nil);
						local v38 = {};
						if u32 then
							local v39 = nil;
						else
							local v40 = p9.PrimaryPart;
							if v40 ~= nil then
								v40 = v40.Position;
							end;
							v39 = v40;
						end;
						v38.position = v39;
						l__SoundManager__21:playSound(l__GameSound__22.SNOW_CONE_MACHINE_REPAIR_HAMMER_3, v38);
					end);
					p11:GetMarkerReachedSignal("hammer_4"):Connect(function()
						l__EffectUtil__18:playEffects(v25.HammerEffect:GetChildren(), nil);
						local v41 = {};
						if u32 then
							local v42 = nil;
						else
							local v43 = p9.PrimaryPart;
							if v43 ~= nil then
								v43 = v43.Position;
							end;
							v42 = v43;
						end;
						v41.position = v42;
						l__SoundManager__21:playSound(l__GameSound__22.SNOW_CONE_MACHINE_REPAIR_HAMMER_4, v41);
					end);
					p11.Stopped:Connect(function()
						v31:Destroy();
						v26:DoCleaning();
					end);
				end;
			end);
		end);
	end);
	l__default__3.Client:OnEvent("RemoteName", function(p12)
		task.spawn(function()
			local v44 = l__ReplicatedStorage__17.Assets.Effects.SnowBlast:Clone();
			v44.Parent = p12.snowConeMachine;
			v44.Position = p12.snowConeMachine.Position + Vector3.new(0, 2.75, 0);
			l__EffectUtil__18:playEffects(v44:GetChildren(), nil, {
				destroyAfterSec = 3, 
				sizeMultiplier = 1.25
			});
		end);
		l__SoundManager__21:playSound(l__GameSound__22.BEDWARS_PURCHASE_ITEM, {
			position = p12.snowConeMachine.Position
		});
		l__SoundManager__21:playSound(l__GameSound__22.SNOW_CONE_MACHINE_MAKING_FINISH, {
			position = p12.snowConeMachine.Position
		});
	end);
end;
local l__CollectionService__33 = v3.CollectionService;
function v5.getClosestBrokenSnowConeMachine(p13, p14)
	local v45 = l__CollectionService__33:GetTagged("BrokenSnowConeMachine");
	table.sort(v45, function(p15, p16)
		return (p15.Position - p14).Magnitude < (p16.Position - p14).Magnitude;
	end);
	local v46 = nil;
	local v47, v48, v49 = ipairs(v45);
	while true do
		v47(v48, v49);
		if not v47 then
			break;
		end;
		v49 = v47;
		if true == true then
			v46 = v48;
			break;
		end;	
	end;
	return v46;
end;
function v5.getClosestSnowConeMachine(p17, p18)
	local v50 = l__CollectionService__33:GetTagged("SnowConeMachine");
	table.sort(v50, function(p19, p20)
		return (p19.Position - p18).Magnitude < (p20.Position - p18).Magnitude;
	end);
	local v51 = nil;
	local v52, v53, v54 = ipairs(v50);
	while true do
		v52(v53, v54);
		if not v52 then
			break;
		end;
		v54 = v52;
		if true == true then
			v51 = v53;
			break;
		end;	
	end;
	return v51;
end;
function v5.makeSnowCone(p21, p22)
	local v55 = l__Players__16.LocalPlayer.Character;
	if v55 ~= nil then
		v55 = v55.PrimaryPart;
		if v55 ~= nil then
			v55 = v55.Position;
		end;
	end;
	if not v55 then
		return nil;
	end;
	l__default__3.Client:Get("RemoteName"):CallServer({
		snowConeMachine = p22
	});
end;
local v56 = l__KnitClient__4.CreateController(v5.new());
return nil;
