-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "HealingBackpckController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "HealingBackpckController";
	p1.abilityMaid = u1.new();
end;
local l__Flamework__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__AbilityId__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
function v4.equip(p2)
	local u4 = l__Flamework__2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(l__AbilityId__3.HEALING_BACKPACK, {
		text = "first aid", 
		interactionKey = Enum.KeyCode.R, 
		gamepadInteractionKey = Enum.KeyCode.ButtonL2
	});
	p2.abilityMaid:GiveTask(function()
		u4.Destroy();
	end);
end;
function v4.unequip(p3)
	p3.abilityMaid:DoCleaning();
end;
local l__ClientSyncEvents__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__Players__6 = v2.Players;
local l__InventoryUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__ItemType__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__default__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__TweenService__11 = v2.TweenService;
local l__SoundManager__12 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v4.KnitStart(p4)
	l__KnitController__3.KnitStart(p4);
	l__ClientSyncEvents__5.AbilityUsed:connect(function(p5)
		local v6 = false;
		if p5.ability == l__AbilityId__3.HEALING_BACKPACK then
			v6 = p5.userCharacter == l__Players__6.LocalPlayer.Character;
		end;
		if v6 then
			local v7 = l__InventoryUtil__7.getInventory(l__Players__6.LocalPlayer).backpack;
			if v7 ~= nil then
				v7 = v7.itemType;
			end;
			v6 = v7 == l__ItemType__8.HEALING_BACKPACK;
		end;
		if v6 then
			l__default__9.Client:Get("RemoteName"):SendToServer({
				player = l__Players__6.LocalPlayer
			});
		end;
	end);
	l__ClientSyncEvents__5.BackpackEquipEvent:connect(function(p6)
		if p6.player == l__Players__6.LocalPlayer then
			if p6.item ~= l__ItemType__8.HEALING_BACKPACK then
				p4:unequip();
				return;
			end;
		else
			return;
		end;
		p4:equip();
	end);
	l__default__9.Client:Get("RemoteName"):Connect(function(p7)
		local v8 = nil;
		local l__Character__9 = p7.healer.Character;
		v8 = p7.target.Character;
		if not l__Character__9 or not v8 then
			return nil;
		end;
		local l__BodyFrontAttachment__10 = l__Character__9:FindFirstChild("UpperTorso"):FindFirstChild("BodyFrontAttachment");
		local l__BodyFrontAttachment__11 = v8:FindFirstChild("UpperTorso"):FindFirstChild("BodyFrontAttachment");
		if l__BodyFrontAttachment__10 and l__BodyFrontAttachment__11 then
			local v12 = u10("Beam", {
				Attachment0 = l__BodyFrontAttachment__10, 
				Attachment1 = l__BodyFrontAttachment__11, 
				Texture = "rbxassetid://8700410994", 
				TextureSpeed = 0.7, 
				Width0 = 0, 
				Width1 = 0, 
				FaceCamera = true, 
				Color = ColorSequence.new(Color3.fromRGB(33, 247, 61)), 
				Parent = l__BodyFrontAttachment__10
			});
			l__TweenService__11:Create(v12, TweenInfo.new(2), {
				Width0 = 2.5, 
				Width1 = 1
			}):Play();
			task.delay(2, function()
				v12:Destroy();
			end);
		end;
	end);
	l__default__9.Client:Get("RemoteName"):Connect(function(p8)
		l__SoundManager__12:playSound(l__GameSound__13.HEALING_BACKPACK_USED, {
			position = p8.position, 
			rollOffMaxDistance = 45, 
			volumeMultiplier = 0.5
		});
	end);
end;
local v13 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
