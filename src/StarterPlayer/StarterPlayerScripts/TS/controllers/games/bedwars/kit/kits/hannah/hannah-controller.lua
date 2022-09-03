-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "HannahController";
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
	p1.Name = "HannahController";
end;
local l__ClientSyncEvents__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__Players__2 = v4.Players;
local l__BedwarsKit__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__Flamework__4 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__HannahCombo__5 = v1.import(script, script.Parent, "ui", "hannah-combo").HannahCombo;
local l__default__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__EntityUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__DeviceUtil__10 = v2.DeviceUtil;
local l__BedwarsImageId__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__ClientStore__12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__BalanceFile__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local l__SoundManager__14 = v2.SoundManager;
local l__GameSound__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v6.KnitStart(p2)
	l__KnitController__5.KnitStart(p2);
	l__ClientSyncEvents__1.KitEquip:connect(function(p3)
		if p3.player ~= l__Players__2.LocalPlayer then
			return nil;
		end;
		if p3.kit ~= l__BedwarsKit__3.HANNAH then
			return nil;
		end;
		l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addApp({
			appId = "HannahCombo", 
			app = l__HannahCombo__5
		}, {});
	end);
	l__default__6.Client:Get("RemoteName"):Connect(function(p4)
		if l__Players__2:GetPlayerFromCharacter(p4.entity) == l__Players__2.LocalPlayer then
			return nil;
		end;
		local v8 = l__EntityUtil__7:getLocalPlayerEntity();
		local v9 = l__EntityUtil__7:getEntity(p4.entity);
		if v8 and v9 and not v8:canAttack(v9) then
			return nil;
		end;
		local v10 = u8("ProximityPrompt", {
			ActionText = "Blood For Blood!", 
			ObjectText = "Execute", 
			HoldDuration = 0, 
			KeyboardKeyCode = l__Theme__9.promptKeyboardKey, 
			RequiresLineOfSight = false, 
			MaxActivationDistance = 30, 
			Parent = p4.entity, 
			ClickablePrompt = l__DeviceUtil__10.isMobileControls()
		});
		local u16 = u8("BillboardGui", {
			Name = "Hannah Execution Icon", 
			Parent = p4.entity, 
			Adornee = p4.entity.Head, 
			AlwaysOnTop = true, 
			MaxDistance = 100, 
			Size = UDim2.fromScale(1, 1), 
			StudsOffset = Vector3.new(-1.5, 7, 0), 
			Children = { u8("ImageLabel", {
					Image = l__BedwarsImageId__11.PIRATE_SKULL_ICON, 
					Size = UDim2.fromScale(3, 3), 
					ScaleType = Enum.ScaleType.Fit, 
					BackgroundTransparency = 1
				}) }
		});
		v10.Triggered:Connect(function(p5)
			local v11 = l__default__6.Client:Get("RemoteName"):CallServer({
				user = l__Players__2.LocalPlayer, 
				victimEntity = p4.entity
			});
			v10:Destroy();
			if v11 then
				v10:Destroy();
				u16:Destroy();
			end;
		end);
	end);
	l__default__6.Client:Get("RemoteName"):Connect(function(p6)
		local l__ProximityPrompt__12 = p6.entity:FindFirstChild("ProximityPrompt");
		local l__Hannah_Execution_Icon__13 = p6.entity:FindFirstChild("Hannah Execution Icon");
		if l__Hannah_Execution_Icon__13 then
			l__Hannah_Execution_Icon__13:Destroy();
		end;
		if l__ProximityPrompt__12 and l__ProximityPrompt__12.ObjectText == "Execute" then
			l__ProximityPrompt__12:Destroy();
		end;
	end);
	l__default__6.Client:Get("RemoteName"):Connect(function(p7)
		local l__ProximityPrompt__14 = p7.entityInstance:FindFirstChild("ProximityPrompt");
		local l__Hannah_Execution_Icon__15 = p7.entityInstance:FindFirstChild("Hannah Execution Icon");
		if l__Hannah_Execution_Icon__15 then
			l__Hannah_Execution_Icon__15:Destroy();
		end;
		if l__ProximityPrompt__14 and l__ProximityPrompt__14.ObjectText == "Execute" then
			l__ProximityPrompt__14:Destroy();
		end;
	end);
	local u17 = tick();
	l__default__6.Client:Get("RemoteName"):Connect(function(p8)
		local v16 = p8.player == l__Players__2.LocalPlayer;
		if v16 then
			local v17 = tick();
			u17 = v17;
			l__ClientStore__12:dispatch({
				type = "KitHannahSetCombo", 
				combo = p8.comboSize
			});
			task.delay(l__BalanceFile__13.HANNAH_COMBO_EXPIRATION_SEC, function()
				if u17 == v17 then
					l__ClientStore__12:dispatch({
						type = "KitHannahSetCombo", 
						combo = 0
					});
				end;
			end);
		end;
		local v18 = {};
		if v16 then
			local v19 = nil;
		else
			local v20 = p8.player.Character;
			if v20 ~= nil then
				v20 = v20:GetPrimaryPartCFrame().Position;
			end;
			v19 = v20;
		end;
		v18.position = v19;
		v18.rollOffMaxDistance = 45;
		v18.volumeMultiplier = 0.7;
		l__SoundManager__14:playSound(l__GameSound__15.HANNAH_UNSHEATH_SWORD, v18);
		task.delay(0.3, function()
			local v21 = p8.player.Character;
			if v21 ~= nil then
				v21 = v21:GetPrimaryPartCFrame();
			end;
			if v21 then
				l__SoundManager__14:playSound(l__GameSound__15.HANNAH_EXECUTE, {
					position = v21.Position, 
					rollOffMaxDistance = 45, 
					volumeMultiplier = 0.7
				});
			end;
		end);
		p2:pullOutSword(p8.player, p8.targetPosition);
	end);
