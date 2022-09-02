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
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__2 = v4.Players;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__DeviceUtil__5 = v2.DeviceUtil;
local l__BedwarsImageId__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__SoundManager__7 = v2.SoundManager;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v6.KnitStart(p2)
	l__KnitController__5.KnitStart(p2);
	l__default__1.Client:Get("RemoteName"):Connect(function(p3)
		if l__Players__2:GetPlayerFromCharacter(p3.entity) == l__Players__2.LocalPlayer then
			return nil;
		end;
		local v8 = u3("ProximityPrompt", {
			ActionText = "Blood For Blood!", 
			ObjectText = "Execute", 
			HoldDuration = 0, 
			KeyboardKeyCode = l__Theme__4.promptKeyboardKey, 
			RequiresLineOfSight = false, 
			MaxActivationDistance = 30, 
			Parent = p3.entity, 
			ClickablePrompt = l__DeviceUtil__5.isMobileControls()
		});
		local u9 = u3("BillboardGui", {
			Parent = p3.entity, 
			Adornee = p3.entity.Head, 
			AlwaysOnTop = true, 
			MaxDistance = 100, 
			Size = UDim2.fromScale(1, 1), 
			StudsOffset = Vector3.new(-1.5, 7, 0), 
			Children = { u3("ImageLabel", {
					Image = l__BedwarsImageId__6.PIRATE_SKULL_ICON, 
					Size = UDim2.fromScale(3, 3), 
					ScaleType = Enum.ScaleType.Fit, 
					BackgroundTransparency = 1
				}) }
		});
		v8.Triggered:Connect(function(p4)
			local v9 = l__default__1.Client:Get("RemoteName"):CallServer({
				user = l__Players__2.LocalPlayer, 
				victimEntity = p3.entity
			});
			v8:Destroy();
			if v9 then
				v8:Destroy();
				u9:Destroy();
			end;
		end);
	end);
	l__default__1.Client:Get("RemoteName"):Connect(function(p5)
		local l__ProximityPrompt__10 = p5.entity:FindFirstChild("ProximityPrompt");
		local l__BillboardGui__11 = p5.entity:FindFirstChild("BillboardGui");
		if l__BillboardGui__11 then
			l__BillboardGui__11:Destroy();
		end;
		if l__ProximityPrompt__10 and l__ProximityPrompt__10.ObjectText == "Execute" then
			l__ProximityPrompt__10:Destroy();
		end;
	end);
	l__default__1.Client:Get("RemoteName"):Connect(function(p6)
		local l__ProximityPrompt__12 = p6.entityInstance:FindFirstChild("ProximityPrompt");
		local l__BillboardGui__13 = p6.entityInstance:FindFirstChild("BillboardGui");
		if l__BillboardGui__13 then
			l__BillboardGui__13:Destroy();
		end;
		if l__ProximityPrompt__12 and l__ProximityPrompt__12.ObjectText == "Execute" then
			l__ProximityPrompt__12:Destroy();
		end;
	end);
	l__default__1.Client:Get("RemoteName"):Connect(function(p7)
		local v14 = {};
		local v15 = p7.player.Character;
		if v15 ~= nil then
			v15 = v15:GetPrimaryPartCFrame().Position;
		end;
		v14.position = v15;
		v14.rollOffMaxDistance = 45;
		v14.volumeMultiplier = 0.7;
		l__SoundManager__7:playSound(l__GameSound__8.HANNAH_UNSHEATH_SWORD, v14);
		task.delay(0.3, function()
			local v16 = p7.player.Character;
			if v16 ~= nil then
				v16 = v16:GetPrimaryPartCFrame();
			end;
			if v16 then
				l__SoundManager__7:playSound(l__GameSound__8.HANNAH_EXECUTE, {
					position = v16.Position, 
					rollOffMaxDistance = 45, 
					volumeMultiplier = 0.7
				});
			end;
		end);
		p2:pullOutSword(p7.player, p7.targetPosition);
	end);
end;
local l__GameAnimationUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__ItemUtil__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local l__ItemType__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__KnitClient__14 = v3.KnitClient;
local l__EntityUtil__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__WeldUtil__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local l__ReplicatedStorage__17 = v4.ReplicatedStorage;
function v6.pullOutSword(p8, p9, p10)
	if not p9.Character then
		return nil;
	end;
	task.delay(0.5, function()
		local v17 = p9.Character;
		if v17 ~= nil then
			v17 = v17:GetPrimaryPartCFrame();
		end;
		if v17 then
			p8:playSlashEffect(v17, p9);
		end;
	end);
	local v18 = l__GameAnimationUtil__10.playAnimation(p9, l__AnimationType__11.HANNAH_ATTACK, {
		looped = false
	});
	if p9 == l__Players__2.LocalPlayer then
		l__KnitClient__14.Controllers.ViewmodelController:setHeldItem((l__ItemUtil__12.createItemInstance(l__ItemType__13.PIRATE_SWORD_FP)));
		l__KnitClient__14.Controllers.ViewmodelController:playAnimation(l__AnimationType__11.FP_HANNAH_ATTACK);
	end;
	local v19 = p9.Character;
	if v19 ~= nil then
		v19 = v19:FindFirstChild("pirate_sword_back");
	end;
	local v20 = l__EntityUtil__15:getEntity(p9);
	if v20 ~= nil then
		v20 = v20:getHandItemInstanceFromCharacter();
		if v20 ~= nil then
			v20 = v20:WaitForChild("Handle", 3);
		end;
	end;
	v20.Transparency = 1;
	if v19 then
		local v21 = p9.Character;
		if v21 ~= nil then
			v21 = v21:WaitForChild("pirate_sword_back"):Clone();
		end;
		local v22, v23, v24 = ipairs(v19:GetChildren());
		while true do
			v22(v23, v24);
			if not v22 then
				break;
			end;
			v24 = v22;
			if v23:IsA("BasePart") then
				v23.Transparency = 1;
			end;		
		end;
		local l__Handle__25 = v21:WaitForChild("Handle");
		local v26 = v21:FindFirstChild("Handle");
		if v26 ~= nil then
			v26 = v26:FindFirstChild("SwordAttachment");
		end;
		local v27 = v26.CFrame * CFrame.Angles(0, 3.141592653589793, 0);
		l__Handle__25:ClearAllChildren();
		u3("Attachment", {
			Name = "RightGripAttachment", 
			Parent = l__Handle__25, 
			CFrame = v27
		});
		local v28.Parent = p9.Character;
		l__WeldUtil__16.weldCharacterAccessories(p9.Character);
	else
		v28 = l__ReplicatedStorage__17.Assets.Effects.PirateSword:Clone();
		v28.Parent = p9.Character;
		l__WeldUtil__16.weldCharacterAccessories(p9.Character);
	end;
	if v18 then
		v18:GetMarkerReachedSignal("start"):Connect(function()
			p8:createTrail(p9, p10);
		end);
		v18:GetMarkerReachedSignal("end"):Connect(function()
			if v28 then
				p8:putSwordBack(p9, v28);
			end;
			if v18 ~= nil then
				v18:Stop();
			end;
			if v18 ~= nil then
				v18:Destroy();
			end;
		end);
	end;
