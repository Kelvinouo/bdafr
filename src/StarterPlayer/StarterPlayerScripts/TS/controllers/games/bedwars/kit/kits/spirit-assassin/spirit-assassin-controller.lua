-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "SpiritAssassinController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v6.constructor(p1)
	l__KnitController__5.constructor(p1);
	p1.Name = "SpiritAssassinController";
	p1.speedMaid = u1.new();
	p1.spiritMap = {};
end;
local l__KnitClient__2 = v3.KnitClient;
local l__ItemType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__AnimationType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__default__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__6 = v4.Players;
function v6.KnitStart(p2)
	l__KnitController__5.KnitStart(p2);
	l__KnitClient__2.Controllers.PreloadController:preloadForItemType(l__ItemType__3.SPIRIT_DAGGER, {
		animations = { l__AnimationType__4.DAGGER_CHARGE }
	});
	l__default__5.Client:OnEvent("RemoteName", function(p3)
		if p3.assassin == l__Players__6.LocalPlayer then
			p2:cooldownIndicator(p3.soulOfPlayer);
		end;
		p2:spawnSpirit(p3.position, p3.secret, p3.assassin);
	end);
	l__default__5.Client:Get("RemoteName"):Connect(function(p4)
		if p4.multiplier == 1 then
			p2.speedMaid:DoCleaning();
		end;
	end);
	l__default__5.Client:Get("RemoteName"):Connect(function(p5)
		local v8 = math.abs(p5.player.UserId);
		p2:playChargeAnimation(l__AnimationType__4.DAGGER_CHARGE, p5.player);
		if p5.player == l__Players__6.LocalPlayer then
			l__KnitClient__2.Controllers.ViewmodelController:playAnimation(l__AnimationType__4.FP_DAGGER_CHARGE);
		end;
		local v9 = p2.spiritMap[v8];
		p2.spiritMap[v8] = nil;
		if v9 ~= nil then
			v9:Destroy();
		end;
	end);
	l__default__5.Client:Get("RemoteName"):Connect(function(p6)
		local v10 = p6.player.Character;
		if v10 ~= nil then
			v10 = v10:GetPrimaryPartCFrame().Position;
		end;
		if v10 then
			p2:createTrail(p6.originalPosition, v10);
		end;
		p2:playSlashAnimation(p6.player);
		if p6.player == l__Players__6.LocalPlayer then
			l__KnitClient__2.Controllers.ViewmodelController:playAnimation(l__AnimationType__4.FP_DAGGER_SLASH);
		end;
	end);
end;
local l__SoundManager__7 = v2.SoundManager;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__AnimationUtil__9 = v2.AnimationUtil;
local l__GameAnimationUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__InventoryUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__ItemUtil__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local l__EntityUtil__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__KnitClient__14 = v3.KnitClient;
local l__WeldUtil__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
function v6.playChargeAnimation(p7, p8, p9)
	local v11 = {};
	local v12 = p9.Character;
	if v12 ~= nil then
		v12 = v12:GetPrimaryPartCFrame().Position;
	end;
	v11.position = v12;
	v11.rollOffMaxDistance = 45;
	v11.volumeMultiplier = 0.5;
	l__SoundManager__7:playSound(l__GameSound__8.SPIRIT_DAGGER_CHARGE, v11);
	local v13 = l__AnimationUtil__9.playAnimation(p9, l__GameAnimationUtil__10.getAssetId(p8));
	local v14 = l__InventoryUtil__11.getInventory(p9).hand;
	if v14 ~= nil then
		v14 = v14.itemType;
	end;
	local v15 = l__ItemUtil__12.createItemInstance(l__ItemType__3.SPIRIT_DAGGER);
	local v16 = l__ItemUtil__12.createItemInstance(l__ItemType__3.SPIRIT_DAGGER_LEFT);
	local v17 = l__ItemUtil__12.createItemInstance(l__ItemType__3.SPIRIT_DAGGER);
	local v18 = l__EntityUtil__13:getEntity(p9);
	if v18 ~= nil then
		local v19 = v18:getHandItemInstanceFromCharacter();
		if v19 ~= nil then
			v19:Destroy();
		end;
	end;
	if p9 == l__Players__6.LocalPlayer then
		l__KnitClient__14.Controllers.ViewmodelController:setHeldItem(v17);
	end;
	if v18 ~= nil then
		local v20 = v18:getHumanoid();
		if v20 ~= nil then
			v20:AddAccessory(v16);
		end;
	end;
	if v18 ~= nil then
		local v21 = v18:getHumanoid();
		if v21 ~= nil then
			v21:AddAccessory(v15);
		end;
	end;
	v15.Destroying:Connect(function()
		v16:Destroy();
	end);
	v16.Destroying:Connect(function()
		v15:Destroy();
	end);
	l__WeldUtil__15:weldCharacterAccessories(p9.Character);
	if v13 ~= nil then
		v13:AdjustSpeed(0.8);
	end;
	task.delay(1.5, function()
		local v22 = v18;
		if v22 ~= nil then
			v22 = v22:getHandItemInstanceFromCharacter();
			if v22 ~= nil then
				v22 = v22.Name;
			end;
		end;
		local v23 = v22 == nil and v14;
		if v23 then
			v15:Destroy();
			v16:Destroy();
			local v24 = l__ItemUtil__12.createItemInstance(v14);
			local v25 = l__ItemUtil__12.createItemInstance(v14);
			if p9 == l__Players__6.LocalPlayer then
				l__KnitClient__14.Controllers.ViewmodelController:setHeldItem(v25);
			end;
			if v18 ~= nil then
				local v26 = v18:getHumanoid();
				if v26 ~= nil then
					v26:AddAccessory(v24);
				end;
			end;
			l__WeldUtil__15:weldCharacterAccessories(p9.Character);
		end;
	end);
