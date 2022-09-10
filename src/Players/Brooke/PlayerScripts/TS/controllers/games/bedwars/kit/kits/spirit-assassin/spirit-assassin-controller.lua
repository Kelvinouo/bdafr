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
local l__EntityUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__InventoryUtil__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__ItemUtil__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
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
	if v13 ~= nil then
		v13:AdjustSpeed(0.8);
	end;
	local v14 = l__EntityUtil__11:getEntity(p9);
	local v15 = v14;
	if v15 ~= nil then
		v15 = v15:getInstance():GetAttribute("Dagger");
	end;
	if v15 ~= 0 and v15 == v15 and v15 ~= "" and v15 then
		return nil;
	end;
	if v14 ~= nil then
		local v16 = v14:getInstance():SetAttribute("Dagger", true);
	end;
	local v17 = l__InventoryUtil__12.getInventory(p9).hand;
	if v17 ~= nil then
		v17 = v17.itemType;
	end;
	local v18 = l__ItemUtil__13.createItemInstance(l__ItemType__3.SPIRIT_DAGGER);
	local v19 = l__ItemUtil__13.createItemInstance(l__ItemType__3.SPIRIT_DAGGER_LEFT);
	local v20 = l__ItemUtil__13.createItemInstance(l__ItemType__3.SPIRIT_DAGGER);
	if v14 ~= nil then
		local v21 = v14:getHandItemInstanceFromCharacter();
		if v21 ~= nil then
			v21:Destroy();
		end;
	end;
	if p9 == l__Players__6.LocalPlayer then
		l__KnitClient__14.Controllers.ViewmodelController:setHeldItem(v20);
	end;
	if v14 ~= nil then
		local v22 = v14:getHumanoid();
		if v22 ~= nil then
			v22:AddAccessory(v19);
		end;
	end;
	if v14 ~= nil then
		local v23 = v14:getHumanoid();
		if v23 ~= nil then
			v23:AddAccessory(v18);
		end;
	end;
	v18.Destroying:Connect(function()
		v19:Destroy();
	end);
	v19.Destroying:Connect(function()
		v18:Destroy();
	end);
	l__WeldUtil__15:weldCharacterAccessories(p9.Character);
	task.delay(1.5, function()
		local v24 = v14;
		if v24 ~= nil then
			v24 = v24:getHandItemInstanceFromCharacter();
			if v24 ~= nil then
				v24 = v24.Name;
			end;
		end;
		local v25 = v24 == nil and v17;
		if v25 then
			if v14 ~= nil then
				local v26 = v14:getInstance():SetAttribute("Dagger", false);
			end;
			v18:Destroy();
			v19:Destroy();
			local v27 = l__ItemUtil__13.createItemInstance(v17);
			local v28 = l__ItemUtil__13.createItemInstance(v17);
			if p9 == l__Players__6.LocalPlayer then
				l__KnitClient__14.Controllers.ViewmodelController:setHeldItem(v28);
			end;
			if v14 ~= nil then
				local v29 = v14:getHumanoid();
				if v29 ~= nil then
					v29:AddAccessory(v27);
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
	local v30 = l__AnimationUtil__9.playAnimation(p11, l__GameAnimationUtil__10.getAssetId(l__AnimationType__4.DAGGER_SLASH));
	if v30 ~= nil then
		v30:AdjustSpeed(0.8);
	end;
	local v31 = l__EntityUtil__11:getEntity(p11);
	if not v31 then
		return nil;
	end;
	local v32 = l__ReplicatedStorage__16.Assets.Effects.DaggerSpin:Clone();
	v32:SetPrimaryPartCFrame(v31:getInstance():GetPrimaryPartCFrame());
	l__scaleModel__17(v32, 0.04);
	v32.Parent = l__Workspace__18;
	local v33, v34, v35 = ipairs(v32:GetChildren());
	while true do
		v33(v34, v35);
		if not v33 then
			break;
		end;
		v35 = v33;
		if v34:IsA("BasePart") then
			l__GameQueryUtil__19:setQueryIgnored(v34, true);
		end;	
	end;
	l__ModelUtil__20.tweenModelSize(v32, 0, l__InOutExpo__21, 10);
	local v36 = {};
	local v37 = p11.Character;
	if v37 ~= nil then
		v37 = v37:GetPrimaryPartCFrame().Position;
	end;
	v36.position = v37;
	v36.rollOffMaxDistance = 45;
	v36.volumeMultiplier = 0.5;
	l__SoundManager__7:playSound(l__GameSound__8.SPIRIT_DAGGER_SLASH, v36);
	task.delay(0.3, function()
		v32:Destroy();
	end);
end;
local u22 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__DeviceUtil__24 = v2.DeviceUtil;
function v6.spawnSpirit(p12, p13, p14, p15)
	if p15 ~= l__Players__6.LocalPlayer then
		return nil;
	end;
	local v38 = l__ReplicatedStorage__16:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild("SpiritOrb"):Clone();
	local v39 = v38:WaitForChild("bigball", 3);
	if v39 ~= nil then
		v39 = v39:WaitForChild("inside", 3);
	end;
	v38:SetPrimaryPartCFrame(CFrame.new(p13));
	v38.Parent = l__Workspace__18;
	if p14 == "" then
		p12.spiritMap[math.abs(p15.UserId)] = v38;
		v1.Promise.delay(10):andThen(function()
			if v38.Parent then
				v38:Destroy();
			end;
		end);
		return nil;
	end;
	v38:SetAttribute("SpiritSecret", p14);
	local v40 = u22("ProximityPrompt", {
		ActionText = "Player's Soul", 
		ObjectText = "Teleport", 
		HoldDuration = 0, 
		KeyboardKeyCode = l__Theme__23.promptKeyboardKey, 
		RequiresLineOfSight = false, 
		MaxActivationDistance = 120, 
		Parent = v38, 
		ClickablePrompt = l__DeviceUtil__24.isMobileControls()
	});
	v40.Triggered:Connect(function(p16)
		if p16 == l__Players__6.LocalPlayer then
			local v41 = l__EntityUtil__11:getEntity(p16);
			if v41 ~= nil then
				v41 = v41:isAlive();
			end;
			if not v41 then
				return nil;
			end;
			if p12:useSpirit(p16, v38) then
				v40:Destroy();
			end;
		end;
	end);
	v1.Promise.delay(10):andThen(function()
		if v38.Parent then
			v38:Destroy();
		end;
	end);
end;
function v6.useSpirit(p17, p18, p19)
	local v42 = l__default__5.Client:Get("RemoteName"):CallServer({
		secret = p19:GetAttribute("SpiritSecret")
	});
	if v42 then
		p17.speedMaid:GiveTask(l__KnitClient__2.Controllers.SprintController:getMovementStatusModifier():addModifier({
			constantSpeedMultiplier = 1.5
		}));
		local u25 = p18:GetAttribute("SpiritAssassinSpeedStart");
		task.delay(6, function()
			if p18:GetAttribute("SpiritAssassinSpeedStart") == u25 then
				l__KnitClient__2.Controllers.SprintController:getMovementStatusModifier():addModifier({
					constantSpeedMultiplier = 1
				});
				p17.speedMaid:DoCleaning();
			end;
		end);
	end;
	task.delay(0.7, function()
		p19:Destroy();
	end);
	return v42;
end;
local l__RunService__26 = v4.RunService;
function v6.cooldownIndicator(p20, p21)
	p21:SetAttribute("SpiritCooldown", true);
	local v43 = l__ReplicatedStorage__16.Assets.Effects.SpiritDagger:Clone();
	v43.Parent = l__Workspace__18;
	l__GameQueryUtil__19:setQueryIgnored(v43, true);
	task.delay(30, function()
		v43:Destroy();
		p21:SetAttribute("SpiritCooldown", false);
	end);
	local u27 = 0;
	l__RunService__26.Heartbeat:Connect(function(p22)
		u27 = u27 + p22;
		local v44 = v43.PrimaryPart;
		if v44 then
			local v45 = p21;
			if v45 ~= nil then
				v45 = v45.Character;
			end;
			v44 = v45;
		end;
		if not v44 then
			v43:Destroy();
			return nil;
		end;
		v43:SetPrimaryPartCFrame(CFrame.new(p21.Character:GetPrimaryPartCFrame().Position + Vector3.new(0, 7, 0)) * CFrame.Angles(math.pi, u27 * math.pi / 2, 0));
	end);
	p21:GetAttributeChangedSignal("SpiritCooldown"):Connect(function()
		local v46 = p21:GetAttribute("SpiritCooldown");
		if v46 == 0 or v46 ~= v46 or v46 == "" or not v46 then
			v43:Destroy();
		end;
	end);
end;
local u28 = v1.import(script, v1.getModule(script, "@rbxts", "electric-arc").lib);
function v6.createTrail(p23, p24, p25)
	local v47 = u22("Attachment", {
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
	local v48 = u22("Attachment", {
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
	local v49 = u28.link(v48, v47, Color3.fromRGB(180, 128, 255));
	local v50 = u1.new();
	v50:GiveTask(v49);
	task.delay(0.3, function()
		v49:Destroy();
		v47:Destroy();
		v48:Destroy();
		v50:DoCleaning();
	end);
end;
local v51 = l__KnitClient__2.CreateController(v6.new());
return nil;
