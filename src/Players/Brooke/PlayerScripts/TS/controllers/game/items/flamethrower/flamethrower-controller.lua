-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "FlamethrowerController";
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
	p1.Name = "FlamethrowerController";
	p1.maid = u2.new();
end;
function u1.KnitStart(p2)
	l__HandKnitController__5.KnitStart(p2);
end;
local l__Flamework__3 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__FLAMETHROWER_USE__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId.FLAMETHROWER_USE;
local l__PyroUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "pyro", "pyro-util").PyroUtil;
local l__default__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__KnitClient__7 = v3.KnitClient;
local l__GameAnimationUtil__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__Players__9 = v4.Players;
local l__AnimationType__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function u1.useFlamethrower(p3)
	if l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(l__FLAMETHROWER_USE__4) then
		if l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(l__FLAMETHROWER_USE__4) < 0.25 then
			l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(l__FLAMETHROWER_USE__4, "buffer", function()
				if p3:isEnabled() then
					p3:useFlamethrower();
				end;
			end);
		end;
		return nil;
	end;
	l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(l__FLAMETHROWER_USE__4, l__PyroUtil__5.FLAMETHROWER_COOLDOWN_SEC);
	l__default__6.Client:Get("RemoteName"):CallServerAsync();
	local v8 = l__KnitClient__7.Controllers.SprintController:getMovementStatusModifier():addModifier({
		moveSpeedMultiplier = 0.2
	});
	p3.maid:GiveTask(v8);
	local u11 = l__GameAnimationUtil__8.playAnimation(l__Players__9.LocalPlayer, l__AnimationType__10.FLAMETHROWER_USE);
	p3.maid:GiveTask(function()
		if u11 ~= nil then
			u11:Stop();
		end;
	end);
	if u11 ~= nil then
		local v9 = u11.Stopped:Connect(function()
			v8.Destroy();
		end);
	end;
end;
function u1.upgrade(p4)
	if p4:isEnabled() then
		local u12 = l__GameAnimationUtil__8.playAnimation(l__Players__9.LocalPlayer, l__AnimationType__10.FLAMETHROWER_UPGRADE);
		p4.maid:GiveTask(function()
			if u12 ~= nil then
				u12:Stop();
			end;
		end);
	end;
end;
local l__ContextActionService__13 = v4.ContextActionService;
local l__DeviceUtil__14 = v2.DeviceUtil;
local u15 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__MobileButton__16 = v2.MobileButton;
local l__BedwarsUI__17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local l__UIUtil__18 = v2.UIUtil;
local l__KnitClient__19 = v3.KnitClient;
function u1.onEnable(p5, p6)
	p5:setupYield(function()
		local v10 = u2.new();
		v10:GiveTask(l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(l__FLAMETHROWER_USE__4));
		return function()
			v10:DoCleaning();
		end;
	end);
	p5:setupYield(function()
		local u20 = l__GameAnimationUtil__8.playAnimation(l__Players__9.LocalPlayer, l__AnimationType__10.FLAMETHROWER_IDLE, {
			looped = true
		});
		return function()
			if u20 ~= nil then
				u20:Stop();
			end;
		end;
	end);
	l__ContextActionService__13:BindAction("use-flamethrower", function(p7, p8, p9)
		if p8 == Enum.UserInputState.Begin then
			p5:useFlamethrower();
		end;
	end, false, Enum.UserInputType.MouseButton1);
	p5.maid:GiveTask(function()
		l__ContextActionService__13:UnbindAction("use-flamethrower");
	end);
	if l__DeviceUtil__14.isMobileControls() then
		p5:setupYield(function()
			local u21 = u15.mount(u15.createElement("ScreenGui", {
				ResetOnSpawn = false
			}, { u15.createElement(l__MobileButton__16, {
					Image = "rbxassetid://6862310392", 
					Position = l__BedwarsUI__17:getActionMobileButtonPosition(), 
					OnClick = function()
						p5:useFlamethrower();
					end
				}) }), l__Players__9.LocalPlayer:WaitForChild("PlayerGui"));
			return function()
				u15.unmount(u21);
			end;
		end);
	end;
	local v11 = "[X] ";
	if l__DeviceUtil__14.isGamepadControls() then
		v11 = "[B] ";
	end;
	if l__DeviceUtil__14.isMobileControls() then
		v11 = "";
	end;
	p5:setupYield(function()
		local u22 = u15.mount(u15.createElement("ScreenGui", {
			ResetOnSpawn = false
		}, { u15.createElement("ImageButton", {
				Size = UDim2.fromScale(0.08, 0.1), 
				Position = l__UIUtil__18:getActionBarPosition(), 
				AnchorPoint = Vector2.new(0.5, 1), 
				BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
				BackgroundTransparency = 0.6, 
				BorderSizePixel = 0, 
				[u15.Event.MouseButton1Down] = function()
					l__KnitClient__19.Controllers.PyroController:openUpgradeMenu();
				end
			}, { u15.createElement("UIAspectRatioConstraint", {
					AspectRatio = 4.675675675675675
				}), u15.createElement("TextLabel", {
					Size = UDim2.fromScale(0.8, 0.5), 
					Position = UDim2.fromScale(0.5, 0.5), 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					Text = "<b>" .. v11 .. "Upgrade Flamethrower</b>", 
					Font = "Roboto", 
					RichText = true, 
					TextScaled = true, 
					TextColor3 = Color3.fromRGB(255, 255, 255)
				}) }) }), l__Players__9.LocalPlayer:WaitForChild("PlayerGui"));
		return function()
			u15.unmount(u22);
		end;
	end);
	l__ContextActionService__13:BindAction("open-upgrades", function(p10, p11, p12)
		if p11 == Enum.UserInputState.Begin then
			l__KnitClient__19.Controllers.PyroController:openUpgradeMenu();
		end;
	end, false, Enum.KeyCode.X, Enum.KeyCode.ButtonB);
	p5.maid:GiveTask(function()
		l__ContextActionService__13:UnbindAction("open-upgrades");
	end);
end;
function u1.onDisable(p13)
	p13.maid:DoCleaning();
end;
local l__ItemType__23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function u1.isRelevantItem(p14, p15)
	return p15.itemType == l__ItemType__23.FLAMETHROWER;
end;
u1 = l__KnitClient__19.CreateController;
u1 = u1(u1.new());
return nil;
