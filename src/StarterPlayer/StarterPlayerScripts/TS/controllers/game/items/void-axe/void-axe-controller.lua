
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
local l__KnitClient__10 = v3.KnitClient;
local l__StarterPlayer__11 = v4.StarterPlayer;
local l__KnitClient__12 = v3.KnitClient;
local l__AnimationType__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__GameAnimationUtil__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__EntityUtil__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__ItemType__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
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
	l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(l__CooldownId__9.VOID_AXE, 6, {
		cooldownBar = {}
	});
	l__SoundManager__5:playSound(l__GameSound__6.VOID_AXE_LEAP);
	l__default__3.Client:Get("RemoteName"):SendToServer();
	local v11 = l__KnitClient__10.Controllers.SprintController:getMovementStatusModifier():addModifier({
		moveSpeedMultiplier = 0, 
		blockSprint = true
	});
	p5.maid:GiveTask(v11);
	local l__Character__12 = l__Players__4.LocalPlayer.Character;
	local v13 = l__Character__12:FindFirstChildOfClass("Humanoid");
	v13.JumpHeight = 3;
	v13:ChangeState(Enum.HumanoidStateType.Jumping);
	local l__PrimaryPart__17 = l__Character__12.PrimaryPart;
	local u18 = nil;
	u18 = v13.Jumping:Connect(function()
		l__PrimaryPart__17:ApplyImpulse((l__PrimaryPart__17.CFrame * CFrame.new(Vector3.new(0, 0, -5)) - l__PrimaryPart__17.Position).Position * 13 * l__PrimaryPart__17.AssemblyMass);
		u18:Disconnect();
		l__KnitClient__10.Controllers.JumpHeightController:setJumpHeight(l__StarterPlayer__11.CharacterJumpHeight);
	end);
	p5.maid:GiveTask(u18);
	p5.maid:GiveTask(function()
		l__KnitClient__10.Controllers.JumpHeightController:setJumpHeight(l__StarterPlayer__11.CharacterJumpHeight);
	end);
	l__KnitClient__12.Controllers.ViewmodelController:playAnimation(l__AnimationType__13.FP_USE_ITEM);
	local u19 = l__GameAnimationUtil__14.playAnimation(l__Players__4.LocalPlayer, l__AnimationType__13.JADE_HAMMER_SLAM);
	p5.maid:GiveTask(function()
		if u19 ~= nil then
			u19:Stop();
		end;
	end);
	if u19 ~= nil then
		local v14 = u19.Stopped:Connect(function()
			local v15 = l__EntityUtil__15:getLocalPlayerEntity();
			if v15 ~= nil then
				v15 = v15:getItemTypeInHand();
			end;
			if v15 == l__ItemType__16.VOID_AXE then
				l__default__3.Client:Get("RemoteName"):SendToServer();
			end;
			v11.Destroy();
		end);
	end;
end;
local l__ContextActionService__20 = v4.ContextActionService;
local l__DeviceUtil__21 = v2.DeviceUtil;
local u22 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__MobileButton__23 = v2.MobileButton;
local l__BedwarsImageId__24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__BedwarsUI__25 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
function v6.onEnable(p6, p7, p8)
	task.spawn(function()
		local v16 = nil;
		v16 = l__GameAnimationUtil__14.playAnimation(l__Players__4.LocalPlayer, l__AnimationType__13.JADE_HAMMER_IDLE, {
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
	l__ContextActionService__20:BindAction("use-void-axe", function(p9, p10, p11)
		if p10 == Enum.UserInputState.Begin then
			p6:useVoidAxe();
		end;
	end, false, Enum.UserInputType.MouseButton1);
	p6.maid:GiveTask(function()
		l__ContextActionService__20:UnbindAction("use-void-axe");
	end);
	if l__DeviceUtil__21.isMobileControls() then
		p6:setupYield(function()
			local u26 = u22.mount(u22.createElement("ScreenGui", {
				ResetOnSpawn = false
			}, { u22.createElement(l__MobileButton__23, {
					Image = l__BedwarsImageId__24.SHOOT_MOBILE, 
					Position = l__BedwarsUI__25:getActionMobileButtonPosition(), 
					OnClick = function()
						p6:useVoidAxe();
					end
				}) }), l__Players__4.LocalPlayer:WaitForChild("PlayerGui"));
			return function()
				u22.unmount(u26);
			end;
		end);
	end;
	p6:setupYield(function()
		local v17 = l__Maid__2.new();
		v17:GiveTask(l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(l__CooldownId__9.VOID_AXE));
		return function()
			v17:DoCleaning();
		end;
	end);
end;
function v6.onDisable(p12)
	p12.maid:DoCleaning();
end;
function v6.isRelevantItem(p13, p14)
	return p14.itemType == l__ItemType__16.VOID_AXE;
end;
u1 = l__KnitClient__12.CreateController;
u1 = u1(v6.new());
return nil;

