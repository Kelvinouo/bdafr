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
		l__KnitClient__3.Controllers.ViewmodelController:playAnimation(l__AnimationType__5.FP_DAGGER_CHARGE);
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
		l__KnitClient__3.Controllers.ViewmodelController:playAnimation(l__AnimationType__5.FP_DAGGER_SLASH);
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
	local l__hand__17 = l__InventoryUtil__12.getInventory(p9).hand;
	if l__hand__17 ~= nil then
		local v18 = l__hand__17.tool:Destroy();
	end;
	local v19 = l__EntityUtil__14:getEntity(p9);
	l__KnitClient__15.Controllers.ViewmodelController:setHeldItem(v15);
	if v19 ~= nil then
		local v20 = v19:getHumanoid();
		if v20 ~= nil then
			v20:AddAccessory(v16);
		end;
	end;
	if v19 ~= nil then
		local v21 = v19:getHumanoid();
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
	l__WeldUtil__16.weldCharacterAccessories(p9.Character);
	if v13 ~= nil then
		v13:AdjustSpeed(0.8);
	end;
	task.delay(2, function()
		local v22 = l__InventoryUtil__12.getInventory(p9).hand;
		if v22 ~= nil then
			v22 = v22.itemType;
		end;
		local v23 = v22 == l__ItemType__4.SPIRIT_DAGGER;
		if not v23 then
			local v24 = l__InventoryUtil__12.getInventory(p9).hand;
			if v24 ~= nil then
				v24 = v24.itemType;
			end;
			v23 = v24 == l__ItemType__4.SPIRIT_DAGGER_LEFT;
		end;
		if v23 and v14 then
			v15:Destroy();
			v16:Destroy();
			local l__hand__25 = l__InventoryUtil__12.getInventory(p9).hand;
			if l__hand__25 ~= nil then
				local v26 = l__hand__25.tool:Destroy();
			end;
			local v27 = l__ItemUtil__13.createItemInstance(v14);
			if v19 ~= nil then
				local v28 = v19:getHumanoid();
				if v28 ~= nil then
					v28:AddAccessory(v27);
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
	local v29 = l__AnimationUtil__10.playAnimation(p11, l__GameAnimationUtil__11.getAssetId(l__AnimationType__5.DAGGER_SLASH));
	if v29 ~= nil then
		v29:AdjustSpeed(0.8);
	end;
	local v30 = l__EntityUtil__14:getEntity(p11);
	if not v30 then
		return nil;
	end;
	local v31 = l__ReplicatedStorage__17.Assets.Effects.DaggerSpin:Clone();
	v31:SetPrimaryPartCFrame(v30:getInstance():GetPrimaryPartCFrame());
	l__scaleModel__18(v31, 0.04);
	v31.Parent = l__Workspace__19;
	for v32, v33 in ipairs(v31:GetChildren()) do
		if v33:IsA("BasePart") then
			l__GameQueryUtil__20:setQueryIgnored(v33, true);
		end;
	end;
	l__ModelUtil__21.tweenModelSize(v31, 0, l__InOutExpo__22, 10);
	local v34 = {};
	local v35 = p11.Character;
	if v35 ~= nil then
		v35 = v35:GetPrimaryPartCFrame().Position;
	end;
	v34.position = v35;
	v34.rollOffMaxDistance = 45;
	v34.volumeMultiplier = 0.5;
	l__SoundManager__8:playSound(l__GameSound__9.SPIRIT_DAGGER_SLASH, v34);
	task.delay(0.3, function()
		v31:Destroy();
	end);
end;
local u23 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
function v6.spawnSpirit(p12, p13, p14, p15)
	if p15 ~= l__Players__7.LocalPlayer then
		return nil;
	end;
	local v36 = l__ReplicatedStorage__17:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild("SpiritOrb"):Clone();
	local v37 = v36:WaitForChild("bigball", 3);
	if v37 ~= nil then
		v37 = v37:WaitForChild("inside", 3);
	end;
	v36:SetPrimaryPartCFrame(CFrame.new(p13));
	v36.Parent = l__Workspace__19;
	if p14 == "" then
		p12.spiritMap[math.abs(p15.UserId)] = v36;
		v1.Promise.delay(10):andThen(function()
			if v36.Parent then
				v36:Destroy();
			end;
		end);
		return nil;
	end;
	v36:SetAttribute("SpiritSecret", p14);
	local v38 = u23("ProximityPrompt", {
		ActionText = "Player's Soul", 
		ObjectText = "Teleport", 
		HoldDuration = 0, 
		KeyboardKeyCode = l__Theme__24.promptKeyboardKey, 
		RequiresLineOfSight = false, 
		MaxActivationDistance = 120, 
		Parent = v36
	});
	v38.Triggered:Connect(function(p16)
		if p16 == l__Players__7.LocalPlayer and p12:useSpirit(p16, v36) then
			v38:Destroy();
		end;
	end);
	v1.Promise.delay(10):andThen(function()
		if v36.Parent then
			v36:Destroy();
		end;
	end);
end;
function v6.useSpirit(p17, p18, p19)
	local v39 = l__default__6.Client:Get("RemoteName"):CallServer({
		secret = p19:GetAttribute("SpiritSecret")
	});
	if v39 then
		p17.speedMaid:GiveTask(l__KnitClient__3.Controllers.SprintController:getMovementStatusModifier():addModifier({
			constantSpeedMultiplier = 1.5
		}));
	end;
	task.delay(0.7, function()
		p19:Destroy();
	end);
	return v39;
end;
local l__RunService__25 = v4.RunService;
function v6.cooldownIndicator(p20, p21)
	p21:SetAttribute("SpiritCooldown", true);
	local v40 = l__ReplicatedStorage__17.Assets.Effects.SpiritDagger:Clone();
	v40.Parent = l__Workspace__19;
	l__GameQueryUtil__20:setQueryIgnored(v40, true);
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
	local v44 = u23("Attachment", {
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
	local v45 = u23("Attachment", {
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
	local v46 = u27.link(v45, v44, Color3.fromRGB(180, 128, 255));
	local v47 = u2.new();
	v47:GiveTask(v46);
	task.delay(0.3, function()
		v46:Destroy();
		v44:Destroy();
		v45:Destroy();
		v47:DoCleaning();
	end);
end;
u1 = l__KnitClient__3.CreateController;
u1 = u1(v6.new());
return nil;