end;
local l__GameAnimationUtil__18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__ItemUtil__20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local l__ItemType__21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__KnitClient__22 = v3.KnitClient;
local l__WeldUtil__23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local l__ReplicatedStorage__24 = v4.ReplicatedStorage;
function v6.pullOutSword(p9, p10, p11)
	if not p10.Character then
		return nil;
	end;
	task.delay(0.5, function()
		local v22 = p10.Character;
		if v22 ~= nil then
			v22 = v22:GetPrimaryPartCFrame();
		end;
		if v22 then
			p9:playSlashEffect(v22, p10);
		end;
	end);
	local v23 = l__GameAnimationUtil__18.playAnimation(p10, l__AnimationType__19.HANNAH_ATTACK, {
		looped = false
	});
	if p10 == l__Players__2.LocalPlayer then
		l__KnitClient__22.Controllers.ViewmodelController:setHeldItem((l__ItemUtil__20.createItemInstance(l__ItemType__21.PIRATE_SWORD_FP)));
		l__KnitClient__22.Controllers.ViewmodelController:playAnimation(l__AnimationType__19.FP_HANNAH_ATTACK);
	end;
	local v24 = p10.Character;
	if v24 ~= nil then
		v24 = v24:FindFirstChild("pirate_sword_back");
	end;
	local v25 = l__EntityUtil__7:getEntity(p10);
	if v25 ~= nil then
		v25 = v25:getHandItemInstanceFromCharacter();
		if v25 ~= nil then
			v25 = v25:WaitForChild("Handle", 3);
		end;
	end;
	v25.Transparency = 1;
	if v24 then
		local v26 = p10.Character;
		if v26 ~= nil then
			v26 = v26:WaitForChild("pirate_sword_back"):Clone();
		end;
		local v27, v28, v29 = ipairs(v24:GetChildren());
		while true do
			v27(v28, v29);
			if not v27 then
				break;
			end;
			v29 = v27;
			if v28:IsA("BasePart") then
				v28.Transparency = 1;
			end;		
		end;
		local l__Handle__30 = v26:WaitForChild("Handle");
		local v31 = v26:FindFirstChild("Handle");
		if v31 ~= nil then
			v31 = v31:FindFirstChild("SwordAttachment");
		end;
		local v32 = v31.CFrame * CFrame.Angles(0, 3.141592653589793, 0);
		l__Handle__30:ClearAllChildren();
		u8("Attachment", {
			Name = "RightGripAttachment", 
			Parent = l__Handle__30, 
			CFrame = v32
		});
		local v33.Parent = p10.Character;
		l__WeldUtil__23.weldCharacterAccessories(p10.Character);
	else
		v33 = l__ReplicatedStorage__24.Assets.Effects.PirateSword:Clone();
		v33.Parent = p10.Character;
		l__WeldUtil__23.weldCharacterAccessories(p10.Character);
	end;
	if v23 then
		v23:GetMarkerReachedSignal("start"):Connect(function()
			p9:createTrail(p10, p11);
		end);
		v23:GetMarkerReachedSignal("end"):Connect(function()
			if v33 then
				p9:putSwordBack(p10, v33);
			end;
			if v23 ~= nil then
				v23:Stop();
			end;
			if v23 ~= nil then
				v23:Destroy();
			end;
		end);
	end;
