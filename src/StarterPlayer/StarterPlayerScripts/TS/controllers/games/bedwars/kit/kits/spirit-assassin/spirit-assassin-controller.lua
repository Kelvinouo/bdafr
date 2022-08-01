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
local u1 = l__KnitController__5;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v6.constructor(p1)
	u1.constructor(p1);
	p1.Name = "SpiritAssassinController";
	p1.speedMaid = u2.new();
	p1.spiritMap = {};
end;
local l__KnitClient__3 = v3.KnitClient;
local l__ItemType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__AnimationType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__default__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__7 = v4.Players;
function v6.KnitStart(p2)
	u1.KnitStart(p2);
	l__KnitClient__3.Controllers.PreloadController:preloadForItemType(l__ItemType__4.SPIRIT_DAGGER, {
		animations = { l__AnimationType__5.DAGGER_CHARGE }
	});
	l__default__6.Client:OnEvent("RemoteName", function(p3)
		if p3.assassin == l__Players__7.LocalPlayer then
			p2:cooldownIndicator(p3.soulOfPlayer);
		end;
		p2:spawnSpirit(p3.position, p3.secret, p3.assassin);
	end);
	l__default__6.Client:Get("RemoteName"):Connect(function(p4)
		if p4.multiplier == 1 then
			p2.speedMaid:DoCleaning();
		end;
	end);
	l__default__6.Client:Get("RemoteName"):Connect(function(p5)
		local v8 = math.abs(p5.player.UserId);
		p2:playChargeAnimation(l__AnimationType__5.DAGGER_CHARGE, p5.player);
		if p5.player == l__Players__7.LocalPlayer then
			l__KnitClient__3.Controllers.ViewmodelController:playAnimation(l__AnimationType__5.FP_DAGGER_CHARGE);
		end;
		p2.spiritMap[v8] = nil;
		local v9 = p2.spiritMap[v8];
		if v9 ~= nil then
			v9:Destroy();
		end;
	end);
	l__default__6.Client:Get("RemoteName"):Connect(function(p6)
		local v10 = p6.player.Character;
		if v10 ~= nil then
			v10 = v10:GetPrimaryPartCFrame().Position;
		end;
		if v10 then
			p2:createTrail(p6.originalPosition, v10);
		end;
		p2:playSlashAnimation(p6.player);
		if p6.player == l__Players__7.LocalPlayer then
			l__KnitClient__3.Controllers.ViewmodelController:playAnimation(l__AnimationType__5.FP_DAGGER_SLASH);
		end;
	end);