end;
local l__ReplicatedStorage__16 = v4.ReplicatedStorage;
local l__scaleModel__17 = v1.import(script, v1.getModule(script, "@rbxts", "scale-model").out).scaleModel;
local l__Workspace__18 = v4.Workspace;
local l__GameQueryUtil__19 = v2.GameQueryUtil;
local l__ModelUtil__20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local l__InOutExpo__21 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).InOutExpo;
function v6.playSlashAnimation(p10, p11)
	local v27 = l__AnimationUtil__9.playAnimation(p11, l__GameAnimationUtil__10.getAssetId(l__AnimationType__4.DAGGER_SLASH));
	if v27 ~= nil then
		v27:AdjustSpeed(0.8);
	end;
	local v28 = l__EntityUtil__13:getEntity(p11);
	if not v28 then
		return nil;
	end;
	local v29 = l__ReplicatedStorage__16.Assets.Effects.DaggerSpin:Clone();
	v29:SetPrimaryPartCFrame(v28:getInstance():GetPrimaryPartCFrame());
	l__scaleModel__17(v29, 0.04);
	v29.Parent = l__Workspace__18;
	local v30, v31, v32 = ipairs(v29:GetChildren());
	while true do
		v30(v31, v32);
		if not v30 then
			break;
		end;
		v32 = v30;
		if v31:IsA("BasePart") then
			l__GameQueryUtil__19:setQueryIgnored(v31, true);
		end;	
	end;
	l__ModelUtil__20.tweenModelSize(v29, 0, l__InOutExpo__21, 10);
	local v33 = {};
	local v34 = p11.Character;
	if v34 ~= nil then
		v34 = v34:GetPrimaryPartCFrame().Position;
	end;
	v33.position = v34;
	v33.rollOffMaxDistance = 45;
	v33.volumeMultiplier = 0.5;
	l__SoundManager__7:playSound(l__GameSound__8.SPIRIT_DAGGER_SLASH, v33);
	task.delay(0.3, function()
		v29:Destroy();
	end);
