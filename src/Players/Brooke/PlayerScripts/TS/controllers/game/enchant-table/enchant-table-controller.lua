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
local l__ClientSyncEvents__10 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__ClientStore__11 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__Flamework__12 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__InventoryUtil__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__ItemType__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local u15 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__Players__16 = v3.Players;
local l__default__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__WatchCollectionTag__18 = v2.WatchCollectionTag;
local l__EffectUtil__19 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
local l__BedwarsAppIds__20 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__AnimationUtil__21 = v2.AnimationUtil;
local l__WatchCharacter__22 = v2.WatchCharacter;
local l__AnimatorAdded__23 = v2.AnimatorAdded;
local l__EntityUtil__24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__ReplicatedStorage__25 = v3.ReplicatedStorage;
local l__WeldUtil__26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local l__GameSound__27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__KnitClient__28 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__SoundManager__29 = v2.SoundManager;
local l__Workspace__30 = v3.Workspace;
local l__HttpService__31 = v3.HttpService;
local l__RunService__32 = v3.RunService;
local u33 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__EnchantTableUIUtil__34 = v1.import(script, script.Parent, "ui", "enchant-table-ui-util").EnchantTableUIUtil;
local l__EnchantPopUp__35 = v1.import(script, script.Parent, "ui", "enchant-pop-up", "enchant-pop-up").EnchantPopUp;
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
			if l__ClientSyncEvents__10.StartEnchantRepair:fire(p3):isCancelled() then
				v7:InputHoldEnd();
				return nil;
			end;
			local v8 = l__ClientStore__11:getState().Game.myTeam;
			if v8 ~= nil then
				v8 = v8.id;
			end;
			if p3:GetAttribute("Team") ~= v8 then
				v7:InputHoldEnd();
				l__Flamework__12.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
					message = "You can only repair your team's Enchant Table."
				});
				return nil;
			end;
			if l__InventoryUtil__13.hasEnough(p4, l__ItemType__14.DIAMOND, l__BedwarsShop__7.RepairEnchantTablePrice) then
				local v9 = u15.new();
				local u36 = l__GameAnimationUtil__4.playAnimation(l__Players__16.LocalPlayer, l__AnimationType__5.REPAIR_ENCHANT_TABLE);
				v9:GiveTask(function()
					if u36 ~= nil then
						u36:Stop();
					end;
					if u36 ~= nil then
						u36:Destroy();
					end;
				end);
				v7.PromptButtonHoldEnded:Connect(function()
					v9:DoCleaning();
				end);
				return;
			end;
			v7:InputHoldEnd();
			l__Flamework__12.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
				message = "You need " .. tostring(l__BedwarsShop__7.RepairEnchantTablePrice) .. " diamonds to repair the Enchant Table."
			});
			return nil;
		end);
		v7.Triggered:Connect(function(p5)
			local v10 = l__default__17.Client:Get("RemoteName"):CallServer(p3);
		end);
	end);
	l__WatchCollectionTag__18("enchant-table", function(p6)
		task.spawn(function()
			local l__SpawnEffect__11 = p6:FindFirstChild("SpawnEffect");
			if l__SpawnEffect__11 then
				l__SpawnEffect__11:WaitForChild("Main");
				l__SpawnEffect__11:WaitForChild("Outline");
				l__SpawnEffect__11:WaitForChild("Outline1");
				l__SpawnEffect__11:WaitForChild("Specs");
				l__EffectUtil__19:playEffects(p6.SpawnEffect:GetChildren(), nil);
			end;
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
		local v13 = l__ClientStore__11:getState().Game.myTeam;
		if v13 ~= nil then
			v13 = v13.id;
		end;
		if p6:GetAttribute("Team") ~= v13 then
			v12.Enabled = false;
		end;
		v12.Triggered:Connect(function(p7)
			if p7 ~= l__Players__16.LocalPlayer then
				return nil;
			end;
			l__Flamework__12.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__20.ENCHANT_TABLE, {
				EnchantTableType = p6.Name
			});
		end);
		local u37 = p6.Name == l__ItemType__14.ENCHANT_TABLE_GLITCHED;
		task.spawn(function()
			local v14 = nil;
			local v15 = p6:WaitForChild("Rig");
			if v15 ~= nil then
				v15 = v15:WaitForChild("AnimationController"):WaitForChild("Animator");
			end;
			v14 = v15;
			if u37 then
				l__AnimationUtil__21.playAnimation(v14, l__GameAnimationUtil__4.getAssetId(l__AnimationType__5.ENCHANT_TABLE_GLITCHED_IDLE), {
					looped = true
				});
				return;
			end;
			l__AnimationUtil__21.playAnimation(v14, l__GameAnimationUtil__4.getAssetId(l__AnimationType__5.ENCHANT_TABLE_LOOP), {
				looped = true
			});
		end);
	end);
	l__WatchCharacter__22(function(p8, p9)
		l__AnimatorAdded__23(p9:WaitForChild("Humanoid"), function(p10)
			p10.AnimationPlayed:Connect(function(p11)
				local v16 = p11.Animation;
				if v16 ~= nil then
					v16 = v16.AnimationId;
				end;
				if v16 == l__GameAnimationUtil__4.getAssetId(l__AnimationType__5.REPAIR_ENCHANT_TABLE) then
					if p2.upgradeCooldowns:has(p8.UserId) and p8.UserId ~= l__Players__16.LocalPlayer.UserId then
						return nil;
					end;
					p2.upgradeCooldowns:add(p8.UserId);
					local v17 = p9.PrimaryPart;
					if v17 ~= nil then
						v17 = v17.Position;
					end;
					if not v17 then
						return nil;
					end;
					local v18 = p2:getClosestBrokenEnchantTable(v17);
					if not v18 then
						return nil;
					end;
					local v19 = u15.new();
					local v20 = l__EntityUtil__24:getEntity(p8);
					if v20 ~= nil then
						v20 = v20:getItemInHandClient();
					end;
					if v20 then
						local v21, v22, v23 = ipairs(v20:GetDescendants());
						while true do
							v21(v22, v23);
							if not v21 then
								break;
							end;
							v23 = v21;
							if v22:IsA("BasePart") then
								v22.Transparency = 1;
								local l__Transparency__38 = v22.Transparency;
								v19:GiveTask(function()
									v22.Transparency = l__Transparency__38;
								end);
							end;						
						end;
					end;
					local v24 = l__ReplicatedStorage__25.Assets.Effects.RepairEnchantTableHammer:Clone();
					v24.Parent = p9;
					l__WeldUtil__26:weldCharacterAccessories(p9);
					local v25 = { l__GameSound__27.ENCHANT_TABLE_REPAIR_HAMMER_1, l__GameSound__27.ENCHANT_TABLE_REPAIR_HAMMER_2, l__GameSound__27.ENCHANT_TABLE_REPAIR_HAMMER_3, l__GameSound__27.ENCHANT_TABLE_REPAIR_HAMMER_4 };
					if l__KnitClient__28.Controllers.GlitchedEnchantingRelicController:onRelicTeam(p8) then
						v25 = { l__GameSound__27.GLITCH_ETABLE_REPAIR_HAMMER_1, l__GameSound__27.GLITCH_ETABLE_REPAIR_HAMMER_2, l__GameSound__27.GLITCH_ETABLE_REPAIR_HAMMER_3, l__GameSound__27.GLITCH_ETABLE_REPAIR_HAMMER_4 };
					end;
					local u39 = p9 == l__Players__16.LocalPlayer.Character;
					p11:GetMarkerReachedSignal("hammer_1"):Connect(function()
						l__EffectUtil__19:playEffects(v18.HammerEffect:GetChildren(), nil);
						local v26 = {};
						if u39 then
							local v27 = nil;
						else
							local v28 = p9.PrimaryPart;
							if v28 ~= nil then
								v28 = v28.Position;
							end;
							v27 = v28;
						end;
						v26.position = v27;
						l__SoundManager__29:playSound(v25[1], v26);
					end);
					p11:GetMarkerReachedSignal("hammer_2"):Connect(function()
						l__EffectUtil__19:playEffects(v18.HammerEffect:GetChildren(), nil);
						local v29 = {};
						if u39 then
							local v30 = nil;
						else
							local v31 = p9.PrimaryPart;
							if v31 ~= nil then
								v31 = v31.Position;
							end;
							v30 = v31;
						end;
						v29.position = v30;
						l__SoundManager__29:playSound(v25[2], v29);
					end);
					p11:GetMarkerReachedSignal("hammer_3"):Connect(function()
						l__EffectUtil__19:playEffects(v18.HammerEffect:GetChildren(), nil);
						local v32 = {};
						if u39 then
							local v33 = nil;
						else
							local v34 = p9.PrimaryPart;
							if v34 ~= nil then
								v34 = v34.Position;
							end;
							v33 = v34;
						end;
						v32.position = v33;
						l__SoundManager__29:playSound(v25[3], v32);
					end);
					p11:GetMarkerReachedSignal("hammer_4"):Connect(function()
						l__EffectUtil__19:playEffects(v18.HammerEffect:GetChildren(), nil);
						local v35 = {};
						if u39 then
							local v36 = nil;
						else
							local v37 = p9.PrimaryPart;
							if v37 ~= nil then
								v37 = v37.Position;
							end;
							v36 = v37;
						end;
						v35.position = v36;
						l__SoundManager__29:playSound(v25[4], v35);
					end);
					p11.Stopped:Connect(function()
						v24:Destroy();
						v19:DoCleaning();
					end);
				end;
			end);
		end);
	end);
	l__default__17.Client:OnEvent("RemoteName", function(p12)
		local v38 = p12.entityInstance.PrimaryPart;
		if v38 ~= nil then
			v38 = v38.Position;
		end;
		local v39 = v38;
		if p12.enchantTable then
			v39 = p12.enchantTable.Position;
		end;
		if p12.orbOriginPosition then
			v39 = p12.orbOriginPosition;
		end;
		if not v39 then
			return nil;
		end;
		local v40 = {
			implosion = l__GameSound__27.ENCHANT_TABLE_RESEARCH_IMPLODE, 
			research = l__GameSound__27.ENCHANT_TABLE_RESEARCH_CONSUME
		};
		local v41 = p12.enchantTable;
		if v41 ~= nil then
			v41 = v41.Name;
		end;
		local v42 = v41 == l__ItemType__14.ENCHANT_TABLE_GLITCHED;
		if v42 and p12.enchantTable then
			v40.implosion = l__GameSound__27.GLITCH_ETABLE_IMPLOSION;
			v40.research = l__GameSound__27.GLITCH_ETABLE_ORB_CONSUME;
			task.spawn(function()
				local v43 = p12.enchantTable;
				if v43 ~= nil then
					v43 = v43:FindFirstChild("Rig");
					if v43 ~= nil then
						v43 = v43:WaitForChild("AnimationController"):WaitForChild("Animator");
					end;
				end;
				l__AnimationUtil__21.playAnimation(v43, l__GameAnimationUtil__4.getAssetId(l__AnimationType__5.ENCHANT_TABLE_GLITCHED_ACTION), {
					looped = false
				});
			end);
		end;
		l__SoundManager__29:playSound(v40.implosion, {
			position = v39, 
			rollOffMaxDistance = 120
		});
		if p12.enchantTable then
			l__EffectUtil__19:playEffects(p12.enchantTable.Implosion:GetChildren(), nil);
		end;
		local v44 = l__ReplicatedStorage__25.Assets.Effects.EnchantResearchOrb;
		if v42 then
			v44 = l__ReplicatedStorage__25.Assets.Effects.EnchantResearchOrbGlitched;
		end;
		local v45 = v44:Clone();
		v45.Parent = l__Workspace__30;
		if p12.enchantTable then
			v45:SetPrimaryPartCFrame(CFrame.new(p12.enchantTable.OrbAttachment.WorldPosition));
		else
			v45:SetPrimaryPartCFrame(CFrame.new(v39));
		end;
		local v46 = u15.new();
		v46:GiveTask(function()
			v45:Destroy();
		end);
		local l__UpperTorso__47 = p12.entityInstance:FindFirstChild("UpperTorso");
		if l__UpperTorso__47 == nil then
			return nil;
		end;
		local v48 = l__HttpService__31:GenerateGUID(false);
		local u40 = 0;
		local u41 = Vector3.new(math.random(-2, 2), math.random(3, 4), math.random(-2, 2));
		l__RunService__32:BindToRenderStep(v48, Enum.RenderPriority.Last.Value, function(p13)
			if l__UpperTorso__47.Parent == nil then
				return nil;
			end;
			if v45.PrimaryPart == nil then
				return nil;
			end;
			u40 = u40 + p13;
			local v49 = math.clamp(u40 / 1.2, 0, 1);
			local v50 = math.sin(v49 * math.pi);
			v45:SetPrimaryPartCFrame(CFrame.new(v45.PrimaryPart.Position:Lerp(l__UpperTorso__47.Position, math.sqrt(v49)) + u41 * Vector3.new(v50, v50, v50)) * CFrame.Angles(math.pi * 2 * (u40 % 2), math.pi * 2 * (u40 % 3), math.pi * 2 * (u40 % 1.5)));
		end);
		v46:GiveTask(function()
			l__RunService__32:UnbindFromRenderStep(v48);
		end);
		local v51 = p12.entityInstance == l__Players__16.LocalPlayer.Character;
		if v51 then
			l__SoundManager__29:playSound(l__GameSound__27.BEDWARS_PURCHASE_ITEM);
		end;
		task.delay(1.2, function()
			v46:DoCleaning();
			if p12.entityInstance.PrimaryPart then
				local v52 = {};
				if v51 then
					local v53 = nil;
				else
					v53 = p12.entityInstance.PrimaryPart.Position;
				end;
				v52.position = v53;
				l__SoundManager__29:playSound(v40.research, v52);
			end;
		end);
		if p12.entityInstance == l__Players__16.LocalPlayer.Character then
			task.delay(1.2, function()
				if p2.enchantPopupTree then
					u33.unmount(p2.enchantPopupTree);
				end;
				local v54 = {
					Enchant = p12.enchant
				};
				local v55 = p12.enchantTable;
				if v55 ~= nil then
					v55 = v55.Name;
				end;
				v54.EnchantTableType = v55;
				local v56 = p12.enchantTable;
				if v56 ~= nil then
					v56 = v56.Name;
				end;
				v54.ThemeColor = l__EnchantTableUIUtil__34.getThemeColor(v56);
				p2.enchantPopupTree = u33.mount(u33.createElement(l__EnchantPopUp__35, v54), l__Players__16.LocalPlayer:WaitForChild("PlayerGui"));
			end);
		end;
	end);
