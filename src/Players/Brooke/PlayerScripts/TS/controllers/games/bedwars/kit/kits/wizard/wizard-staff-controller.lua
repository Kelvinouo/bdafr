-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-source-controller").ProjectileSourceController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "WizardStaffController";
	end, 
	__index = v3
});
v4.__index = v4;
local u1 = v4;
function u1.new(...)
	local v5 = setmetatable({}, u1);
	return v5:constructor(...) and v5;
end;
function u1.constructor(p1, ...)
	v3.constructor(p1, ...);
	p1.Name = "WizardStaffController";
end;
function u1.KnitStart(p2)
	v3.KnitStart(p2);
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__Flamework__3 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__CooldownId__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local l__ContextActionService__5 = v2.ContextActionService;
local l__Players__6 = v2.Players;
local l__ClientStore__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__CreateRoduxApp__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__WizardAbilityBarWrapper__9 = v1.import(script, script.Parent, "ui", "wizard-ability-bar").WizardAbilityBarWrapper;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
function u1.onEnable(p3, p4, p5)
	v3.onEnable(p3, p4, p5);
	p3:setupYield(function()
		local v6 = u2.new();
		v6:GiveTask(l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(l__CooldownId__4.WIZARD_STAFF));
		return function()
			v6:DoCleaning();
		end;
	end);
	l__ContextActionService__5:BindAction("change-ability", function(p6, p7, p8)
		if p7 == Enum.UserInputState.Begin then
			p3:changeAbility();
		end;
	end, false, Enum.KeyCode.F, Enum.KeyCode.ButtonB);
	p3.maid:GiveTask(function()
		return l__ContextActionService__5:UnbindAction("change-ability");
	end);
	p3.maid:GiveTask(l__Players__6.LocalPlayer:GetAttributeChangedSignal("WizardAbility"):Connect(function()
		l__ClientStore__7:dispatch({
			type = "KitWizardSetAbility", 
			ability = p3:getAbility()
		});
	end));
	local u11 = l__CreateRoduxApp__8("WizardAbilityBar", l__WizardAbilityBarWrapper__9, {
		ChangeAbility = function()
			return p3:changeAbility();
		end
	});
	p3.maid:GiveTask(function()
		return u10.unmount(u11);
	end);
	p3:setAbility(p3:getAbility());
	u1:setTheme(p4.tool, p3:getAbility());
end;
local l__GameAnimationUtil__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__EntityUtil__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
function u1.changeAbility(p9)
	local v7 = p9:getNextAbility();
	l__GameAnimationUtil__12.playAnimation(l__Players__6.LocalPlayer, l__AnimationType__13.WIZARD_ABILITY_SWITCH);
	p9:setAbility(v7);
	local v8 = l__EntityUtil__14:getEntity(l__Players__6.LocalPlayer);
	if not v8 then
		return nil;
	end;
	local v9 = v8:getItemInHandClient();
	if v9 then
		u1:setTheme(v9, v7);
	end;
end;
function u1.setTheme(p10, p11, p12)
	local v10 = u1:getColorTheme(p12);
	p11.Handle.InnerOrb.Color = v10.InnerOrb;
	p11.Handle.Orb.Color = v10.Orb;
	p11.Handle.OuterOrb.Color = v10.OuterOrb;
	p11.Handle.Neon.Color = v10.Neon;
end;
local l__WizardAbilityType__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "wizard", "wizard-ability-type").WizardAbilityType;
function u1.getNextAbility(p13)
	if p13:getAbility() == l__WizardAbilityType__15.ElectricityOrb then
		return l__WizardAbilityType__15.LightningStrike;
	end;
	return l__WizardAbilityType__15.ElectricityOrb;
end;
local l__ItemType__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function u1.isRelevantItem(p14, p15)
	return p15.itemType == l__ItemType__16.WIZARD_STAFF;
end;
function u1.onStartCharging(p16)

end;
function u1.onStopCharging(p17)

end;
function u1.onLaunch(p18)

end;
function u1.onStartReload(p19)

end;
function u1.getProjectileSource(p20, p21)
	return p20:getAbilityProjectile((p20:getAbility()));
end;
function u1.getAbilityProjectile(p22, p23)
	if p23 == l__WizardAbilityType__15.LightningStrike then
		return {
			projectileType = function()
				return "lightning_strike";
			end, 
			fireDelaySec = 10, 
			thirdPerson = {
				fireAnimation = l__AnimationType__13.WIZARD_LIGHTNING_CAST
			}, 
			firstPerson = {
				fireAnimation = l__AnimationType__13.FP_USE_ITEM
			}, 
			cooldownId = l__CooldownId__4.WIZARD_STAFF
		};
	end;
	if p23 ~= l__WizardAbilityType__15.ElectricityOrb then
		return;
	end;
	return {
		projectileType = function()
			return "electric_orb";
		end, 
		fireDelaySec = 10, 
		thirdPerson = {
			fireAnimation = l__AnimationType__13.WIZARD_BALL_CAST
		}, 
		firstPerson = {
			fireAnimation = l__AnimationType__13.FP_USE_ITEM
		}, 
		cooldownId = l__CooldownId__4.WIZARD_STAFF
	};
end;
function u1.setAbility(p24, p25)
	l__Players__6.LocalPlayer:SetAttribute("WizardAbility", p25);
end;
function u1.getAbility(p26)
	return l__Players__6.LocalPlayer:GetAttribute("WizardAbility") or l__WizardAbilityType__15.LightningStrike;
end;
local l__ColorUtil__17 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
function u1.getColorTheme(p27, p28)
	if p28 == l__WizardAbilityType__15.LightningStrike then
		return {
			InnerOrb = l__ColorUtil__17.hexColor(6260671), 
			Orb = l__ColorUtil__17.hexColor(625103), 
			OuterOrb = l__ColorUtil__17.hexColor(1662671), 
			Neon = l__ColorUtil__17.hexColor(6260671)
		};
	end;
	if p28 ~= l__WizardAbilityType__15.ElectricityOrb then
		return;
	end;
	return {
		InnerOrb = l__ColorUtil__17.hexColor(16733782), 
		Orb = l__ColorUtil__17.hexColor(13592110), 
		OuterOrb = l__ColorUtil__17.hexColor(13586710), 
		Neon = l__ColorUtil__17.hexColor(13591065)
	};
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return nil;