end;
local u22 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__DeviceUtil__24 = v2.DeviceUtil;
function v6.spawnSpirit(p12, p13, p14, p15)
	if p15 ~= l__Players__6.LocalPlayer then
		return nil;
	end;
	local v35 = l__ReplicatedStorage__16:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild("SpiritOrb"):Clone();
	local v36 = v35:WaitForChild("bigball", 3);
	if v36 ~= nil then
		v36 = v36:WaitForChild("inside", 3);
	end;
	v35:SetPrimaryPartCFrame(CFrame.new(p13));
	v35.Parent = l__Workspace__18;
	if p14 == "" then
		p12.spiritMap[math.abs(p15.UserId)] = v35;
		v1.Promise.delay(10):andThen(function()
			if v35.Parent then
				v35:Destroy();
			end;
		end);
		return nil;
	end;
	v35:SetAttribute("SpiritSecret", p14);
	local v37 = u22("ProximityPrompt", {
		ActionText = "Player's Soul", 
		ObjectText = "Teleport", 
		HoldDuration = 0, 
		KeyboardKeyCode = l__Theme__23.promptKeyboardKey, 
		RequiresLineOfSight = false, 
		MaxActivationDistance = 120, 
		Parent = v35, 
		ClickablePrompt = l__DeviceUtil__24.isMobileControls()
	});
	v37.Triggered:Connect(function(p16)
		if p16 == l__Players__6.LocalPlayer then
			local v38 = l__EntityUtil__13:getEntity(p16);
			if v38 ~= nil then
				v38 = v38:isAlive();
			end;
			if not v38 then
				return nil;
			end;
			if p12:useSpirit(p16, v35) then
				v37:Destroy();
			end;
		end;
	end);
	v1.Promise.delay(10):andThen(function()
		if v35.Parent then
			v35:Destroy();
		end;
	end);
end;
function v6.useSpirit(p17, p18, p19)
	local v39 = l__default__5.Client:Get("RemoteName"):CallServer({
		secret = p19:GetAttribute("SpiritSecret")
	});
	if v39 then
		p17.speedMaid:GiveTask(l__KnitClient__2.Controllers.SprintController:getMovementStatusModifier():addModifier({
			constantSpeedMultiplier = 1.5
		}));
		task.delay(6, function()
			if p18:GetAttribute("SpeedBoostExpireTime") < time() then
				p17.speedMaid:DoCleaning();
			end;
		end);
	end;
	task.delay(0.7, function()
		p19:Destroy();
	end);
	return v39;
end;
local l__RunService__25 = v4.RunService;
function v6.cooldownIndicator(p20, p21)
	p21:SetAttribute("SpiritCooldown", true);
	local v40 = l__ReplicatedStorage__16.Assets.Effects.SpiritDagger:Clone();
	v40.Parent = l__Workspace__18;
	l__GameQueryUtil__19:setQueryIgnored(v40, true);
	task.delay(30, function()
		v40:Destroy();
		p21:SetAttribute("SpiritCooldown", false);
	end);
	local u26 = 0;
	l__RunService__25.Heartbeat:Connect(function(p22)
		u26 = u26 + p22;
		local v41 = v40.PrimaryPart;
		if v41 then
			local v42 = p21;
			if v42 ~= nil then
				v42 = v42.Character;
			end;
			v41 = v42;
		end;
		if not v41 then
			v40:Destroy();
			return nil;
		end;
		v40:SetPrimaryPartCFrame(CFrame.new(p21.Character:GetPrimaryPartCFrame().Position + Vector3.new(0, 7, 0)) * CFrame.Angles(math.pi, u26 * math.pi / 2, 0));
	end);
	p21:GetAttributeChangedSignal("SpiritCooldown"):Connect(function()
		local v43 = p21:GetAttribute("SpiritCooldown");
		if v43 == 0 or v43 ~= v43 or v43 == "" or not v43 then
			v40:Destroy();
		end;
	end);
end;
local u27 = v1.import(script, v1.getModule(script, "@rbxts", "electric-arc").lib);
function v6.createTrail(p23, p24, p25)
	local v44 = u22("Attachment", {
		Parent = u22("Part", {
			Position = p24, 
			Parent = l__Workspace__18, 
			Transparency = 1, 
			CanCollide = false, 
			CanQuery = false, 
			CanTouch = false, 
			Anchored = true
		})
	});
	local v45 = u22("Attachment", {
		Parent = u22("Part", {
			Position = p25, 
			Parent = l__Workspace__18, 
			Transparency = 1, 
			CanCollide = false, 
			CanQuery = false, 
			CanTouch = false, 
			Anchored = true
		})
	});
	local v46 = u27.link(v45, v44, Color3.fromRGB(180, 128, 255));
	local v47 = u1.new();
	v47:GiveTask(v46);
	task.delay(0.3, function()
		v46:Destroy();
		v44:Destroy();
		v45:Destroy();
		v47:DoCleaning();
	end);
end;
local v48 = l__KnitClient__2.CreateController(v6.new());
return nil;