end;
local l__InventoryUtil__25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
function v6.putSwordBack(p12, p13, p14)
	p14:Destroy();
	local v34 = l__EntityUtil__7:getEntity(p13);
	if v34 ~= nil then
		v34 = v34:getHandItemInstanceFromCharacter();
		if v34 ~= nil then
			v34 = v34:WaitForChild("Handle", 3);
		end;
	end;
	v34.Transparency = 0;
	local v35 = p13.Character;
	if v35 ~= nil then
		v35 = v35:WaitForChild("pirate_sword_back");
	end;
	if v35 then
		local v36, v37, v38 = ipairs(v35:GetChildren());
		while true do
			v36(v37, v38);
			if not v36 then
				break;
			end;
			v38 = v36;
			if v37:IsA("BasePart") then
				v37.Transparency = 0;
			end;		
		end;
	end;
	if p13 == l__Players__2.LocalPlayer then
		local v39 = l__InventoryUtil__25.getInventory(p13).hand;
		if v39 ~= nil then
			v39 = v39.itemType;
		end;
		if v39 then
			l__KnitClient__22.Controllers.ViewmodelController:setHeldItem((l__ItemUtil__20.createItemInstance(v39)));
			return;
		end;
	else
		return;
	end;
	return nil;
end;
local l__Workspace__26 = v4.Workspace;
local l__TweenService__27 = v4.TweenService;
function v6.createTrail(p15, p16, p17)
	local v40 = p16.Character;
	if v40 ~= nil then
		v40 = v40:Clone();
	end;
	if not v40 then
		print("CLONE FAILED!");
		return nil;
	end;
	local l__Character__41 = p16.Character;
	if not v40.PrimaryPart then
		return nil;
	end;
	if p16 == l__Players__2.LocalPlayer then
		if v40.Humanoid == nil or not l__Character__41 then
			return nil;
		end;
		l__Workspace__26.CurrentCamera.CameraSubject = v40.Humanoid;
	end;
	local l__Character__42 = p16.Character;
	if l__Character__42 ~= nil then
		l__Character__42:SetAttribute("Transparency", 1);
	end;
	v40:SetPrimaryPartCFrame(CFrame.new(l__Character__41:GetPrimaryPartCFrame().Position, p17));
	v40.Parent = l__Workspace__26;
	v40.Humanoid.Animator:LoadAnimation(u8("Animation", {
		AnimationId = "rbxassetid://10727303147"
	})):Play();
	local v43 = l__TweenService__27:Create(v40.PrimaryPart, TweenInfo.new(0.6), {
		CFrame = CFrame.new(p17)
	});
	v43:Play();
	v43.Completed:Connect(function()
		v40:Destroy();
		local l__Character__44 = p16.Character;
		if l__Character__44 ~= nil then
			l__Character__44:SetAttribute("Transparency", 0);
		end;
		if p16 == l__Players__2.LocalPlayer then
			l__Workspace__26.CurrentCamera.CameraSubject = p16.Character.Humanoid;
		end;
	end);
end;
local l__KnitClient__28 = v3.KnitClient;
local l__BedwarsKitSkin__29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
function v6.playSlashEffect(p18, p19, p20)
	if not p19 or not p20.Character then
		return nil;
	end;
	local v45 = l__ReplicatedStorage__24.Assets.Effects.HannahSwordSwing:Clone();
	local v46 = v45:FindFirstChild("Main");
	if v46 ~= nil then
		v46 = v46:FindFirstChild("Color");
	end;
	if v46 and l__KnitClient__28.Controllers.KitController:getKitSkin(p20.Character) == l__BedwarsKitSkin__29.HANNAH_GHOST then
		v46.Color = Color3.fromRGB(5, 161, 107);
	end;
	v45:SetPrimaryPartCFrame(p19);
	v45.Parent = l__Workspace__26;
	v45:SetPrimaryPartCFrame(p19 * CFrame.new(0, 0, -2));
	task.delay(0.15, function()
		v45:Destroy();
	end);
end;
local v47 = l__KnitClient__28.CreateController(v6.new());
return nil;