end;
local l__InventoryUtil__18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
function v6.putSwordBack(p11, p12, p13)
	p13:Destroy();
	local v29 = l__EntityUtil__15:getEntity(p12);
	if v29 ~= nil then
		v29 = v29:getHandItemInstanceFromCharacter();
		if v29 ~= nil then
			v29 = v29:WaitForChild("Handle", 3);
		end;
	end;
	v29.Transparency = 0;
	local v30 = p12.Character;
	if v30 ~= nil then
		v30 = v30:WaitForChild("pirate_sword_back");
	end;
	if v30 then
		local v31, v32, v33 = ipairs(v30:GetChildren());
		while true do
			v31(v32, v33);
			if not v31 then
				break;
			end;
			v33 = v31;
			if v32:IsA("BasePart") then
				v32.Transparency = 0;
			end;		
		end;
	end;
	if p12 == l__Players__2.LocalPlayer then
		local v34 = l__InventoryUtil__18.getInventory(p12).hand;
		if v34 ~= nil then
			v34 = v34.itemType;
		end;
		if v34 then
			l__KnitClient__14.Controllers.ViewmodelController:setHeldItem((l__ItemUtil__12.createItemInstance(v34)));
			return;
		end;
	else
		return;
	end;
	return nil;
end;
local l__Workspace__19 = v4.Workspace;
local l__TweenService__20 = v4.TweenService;
function v6.createTrail(p14, p15, p16)
	local v35 = p15.Character;
	if v35 ~= nil then
		v35 = v35:Clone();
	end;
	if not v35 then
		print("CLONE FAILED!");
		return nil;
	end;
	local l__Character__36 = p15.Character;
	if not v35.PrimaryPart then
		return nil;
	end;
	if p15 == l__Players__2.LocalPlayer then
		if v35.Humanoid == nil or not l__Character__36 then
			return nil;
		end;
		l__Workspace__19.CurrentCamera.CameraSubject = v35.Humanoid;
	end;
	local l__Character__37 = p15.Character;
	if l__Character__37 ~= nil then
		l__Character__37:SetAttribute("Transparency", 1);
	end;
	v35:SetPrimaryPartCFrame(CFrame.new(l__Character__36:GetPrimaryPartCFrame().Position, p16));
	v35.Parent = l__Workspace__19;
	v35.Humanoid.Animator:LoadAnimation(u3("Animation", {
		AnimationId = "rbxassetid://10727303147"
	})):Play();
	local v38 = l__TweenService__20:Create(v35.PrimaryPart, TweenInfo.new(0.6), {
		CFrame = CFrame.new(p16)
	});
	v38:Play();
	v38.Completed:Connect(function()
		v35:Destroy();
		local l__Character__39 = p15.Character;
		if l__Character__39 ~= nil then
			l__Character__39:SetAttribute("Transparency", 0);
		end;
		if p15 == l__Players__2.LocalPlayer then
			l__Workspace__19.CurrentCamera.CameraSubject = p15.Character.Humanoid;
		end;
	end);
end;
local l__KnitClient__21 = v3.KnitClient;
local l__BedwarsKitSkin__22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
function v6.playSlashEffect(p17, p18, p19)
	if not p18 or not p19.Character then
		return nil;
	end;
	local v40 = l__ReplicatedStorage__17.Assets.Effects.HannahSwordSwing:Clone();
	local v41 = v40:FindFirstChild("Main");
	if v41 ~= nil then
		v41 = v41:FindFirstChild("Color");
	end;
	if v41 and l__KnitClient__21.Controllers.KitController:getKitSkin(p19.Character) == l__BedwarsKitSkin__22.HANNAH_GHOST then
		v41.Color = Color3.fromRGB(5, 161, 107);
	end;
	v40:SetPrimaryPartCFrame(p18);
	v40.Parent = l__Workspace__19;
	v40:SetPrimaryPartCFrame(p18 * CFrame.new(0, 0, -2));
	task.delay(0.15, function()
		v40:Destroy();
	end);
end;
local v42 = l__KnitClient__21.CreateController(v6.new());
return nil;