end;
local l__SoundManager__8 = v2.SoundManager;
local l__GameSound__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__AnimationUtil__10 = v2.AnimationUtil;
local l__GameAnimationUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__InventoryUtil__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__ItemUtil__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local l__EntityUtil__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__KnitClient__15 = v3.KnitClient;
local l__WeldUtil__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
function v6.playChargeAnimation(p7, p8, p9)
	local v11 = {};
	local v12 = p9.Character;
	if v12 ~= nil then
		v12 = v12:GetPrimaryPartCFrame().Position;
	end;
	v11.position = v12;
	v11.rollOffMaxDistance = 45;
	v11.volumeMultiplier = 0.5;
	l__SoundManager__8:playSound(l__GameSound__9.SPIRIT_DAGGER_CHARGE, v11);
	local v13 = l__AnimationUtil__10.playAnimation(p9, l__GameAnimationUtil__11.getAssetId(p8));
	local v14 = l__InventoryUtil__12.getInventory(p9).hand;
	if v14 ~= nil then
		v14 = v14.itemType;
	end;
	local v15 = l__ItemUtil__13.createItemInstance(l__ItemType__4.SPIRIT_DAGGER);
	local v16 = l__ItemUtil__13.createItemInstance(l__ItemType__4.SPIRIT_DAGGER_LEFT);
	local v17 = l__ItemUtil__13.createItemInstance(l__ItemType__4.SPIRIT_DAGGER);
	local l__hand__18 = l__InventoryUtil__12.getInventory(p9).hand;
	if l__hand__18 ~= nil then
		local v19 = l__hand__18.tool:Destroy();
	end;
	local v20 = l__EntityUtil__14:getEntity(p9);
	if p9 == l__Players__7.LocalPlayer then
		l__KnitClient__15.Controllers.ViewmodelController:setHeldItem(v17);
	end;
	if v20 ~= nil then
		local v21 = v20:getHumanoid();
		if v21 ~= nil then
			v21:AddAccessory(v16);
		end;
	end;
	if v20 ~= nil then
		local v22 = v20:getHumanoid();
		if v22 ~= nil then
			v22:AddAccessory(v15);
		end;
	end;
	v15.Destroying:Connect(function()
		v16:Destroy();
	end);
	v16.Destroying:Connect(function()
		v15:Destroy();
	end);
	l__WeldUtil__16.weldCharacterAccessories(p9.Character);
	if v13 ~= nil then
		v13:AdjustSpeed(0.8);
	end;
	task.delay(2, function()
		local v23 = l__InventoryUtil__12.getInventory(p9).hand;
		if v23 ~= nil then
			v23 = v23.itemType;
		end;
		local v24 = v23 == l__ItemType__4.SPIRIT_DAGGER;
		if not v24 then
			local v25 = l__InventoryUtil__12.getInventory(p9).hand;
			if v25 ~= nil then
				v25 = v25.itemType;
			end;
			v24 = v25 == l__ItemType__4.SPIRIT_DAGGER_LEFT;
		end;
		if v24 and v14 then
			v15:Destroy();
			v16:Destroy();
			local l__hand__26 = l__InventoryUtil__12.getInventory(p9).hand;
			if l__hand__26 ~= nil then
				local v27 = l__hand__26.tool:Destroy();
			end;
			local v28 = l__ItemUtil__13.createItemInstance(v14);
			if v20 ~= nil then
				local v29 = v20:getHumanoid();
				if v29 ~= nil then
					v29:AddAccessory(v28);
				end;
			end;
			l__WeldUtil__16.weldCharacterAccessories(p9.Character);
		end;
	end);
end;
local l__ReplicatedStorage__17 = v4.ReplicatedStorage;
local l__scaleModel__18 = v1.import(script, v1.getModule(script, "@rbxts", "scale-model").out).scaleModel;
local l__Workspace__19 = v4.Workspace;
local l__GameQueryUtil__20 = v2.GameQueryUtil;
local l__ModelUtil__21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local l__InOutExpo__22 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).InOutExpo;
function v6.playSlashAnimation(p10, p11)
	local v30 = l__AnimationUtil__10.playAnimation(p11, l__GameAnimationUtil__11.getAssetId(l__AnimationType__5.DAGGER_SLASH));
	if v30 ~= nil then
		v30:AdjustSpeed(0.8);
	end;
	local v31 = l__EntityUtil__14:getEntity(p11);
	if not v31 then
		return nil;
	end;
	local v32 = l__ReplicatedStorage__17.Assets.Effects.DaggerSpin:Clone();
	v32:SetPrimaryPartCFrame(v31:getInstance():GetPrimaryPartCFrame());
	l__scaleModel__18(v32, 0.04);
	v32.Parent = l__Workspace__19;
	for v33, v34 in ipairs(v32:GetChildren()) do
		if v34:IsA("BasePart") then
			l__GameQueryUtil__20:setQueryIgnored(v34, true);
		end;
	end;
	l__ModelUtil__21.tweenModelSize(v32, 0, l__InOutExpo__22, 10);
	local v35 = {};
	local v36 = p11.Character;
	if v36 ~= nil then
		v36 = v36:GetPrimaryPartCFrame().Position;
	end;
	v35.position = v36;
	v35.rollOffMaxDistance = 45;
	v35.volumeMultiplier = 0.5;
	l__SoundManager__8:playSound(l__GameSound__9.SPIRIT_DAGGER_SLASH, v35);
	task.delay(0.3, function()
		v32:Destroy();
	end);
