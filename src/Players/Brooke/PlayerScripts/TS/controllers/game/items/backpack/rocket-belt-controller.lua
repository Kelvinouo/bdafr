-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "RocketBeltController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v5.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "RocketBeltController";
	p1.rocketMaid = u1.new();
end;
local l__ItemType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v5.isRelevantItem(p2, p3)
	return p3.itemType == l__ItemType__2.ROCKET_BELT;
end;
local l__SoundManager__3 = v2.SoundManager;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Flamework__5 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__AbilityId__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
function v5.equip(p4)
	l__SoundManager__3:playSound(l__GameSound__4.EQUIP_JET_PACK);
	local u7 = l__Flamework__5.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(l__AbilityId__6.ROCKET_BELT, {
		text = "dash", 
		interactionKey = Enum.KeyCode.R, 
		gamepadInteractionKey = Enum.KeyCode.R
	});
	p4.rocketMaid:GiveTask(function()
		u7.Destroy();
	end);
end;
function v5.unequip(p5)
	p5.rocketMaid:DoCleaning();
end;
local l__ClientSyncEvents__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__Players__9 = v3.Players;
local l__InventoryUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__default__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__CooldownId__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
function v5.KnitStart(p6)
	l__KnitController__4.KnitStart(p6);
	l__ClientSyncEvents__8.AbilityUsed:connect(function(p7)
		local v7 = false;
		if p7.ability == l__AbilityId__6.ROCKET_BELT then
			v7 = p7.userCharacter == l__Players__9.LocalPlayer.Character;
		end;
		if v7 then
			local v8 = l__InventoryUtil__10.getInventory(l__Players__9.LocalPlayer).backpack;
			if v8 ~= nil then
				v8 = v8.itemType;
			end;
			v7 = v8 == l__ItemType__2.ROCKET_BELT;
		end;
		if v7 then
			l__default__11.Client:Get("RemoteName"):SendToServer({
				player = l__Players__9.LocalPlayer
			});
			local v9 = l__Players__9.LocalPlayer.Character;
			if v9 ~= nil then
				v9 = v9.PrimaryPart;
			end;
			local v10 = l__Players__9.LocalPlayer.Character;
			if v10 ~= nil then
				v10 = v10:FindFirstChild("Humanoid");
			end;
			local v11 = l__Players__9.LocalPlayer.Character;
			if v11 ~= nil then
				v11 = v11:GetPrimaryPartCFrame().LookVector * 100;
			end;
			if v9 ~= nil then
				v9:ApplyImpulse((Vector3.new(0, 65, 0) + v11) * (v9.AssemblyMass * 1.2));
			end;
		end;
	end);
	l__ClientSyncEvents__8.CooldownExpired:connect(function(p8)
		local v12 = p8.cooldownId == l__CooldownId__12.ROCKET_BELT;
		if v12 then
			local v13 = l__InventoryUtil__10.getInventory(l__Players__9.LocalPlayer).backpack;
			if v13 ~= nil then
				v13 = v13.itemType;
			end;
			v12 = v13 == l__ItemType__2.ROCKET_BELT;
		end;
		if v12 then
			l__SoundManager__3:playSound(l__GameSound__4.JETPACK_COOLDOWN_READY);
		end;
	end);
	l__default__11.Client:Get("RemoteName"):Connect(function(p9)
		p6:playEffect(p9.player);
	end);
	l__ClientSyncEvents__8.BackpackEquipEvent:connect(function(p10)
		if p10.player == l__Players__9.LocalPlayer then
			if p10.item ~= l__ItemType__2.ROCKET_BELT then
				p6:unequip();
				return;
			end;
		else
			return;
		end;
		p6:equip();
	end);
end;
local l__EntityUtil__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
function v5.playEffect(p11, p12)
	local v14 = l__EntityUtil__13:getEntity(p12);
	local v15 = p12.Character;
	if v15 ~= nil then
		v15 = v15:WaitForChild(l__ItemType__2.ROCKET_BELT);
	end;
	local v16 = v15;
	if v16 ~= nil then
		v16 = v16.Name;
	end;
	if v16 ~= l__ItemType__2.ROCKET_BELT then
		return nil;
	end;
	local l__Effect__17 = v15:WaitForChild("Handle"):WaitForChild("LeftEffectAttachment"):WaitForChild("Effect");
	local l__Effect__18 = v15:WaitForChild("Handle"):WaitForChild("RightEffectAttachment"):WaitForChild("Effect");
	if not l__Effect__17 or not l__Effect__18 then
		return nil;
	end;
	l__Effect__17.Enabled = true;
	l__Effect__18.Enabled = true;
	local v19 = p12.Character;
	if v19 ~= nil then
		v19 = v19:GetPrimaryPartCFrame().Position;
	end;
	p11:playLaunchEffect(v19);
	task.delay(0.5, function()
		if l__Effect__17 then
			l__Effect__17.Enabled = false;
		end;
		if l__Effect__18 then
			l__Effect__18.Enabled = false;
		end;
	end);
end;
local l__ReplicatedStorage__14 = v3.ReplicatedStorage;
local l__Workspace__15 = v3.Workspace;
local l__GameQueryUtil__16 = v2.GameQueryUtil;
function v5.playLaunchEffect(p13, p14)
	if not p14 then
		return nil;
	end;
	l__SoundManager__3:playSound(l__GameSound__4.JETPACK_LAUNCH, {
		position = p14, 
		rollOffMaxDistance = 45, 
		volumeMultiplier = 0.5
	});
	p14 = p14 - Vector3.new(0, 2, 0);
	local v20 = l__ReplicatedStorage__14.Assets.Effects.RocketLaunchEffect:Clone();
	v20:SetPrimaryPartCFrame(CFrame.new(p14));
	v20.Parent = l__Workspace__15;
	l__GameQueryUtil__16:setQueryIgnored(v20, true);
	task.delay(0.5, function()
		v20:Destroy();
	end);
end;
local v21 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v5.new());
return nil;
