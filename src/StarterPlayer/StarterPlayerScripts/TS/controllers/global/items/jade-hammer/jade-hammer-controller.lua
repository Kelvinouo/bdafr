
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__KnitClient__4 = v3.KnitClient;
local v5 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v7 = setmetatable({}, {
	__tostring = function()
		return "JadeHammerController";
	end, 
	__index = l__HandKnitController__6
});
v7.__index = v7;
local u1 = v7;
function u1.new(...)
	local v8 = setmetatable({}, u1);
	return v8:constructor(...) and v8;
end;
local u2 = l__HandKnitController__6;
local l__Maid__3 = v3.Maid;
function u1.constructor(p1, ...)
	u2.constructor(p1, ...);
	p1.Name = "JadeHammerController";
	p1.maid = l__Maid__3.new();
end;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
end;
local l__Flamework__4 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__CooldownId__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local l__default__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__KnitClient__7 = v3.KnitClient;
local l__Players__8 = v5.Players;
local l__StarterPlayer__9 = v5.StarterPlayer;
local l__AnimationType__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__GameAnimationUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__EntityUtil__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__ItemType__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__SoundManager__14 = v2.SoundManager;
local l__GameSound__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function u1.useJadeHammer(p3)
	if l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(l__CooldownId__5.JADE_HAMMER) then
		if l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(l__CooldownId__5.JADE_HAMMER) < 0.25 then
			l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(l__CooldownId__5.JADE_HAMMER, "buffer", function()
				if p3:isEnabled() then
					p3:useJadeHammer();
				end;
			end);
		end;
		return nil;
	end;
	l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(l__CooldownId__5.JADE_HAMMER, 6, {
		cooldownBar = {}
	});
	l__default__6.Client:Get("firKhtmeuljnfebvdyjsooMfldziij"):SendToServer();
	local v9 = l__KnitClient__7.Controllers.SprintController:getMovementStatusModifier():addModifier({
		moveSpeedMultiplier = 0, 
		blockSprint = true
	});
	p3.maid:GiveTask(v9);
	local l__Character__10 = l__Players__8.LocalPlayer.Character;
	local v11 = l__Character__10:FindFirstChildOfClass("Humanoid");
	v11.JumpHeight = 3;
	v11:ChangeState(Enum.HumanoidStateType.Jumping);
	local l__PrimaryPart__16 = l__Character__10.PrimaryPart;
	local u17 = nil;
	u17 = v11.Jumping:Connect(function()
		l__PrimaryPart__16:ApplyImpulse((l__PrimaryPart__16.CFrame * CFrame.new(Vector3.new(0, 0, -5)) - l__PrimaryPart__16.Position).Position * 13 * l__PrimaryPart__16.AssemblyMass);
		u17:Disconnect();
		l__KnitClient__7.Controllers.JumpHeightController:setJumpHeight(l__StarterPlayer__9.CharacterJumpHeight);
	end);
	p3.maid:GiveTask(u17);
	p3.maid:GiveTask(function()
		l__KnitClient__7.Controllers.JumpHeightController:setJumpHeight(l__StarterPlayer__9.CharacterJumpHeight);
	end);
	l__KnitClient__4.Controllers.ViewmodelController:playAnimation(l__AnimationType__10.FP_USE_ITEM);
	local u18 = l__GameAnimationUtil__11.playAnimation(l__Players__8.LocalPlayer, l__AnimationType__10.JADE_HAMMER_SLAM);
	p3.maid:GiveTask(function()
		if u18 ~= nil then
			u18:Stop();
		end;
	end);
	if u18 ~= nil then
		local v12 = u18.Stopped:Connect(function()
			local v13 = l__EntityUtil__12:getLocalPlayerEntity();
			if v13 ~= nil then
				v13 = v13:getItemTypeInHand();
			end;
			if v13 == l__ItemType__13.JADE_HAMMER then
				l__default__6.Client:Get("jcseoYodbqaKunlngm"):SendToServer();
				l__SoundManager__14:playSound(l__GameSound__15.JADE_HAMMER_THUD, {
					position = l__PrimaryPart__16.Position
				});
			end;
			v9.Destroy();
		end);
	end;
end;
local l__ContextActionService__19 = v5.ContextActionService;
local l__DeviceUtil__20 = v2.DeviceUtil;
local u21 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__MobileButton__22 = v2.MobileButton;
local l__BedwarsImageId__23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__BedwarsUI__24 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
function u1.onEnable(p4, p5, p6)
	task.spawn(function()
		local v14 = nil;
		v14 = l__GameAnimationUtil__11.playAnimation(l__Players__8.LocalPlayer, l__AnimationType__10.JADE_HAMMER_IDLE, {
			looped = true
		});
		if p6() then
			p4.maid:GiveTask(function()
				if v14 ~= nil then
					v14:Stop();
				end;
			end);
			return;
		end;
		if v14 ~= nil then
			v14:Stop();
		end;
	end);
	l__ContextActionService__19:BindAction("use-jade-hammer", function(p7, p8, p9)
		if p8 == Enum.UserInputState.Begin then
			p4:useJadeHammer();
		end;
	end, false, Enum.UserInputType.MouseButton1);
	p4.maid:GiveTask(function()
		l__ContextActionService__19:UnbindAction("use-jade-hammer");
	end);
	if l__DeviceUtil__20.isMobileControls() then
		p4:setupYield(function()
			local u25 = u21.mount(u21.createElement("ScreenGui", {
				ResetOnSpawn = false
			}, { u21.createElement(l__MobileButton__22, {
					Image = l__BedwarsImageId__23.UP_MOBILE, 
					Position = l__BedwarsUI__24:getActionMobileButtonPosition(), 
					OnClick = function()
						p4:useJadeHammer();
					end
				}) }), l__Players__8.LocalPlayer:WaitForChild("PlayerGui"));
			return function()
				u21.unmount(u25);
			end;
		end);
	end;
	p4:setupYield(function()
		local v15 = l__Maid__3.new();
		v15:GiveTask(l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(l__CooldownId__5.JADE_HAMMER));
		return function()
			v15:DoCleaning();
		end;
	end);
end;
function u1.onDisable(p10)
	p10.maid:DoCleaning();
end;
function u1.isRelevantItem(p11, p12)
	return p12.itemType == l__ItemType__13.JADE_HAMMER;
end;
u2 = l__KnitClient__4.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;