end;
local u23 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__DeviceUtil__25 = v2.DeviceUtil;
function v6.spawnSpirit(p12, p13, p14, p15)
	if p15 ~= l__Players__7.LocalPlayer then
		return nil;
	end;
	local v37 = l__ReplicatedStorage__17:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild("SpiritOrb"):Clone();
	local v38 = v37:WaitForChild("bigball", 3);
	if v38 ~= nil then
		v38 = v38:WaitForChild("inside", 3);
	end;
	v37:SetPrimaryPartCFrame(CFrame.new(p13));
	v37.Parent = l__Workspace__19;
	if p14 == "" then
		p12.spiritMap[math.abs(p15.UserId)] = v37;
		v1.Promise.delay(10):andThen(function()
			if v37.Parent then
				v37:Destroy();
			end;
		end);
		return nil;
	end;
	v37:SetAttribute("SpiritSecret", p14);
	local v39 = u23("ProximityPrompt", {
		ActionText = "Player's Soul", 
		ObjectText = "Teleport", 
		HoldDuration = 0, 
		KeyboardKeyCode = l__Theme__24.promptKeyboardKey, 
		RequiresLineOfSight = false, 
		MaxActivationDistance = 120, 
		Parent = v37, 
		ClickablePrompt = l__DeviceUtil__25.isMobileControls()
	});
	v39.Triggered:Connect(function(p16)
		if p16 == l__Players__7.LocalPlayer and p12:useSpirit(p16, v37) then
			v39:Destroy();
		end;
	end);
	v1.Promise.delay(10):andThen(function()
		if v37.Parent then
			v37:Destroy();
		end;
	end);
end;
function v6.useSpirit(p17, p18, p19)
	local v40 = l__default__6.Client:Get("RemoteName"):CallServer({
		secret = p19:GetAttribute("SpiritSecret")
	});
	if v40 then
		p17.speedMaid:GiveTask(l__KnitClient__3.Controllers.SprintController:getMovementStatusModifier():addModifier({
			constantSpeedMultiplier = 1.5
		}));
	end;
	task.delay(0.7, function()
		p19:Destroy();
	end);
	return v40;
end;
local l__RunService__26 = v4.RunService;
function v6.cooldownIndicator(p20, p21)
	p21:SetAttribute("SpiritCooldown", true);
	local v41 = l__ReplicatedStorage__17.Assets.Effects.SpiritDagger:Clone();
	v41.Parent = l__Workspace__19;
	l__GameQueryUtil__20:setQueryIgnored(v41, true);
	task.delay(30, function()
		v41:Destroy();
		p21:SetAttribute("SpiritCooldown", false);
	end);
	local u27 = 0;
	l__RunService__26.Heartbeat:Connect(function(p22)
		u27 = u27 + p22;
		local v42 = v41.PrimaryPart;
		if v42 then
			local v43 = p21;
			if v43 ~= nil then
				v43 = v43.Character;
			end;
			v42 = v43;
		end;
		if not v42 then
			v41:Destroy();
			return nil;
		end;
		v41:SetPrimaryPartCFrame(CFrame.new(p21.Character:GetPrimaryPartCFrame().Position + Vector3.new(0, 7, 0)) * CFrame.Angles(math.pi, u27 * math.pi / 2, 0));
	end);
	p21:GetAttributeChangedSignal("SpiritCooldown"):Connect(function()
		local v44 = p21:GetAttribute("SpiritCooldown");
		if v44 == 0 or v44 ~= v44 or v44 == "" or not v44 then
			v41:Destroy();
		end;
	end);
end;
local u28 = v1.import(script, v1.getModule(script, "@rbxts", "electric-arc").lib);
function v6.createTrail(p23, p24, p25)
	local v45 = u23("Attachment", {
		Parent = u23("Part", {
			Position = p24, 
			Parent = l__Workspace__19, 
			Transparency = 1, 
			CanCollide = false, 
			CanQuery = false, 
			CanTouch = false, 
			Anchored = true
		})
	});
	local v46 = u23("Attachment", {
		Parent = u23("Part", {
			Position = p25, 
			Parent = l__Workspace__19, 
			Transparency = 1, 
			CanCollide = false, 
			CanQuery = false, 
			CanTouch = false, 
			Anchored = true
		})
	});
	local v47 = u28.link(v46, v45, Color3.fromRGB(180, 128, 255));
	local v48 = u2.new();
	v48:GiveTask(v47);
	task.delay(0.3, function()
		v47:Destroy();
		v45:Destroy();
		v46:Destroy();
		v48:DoCleaning();
	end);
end;
u1 = l__KnitClient__3.CreateController;
u1 = u1(v6.new());
return nil;
