-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__LegacyKitKnitController__3 = v1.import(script, script.Parent.Parent.Parent, "legacy-kit-controller").LegacyKitKnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "YetiKitController";
	end, 
	__index = l__LegacyKitKnitController__3
});
v4.__index = v4;
local u1 = v4;
function u1.new(...)
	local v5 = setmetatable({}, u1);
	return v5:constructor(...) and v5;
end;
local l__BedwarsKit__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function u1.constructor(p1)
	l__LegacyKitKnitController__3.constructor(p1, { l__BedwarsKit__2.YETI });
	p1.Name = "YetiKitController";
	p1.maid = u3.new();
end;
local l__RunService__4 = v2.RunService;
local l__Workspace__5 = v2.Workspace;
local l__ClientStore__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__Flamework__7 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ActionButton__9 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ActionButton;
local l__ContextActionService__10 = v2.ContextActionService;
local l__CooldownId__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
function u1.KnitStart(p2)
	l__LegacyKitKnitController__3.KnitStart(p2);
	l__RunService__4.Heartbeat:Connect(function()
		if not (l__ClientStore__6:getState().Kit.canUseYetiAbilityNext <= l__Workspace__5:GetServerTimeNow()) then
			if p2.useAbilityMaid then
				p2.useAbilityMaid:DoCleaning();
				p2.useAbilityMaid = nil;
			end;
			return;
		end;
		if p2.useAbilityMaid ~= nil then
			return nil;
		end;
		p2.useAbilityMaid = u3.new();
		local u12 = l__Flamework__7.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u8.createElement(l__ActionButton__9, {
			actionName = "use-yeti-ability", 
			interactionKey = Enum.KeyCode.Z, 
			gamepadInteractionKey = Enum.KeyCode.ButtonB, 
			onActivated = function()
				p2:useAbility();
			end, 
			text = "Glacial Roar"
		}));
		p2.useAbilityMaid:GiveTask(function()
			u12:DoCleaning();
		end);
		p2.useAbilityMaid:GiveTask(function()
			l__ContextActionService__10:UnbindAction("use-yeti-ability");
		end);
	end);
	l__ClientStore__6.changed:connect(function(p3, p4)
		if p3.Kit.canUseYetiAbilityNext ~= p4.Kit.canUseYetiAbilityNext then
			print(p3.Kit.canUseYetiAbilityNext);
			if l__Workspace__5:GetServerTimeNow() <= p3.Kit.canUseYetiAbilityNext then
				if p2.cooldownbarMaid == nil then
					local v6 = p3.Kit.canUseYetiAbilityNext - l__Workspace__5:GetServerTimeNow();
					p2.cooldownbarMaid = u3.new();
					p2.cooldownbarMaid:GiveTask(l__Flamework__7.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(l__CooldownId__11.YETI_ABILITY));
					l__Flamework__7.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(l__CooldownId__11.YETI_ABILITY, v6, {
						cooldownBar = {
							color = Color3.fromRGB(48, 255, 245)
						}
					});
					p2.cooldownbarMaid:GiveTask(function()
						l__Flamework__7.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):removeCooldown(l__CooldownId__11.YETI_ABILITY);
					end);
					task.delay(v6, function()
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
local l__Players__13 = v2.Players;
function u1.onKitEnabled(p5)
	if l__Players__13.LocalPlayer:GetAttribute("CanUseYetiAbilityNext") ~= nil then
		l__ClientStore__6:dispatch({
			type = "KitYetiSetWhenCanUseAbility", 
			when = l__Players__13.LocalPlayer:GetAttribute("CanUseYetiAbilityNext")
		});
	end;
	l__Players__13.LocalPlayer:GetAttributeChangedSignal("CanUseYetiAbilityNext"):Connect(function()
		l__ClientStore__6:dispatch({
			type = "KitYetiSetWhenCanUseAbility", 
			when = l__Players__13.LocalPlayer:GetAttribute("CanUseYetiAbilityNext")
		});
	end);
end;
function u1.onKitDisabled(p6)

end;
local l__default__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__GameAnimationUtil__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function u1.useAbility(p7)
	local l__Character__7 = l__Players__13.LocalPlayer.Character;
	if l__Character__7 == nil then
		return nil;
	end;
	l__default__14.Client:Get("RemoteName"):SendToServer({
		cframe = l__Character__7.HumanoidRootPart.CFrame
	});
	l__GameAnimationUtil__15.playAnimation(l__Players__13.LocalPlayer, l__AnimationType__16.YETI_ROAR);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return {
	YetiKitController = u1
};
