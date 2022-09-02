-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "EnchantTableController";
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
	p1.Name = "EnchantTableController";
	p1.upgradeCooldowns = l__ExpireList__1.new(2);
end;
local l__ContentProvider__2 = v3.ContentProvider;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__GameAnimationUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__CollectionTagAdded__6 = v2.CollectionTagAdded;
local l__BedwarsShop__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
local l__Theme__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__DeviceUtil__9 = v2.DeviceUtil;
local l__ClientStore__10 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__Flamework__11 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__InventoryUtil__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__ItemType__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local u14 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__Players__15 = v3.Players;
local l__default__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__EffectUtil__17 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
local l__BedwarsAppIds__18 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__AnimationUtil__19 = v2.AnimationUtil;
local l__WatchCharacter__20 = v2.WatchCharacter;
local l__AnimatorAdded__21 = v2.AnimatorAdded;
local l__EntityUtil__22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__ReplicatedStorage__23 = v3.ReplicatedStorage;
local l__WeldUtil__24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local l__SoundManager__25 = v2.SoundManager;
local l__GameSound__26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Workspace__27 = v3.Workspace;
local l__HttpService__28 = v3.HttpService;
local l__RunService__29 = v3.RunService;
local u30 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__EnchantPopUp__31 = v1.import(script, script.Parent, "ui", "enchant-pop-up").EnchantPopUp;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	task.spawn(function()
		l__ContentProvider__2:PreloadAsync({ u3("Animation", {
				AnimationId = l__GameAnimationUtil__4.getAssetId(l__AnimationType__5.REPAIR_ENCHANT_TABLE)
			}) });
	end);
	l__CollectionTagAdded__6("broken-enchant-table", function(p3)
		local v7 = u3("ProximityPrompt", {
			Parent = p3, 
			ActionText = tostring(l__BedwarsShop__7.RepairEnchantTablePrice) .. " Diamonds", 
			ObjectText = "Repair Enchant Table", 
			KeyboardKeyCode = l__Theme__8.promptKeyboardKey, 
			RequiresLineOfSight = false, 
			MaxActivationDistance = 6, 
			HoldDuration = 3.68, 
			ClickablePrompt = l__DeviceUtil__9.isMobileControls()
		});
		v7.PromptButtonHoldBegan:Connect(function(p4)
			local v8 = l__ClientStore__10:getState().Game.myTeam;
			if v8 ~= nil then
				v8 = v8.id;
			end;
			if p3:GetAttribute("Team") ~= v8 then
				v7:InputHoldEnd();
				l__Flamework__11.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
					message = "You can only repair your team's Enchant Table."
				});
				return nil;
			end;
			if l__InventoryUtil__12.hasEnough(p4, l__ItemType__13.DIAMOND, l__BedwarsShop__7.RepairEnchantTablePrice) then
				local v9 = u14.new();
				local u32 = l__GameAnimationUtil__4.playAnimation(l__Players__15.LocalPlayer, l__AnimationType__5.REPAIR_ENCHANT_TABLE);
				v9:GiveTask(function()
					if u32 ~= nil then
						u32:Stop();
					end;
					if u32 ~= nil then
						u32:Destroy();
					end;
				end);
				v7.PromptButtonHoldEnded:Connect(function()
					v9:DoCleaning();
				end);
				return;
			end;
			v7:InputHoldEnd();
			l__Flamework__11.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
				message = "You need " .. tostring(l__BedwarsShop__7.RepairEnchantTablePrice) .. " diamonds to repair the Enchant Table."
			});
			return nil;
		end);
		v7.Triggered:Connect(function(p5)
			local v10 = l__default__16.Client:Get("RemoteName"):CallServer(p3);
		end);
	end);
	l__CollectionTagAdded__6("enchant-table", function(p6)
		task.spawn(function()
			local l__SpawnEffect__11 = p6:WaitForChild("SpawnEffect");
			l__SpawnEffect__11:WaitForChild("Main");
			l__SpawnEffect__11:WaitForChild("Outline");
			l__SpawnEffect__11:WaitForChild("Outline1");
			l__SpawnEffect__11:WaitForChild("Specs");
			l__EffectUtil__17:playEffects(p6.SpawnEffect:GetChildren(), nil);
		end);
		local v12 = u3("ProximityPrompt", {
			Parent = p6, 
			ActionText = "Open", 
			ObjectText = "Enchant Table", 
			KeyboardKeyCode = l__Theme__8.promptKeyboardKey, 
			RequiresLineOfSight = false, 
			MaxActivationDistance = 6, 
			ClickablePrompt = l__DeviceUtil__9.isMobileControls()
		});
		local v13 = l__ClientStore__10:getState().Game.myTeam;
		if v13 ~= nil then
			v13 = v13.id;
		end;
		if p6:GetAttribute("Team") ~= v13 then
			v12.Enabled = false;
		end;
		v12.Triggered:Connect(function(p7)
			if p7 ~= l__Players__15.LocalPlayer then
				return nil;
			end;
			l__Flamework__11.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__18.ENCHANT_TABLE, {});
		end);
		task.spawn(function()
			l__AnimationUtil__19.playAnimation(p6:WaitForChild("Rig"):WaitForChild("AnimationController"):WaitForChild("Animator"), l__GameAnimationUtil__4.getAssetId(l__AnimationType__5.ENCHANT_TABLE_LOOP));
		end);
	end);
	l__WatchCharacter__20(function(p8, p9)
		l__AnimatorAdded__21(p9:WaitForChild("Humanoid"), function(p10)
			p10.AnimationPlayed:Connect(function(p11)
				local v14 = p11.Animation;
				if v14 ~= nil then
					v14 = v14.AnimationId;
				end;
				if v14 == l__GameAnimationUtil__4.getAssetId(l__AnimationType__5.REPAIR_ENCHANT_TABLE) then
					if p2.upgradeCooldowns:has(p8.UserId) and p8.UserId ~= l__Players__15.LocalPlayer.UserId then
						return nil;
					end;
					p2.upgradeCooldowns:add(p8.UserId);
					local v15 = p9.PrimaryPart;
					if v15 ~= nil then
						v15 = v15.Position;
					end;
					if not v15 then
						return nil;
					end;
					local v16 = p2:getClosestBrokenEnchantTable(v15);
					if not v16 then
						return nil;
					end;
					local v17 = u14.new();
					local v18 = l__EntityUtil__22:getEntity(p8);
					if v18 ~= nil then
						v18 = v18:getItemInHandClient();
					end;
					if v18 then
						local v19, v20, v21 = ipairs(v18:GetDescendants());
						while true do
							v19(v20, v21);
							if not v19 then
								break;
							end;
							v21 = v19;
							if v20:IsA("BasePart") then
								v20.Transparency = 1;
								local l__Transparency__33 = v20.Transparency;
								v17:GiveTask(function()
									v20.Transparency = l__Transparency__33;
								end);
							end;						
						end;
					end;
					local v22 = l__ReplicatedStorage__23.Assets.Effects.RepairEnchantTableHammer:Clone();
					v22.Parent = p9;
					l__WeldUtil__24.weldCharacterAccessories(p9);
					local u34 = p9 == l__Players__15.LocalPlayer.Character;
					p11:GetMarkerReachedSignal("hammer_1"):Connect(function()
						l__EffectUtil__17:playEffects(v16.HammerEffect:GetChildren(), nil);
						local v23 = {};
						if u34 then
							local v24 = nil;
						else
							local v25 = p9.PrimaryPart;
							if v25 ~= nil then
								v25 = v25.Position;
							end;
							v24 = v25;
						end;
						v23.position = v24;
						l__SoundManager__25:playSound(l__GameSound__26.ENCHANT_TABLE_REPAIR_HAMMER_1, v23);
					end);
					p11:GetMarkerReachedSignal("hammer_2"):Connect(function()
						l__EffectUtil__17:playEffects(v16.HammerEffect:GetChildren(), nil);
						local v26 = {};
						if u34 then
							local v27 = nil;
						else
							local v28 = p9.PrimaryPart;
							if v28 ~= nil then
								v28 = v28.Position;
							end;
							v27 = v28;
						end;
						v26.position = v27;
						l__SoundManager__25:playSound(l__GameSound__26.ENCHANT_TABLE_REPAIR_HAMMER_2, v26);
					end);
					p11:GetMarkerReachedSignal("hammer_3"):Connect(function()
						l__EffectUtil__17:playEffects(v16.HammerEffect:GetChildren(), nil);
						local v29 = {};
						if u34 then
							local v30 = nil;
						else
							local v31 = p9.PrimaryPart;
							if v31 ~= nil then
								v31 = v31.Position;
							end;
							v30 = v31;
						end;
						v29.position = v30;
						l__SoundManager__25:playSound(l__GameSound__26.ENCHANT_TABLE_REPAIR_HAMMER_3, v29);
					end);
					p11:GetMarkerReachedSignal("hammer_4"):Connect(function()
						l__EffectUtil__17:playEffects(v16.HammerEffect:GetChildren(), nil);
						local v32 = {};
						if u34 then
							local v33 = nil;
						else
							local v34 = p9.PrimaryPart;
							if v34 ~= nil then
								v34 = v34.Position;
							end;
							v33 = v34;
						end;
						v32.position = v33;
						l__SoundManager__25:playSound(l__GameSound__26.ENCHANT_TABLE_REPAIR_HAMMER_4, v32);
					end);
					p11.Stopped:Connect(function()
						v22:Destroy();
						v17:DoCleaning();
					end);
				end;
			end);
		end);
	end);
	l__default__16.Client:OnEvent("RemoteName", function(p12)
		local v35 = p12.entityInstance.PrimaryPart;
		if v35 ~= nil then
			v35 = v35.Position;
		end;
		local v36 = v35;
		if p12.enchantTable then
			v36 = p12.enchantTable.Position;
		end;
		if p12.orbOriginPosition then
			v36 = p12.orbOriginPosition;
		end;
		if not v36 then
			return nil;
		end;
		l__SoundManager__25:playSound(l__GameSound__26.ENCHANT_TABLE_RESEARCH_IMPLODE, {
			position = v36, 
			rollOffMaxDistance = 120
		});
		if p12.enchantTable then
			l__EffectUtil__17:playEffects(p12.enchantTable.Implosion:GetChildren(), nil);
		end;
		local v37 = l__ReplicatedStorage__23.Assets.Effects.EnchantResearchOrb:Clone();
		v37.Parent = l__Workspace__27;
		if p12.enchantTable then
			v37:SetPrimaryPartCFrame(CFrame.new(p12.enchantTable.OrbAttachment.WorldPosition));
		else
			v37:SetPrimaryPartCFrame(CFrame.new(v36));
		end;
		local v38 = u14.new();
		v38:GiveTask(function()
			v37:Destroy();
		end);
		local l__UpperTorso__39 = p12.entityInstance:FindFirstChild("UpperTorso");
		if l__UpperTorso__39 == nil then
			return nil;
		end;
		local v40 = l__HttpService__28:GenerateGUID(false);
		local u35 = 0;
		local u36 = Vector3.new(math.random(-2, 2), math.random(3, 4), math.random(-2, 2));
		l__RunService__29:BindToRenderStep(v40, Enum.RenderPriority.Last.Value, function(p13)
			if l__UpperTorso__39.Parent == nil then
				return nil;
			end;
			if v37.PrimaryPart == nil then
				return nil;
			end;
			u35 = u35 + p13;
			local v41 = math.clamp(u35 / 1.2, 0, 1);
			local v42 = math.sin(v41 * math.pi);
			v37:SetPrimaryPartCFrame(CFrame.new(v37.PrimaryPart.Position:Lerp(l__UpperTorso__39.Position, math.sqrt(v41)) + u36 * Vector3.new(v42, v42, v42)) * CFrame.Angles(math.pi * 2 * (u35 % 2), math.pi * 2 * (u35 % 3), math.pi * 2 * (u35 % 1.5)));
		end);
		v38:GiveTask(function()
			l__RunService__29:UnbindFromRenderStep(v40);
		end);
		local v43 = p12.entityInstance == l__Players__15.LocalPlayer.Character;
		if v43 then
			l__SoundManager__25:playSound(l__GameSound__26.BEDWARS_PURCHASE_ITEM);
		end;
		task.delay(1.2, function()
			v38:DoCleaning();
			if p12.entityInstance.PrimaryPart then
				local v44 = {};
				if v43 then
					local v45 = nil;
				else
					v45 = p12.entityInstance.PrimaryPart.Position;
				end;
				v44.position = v45;
				l__SoundManager__25:playSound(l__GameSound__26.ENCHANT_TABLE_RESEARCH_CONSUME, v44);
			end;
		end);
		if p12.entityInstance == l__Players__15.LocalPlayer.Character then
			task.delay(1.2, function()
				if p2.enchantPopupTree then
					u30.unmount(p2.enchantPopupTree);
				end;
				p2.enchantPopupTree = u30.mount(u30.createElement(l__EnchantPopUp__31, {
					Enchant = p12.enchant
				}), l__Players__15.LocalPlayer:WaitForChild("PlayerGui"));
			end);
		end;
	end);
