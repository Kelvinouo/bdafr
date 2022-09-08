-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "JadeHammerController";
	end, 
	__index = l__HandKnitController__5
});
v6.__index = v6;
local u1 = v6;
function u1.new(...)
	local v7 = setmetatable({}, u1);
	return v7:constructor(...) and v7;
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function u1.constructor(p1, ...)
	l__HandKnitController__5.constructor(p1, ...);
	p1.Name = "JadeHammerController";
	p1.maid = u2.new();
end;
function u1.KnitStart(p2)
	l__HandKnitController__5.KnitStart(p2);
end;
local l__Flamework__3 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__CooldownId__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local l__AbilityId__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local l__KnitClient__6 = v3.KnitClient;
local l__Players__7 = v4.Players;
local l__StarterPlayer__8 = v4.StarterPlayer;
local l__KnitClient__9 = v3.KnitClient;
local l__AnimationType__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__GameAnimationUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__EntityUtil__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__ItemType__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__default__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__SoundManager__15 = v2.SoundManager;
local l__GameSound__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function u1.useJadeHammer(p3)
	if l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(l__CooldownId__4.JADE_HAMMER) then
		if l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(l__CooldownId__4.JADE_HAMMER) < 0.25 then
			l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(l__CooldownId__4.JADE_HAMMER, "buffer", function()
				if p3:isEnabled() then
					p3:useJadeHammer();
				end;
			end);
		end;
		return nil;
	end;
	if not l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):canUseAbility(l__AbilityId__5.JADE_HAMMER_JUMP) then
		return nil;
	end;
	l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(l__AbilityId__5.JADE_HAMMER_JUMP);
	local v8 = l__KnitClient__6.Controllers.SprintController:getMovementStatusModifier():addModifier({
		moveSpeedMultiplier = 0, 
		blockSprint = true
	});
	p3.maid:GiveTask(v8);
	local l__Character__9 = l__Players__7.LocalPlayer.Character;
	local v10 = l__Character__9:FindFirstChildOfClass("Humanoid");
	v10.JumpHeight = 3;
	v10:ChangeState(Enum.HumanoidStateType.Jumping);
	local l__PrimaryPart__17 = l__Character__9.PrimaryPart;
	local u18 = nil;
	u18 = v10.Jumping:Connect(function()
		l__PrimaryPart__17:ApplyImpulse((l__PrimaryPart__17.CFrame * CFrame.new(Vector3.new(0, 0, -5)) - l__PrimaryPart__17.Position).Position * 13 * l__PrimaryPart__17.AssemblyMass);
		u18:Disconnect();
		l__KnitClient__6.Controllers.JumpHeightController:setJumpHeight(l__StarterPlayer__8.CharacterJumpHeight);
	end);
	p3.maid:GiveTask(u18);
	p3.maid:GiveTask(function()
		l__KnitClient__6.Controllers.JumpHeightController:setJumpHeight(l__StarterPlayer__8.CharacterJumpHeight);
	end);
	l__KnitClient__9.Controllers.ViewmodelController:playAnimation(l__AnimationType__10.FP_USE_ITEM);
	local u19 = l__GameAnimationUtil__11.playAnimation(l__Players__7.LocalPlayer, l__AnimationType__10.JADE_HAMMER_SLAM);
	p3.maid:GiveTask(function()
		if u19 ~= nil then
			u19:Stop();
		end;
	end);
	if u19 ~= nil then
		local v11 = u19.Stopped:Connect(function()
			local v12 = l__EntityUtil__12:getLocalPlayerEntity();
			if v12 ~= nil then
				v12 = v12:getItemTypeInHand();
			end;
			if v12 == l__ItemType__13.JADE_HAMMER then
				l__default__14.Client:Get("RemoteName"):SendToServer();
				l__SoundManager__15:playSound(l__GameSound__16.JADE_HAMMER_THUD, {
					position = l__PrimaryPart__17.Position
				});
			end;
			v8.Destroy();
		end);
	end;
end;
local l__ContextActionService__20 = v4.ContextActionService;
local l__DeviceUtil__21 = v2.DeviceUtil;
local u22 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__MobileButton__23 = v2.MobileButton;
local l__BedwarsImageId__24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__BedwarsUI__25 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
function u1.onEnable(p4, p5, p6)
	p4.maid:GiveTask(l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(l__AbilityId__5.JADE_HAMMER_JUMP, nil));
	task.spawn(function()
		local v13 = nil;
		v13 = l__GameAnimationUtil__11.playAnimation(l__Players__7.LocalPlayer, l__AnimationType__10.JADE_HAMMER_IDLE, {
			looped = true
		});
		if p6() then
			p4.maid:GiveTask(function()
				if v13 ~= nil then
					v13:Stop();
				end;
			end);
			return;
		end;
		if v13 ~= nil then
			v13:Stop();
		end;
	end);
	l__ContextActionService__20:BindAction("use-jade-hammer", function(p7, p8, p9)
		if p8 == Enum.UserInputState.Begin then
			p4:useJadeHammer();
		end;
	end, false, Enum.UserInputType.MouseButton1);
	p4.maid:GiveTask(function()
		l__ContextActionService__20:UnbindAction("use-jade-hammer");
	end);
	if l__DeviceUtil__21.isMobileControls() then
		p4:setupYield(function()
			local u26 = u22.mount(u22.createElement("ScreenGui", {
				ResetOnSpawn = false
			}, { u22.createElement(l__MobileButton__23, {
					Image = l__BedwarsImageId__24.UP_MOBILE, 
					Position = l__BedwarsUI__25:getActionMobileButtonPosition(), 
					OnClick = function()
						p4:useJadeHammer();
					end
				}) }), l__Players__7.LocalPlayer:WaitForChild("PlayerGui"));
			return function()
				u22.unmount(u26);
			end;
		end);
	end;
end;
function u1.onDisable(p10)
	p10.maid:DoCleaning();
end;
function u1.isRelevantItem(p11, p12)
	return p12.itemType == l__ItemType__13.JADE_HAMMER;
end;
u1 = l__KnitClient__9.CreateController;
u1 = u1(u1.new());
return nil;
