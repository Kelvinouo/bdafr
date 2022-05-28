-- Script Hash: b248a73d5073845753c9ed214ca976b31fc76bc472e637b92ad7377b80396b7f8dcba60dcdf3c241d85de1729d7c27c6
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "VoidAxeController";
	end, 
	__index = l__HandKnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = l__HandKnitController__5;
local l__Maid__2 = v3.Maid;
function v6.constructor(p1)
	u1.constructor(p1);
	p1.Name = "VoidAxeController";
	p1.maid = l__Maid__2.new();
end;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__4 = v4.Players;
local l__SoundManager__5 = v2.SoundManager;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__DamageType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType;
function v6.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__3.Client:OnEvent("RemoteName", function(p3)
		if p3.entity.PrimaryPart then
			if p3.entity ~= l__Players__4.LocalPlayer.Character then
				l__SoundManager__5:playSound(l__GameSound__6.VOID_AXE_LEAP, {
					position = p3.entity.PrimaryPart.Position, 
					parent = p3.entity.PrimaryPart
				});
				return;
			end;
		else
			return;
		end;
		return nil;
	end);
	l__default__3.Client:OnEvent("RemoteName", function(p4)
		if p4.damageType == l__DamageType__7.VOID_AXE_SLASH then
			local v8 = {};
			if l__Players__4.LocalPlayer.Character == p4.entityInstance then
				local v9 = nil;
			else
				local v10 = p4.entityInstance.PrimaryPart;
				if v10 ~= nil then
					v10 = v10.Position;
				end;
				v9 = v10;
			end;
			v8.position = v9;
			l__SoundManager__5:playSound(l__GameSound__6.VOID_AXE_HIT, v8);
		end;
	end);
end;
local l__Flamework__8 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__CooldownId__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local l__AbilityId__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local l__KnitClient__11 = v3.KnitClient;
local l__StarterPlayer__12 = v4.StarterPlayer;
local l__KnitClient__13 = v3.KnitClient;
local l__AnimationType__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__GameAnimationUtil__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__EntityUtil__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__ItemType__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v6.useVoidAxe(p5)
	if l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(l__CooldownId__9.VOID_AXE) then
		if l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(l__CooldownId__9.VOID_AXE) < 0.25 then
			l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(l__CooldownId__9.VOID_AXE, "buffer", function()
				if p5:isEnabled() then
					p5:useVoidAxe();
				end;
			end);
		end;
		return nil;
	end;
	if not l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):canUseAbility(l__AbilityId__10.VOID_AXE_JUMP) then
		return nil;
	end;
	l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(l__AbilityId__10.VOID_AXE_JUMP);
	l__SoundManager__5:playSound(l__GameSound__6.VOID_AXE_LEAP);
	local v11 = l__KnitClient__11.Controllers.SprintController:getMovementStatusModifier():addModifier({
		moveSpeedMultiplier = 0, 
		blockSprint = true
	});
	p5.maid:GiveTask(v11);
	local l__Character__12 = l__Players__4.LocalPlayer.Character;
	local v13 = l__Character__12:FindFirstChildOfClass("Humanoid");
	v13.JumpHeight = 3;
	v13:ChangeState(Enum.HumanoidStateType.Jumping);
	local l__PrimaryPart__18 = l__Character__12.PrimaryPart;
	local u19 = nil;
	u19 = v13.Jumping:Connect(function()
		l__PrimaryPart__18:ApplyImpulse((l__PrimaryPart__18.CFrame * CFrame.new(Vector3.new(0, 0, -5)) - l__PrimaryPart__18.Position).Position * 13 * l__PrimaryPart__18.AssemblyMass);
		u19:Disconnect();
		l__KnitClient__11.Controllers.JumpHeightController:setJumpHeight(l__StarterPlayer__12.CharacterJumpHeight);
	end);
	p5.maid:GiveTask(u19);
	p5.maid:GiveTask(function()
		l__KnitClient__11.Controllers.JumpHeightController:setJumpHeight(l__StarterPlayer__12.CharacterJumpHeight);
	end);
	l__KnitClient__13.Controllers.ViewmodelController:playAnimation(l__AnimationType__14.FP_USE_ITEM);
	local u20 = l__GameAnimationUtil__15.playAnimation(l__Players__4.LocalPlayer, l__AnimationType__14.JADE_HAMMER_SLAM);
	p5.maid:GiveTask(function()
		if u20 ~= nil then
			u20:Stop();
		end;
	end);
	if u20 ~= nil then
		local v14 = u20.Stopped:Connect(function()
			local v15 = l__EntityUtil__16:getLocalPlayerEntity();
			if v15 ~= nil then
				v15 = v15:getItemTypeInHand();
			end;
			if v15 == l__ItemType__17.VOID_AXE then
				l__default__3.Client:Get("RemoteName"):SendToServer();
			end;
			v11.Destroy();
		end);
	end;
end;
local l__ContextActionService__21 = v4.ContextActionService;
local l__DeviceUtil__22 = v2.DeviceUtil;
local u23 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__MobileButton__24 = v2.MobileButton;
local l__BedwarsImageId__25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__BedwarsUI__26 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
function v6.onEnable(p6, p7, p8)
	p6.maid:GiveTask(l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(l__AbilityId__10.VOID_AXE_JUMP, nil));
	task.spawn(function()
		local v16 = nil;
		v16 = l__GameAnimationUtil__15.playAnimation(l__Players__4.LocalPlayer, l__AnimationType__14.JADE_HAMMER_IDLE, {
			looped = true
		});
		if p8() then
			p6.maid:GiveTask(function()
				if v16 ~= nil then
					v16:Stop();
				end;
			end);
			return;
		end;
		if v16 ~= nil then
			v16:Stop();
		end;
	end);
	l__ContextActionService__21:BindAction("use-void-axe", function(p9, p10, p11)
		if p10 == Enum.UserInputState.Begin then
			p6:useVoidAxe();
		end;
	end, false, Enum.UserInputType.MouseButton1);
	p6.maid:GiveTask(function()
		l__ContextActionService__21:UnbindAction("use-void-axe");
	end);
	if l__DeviceUtil__22.isMobileControls() then
		p6:setupYield(function()
			local u27 = u23.mount(u23.createElement("ScreenGui", {
				ResetOnSpawn = false
			}, { u23.createElement(l__MobileButton__24, {
					Image = l__BedwarsImageId__25.SHOOT_MOBILE, 
					Position = l__BedwarsUI__26:getActionMobileButtonPosition(), 
					OnClick = function()
						p6:useVoidAxe();
					end
				}) }), l__Players__4.LocalPlayer:WaitForChild("PlayerGui"));
			return function()
				u23.unmount(u27);
			end;
		end);
	end;
end;
function v6.onDisable(p12)
	p12.maid:DoCleaning();
end;
function v6.isRelevantItem(p13, p14)
	return p14.itemType == l__ItemType__17.VOID_AXE;
end;
u1 = l__KnitClient__13.CreateController;
u1 = u1(v6.new());
return nil;
