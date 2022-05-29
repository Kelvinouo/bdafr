-- Script Hash: c311dc78eb8d428dbc7319f7396ceabde0ff6c64e8ff6668ac42f2eb00e48a7e8627a52157ae2c596a753c2bc3c5e07a
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "EnchantTableController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = l__KnitController__5;
local l__ExpireList__2 = v2.ExpireList;
function v6.constructor(p1)
	u1.constructor(p1);
	p1.Name = "EnchantTableController";
	p1.upgradeCooldowns = l__ExpireList__2.new(2);
end;
local l__ContentProvider__3 = v4.ContentProvider;
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
local l__Maid__15 = v3.Maid;
local l__Players__16 = v4.Players;
local l__default__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__EffectUtil__18 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
local l__BedwarsAppIds__19 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__AnimationUtil__20 = v2.AnimationUtil;
local l__WatchCharacter__21 = v2.WatchCharacter;
local l__AnimatorAdded__22 = v2.AnimatorAdded;
local l__EntityUtil__23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__ReplicatedStorage__24 = v4.ReplicatedStorage;
local l__WeldUtil__25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local l__SoundManager__26 = v2.SoundManager;
local l__GameSound__27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Workspace__28 = v4.Workspace;
local l__HttpService__29 = v4.HttpService;
local l__RunService__30 = v4.RunService;
local u31 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__EnchantPopUp__32 = v1.import(script, script.Parent, "ui", "enchant-pop-up").EnchantPopUp;
function v6.KnitStart(p2)
	u1.KnitStart(p2);
	task.spawn(function()
		l__ContentProvider__3:PreloadAsync({ u4("Animation", {
				AnimationId = l__GameAnimationUtil__5.getAssetId(l__AnimationType__6.REPAIR_ENCHANT_TABLE)
			}) });
	end);
	l__CollectionTagAdded__7("broken-enchant-table", function(p3)
		local v8 = u4("ProximityPrompt", {
			Parent = p3, 
			ActionText = tostring(l__BedwarsShop__8.RepairEnchantTablePrice) .. " Diamonds", 
			ObjectText = "Repair Enchant Table", 
			KeyboardKeyCode = l__Theme__9.promptKeyboardKey, 
			RequiresLineOfSight = false, 
			MaxActivationDistance = 6, 
			HoldDuration = 3.68, 
			ClickablePrompt = l__DeviceUtil__10.isMobileControls()
		});
		v8.PromptButtonHoldBegan:Connect(function(p4)
			local v9 = l__ClientStore__11:getState().Game.myTeam;
			if v9 ~= nil then
				v9 = v9.id;
			end;
			if p3:GetAttribute("Team") ~= v9 then
				v8:InputHoldEnd();
				l__Flamework__12.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
					message = "You can only repair your team's Enchant Table."
				});
				return nil;
			end;
			if l__InventoryUtil__13.hasEnough(p4, l__ItemType__14.DIAMOND, l__BedwarsShop__8.RepairEnchantTablePrice) then
				local v10 = l__Maid__15.new();
				local u33 = l__GameAnimationUtil__5.playAnimation(l__Players__16.LocalPlayer, l__AnimationType__6.REPAIR_ENCHANT_TABLE);
				v10:GiveTask(function()
					if u33 ~= nil then
						u33:Stop();
					end;
					if u33 ~= nil then
						u33:Destroy();
					end;
				end);
				v8.PromptButtonHoldEnded:Connect(function()
					v10:DoCleaning();
				end);
				return;
			end;
			v8:InputHoldEnd();
			l__Flamework__12.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
				message = "You need " .. tostring(l__BedwarsShop__8.RepairEnchantTablePrice) .. " diamonds to repair the Enchant Table."
			});
			return nil;
		end);
		v8.Triggered:Connect(function(p5)
			local v11 = l__default__17.Client:Get("RemoteName"):CallServer(p3);
		end);
	end);
	l__CollectionTagAdded__7("enchant-table", function(p6)
		task.spawn(function()
			local l__SpawnEffect__12 = p6:WaitForChild("SpawnEffect");
			l__SpawnEffect__12:WaitForChild("Main");
			l__SpawnEffect__12:WaitForChild("Outline");
			l__SpawnEffect__12:WaitForChild("Outline1");
			l__SpawnEffect__12:WaitForChild("Specs");
			l__EffectUtil__18:playEffects(p6.SpawnEffect:GetChildren(), nil);
		end);
		local v13 = u4("ProximityPrompt", {
			Parent = p6, 
			ActionText = "Open", 
			ObjectText = "Enchant Table", 
			KeyboardKeyCode = l__Theme__9.promptKeyboardKey, 
			RequiresLineOfSight = false, 
			MaxActivationDistance = 6, 
			ClickablePrompt = l__DeviceUtil__10.isMobileControls()
		});
		local v14 = l__ClientStore__11:getState().Game.myTeam;
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
			l__Flamework__12.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__19.ENCHANT_TABLE, {});
		end);
		task.spawn(function()
			l__AnimationUtil__20.playAnimation(p6:WaitForChild("Rig"):WaitForChild("AnimationController"):WaitForChild("Animator"), l__GameAnimationUtil__5.getAssetId(l__AnimationType__6.ENCHANT_TABLE_LOOP));
		end);
	end);
	l__WatchCharacter__21(function(p8, p9)
		l__AnimatorAdded__22(p9:WaitForChild("Humanoid"), function(p10)
			p10.AnimationPlayed:Connect(function(p11)
				local v15 = p11.Animation;
				if v15 ~= nil then
					v15 = v15.AnimationId;
				end;
				if v15 == l__GameAnimationUtil__5.getAssetId(l__AnimationType__6.REPAIR_ENCHANT_TABLE) then
					if p2.upgradeCooldowns:has(p8.UserId) and p8.UserId ~= l__Players__16.LocalPlayer.UserId then
						return nil;
					end;
					p2.upgradeCooldowns:add(p8.UserId);
					local v16 = p9.PrimaryPart;
					if v16 ~= nil then
						v16 = v16.Position;
					end;
					if not v16 then
						return nil;
					end;
					local v17 = p2:getClosestBrokenEnchantTable(v16);
					if not v17 then
						return nil;
					end;
					local v18 = l__Maid__15.new();
					local v19 = l__EntityUtil__23:getEntity(p8);
					if v19 ~= nil then
						v19 = v19:getItemInHandClient();
					end;
					if v19 then
						for v20, v21 in ipairs(v19:GetDescendants()) do
							if v21:IsA("BasePart") then
								v21.Transparency = 1;
								local l__Transparency__34 = v21.Transparency;
								v18:GiveTask(function()
									v21.Transparency = l__Transparency__34;
								end);
							end;
						end;
					end;
					local v22 = l__ReplicatedStorage__24.Assets.Effects.RepairEnchantTableHammer:Clone();
					v22.Parent = p9;
					l__WeldUtil__25.weldCharacterAccessories(p9);
					local u35 = p9 == l__Players__16.LocalPlayer.Character;
					p11:GetMarkerReachedSignal("hammer_1"):Connect(function()
						l__EffectUtil__18:playEffects(v17.HammerEffect:GetChildren(), nil);
						local v23 = {};
						if u35 then
							local v24 = nil;
						else
							local v25 = p9.PrimaryPart;
							if v25 ~= nil then
								v25 = v25.Position;
							end;
							v24 = v25;
						end;
						v23.position = v24;
						l__SoundManager__26:playSound(l__GameSound__27.ENCHANT_TABLE_REPAIR_HAMMER_1, v23);
					end);
					p11:GetMarkerReachedSignal("hammer_2"):Connect(function()
						l__EffectUtil__18:playEffects(v17.HammerEffect:GetChildren(), nil);
						local v26 = {};
						if u35 then
							local v27 = nil;
						else
							local v28 = p9.PrimaryPart;
							if v28 ~= nil then
								v28 = v28.Position;
							end;
							v27 = v28;
						end;
						v26.position = v27;
						l__SoundManager__26:playSound(l__GameSound__27.ENCHANT_TABLE_REPAIR_HAMMER_2, v26);
					end);
					p11:GetMarkerReachedSignal("hammer_3"):Connect(function()
						l__EffectUtil__18:playEffects(v17.HammerEffect:GetChildren(), nil);
						local v29 = {};
						if u35 then
							local v30 = nil;
						else
							local v31 = p9.PrimaryPart;
							if v31 ~= nil then
								v31 = v31.Position;
							end;
							v30 = v31;
						end;
						v29.position = v30;
						l__SoundManager__26:playSound(l__GameSound__27.ENCHANT_TABLE_REPAIR_HAMMER_3, v29);
					end);
					p11:GetMarkerReachedSignal("hammer_4"):Connect(function()
						l__EffectUtil__18:playEffects(v17.HammerEffect:GetChildren(), nil);
						local v32 = {};
						if u35 then
							local v33 = nil;
						else
							local v34 = p9.PrimaryPart;
							if v34 ~= nil then
								v34 = v34.Position;
							end;
							v33 = v34;
						end;
						v32.position = v33;
						l__SoundManager__26:playSound(l__GameSound__27.ENCHANT_TABLE_REPAIR_HAMMER_4, v32);
					end);
					p11.Stopped:Connect(function()
						v22:Destroy();
						v18:DoCleaning();
					end);
				end;
			end);
		end);
	end);
	l__default__17.Client:OnEvent("RemoteName", function(p12)
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
		l__SoundManager__26:playSound(l__GameSound__27.ENCHANT_TABLE_RESEARCH_IMPLODE, {
			position = v36, 
			rollOffMaxDistance = 120
		});
		if p12.enchantTable then
			l__EffectUtil__18:playEffects(p12.enchantTable.Implosion:GetChildren(), nil);
		end;
		local v37 = l__ReplicatedStorage__24.Assets.Effects.EnchantResearchOrb:Clone();
		v37.Parent = l__Workspace__28;
		if p12.enchantTable then
			v37:SetPrimaryPartCFrame(CFrame.new(p12.enchantTable.OrbAttachment.WorldPosition));
		else
			v37:SetPrimaryPartCFrame(CFrame.new(v36));
		end;
		local v38 = l__Maid__15.new();
		v38:GiveTask(function()
			v37:Destroy();
		end);
		local l__UpperTorso__39 = p12.entityInstance:FindFirstChild("UpperTorso");
		if l__UpperTorso__39 == nil then
			return nil;
		end;
		local v40 = l__HttpService__29:GenerateGUID(false);
		local u36 = 0;
		local u37 = Vector3.new(math.random(-2, 2), math.random(3, 4), math.random(-2, 2));
		l__RunService__30:BindToRenderStep(v40, Enum.RenderPriority.Last.Value, function(p13)
			if l__UpperTorso__39.Parent == nil then
				return nil;
			end;
			if v37.PrimaryPart == nil then
				return nil;
			end;
			u36 = u36 + p13;
			local v41 = math.clamp(u36 / 1.2, 0, 1);
			local v42 = math.sin(v41 * math.pi);
			v37:SetPrimaryPartCFrame(CFrame.new(v37.PrimaryPart.Position:Lerp(l__UpperTorso__39.Position, math.sqrt(v41)) + u37 * Vector3.new(v42, v42, v42)) * CFrame.Angles(math.pi * 2 * (u36 % 2), math.pi * 2 * (u36 % 3), math.pi * 2 * (u36 % 1.5)));
		end);
		v38:GiveTask(function()
			l__RunService__30:UnbindFromRenderStep(v40);
		end);
		local v43 = p12.entityInstance == l__Players__16.LocalPlayer.Character;
		if v43 then
			l__SoundManager__26:playSound(l__GameSound__27.BEDWARS_PURCHASE_ITEM);
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
				l__SoundManager__26:playSound(l__GameSound__27.ENCHANT_TABLE_RESEARCH_CONSUME, v44);
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
local l__CollectionService__38 = v4.CollectionService;
function v6.getClosestBrokenEnchantTable(p14, p15)
	local v46 = l__CollectionService__38:GetTagged("broken-enchant-table");
	table.sort(v46, function(p16, p17)
		return (p16.Position - p15).Magnitude < (p17.Position - p15).Magnitude;
	end);
	local function v47(p18)
		return true;
	end;
	local v48 = nil;
	for v49, v50 in ipairs(v46) do
		if v47(v50, v49 - 1, v46) == true then
			v48 = v50;
			break;
		end;
	end;
	return v48;
end;
function v6.getClosestEnchantTable(p19, p20)
	local v51 = l__CollectionService__38:GetTagged("enchant-table");
	table.sort(v51, function(p21, p22)
		return (p21.Position - p20).Magnitude < (p22.Position - p20).Magnitude;
	end);
	local function v52(p23)
		return true;
	end;
	local v53 = nil;
	for v54, v55 in ipairs(v51) do
		if v52(v55, v54 - 1, v51) == true then
			v53 = v55;
			break;
		end;
	end;
	return v53;
end;
function v6.researchEnchant(p24, p25)
	local v56 = l__Players__16.LocalPlayer.Character;
	if v56 ~= nil then
		v56 = v56.PrimaryPart;
		if v56 ~= nil then
			v56 = v56.Position;
		end;
	end;
	if not v56 then
		return nil;
	end;
	local v57 = p24:getClosestEnchantTable(v56);
	if not v57 then
		return nil;
	end;
	l__Flamework__12.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(l__BedwarsAppIds__19.ENCHANT_TABLE);
	local v58 = l__default__17.Client:Get("RemoteName"):CallServer({
		researchType = p25, 
		enchantTable = v57
	});
end;
function v6.unmountEnchantPopup(p26)
	if p26.enchantPopupTree then
		u31.unmount(p26.enchantPopupTree);
		p26.enchantPopupTree = nil;
	end;
end;
u1 = v3.KnitClient.CreateController;
u1 = u1(v6.new());
return nil;