end;
local l__CollectionService__37 = v3.CollectionService;
function v5.getClosestBrokenEnchantTable(p14, p15)
	local v46 = l__CollectionService__37:GetTagged("broken-enchant-table");
	table.sort(v46, function(p16, p17)
		return (p16.Position - p15).Magnitude < (p17.Position - p15).Magnitude;
	end);
	local v47 = nil;
	local v48, v49, v50 = ipairs(v46);
	while true do
		v48(v49, v50);
		if not v48 then
			break;
		end;
		v50 = v48;
		if true == true then
			v47 = v49;
			break;
		end;	
	end;
	return v47;
end;
function v5.getClosestEnchantTable(p18, p19)
	local v51 = l__CollectionService__37:GetTagged("enchant-table");
	table.sort(v51, function(p20, p21)
		return (p20.Position - p19).Magnitude < (p21.Position - p19).Magnitude;
	end);
	local v52 = nil;
	local v53, v54, v55 = ipairs(v51);
	while true do
		v53(v54, v55);
		if not v53 then
			break;
		end;
		v55 = v53;
		if true == true then
			v52 = v54;
			break;
		end;	
	end;
	return v52;
end;
function v5.researchEnchant(p22, p23)
	local v56 = l__Players__15.LocalPlayer.Character;
	if v56 ~= nil then
		v56 = v56.PrimaryPart;
		if v56 ~= nil then
			v56 = v56.Position;
		end;
	end;
	if not v56 then
		return nil;
	end;
	local v57 = p22:getClosestEnchantTable(v56);
	if not v57 then
		return nil;
	end;
	l__Flamework__11.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(l__BedwarsAppIds__18.ENCHANT_TABLE);
	local v58 = l__default__16.Client:Get("RemoteName"):CallServer({
		researchType = p23, 
		enchantTable = v57
	});
end;
function v5.unmountEnchantPopup(p24)
	if p24.enchantPopupTree then
		u30.unmount(p24.enchantPopupTree);
		p24.enchantPopupTree = nil;
	end;
end;
local v59 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v5.new());
return nil;