end;
local l__CollectionService__42 = v3.CollectionService;
function v5.getClosestBrokenEnchantTable(p14, p15)
	local v57 = l__CollectionService__42:GetTagged("broken-enchant-table");
	table.sort(v57, function(p16, p17)
		return (p16.Position - p15).Magnitude < (p17.Position - p15).Magnitude;
	end);
	local v58 = nil;
	local v59, v60, v61 = ipairs(v57);
	while true do
		v59(v60, v61);
		if not v59 then
			break;
		end;
		v61 = v59;
		if true == true then
			v58 = v60;
			break;
		end;	
	end;
	return v58;
end;
function v5.getClosestEnchantTable(p18, p19)
	local v62 = l__CollectionService__42:GetTagged("enchant-table");
	table.sort(v62, function(p20, p21)
		return (p20.Position - p19).Magnitude < (p21.Position - p19).Magnitude;
	end);
	local v63 = nil;
	local v64, v65, v66 = ipairs(v62);
	while true do
		v64(v65, v66);
		if not v64 then
			break;
		end;
		v66 = v64;
		if true == true then
			v63 = v65;
			break;
		end;	
	end;
	return v63;
end;
function v5.researchEnchant(p22, p23)
	local v67 = l__Players__16.LocalPlayer.Character;
	if v67 ~= nil then
		v67 = v67.PrimaryPart;
		if v67 ~= nil then
			v67 = v67.Position;
		end;
	end;
	if not v67 then
		return nil;
	end;
	local v68 = p22:getClosestEnchantTable(v67);
	if not v68 then
		return nil;
	end;
	l__Flamework__12.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(l__BedwarsAppIds__20.ENCHANT_TABLE);
	local v69 = l__default__17.Client:Get("RemoteName"):CallServer({
		researchType = p23, 
		enchantTable = v68
	});
end;
function v5.unmountEnchantPopup(p24)
	if p24.enchantPopupTree then
		u33.unmount(p24.enchantPopupTree);
		p24.enchantPopupTree = nil;
	end;
end;
local v70 = l__KnitClient__28.CreateController(v5.new());
return nil;
