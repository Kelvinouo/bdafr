
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__LegacyKitKnitController__4 = v1.import(script, script.Parent.Parent.Parent, "legacy-kit-controller").LegacyKitKnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "YetiKitController";
	end, 
	__index = l__LegacyKitKnitController__4
});
v5.__index = v5;
local u1 = v5;
function u1.new(...)
	local v6 = setmetatable({}, u1);
	return v6:constructor(...) and v6;
end;
local u2 = l__LegacyKitKnitController__4;
local l__BedwarsKit__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__Maid__4 = v2.Maid;
function u1.constructor(p1)
	u2.constructor(p1, { l__BedwarsKit__3.YETI });
	p1.Name = "YetiKitController";
	p1.maid = l__Maid__4.new();
end;
local l__RunService__5 = v3.RunService;
local l__Workspace__6 = v3.Workspace;
local l__ClientStore__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__Flamework__8 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ActionButton__10 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ActionButton;
local l__ContextActionService__11 = v3.ContextActionService;
local l__CooldownId__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
	l__RunService__5.Heartbeat:Connect(function()
		if not (l__ClientStore__7:getState().Kit.canUseYetiAbilityNext <= l__Workspace__6:GetServerTimeNow()) then
			if p2.useAbilityMaid then
				p2.useAbilityMaid:DoCleaning();
				p2.useAbilityMaid = nil;
			end;
			return;
		end;
		if p2.useAbilityMaid ~= nil then
			return nil;
		end;
		p2.useAbilityMaid = l__Maid__4.new();
		local u13 = l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u9.createElement(l__ActionButton__10, {
			actionName = "use-yeti-ability", 
			interactionKey = Enum.KeyCode.Z, 
			gamepadInteractionKey = Enum.KeyCode.ButtonB, 
			onActivated = function()
				p2:useAbility();
			end, 
			text = "Glacial Roar"
		}));
		p2.useAbilityMaid:GiveTask(function()
			u13:DoCleaning();
		end);
		p2.useAbilityMaid:GiveTask(function()
			l__ContextActionService__11:UnbindAction("use-yeti-ability");
		end);
	end);
	l__ClientStore__7.changed:connect(function(p3, p4)
		if p3.Kit.canUseYetiAbilityNext ~= p4.Kit.canUseYetiAbilityNext then
			print(p3.Kit.canUseYetiAbilityNext);
			if l__Workspace__6:GetServerTimeNow() <= p3.Kit.canUseYetiAbilityNext then
				if p2.cooldownbarMaid == nil then
					local v7 = p3.Kit.canUseYetiAbilityNext - l__Workspace__6:GetServerTimeNow();
					p2.cooldownbarMaid = l__Maid__4.new();
					p2.cooldownbarMaid:GiveTask(l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(l__CooldownId__12.YETI_ABILITY));
					l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(l__CooldownId__12.YETI_ABILITY, v7, {
						cooldownBar = {
							color = Color3.fromRGB(48, 255, 245)
						}
					});
					p2.cooldownbarMaid:GiveTask(function()
						l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):removeCooldown(l__CooldownId__12.YETI_ABILITY);
					end);
					task.delay(v7, function()
						if p2.cooldownbarMaid then
							p2.cooldownbarMaid:DoCleaning();
							p2.cooldownbarMaid = nil;
						end;
					end);
					return;
				end;
			else
				return;
			end;
		else
			return;
		end;
		return nil;
	end);
end;
local l__Players__14 = v3.Players;
function u1.onKitEnabled(p5)
	if l__Players__14.LocalPlayer:GetAttribute("CanUseYetiAbilityNext") ~= nil then
		l__ClientStore__7:dispatch({
			type = "KitYetiSetWhenCanUseAbility", 
			when = l__Players__14.LocalPlayer:GetAttribute("CanUseYetiAbilityNext")
		});
	end;
	l__Players__14.LocalPlayer:GetAttributeChangedSignal("CanUseYetiAbilityNext"):Connect(function()
		l__ClientStore__7:dispatch({
			type = "KitYetiSetWhenCanUseAbility", 
			when = l__Players__14.LocalPlayer:GetAttribute("CanUseYetiAbilityNext")
		});
	end);
end;
function u1.onKitDisabled(p6)

end;
local l__default__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__GameAnimationUtil__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function u1.useAbility(p7)
	local l__Character__8 = l__Players__14.LocalPlayer.Character;
	if l__Character__8 == nil then
		return nil;
	end;
	l__default__15.Client:Get("wrgkCYvHabsIralhvHmtPooHrurjdznLca"):SendToServer({
		cframe = l__Character__8.HumanoidRootPart.CFrame
	});
	l__GameAnimationUtil__16.playAnimation(l__Players__14.LocalPlayer, l__AnimationType__17.YETI_ROAR);
end;
u2 = v2.KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	YetiKitController = u2
};
return u1;

