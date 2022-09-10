-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "GlitchTrumpetController";
	end, 
	__index = l__HandKnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v4.constructor(p1)
	l__HandKnitController__3.constructor(p1);
	p1.Name = "GlitchTrumpetController";
	p1.abilityMaid = u1.new();
	p1.inputButton = Enum.UserInputType.MouseButton1;
	p1.effectCooldown = {};
end;
local l__ItemType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v4.isRelevantItem(p2, p3)
	return p3.itemType == l__ItemType__2.GLITCH_TRUMPET;
end;
local l__Flamework__3 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__AbilityId__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local l__ContextActionService__5 = v2.ContextActionService;
function v4.onEnable(p4, p5, p6)
	local u6 = l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(l__AbilityId__4.GLITCH_TRUMPET_PLAY, nil);
	p4.abilityMaid:GiveTask(function()
		u6.Destroy();
		l__ContextActionService__5:UnbindAction("use-glitch-trumpet");
	end);
	l__ContextActionService__5:BindAction("use-glitch-trumpet", function(p7, p8, p9)
		if p8 == Enum.UserInputState.Begin then
			if l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):canUseAbility(l__AbilityId__4.GLITCH_TRUMPET_PLAY) then
				l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(l__AbilityId__4.GLITCH_TRUMPET_PLAY);
				return;
			end;
		else
			return;
		end;
		return nil;
	end, false, p4.inputButton);
end;
function v4.onDisable(p10)
	p10.abilityMaid:DoCleaning();
end;
local l__KnitClient__7 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ClientSyncEvents__9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__Players__10 = v2.Players;
local l__InventoryUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__SoundManager__12 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__ReplicatedStorage__13 = v2.ReplicatedStorage;
local l__Workspace__14 = v2.Workspace;
local l__EffectUtil__15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
local l__default__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v4.KnitStart(p11)
	l__HandKnitController__3.KnitStart(p11);
	l__KnitClient__7.Controllers.PreloadController:preloadForItemType(l__ItemType__2.GLITCH_TRUMPET, {
		sounds = { l__GameSound__8.TRUMPET_PLAY }
	});
	l__ClientSyncEvents__9.AbilityUsed:connect(function(p12)
		local v6 = false;
		if p12.ability == l__AbilityId__4.GLITCH_TRUMPET_PLAY then
			v6 = p12.userCharacter == l__Players__10.LocalPlayer.Character;
		end;
		if v6 then
			local v7 = l__InventoryUtil__11.getInventory(l__Players__10.LocalPlayer).hand;
			if v7 ~= nil then
				v7 = v7.itemType;
			end;
			v6 = v7 == l__ItemType__2.GLITCH_TRUMPET;
		end;
		if v6 then
			local v8 = {};
			if p12.userCharacter == l__Players__10.LocalPlayer.Character then
				local v9 = nil;
			else
				v9 = p12.userCharacter:GetPivot().Position;
			end;
			v8.position = v9;
			l__SoundManager__12:playSound(l__GameSound__8.TRUMPET_PLAY, v8);
			local v10 = l__ReplicatedStorage__13.Assets.Effects.Trumpet:Clone();
			v10.CFrame = p12.userCharacter:GetPivot();
			v10.Parent = l__Workspace__14;
			l__EffectUtil__15:playEffects({ v10 }, nil);
			l__default__16.Client:Get("RemoteName"):CallServer();
		end;
	end);
end;
local v11 = l__KnitClient__7.CreateController(v4.new());
return nil;
