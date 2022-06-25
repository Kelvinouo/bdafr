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
local u1 = l__KnitController__4;
local l__ExpireList__2 = v2.ExpireList;
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "EnchantTableController";
	p1.upgradeCooldowns = l__ExpireList__2.new(2);
end;
local l__ContentProvider__3 = v3.ContentProvider;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__GameAnimationUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__CollectionTagAdded__7 = v2.CollectionTagAdded;
local l__BedwarsShop__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
local l__Theme__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__DeviceUtil__10 = v2.DeviceUtil;
local l__ClientStore__11 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__Flamework__12 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__InventoryUtil__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__ItemType__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local u15 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__Players__16 = v3.Players;
local l__default__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__EffectUtil__18 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
local l__BedwarsAppIds__19 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__AnimationUtil__20 = v2.AnimationUtil;
local l__WatchCharacter__21 = v2.WatchCharacter;
local l__AnimatorAdded__22 = v2.AnimatorAdded;
local l__EntityUtil__23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__ReplicatedStorage__24 = v3.ReplicatedStorage;
local l__WeldUtil__25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local l__SoundManager__26 = v2.SoundManager;
local l__GameSound__27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Workspace__28 = v3.Workspace;
local l__HttpService__29 = v3.HttpService;
local l__RunService__30 = v3.RunService;
local u31 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__EnchantPopUp__32 = v1.import(script, script.Parent, "ui", "enchant-pop-up").EnchantPopUp;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	task.spawn(function()
		l__ContentProvider__3:PreloadAsync({ u4("Animation", {
				AnimationId = l__GameAnimationUtil__5.getAssetId(l__AnimationType__6.REPAIR_ENCHANT_TABLE)
			}) });
	end);
	l__CollectionTagAdded__7("broken-enchant-table", function(p3)
		local v7 = u4("ProximityPrompt", {
			Parent = p3, 
			ActionText = tostring(l__BedwarsShop__8.RepairEnchantTablePrice) .. " Diamonds", 
			ObjectText = "Repair Enchant Table", 
			KeyboardKeyCode = l__Theme__9.promptKeyboardKey, 
			RequiresLineOfSight = false, 
			MaxActivationDistance = 6, 
			HoldDuration = 3.68, 
			ClickablePrompt = l__DeviceUtil__10.isMobileControls()
		});
		v7.PromptButtonHoldBegan:Connect(function(p4)
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
			if l__InventoryUtil__13.hasEnough(p4, l__ItemType__14.DIAMOND, l__BedwarsShop__8.RepairEnchantTablePrice) then
				local v9 = u15.new();
				local u33 = l__GameAnimationUtil__5.playAnimation(l__Players__16.LocalPlayer, l__AnimationType__6.REPAIR_ENCHANT_TABLE);
				v9:GiveTask(function()
					if u33 ~= nil then
						u33:Stop();
					end;
					if u33 ~= nil then
						u33:Destroy();
					end;
				end);
				v7.PromptButtonHoldEnded:Connect(function()
					v9:DoCleaning();
				end);
				return;
			end;
			v7:InputHoldEnd();
			l__Flamework__12.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
				message = "You need " .. tostring(l__BedwarsShop__8.RepairEnchantTablePrice) .. " diamonds to repair the Enchant Table."
			});
			return nil;
		end);
		v7.Triggered:Connect(function(p5)
			local v10 = l__default__17.Client:Get("RemoteName"):CallServer(p3);
		end);
	end);
	l__CollectionTagAdded__7("enchant-table", function(p6)
		task.spawn(function()
			local l__SpawnEffect__11 = p6:WaitForChild("SpawnEffect");
			l__SpawnEffect__11:WaitForChild("Main");
			l__SpawnEffect__11:WaitForChild("Outline");
			l__SpawnEffect__11:WaitForChild("Outline1");
			l__SpawnEffect__11:WaitForChild("Specs");
			l__EffectUtil__18:playEffects(p6.SpawnEffect:GetChildren(), nil);
		end);
		local v12 = u4("ProximityPrompt", {
			Parent = p6, 
			ActionText = "Open", 
			ObjectText = "Enchant Table", 
			KeyboardKeyCode = l__Theme__9.promptKeyboardKey, 
			RequiresLineOfSight = false, 
			MaxActivationDistance = 6, 
			ClickablePrompt = l__DeviceUtil__10.isMobileControls()
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
			l__Flamework__12.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__19.ENCHANT_TABLE, {});
		end);
		task.spawn(function()
			l__AnimationUtil__20.playAnimation(p6:WaitForChild("Rig"):WaitForChild("AnimationController"):WaitForChild("Animator"), l__GameAnimationUtil__5.getAssetId(l__AnimationType__6.ENCHANT_TABLE_LOOP));
		end);
	end);
	l__WatchCharacter__21(function(p8, p9)
		l__AnimatorAdded__22(p9:WaitForChild("Humanoid"), function(p10)
			p10.AnimationPlayed:Connect(function(p11)
				local v14 = p11.Animation;
				if v14 ~= nil then
					v14 = v14.AnimationId;
				end;
				if v14 == l__GameAnimationUtil__5.getAssetId(l__AnimationType__6.REPAIR_ENCHANT_TABLE) then
					if p2.upgradeCooldowns:has(p8.UserId) and p8.UserId ~= l__Players__16.LocalPlayer.UserId then
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
					local v17 = u15.new();
					local v18 = l__EntityUtil__23:getEntity(p8);
					if v18 ~= nil then
						v18 = v18:getItemInHandClient();
					end;
					if v18 then
						for v19, v20 in ipairs(v18:GetDescendants()) do
							if v20:IsA("BasePart") then
								v20.Transparency = 1;
								local l__Transparency__34 = v20.Transparency;
								v17:GiveTask(function()
									v20.Transparency = l__Transparency__34;
								end);
							end;
						end;
					end;
					local v21 = l__ReplicatedStorage__24.Assets.Effects.RepairEnchantTableHammer:Clone();
					v21.Parent = p9;
					l__WeldUtil__25.weldCharacterAccessories(p9);
					local u35 = p9 == l__Players__16.LocalPlayer.Character;
					p11:GetMarkerReachedSignal("hammer_1"):Connect(function()
						l__EffectUtil__18:playEffects(v16.HammerEffect:GetChildren(), nil);
						local v22 = {};
						if u35 then
							local v23 = nil;
						else
							local v24 = p9.PrimaryPart;
							if v24 ~= nil then
								v24 = v24.Position;
							end;
							v23 = v24;
						end;
						v22.position = v23;
						l__SoundManager__26:playSound(l__GameSound__27.ENCHANT_TABLE_REPAIR_HAMMER_1, v22);
					end);
					p11:GetMarkerReachedSignal("hammer_2"):Connect(function()
						l__EffectUtil__18:playEffects(v16.HammerEffect:GetChildren(), nil);
						local v25 = {};
						if u35 then
							local v26 = nil;
						else
							local v27 = p9.PrimaryPart;
							if v27 ~= nil then
								v27 = v27.Position;
							end;
							v26 = v27;
						end;
						v25.position = v26;
						l__SoundManager__26:playSound(l__GameSound__27.ENCHANT_TABLE_REPAIR_HAMMER_2, v25);
					end);
					p11:GetMarkerReachedSignal("hammer_3"):Connect(function()
						l__EffectUtil__18:playEffects(v16.HammerEffect:GetChildren(), nil);
						local v28 = {};
						if u35 then
							local v29 = nil;
						else
							local v30 = p9.PrimaryPart;
							if v30 ~= nil then
								v30 = v30.Position;
							end;
							v29 = v30;
						end;
						v28.position = v29;
						l__SoundManager__26:playSound(l__GameSound__27.ENCHANT_TABLE_REPAIR_HAMMER_3, v28);
					end);
					p11:GetMarkerReachedSignal("hammer_4"):Connect(function()
						l__EffectUtil__18:playEffects(v16.HammerEffect:GetChildren(), nil);
						local v31 = {};
						if u35 then
							local v32 = nil;
						else
							local v33 = p9.PrimaryPart;
							if v33 ~= nil then
								v33 = v33.Position;
							end;
							v32 = v33;
						end;
						v31.position = v32;
						l__SoundManager__26:playSound(l__GameSound__27.ENCHANT_TABLE_REPAIR_HAMMER_4, v31);
					end);
					p11.Stopped:Connect(function()
						v21:Destroy();
						v17:DoCleaning();
					end);
				end;
			end);
		end);
	end);
	l__default__17.Client:OnEvent("RemoteName", function(p12)
		local v34 = p12.entityInstance.PrimaryPart;
		if v34 ~= nil then
			v34 = v34.Position;
		end;
		local v35 = v34;
		if p12.enchantTable then
			v35 = p12.enchantTable.Position;
		end;
		if p12.orbOriginPosition then
			v35 = p12.orbOriginPosition;
		end;
		if not v35 then
			return nil;
		end;
		l__SoundManager__26:playSound(l__GameSound__27.ENCHANT_TABLE_RESEARCH_IMPLODE, {
			position = v35, 
			rollOffMaxDistance = 120
		});
		if p12.enchantTable then
			l__EffectUtil__18:playEffects(p12.enchantTable.Implosion:GetChildren(), nil);
		end;
		local v36 = l__ReplicatedStorage__24.Assets.Effects.EnchantResearchOrb:Clone();
		v36.Parent = l__Workspace__28;
		if p12.enchantTable then
			v36:SetPrimaryPartCFrame(CFrame.new(p12.enchantTable.OrbAttachment.WorldPosition));
		else
			v36:SetPrimaryPartCFrame(CFrame.new(v35));
		end;
		local v37 = u15.new();
		v37:GiveTask(function()
			v36:Destroy();
		end);
		local l__UpperTorso__38 = p12.entityInstance:FindFirstChild("UpperTorso");
		if l__UpperTorso__38 == nil then
			return nil;
		end;
		local v39 = l__HttpService__29:GenerateGUID(false);
		local u36 = 0;
		local u37 = Vector3.new(math.random(-2, 2), math.random(3, 4), math.random(-2, 2));
		l__RunService__30:BindToRenderStep(v39, Enum.RenderPriority.Last.Value, function(p13)
			if l__UpperTorso__38.Parent == nil then
				return nil;
			end;
			if v36.PrimaryPart == nil then
				return nil;
			end;
			u36 = u36 + p13;
			local v40 = math.clamp(u36 / 1.2, 0, 1);
			local v41 = math.sin(v40 * math.pi);
			v36:SetPrimaryPartCFrame(CFrame.new(v36.PrimaryPart.Position:Lerp(l__UpperTorso__38.Position, math.sqrt(v40)) + u37 * Vector3.new(v41, v41, v41)) * CFrame.Angles(math.pi * 2 * (u36 % 2), math.pi * 2 * (u36 % 3), math.pi * 2 * (u36 % 1.5)));
		end);
		v37:GiveTask(function()
			l__RunService__30:UnbindFromRenderStep(v39);
		end);
		local v42 = p12.entityInstance == l__Players__16.LocalPlayer.Character;
		if v42 then
			l__SoundManager__26:playSound(l__GameSound__27.BEDWARS_PURCHASE_ITEM);
		end;
		task.delay(1.2, function()
			v37:DoCleaning();
			if p12.entityInstance.PrimaryPart then
				local v43 = {};
				if v42 then
					local v44 = nil;
				else
					v44 = p12.entityInstance.PrimaryPart.Position;
				end;
				v43.position = v44;
				l__SoundManager__26:playSound(l__GameSound__27.ENCHANT_TABLE_RESEARCH_CONSUME, v43);
			end;
		end);
		if p12.entityInstance == l__Players__16.LocalPlayer.Character then
			task.delay(1.2, function()
				if p2.enchantPopupTree then
					u31.unmount(p2.enchantPopupTree);
				end;
				p2.enchantPopupTree = u31.mount(u31.createElement(l__EnchantPopUp__32, {
					Enchant = p12.enchant
				}), l__Players__16.LocalPlayer:WaitForChild("PlayerGui"));
			end);
		end;
	end);
end;
local l__CollectionService__38 = v3.CollectionService;
function v5.getClosestBrokenEnchantTable(p14, p15)
	local v45 = l__CollectionService__38:GetTagged("broken-enchant-table");
	table.sort(v45, function(p16, p17)
		return (p16.Position - p15).Magnitude < (p17.Position - p15).Magnitude;
	end);
	local function v46(p18)
		return true;
	end;
	local v47 = nil;
	for v48, v49 in ipairs(v45) do
		if v46(v49, v48 - 1, v45) == true then
			v47 = v49;
			break;
		end;
	end;
	return v47;
end;
function v5.getClosestEnchantTable(p19, p20)
	local v50 = l__CollectionService__38:GetTagged("enchant-table");
	table.sort(v50, function(p21, p22)
		return (p21.Position - p20).Magnitude < (p22.Position - p20).Magnitude;
	end);
	local function v51(p23)
		return true;
	end;
	local v52 = nil;
	for v53, v54 in ipairs(v50) do
		if v51(v54, v53 - 1, v50) == true then
			v52 = v54;
			break;
		end;
	end;
	return v52;
end;
function v5.researchEnchant(p24, p25)
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
	local v56 = p24:getClosestEnchantTable(v55);
	if not v56 then
		return nil;
	end;
	l__Flamework__12.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(l__BedwarsAppIds__19.ENCHANT_TABLE);
	local v57 = l__default__17.Client:Get("RemoteName"):CallServer({
		researchType = p25, 
		enchantTable = v56
	});
end;
function v5.unmountEnchantPopup(p26)
	if p26.enchantPopupTree then
		u31.unmount(p26.enchantPopupTree);
		p26.enchantPopupTree = nil;
	end;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
